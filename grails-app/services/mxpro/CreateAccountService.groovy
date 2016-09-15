package mxpro

import grails.transaction.Transactional
import groovy.time.TimeCategory
import br.com.moip.API
import br.com.moip.Client
import br.com.moip.authentication.Authentication
import br.com.moip.authentication.BasicAuth
import br.com.moip.exception.UnauthorizedException
import br.com.moip.exception.ValidationException
import br.com.moip.request.CreditCardRequest
import br.com.moip.request.CustomerRequest
import br.com.moip.request.FundingInstrumentRequest
import br.com.moip.request.HolderRequest
import br.com.moip.request.OrderRequest
import br.com.moip.request.PaymentRequest
import br.com.moip.request.PhoneRequest
import br.com.moip.request.TaxDocumentRequest
import br.com.moip.resource.Order
import br.com.moip.resource.Payment

@Transactional
class CreateAccountService {
	
	def grailsApplication

	def createAccount(Customer customer, PaymentCommand payment, String chosenEmailAddress, String password) {
		if (!doPayment(customer, payment, chosenEmailAddress)) {
			return [error: "O pagamento não foi aceito pela instituição financeira."]
		}
		
		String ticket = createEntities(customer, payment.plan, chosenEmailAddress, password, payment)
		doRegistrar(customer, chosenEmailAddress)
		
		[error: false, ticket: ticket]
    }
	
	private doPayment(Customer customer, PaymentCommand payment, String chosenEmailAddress) {
		String token = grailsApplication.config.moip.authToken
		String key = grailsApplication.config.moip.authKey
		Authentication auth = new BasicAuth(token, key)

		Client client = new Client(Client.SANDBOX, auth);
		API api = new API(client);

		Integer total = payment.total.setScale(2, BigDecimal.ROUND_UP).multiply(new BigDecimal(100)).toInteger()
		String areaCode = customer.mobile.substring(1, 3)
		String phoneNumber = customer.mobile.substring(4)
		String birthdate = new Date().parse('dd/MM/yyyy', customer.birthdate).format('yyyy-MM-dd')
		
		try {
			Order createdOrder = api.order().create(
				new OrderRequest()
				.ownId(chosenEmailAddress)
				.addItem(payment.plan.planName, 1, "N/A", total)
				.customer(
					new CustomerRequest()
					.ownId(customer.idNumber)
					.fullname(customer.name)
					.email(chosenEmailAddress)
				)
			);
	
			Payment createdPayment = api.payment().create(
				new PaymentRequest()
				.orderId(createdOrder.id)
				.installmentCount(1)
				.fundingInstrument(
					new FundingInstrumentRequest()
					.creditCard(
						new CreditCardRequest()
						.hash(payment.creditCardHash)
						.holder(
							new HolderRequest()
							.fullname(payment.holder)
							.birthdate("1984-10-17")
							.phone(
								new PhoneRequest()
								.setAreaCode(areaCode)
								.setNumber(phoneNumber)
							)
							.taxDocument(TaxDocumentRequest.cpf(customer.idNumber))
						)
					)
				)
			);
		} catch(ValidationException | UnauthorizedException e) {
			return [error: "O pagamento não foi aceito pela instituição financeira."]
		}
		
		return true
	}
	
	private doRegistrar(Customer customer, String chosenEmailAddress) {
		// TODO register a ticket on registrar or send a message to backoffice do that.
	}
	
	private createEntities(Customer customer, Plan plan, String chosenEmailAddress, String password, PaymentCommand payment) {
		def g = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
		Date currDate = new Date()
		
		// if payment has been processed successfully, start registering all entities
		User user = new User()
		user.username = chosenEmailAddress
		user.password = password
		user.enabled = true
		user.authorities = [Role.ROLE_USER]
		user.save(flush: true)
		
		InvoiceItem item = new InvoiceItem()
		item.quantity = plan.months
		item.amount = plan.price
		item.description = "MONTHLY PLAN CHARGE OF ${g.formatNumber(number: plan.price, type: 'currency', currencyCode: 'BRL')}"
		
		InvoiceItem registrar = new InvoiceItem()
		registrar.quantity = 1
		registrar.amount = Param.findByName('mxpro.registrobr.price').value as BigDecimal
		registrar.description = "REGISTRO.BR ANNUAL CHARGE OF ${g.formatNumber(number: registrar.amount, type: 'currency', currencyCode: 'BRL')}"
		
		Invoice invoice = new Invoice()
		invoice.number = UUID.randomUUID().toString()
		invoice.status = InvoiceStatus.PENDING_PAYMENT
		invoice.timestamp = currDate
		invoice.total = plan.total() + registrar.amount
		invoice.items = [item, registrar]
		invoice.save()
		
		Domain domain = new Domain()
		domain.name = chosenEmailAddress.split('@')[1]
		domain.registrar = "REGISTRO.BR"
		domain.domainStatus = DomainStatus.PENDING_TICKET
		domain.save()
		
		Account account = new Account()
		account.domain = domain
		account.status = AccountStatus.ACTIVE
		use (TimeCategory) {
			account.expiration = currDate + plan.months.months
		}
		account.lastPayment = currDate
		account.amount = plan.total()
		account.balance = BigDecimal.ZERO
		account.currentPlan = plan
		account.maxSize = plan.maxSize
		account.maxEmailAccounts = plan.maxEmailAccounts
		account.notifyNextPaymentDates = true
		account.notifyBySMS = false
		account.webmailURL = "webmail." + domain.name
		account.serversURL = [
			"imap." + domain.name,
			"pop3." + domain.name,
			"smtp." + domain.name
		]
		account.invoices = [invoice]
		account.ticket = UUID.randomUUID().toString()
		account.emailAccountsBillingStatus = "Sem débitos pendentes"
		account.domainBillingStatus = "Sem débitos pendentes"
		account.save()
		
		CreditCard creditCard = new CreditCard()
		creditCard.name = payment.holder
		creditCard.brand = payment.brand
		creditCard.first4Digits = payment.first4Digits
		creditCard.last4Digits = payment.last4Digits
		creditCard.expiration = payment.expiration
		creditCard.save()
		
		customer.account = account
		customer.currentCreditCard = creditCard
		customer.idType = 'CPF'
		customer.user = user
		customer.address.country = 'BRAZIL'
		customer.save()
		
		EmailAccount emailAccount = new EmailAccount()
		emailAccount.accountAddress = chosenEmailAddress.split('@')[0]
		emailAccount.fullAddress = chosenEmailAddress
		emailAccount.account = account
		emailAccount.domain = domain
		emailAccount.status = EmailAccountStatus.PENDING_DOMAIN
		emailAccount.legacyUser = chosenEmailAddress
		emailAccount.legacyPassword = password
		emailAccount.currentSize = 0
		emailAccount.save()
		
		return account.ticket
	}
}

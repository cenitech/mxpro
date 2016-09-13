package mxpro

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CreateAccountController {

	def createAccountService
	
	def index() {
		if (!session['domainCheck/chosenEmailAddress']) {
			redirect uri: '/'
		}
		
		session.removeAttribute('createAccount/customer')
		session.removeAttribute('createAccount/address')
		session.removeAttribute('createAccount/payment')
		
		render view: 'index', model: [customer: session['createAccount/customer']]
	}
	
	def backToIndex() {
		render view: 'index', model: [customer: session['createAccount/customer']]
	}
	
	def gotoAddress(CustomerCommand customer) {
		if (customer.hasErrors()) {
			render template: 'basic', model: [customer: customer]
			return
		}
		
		session['createAccount/customer'] = customer
		render template: "address", model: [address: session['createAccount/address']]
	}
	
	def backToAddress() {
		render template: "address", model: [address: session['createAccount/address']]
	}
	
	def gotoPayment(AddressCommand address) {
		if (address.hasErrors()) {
			render template: 'address', model: [address: address]
			return
		}
		
		session['createAccount/address'] = address
		render template: "payment", model: [payment: session['createAccount/payment']]
	}
	
	def backToPayment() {
		render template: "payment", model: [payment: session['createAccount/payment']]
	}
	
	def gotoConfirm(PaymentCommand payment) {
		if (payment.hasErrors()) {
			render template: 'payment', model: [payment: payment]
			return
		}
		
		payment.first4Digits = payment.cardnumber.substring(0,4)
		payment.last4Digits = payment.cardnumber.substring(payment.cardnumber.length()-4,payment.cardnumber.length())
		payment.total = payment.plan.total() + (Param.findByName('mxpro.registrobr.price').value as BigDecimal)
		
		session['createAccount/payment'] = payment
		render template: "confirm"
	}
	
	def confirm() {
		Customer customer = new Customer()
		customer.address = new Address()
		
		bindData(customer, session['createAccount/customer'])
		bindData(customer.address, session['createAccount/address'])
		
		PaymentCommand payment = session['createAccount/payment']
		String chosenEmailAddress = session['domainCheck/chosenEmailAddress']
		String password = session['createAccount/customer'].password
		
		// Gravar os dados do customer e o pedido do domínio para ser processado por alguém do backoffice.
		// assim que o domínio for registrado, inicia-se o processo de configuração da conta nos servidores de email.
		// em seguida, a conta é liberada e o customer poderá acessá-la via SMTP (primeira versão)
		// ao concluir o cadastro, o usuário é redirecionado para a dashboard onde irá consultar seus emails (fake dashboard),
		// e terá acesso ao menu onde poderá visualizar informações de pagamento, das suas contas de email,
		// adicionar mais domínios, mais emails, enviar documentos pendentes (comprovante residência, RG/CPF, contrato social)
		// visualizar o histórico do seu pedido junto ao registro.br
		// As informações de acesso ao sistema ficam na entidade User, onde o username é o primeiro email que o customer cadastrou.
		def postProcessingResponse = createAccountService.createAccount(customer, payment, chosenEmailAddress, password)
		if (!postProcessingResponse.error) {
			session.removeAttribute('createAccount/customer')
			session.removeAttribute('createAccount/address')
			session.removeAttribute('createAccount/payment')
			session['j_username'] = session['domainCheck/chosenEmailAddress']
			session.removeAttribute('domainCheck/chosenEmailAddress')
		}
		
		render template: "confirmation", model: [chosenEmailAddress: chosenEmailAddress, postProcessingResponse: postProcessingResponse]
	}
	
	def cancel() {
		session.invalidate()
		redirect uri: '/'
	}
	
	def done() {
		redirect uri: '/'
	}
}

class CustomerCommand {
	String name
	String idNumber
	String mobile
	String birthdate
	String password
	String confirmation
	
	static constraints = {
		idNumber cpf: true, validator: { val, obj -> Customer.countByIdNumber(val) == 0 }
		confirmation validator: { val, obj -> val == obj.password }
	}
}

class AddressCommand {
	String zip
	String street
	String number
	String complement
	String city
	String region
	
	static constraints = {
		number nullable: true
		complement nullable: true
	}
	
	String getAddressString() {
		return "$street, $number - $city - $region"
	}
}

class PaymentCommand {
	Plan plan
	String holder
	String brand
	String cardnumber
	String expiration
	String security
	String first4Digits
	String last4Digits
	BigDecimal total
	String creditCardHash
	
	static constraints = {
		cardnumber minSize: 19
		expiration minSize: 7
		security size: 3..4
		first4Digits nullable: true
		last4Digits nullable: true
		total nullable: true
	}
}
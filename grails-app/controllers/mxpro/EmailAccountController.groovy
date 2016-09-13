package mxpro

import grails.converters.JSON

import org.apache.commons.validator.routines.EmailValidator

class EmailAccountController {
	
	def springSecurityService
	
    def index() {
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		def currentEmailAccount = EmailAccount.findByCustomer(customer)
		
		def domain = currentEmailAccount.domain.domain
		domain = domain.contains('.com.br') ? domain.substring(0, domain.indexOf('.com.br')) : domain
		
		def account = new AccountCommand()
		account.domain = domain;
		[account: account]
	}
	
	def create(AccountCommand account) {
		if (account.hasErrors()) {
			render view: 'index', model: [account: account]
			return
		}

		flash.message = "Conta de email criada com sucesso"
		render ([url:createLink(controller: 'dashboard', action: 'contas')]  as JSON)
	}
}

class AccountCommand {
	def springSecurityService
	
	String account
	String domain
	
	static constraints = {
		account blank: false, nullable: false, validator: {val, obj, errors ->
			def customer = Customer.findByUser(obj.springSecurityService.getCurrentUser())
			def newEmailAccount = val + '@' + customer.account.domain.name
			
			// verifica o novo endereço de email
			if(!EmailValidator.instance.isValid(newEmailAccount)) {
				errors.rejectValue('account', 'invalidEmailAccount')
			}
		}
	}
}

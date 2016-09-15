package mxpro

import grails.converters.JSON
import grails.transaction.Transactional

import org.apache.commons.validator.routines.EmailValidator

@Transactional(readOnly=true)
class EmailAccountController {
	
	def springSecurityService
	def emailAccountService
	
    def index() {
		session.removeAttribute('emailAccount/account')
		
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		def account = Account.findByCustomer(customer)
		def domain = account.domain.name
		
		def accountCommand = new AccountCommand()
		accountCommand.domain = domain.contains('.') ? domain.substring(0, domain.indexOf('.')) : domain
		accountCommand.suffix = domain.substring(domain.indexOf('.'))
		 
		[account: accountCommand]
	}
	
	def password(AccountCommand accountCommand) {
		if (accountCommand.hasErrors()) {
			render view: 'index', model: [account: accountCommand]
			return
		}
		
		session['emailAccount/account'] = accountCommand
		[account: accountCommand]
	}
	
	def finish(PasswordCommand passwordCommand) {
		AccountCommand accountCommand = session['emailAccount/account']
		if (passwordCommand.hasErrors()) {
			render view: 'password', model: [account: accountCommand, password: passwordCommand]
			return
		}
		
		def newEmailAccount = accountCommand.account + '@' + accountCommand.domain + accountCommand.suffix
		
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		emailAccountService.createEmailAccount(customer, newEmailAccount, passwordCommand.password)

		session.removeAttribute('emailAccount/account')
		flash.message = "Conta de email criada com sucesso"
		render ([url:createLink(controller: 'dashboard', action: 'contas')]  as JSON)
	}
	
	def delete(ContasCommand cmd) {
		User user = springSecurityService.getCurrentUser()
		def customer = Customer.findByUser(user)
		def emails = EmailAccount.findAllByAccountAndIdInList(customer.account, cmd.ids)
		
		flash.message = "Conta(s) de email excluida(s) com sucesso"
		
		emails.each {
			if (user.username != it.fullAddress) {
				it.delete()
			} else {
				flash.message = "O email principal não pode ser removido, as demais contas de email selecionadas foram removidas"
			}
		}
		
		render ([url:createLink(controller: 'dashboard', action: 'contas')]  as JSON)
	}
	
	def changePassword(ContasCommand cmd) {
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		def emails = EmailAccount.findAllByAccountAndIdInList(customer.account, cmd.ids)
		
		session['emailAccount/emails'] = emails
		
		[emails: emails]
	}
	
	def performPasswordChange(PasswordCommand cmd) {
		def emails = session['emailAccount/emails']
		if (cmd.hasErrors()) {
			render view: 'changePassword', model: [emails: emails]
			return
		}
		
		emailAccountService.changePassword(emails, cmd.password)

		session.removeAttribute('emailAccount/emails')
		flash.message = "Senha(s) alterada(s) com sucesso"
		render ([url:createLink(controller: 'dashboard', action: 'contas')]  as JSON)
	}
}

class ContasCommand {
	List<String> ids
}

class AccountCommand {
	
	def springSecurityService
	
	String account
	String domain
	String suffix
	int numOfAvailableEmailAccounts
	
	static constraints = {
		account blank: false, nullable: false, validator: {val, obj, errors ->
			def newEmailAccount = val + '@' + obj.domain + obj.suffix
			
			// verifica o novo endereço de email
			if(!EmailValidator.instance.isValid(newEmailAccount)) {
				errors.rejectValue('account', 'invalidEmailAccount')
				return
			}
			
			if (EmailAccount.countByFullAddress(newEmailAccount) > 0) {
				errors.rejectValue('account', 'notUniqueEmailAccount')
				return
			}
		}
		numOfAvailableEmailAccounts validator: {val, obj, errors ->
			def customer = Customer.findByUser(obj.springSecurityService.getCurrentUser())
			def numOfEmailAccounts = EmailAccount.countByAccount(customer.account)
			
			// check if there is available slots to the account yet
			if (numOfEmailAccounts >= customer.account.maxEmailAccounts) {
				errors.rejectValue('numOfAvailableEmailAccounts', 'maximumEmailAccountsNumber')
				return
			}
		}
	}
}

class PasswordCommand {
	
	String password
	
	static constraints = {
		password blank: false, nullable: false
	}
}

package mxpro

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DashboardController {

	def springSecurityService
	
	def index() {
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		def account = Account.findByCustomer(customer)
		def emailAccounts = EmailAccount.findAllByAccount(account)
		
		[customer: customer, account: account, emailAccounts: emailAccounts]
	}
	
	def example() {
		
	}
	
	def contas() {
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		def account = Account.findByCustomer(customer)
		def currentEmailAccount = EmailAccount.findByCustomer(customer)
		def accounts = EmailAccount.findAllByDomain(currentEmailAccount.domain)
		def numberOfAccounts = accounts.size()
		
		def numberOfAvailable = 0 // calculates how much available accounts are for the current user.
		
		[customer: customer, account: account, domain: currentEmailAccount.domain.domain, numberOfAccounts: numberOfAccounts, accounts: accounts, numberOfAvailable: numberOfAvailable]
	}
	
	def financeiro() {
		
	}
	
	def imprimir() {
		
	}
	
	def configuracoes() {
		
	}
	
	def suporte() {
		
	}
}
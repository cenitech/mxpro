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
		def emailAccounts = EmailAccount.findAllByAccount(account)
		
		[customer: customer, account: account, domain: account.domain, emailAccounts: emailAccounts]
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
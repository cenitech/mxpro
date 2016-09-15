package mxpro

import grails.transaction.Transactional

@Transactional(readOnly=true)
class BillingController {
	
	def springSecurityService
	def emailAccountService
	
    def index() {
		
	}
}
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
class BillingService {
	
	def springSecurityService
	def grailsApplication

	
	def saveToTest() {
		
		
		Customer c = Customer.get("57f5082c648f021bb4959dc6")
		c.name = c.name + '2'
		println c.name
		println c.account.ticket
		println c.account.expiration
		
		def ccc = c.save(flush: true)
		println ccc
		return 1
	}
	
	def addCreditCardToCustomer(String creditCardHash) {
		println creditCardHash
		return true
	}
	
	def makePayment(String security) {
		println security
		return true
	}
}

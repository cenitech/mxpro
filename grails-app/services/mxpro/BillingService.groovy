package mxpro

import org.apache.http.HttpStatus;

import grails.converters.JSON
import grails.transaction.Transactional
import groovy.json.JsonOutput

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
	
	def addCreditCardToCustomer(CreditCard creditCard, String hash) {
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		
		// verify if customer already exists in Moip, else, create it.
		if (!customer.moipId) {
			def result = createMoipCustomer(customer)
			if (result.success) {
				customer.moipId = result.customerId
			} else {
				return result
			}
		}
		
		// add the credit card to the customer
		def result = createMoipCreditCard(customer.moipId, creditCard, hash)
		if (result.success) {
			creditCard.token = result.creditCard.id
			creditCard.first6Digits = result.creditCard.first6
			creditCard.last4Digits = result.creditCard.last4
			creditCard.brand = result.creditCard.brand
			creditCard.idType = "CPF"
			creditCard.address.country = "BRA"
			
			customer.currentCreditCard = creditCard
			
			creditCard.save()
			customer.save()
		}

		return result
	}
	
	def createMoipCustomer(Customer customer) {
		def moip = new Expando()
		moip.ownId = "TEST-" + String.valueOf(customer.id)
		moip.fullname = customer.name
		moip.email = customer.user.username
		moip.birthDate = new Date().parse("dd/MM/yyyy", customer.birthdate).format("yyyy-MM-dd")
		moip.taxDocument = new Expando()
		moip.taxDocument.type = "CPF"
		moip.taxDocument.number = customer.idNumber.replaceAll('\\.', '').replaceAll('-','')
		moip.phone = new Expando()
		moip.phone.countryCode = "55"
		moip.phone.areaCode = customer.mobile.substring(1,3)
		moip.phone.number = customer.mobile.substring(5)
		moip.shippingAddress = new Expando()
		moip.shippingAddress.city = customer.address.city
		moip.shippingAddress.complement = customer.address.complement
		moip.shippingAddress.street = customer.address.street
		moip.shippingAddress.streetNumber = customer.address.number
		moip.shippingAddress.zipCode = customer.address.zip.replaceAll('-', '')
		moip.shippingAddress.state = customer.address.region
		moip.shippingAddress.country = "BRA"
		
		String url = grailsApplication.config.moip.url
		String pathToCustomers = "/v2/customers"
		
		def result = withRest(uri: url) {
			handler.failure = { resp, data ->
				return [success: false, errors: data.errors]
			}
			handler.success = { resp, data ->
				return [success: true, customerId: data.id]
			}
			
			post(
				path: pathToCustomers,
				headers: [Authorization: Util.auth64String],
				body: JsonOutput.toJson(moip),
				requestContentType: groovyx.net.http.ContentType.JSON
			)
		}
		
		return result
	}
	
	def createMoipCreditCard(String customerId, CreditCard creditCard, String hash) {
		
		def moip = new Expando()
		moip.method = "CREDIT_CARD"
		moip.creditCard = new Expando()
		
		moip.creditCard.expirationMonth = creditCard.expiration.substring(0,2)
		moip.creditCard.expirationYear = creditCard.expiration.substring(3)
		moip.creditCard.number = creditCard.cardnumber.replaceAll(" ", "")
		moip.creditCard.cvc = creditCard.security
//		moip.creditCard.hash = hash
		
		moip.creditCard.holder = new Expando()
		moip.creditCard.holder.fullname = creditCard.name
		moip.creditCard.holder.birthdate = new Date().parse("dd/MM/yyyy", creditCard.birthDate).format("yyyy-MM-dd")
		moip.creditCard.holder.taxDocument = new Expando()
		moip.creditCard.holder.taxDocument.type = "CPF"
		moip.creditCard.holder.taxDocument.number = creditCard.idNumber.replaceAll('\\.', '').replaceAll('-','')
		moip.creditCard.phone = new Expando()
		moip.creditCard.phone.countryCode = "55"
		moip.creditCard.phone.areaCode = creditCard.phoneNumber.substring(1,3)
		moip.creditCard.phone.number = creditCard.phoneNumber.substring(5)
		moip.creditCard.billingAddress = new Expando()
		moip.creditCard.billingAddress.city = creditCard.address.city
		moip.creditCard.billingAddress.complement = creditCard.address.complement
		moip.creditCard.billingAddress.street = creditCard.address.street
		moip.creditCard.billingAddress.streetNumber = creditCard.address.number
		moip.creditCard.billingAddress.zipCode = creditCard.address.zip.replaceAll('-', '')
		moip.creditCard.billingAddress.state = creditCard.address.region
		moip.creditCard.billingAddress.country = "BRA"
		
		String url = grailsApplication.config.moip.url
		String pathToFundingInstrument = "/v2/customers/" + customerId + "/fundinginstruments"
		
		def result = withRest(uri: url) {
			handler.failure = { resp, data ->
				return [success: false, errors: data.errors]
			}
			handler.success = { resp, data ->
				return [success: true, creditCard: data.creditCard]
			}
			
			post(
				path: pathToFundingInstrument,
				headers: [Authorization: Util.auth64String],
				body: JsonOutput.toJson(moip),
				requestContentType: groovyx.net.http.ContentType.JSON
			)
		}
		
		return result
	}
	
	def makePayment(String security) {
		println security
		return true
	}
}

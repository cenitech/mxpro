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
class EmailAccountService {
	
	def springSecurityService
	def grailsApplication

	def createEmailAccount(Customer customer, String chosenEmailAddress, String password) {
		EmailAccount emailAccount = new EmailAccount()
		emailAccount.accountAddress = chosenEmailAddress.split('@')[0]
		emailAccount.fullAddress = chosenEmailAddress
		emailAccount.account = customer.account
		emailAccount.domain = customer.account.domain
		emailAccount.status = EmailAccountStatus.PENDING_SETUP
		emailAccount.legacyUser = chosenEmailAddress
		emailAccount.legacyPassword = password
		emailAccount.currentSize = 0
		emailAccount.save()
		
		[emailAccountId: emailAccount.id]
    }
	
	def changePassword(List<EmailAccount> emails, String newPassword) {
		def user = springSecurityService.getCurrentUser()
		
		emails.each {
			it.legacyNewPassword = newPassword
			it.status = EmailAccountStatus.PENDING_WEBMAIL_PASSWORD_UPDATE
			it.save()
			
			if (it.fullAddress == user.username) {
				user.password = newPassword
				user.save()
			}
		}
	}
}

package mxpro

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import br.com.moip.API
import br.com.moip.Client
import br.com.moip.authentication.Authentication
import br.com.moip.request.CreditCardRequest
import br.com.moip.request.CustomerRequest
import br.com.moip.request.FundingInstrumentRequest
import br.com.moip.request.HolderRequest
import br.com.moip.request.OrderRequest
import br.com.moip.request.PaymentRequest
import br.com.moip.request.PhoneRequest
import br.com.moip.request.TaxDocumentRequest
import br.com.moip.resource.Order
import br.nic.isavail.AvailClient
import br.nic.isavail.AvailResponseParser

@Transactional(readOnly = true)
class DomainCheckController {

	static REGEX_EMAIL = '([a-z0-9!#$%&\\\'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&\\\'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)';

	def checkAccountAndDomain() {
		String account = params.account
		String domain = params.domain + '.com.br'
		String address = params.account + '@' + domain

		if (!(address =~ REGEX_EMAIL)) {
			render template: "invalid"
			return;
		}
		
		if (EmailAccount.countByFullAddress(address) > 0) {
			render template: "notAvailable"
			return
		}

		// Initialize client object and send query
		AvailResponseParser arp = AvailClient.getInstance().sendQuery(domain);
		log.info(arp)
		
		if (arp.getStatus() == 0) {
			session['domainCheck/selectedDomain'] = domain
			session['domainCheck/selectedAccount'] = account
			session['domainCheck/chosenEmailAddress'] = address
			render template: "available", model: [account: account, domain: domain]
			return
		} else if (arp.getStatus() == 3) {
			render template: "invalid"
			return
		} else {
			def suggestions = []
			if (!arp.getSuggestions()?.isEmpty()) {
				def allSuggestions = arp.getSuggestions() - ['.br']
				suggestions.addAll(allSuggestions.collect {address.replace('.com.br','.'+it)})
			}
			
			render template: "notAvailable", model: [suggestions: suggestions]
			return
		}
	}
}

package mxpro

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.springframework.http.HttpStatus

@Transactional(readOnly = true)
class AccountStatusController {

	def index(String id) {
		[account: Account.findByTicket(id)]
	}
}

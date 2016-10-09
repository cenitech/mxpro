package mxpro

import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly=true)
class TicketController {
	
	def springSecurityService
	
	def createTicket(TicketCommand command) {
		if (command.hasErrors()) {
			flash.message = "Por favor preencha os campos de email/telefone e descrição do problema."
			render ([url:createLink(controller: 'dashboard', action: 'suporte')]  as JSON)
			return
		}
		
		int maxNumber = 1000
		if (Ticket.count() > 0) {
			maxNumber = Ticket.withCriteria {
				projections{
					max 'number'
				}
			}[0]
			maxNumber++
		}
		
		Ticket ticket = new Ticket()
		bindData(ticket, command)
		ticket.number = maxNumber
		ticket.begin = new Date()
		ticket.status = "Em análise"
		
		ticket = ticket.save()
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		
		if (customer.account.supportTickets)
			customer.account.supportTickets += ticket
		else
			customer.account.supportTickets = [ticket]
		customer.account.save()
		
		flash.message = "Ticket criado com sucesso, aguarde o retorno da nossa equipe de suporte."
		render ([url:createLink(controller: 'dashboard', action: 'suporte')]  as JSON)
	}
}

class TicketCommand {
	String contact
	String description
	
	static constraints = {
		contact nullable: false
		description nullable: false
	}
}
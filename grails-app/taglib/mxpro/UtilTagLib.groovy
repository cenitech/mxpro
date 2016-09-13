package mxpro


class UtilTagLib {

	static namespace = 'util'

	//static defaultEncodeAs = [taglib:'html']
	//static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

	def springSecurityService

	def nameOfUser = { attrs, body ->
		Customer customer = Customer.findByUser(springSecurityService.currentUser)
		out << customer.name
	}
}

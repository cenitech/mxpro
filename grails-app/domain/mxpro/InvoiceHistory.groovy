package mxpro


class InvoiceHistory {

	Date eventDate
	String description
	DomainStatus oldStatus
	DomainStatus newStatus
	
    static constraints = {
		description blank: false
		oldStatus nullable: true
    }
}

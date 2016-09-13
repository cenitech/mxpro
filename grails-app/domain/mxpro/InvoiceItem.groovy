package mxpro


class InvoiceItem {

	BigDecimal quantity
	String description
	BigDecimal amount
	
    static constraints = {
		description blank: false
    }
}

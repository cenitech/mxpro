package mxpro



class Invoice {

	String id
	String number
	InvoiceStatus status
	BigDecimal total
	Payment payment
	Date timestamp
	Set<InvoiceItem> items
	Set<InvoiceHistory> invoiceHistory
	
	static embedded = ['items', 'invoiceHistory']
	
    static constraints = {
		number unique: true, blank: false
		payment nullable: true
    }
}

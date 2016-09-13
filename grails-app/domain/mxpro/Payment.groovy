package mxpro

import java.util.Set;


class Payment {

	String id
	String internalCode
	String externalCode
	String method
	BigDecimal amount
	Date timestamp
	PaymentStatus status
	Customer customer
	Set<PaymentHistory> paymentHistory
	
	static embedded = ['paymentHistory']
	
    static constraints = {
		internalCode unique: true
		externalCode nullable: true
    }
}

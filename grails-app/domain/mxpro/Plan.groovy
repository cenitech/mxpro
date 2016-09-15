package mxpro

import java.util.Set;


class Plan {

	String id
	int showOrder
	String planName
	String planDescription
	String priceDescription
	int months
	BigDecimal price
	Date startDate
	Date endDate
	int maxSize // max size in MB for each email account
	int maxEmailAccounts // max number of email accounts
	boolean active
	String fullDescription
	
    static constraints = {
		endDate nullable: true
    }
	
	BigDecimal total() {
		return price * months
	}
}

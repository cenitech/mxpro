package mxpro



class EmailAccount {

	String id
	String accountAddress
	String fullAddress
	String legacyUser
	String legacyPassword
	String legacyNewPassword
	Integer currentSize // current size in MB for each email account
	Account account
	Domain domain
	EmailAccountStatus status
	
    static constraints = {
   		accountAddress blank: false
		fullAddress unique: true
		legacyNewPassword nullable: true
    }
}

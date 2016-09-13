package mxpro



class EmailAccount {

	String id
	String accountAddress
	String fullAddress
	String legacyUser
	String legacyPassword
	Integer currentSize // current size in MB for each email account
	Account account
	Domain domain
	EmailAccountStatus status
	
	static belongsTo = [account : Account]
	
    static constraints = {
   		accountAddress blank: false
		fullAddress unique: true
    }
}

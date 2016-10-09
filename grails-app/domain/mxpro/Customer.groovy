package mxpro


class Customer {

	String id
	String name
	String idNumber
	String idType
	String birthdate
	String mobile
	Address address
	User user
	Account account
	CreditCard currentCreditCard

	static embedded = ['address']
		
    static constraints = {
		idNumber unique: true
		address nullable: true
		user nullable: true
		account nullable: true
		currentCreditCard nullable: true
    }
}

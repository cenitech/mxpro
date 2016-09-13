package mxpro


class Customer {

	String id
	String name
	String idNumber
	String idType
	String birthdate
	User user
	Account account
	String mobile
	CreditCard currentCreditCard
	Address address

	static embedded = ['address']
	static hasMany = [creditCardHistory: CreditCard]
		
    static constraints = {
		idNumber unique: true
    }
}

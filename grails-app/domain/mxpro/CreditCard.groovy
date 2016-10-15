package mxpro


class CreditCard {

	String id
	String name
	String cardnumber
	String brand
	String first6Digits
	String last4Digits
	String expiration
	String security
	String phoneNumber
	String birthDate
	String idType
	String idNumber
	String token // token from payment intermediary, used for one-click-buy or signatures.
	Address address // credit card address, sometimes different from customer address
	
	static embedded = ['address']
	static transients = ['cardnumber', 'expiration', 'security']
	
    static constraints = {
		cardnumber bindable: true
		expiration bindable: true
		security bindable: true
		first6Digits nullable: true
		last4Digits nullable: true
		token nullable: true
		address nullable: true
    }
}

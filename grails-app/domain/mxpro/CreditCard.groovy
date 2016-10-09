package mxpro


class CreditCard {

	String id
	String name
	String brand
	String first4Digits
	String last4Digits
	String expiration
	String token // token from payment intermediary, used for one-click-buy or signatures.
	Address address // credit card address, sometimes different from customer address
	
	static embedded = ['address']
	
    static constraints = {
		token nullable: true
		address nullable: true
    }
}

package mxpro


class Address {

	String number
	String street
	String complement
	String city
	String region
	String country
	String zip
	String latitude
	String longitude
	
    static constraints = {
		number nullable: true
		complement nullable: true
		latitude nullable: true
		longitude nullable: true
    }
	
	String getAddressString() {
		return "$street, $number - $city - $region"
	}
}

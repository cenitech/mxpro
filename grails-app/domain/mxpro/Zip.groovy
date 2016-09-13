package mxpro

import org.bson.types.ObjectId

class Zip {

	ObjectId id
    String neighborhood
    String zip
    String city
    String region
    String street
    String type
	
    static constraints = {
		zip unique:true
    }
}

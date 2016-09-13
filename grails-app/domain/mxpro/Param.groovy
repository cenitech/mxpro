package mxpro


class Param {

	String id
	String name
	String value
	
    static constraints = {
		name unique:true
		value blank:false
    }
}

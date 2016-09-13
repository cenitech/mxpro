package mxpro


class Domain {

	String id
	String name
	String registrar
	String registrarRefId
	DomainStatus domainStatus
	
	static belongsTo = [account : Account]
	
    static constraints = {
		name blank: false
		registrar nullable: true
		registrarRefId nullable: true
    }
}

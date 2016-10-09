package mxpro


class Ticket {

	String id
	int number
	Date begin
	Date end
	String contact
	String description
	String resolution
	String status
	
    static constraints = {
		end nullable: true
		resolution nullable: true
    }
}

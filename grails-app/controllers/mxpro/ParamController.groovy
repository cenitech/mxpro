package mxpro

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ParamController {

    def index() {
		render view: "index"
	}
	
	@Transactional
	def update(Param paramInstance) {
		if (paramInstance == null) {
			notFound()
			return
		}
		
		paramInstance.save()
		render status: OK
	}
	
	protected void notFound() {
		render status: NOT_FOUND
	}
}

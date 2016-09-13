package mxpro

import grails.converters.JSON

import org.springframework.http.HttpStatus

class AddressController {

    def zip() {
		Zip zip = Zip.findByZip(params.id)
		
		if (zip) {
			render zip as JSON
		}
		render HttpStatus.NOT_FOUND
	}
}

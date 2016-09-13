environments {
	development {
		grails {
			mongodb {
				host = "localhost"
				port = 27017
				databaseName = "mxpro"
			}
		}
	}
	production {
		grails {
			mongodb {
				host = "ds031865.mlab.com"
				port = 31865
				databaseName = "mxpro"
				username = "mxpro"
				password = "mxpro"
			}
		}
	}
}
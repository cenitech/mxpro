// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
    all:           '*/*', // 'all' maps to '*' or the first available format in withFormat
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    hal:           ['application/hal+json','application/hal+xml'],
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}


grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

// configure passing transaction's read-only attribute to Hibernate session, queries and criterias
// set "singleSession = false" OSIV mode in hibernate configuration after enabling
grails.hibernate.pass.readonly = false
// configure passing read-only to OSIV session by default, requires "singleSession = false" OSIV mode
grails.hibernate.osiv.readonly = false

environments {
    development {
        grails.logging.jul.usebridge = true
		moip.user='lucas.ceni@gmail.com'
		moip.authToken='0D9YFZEMAUBNHBLSYBPI4ANCRAPLFKIR'
		moip.authKey='5ZO0DTPCLWSY7TJOX2D44J3ODFKGGAVPGDIIPVAX'
		moip.signatureKey="8UBTLDQQAXG0QZI7BOUHIBFPNEMFAQ4P"
		moip.publicKey='\
-----BEGIN PUBLIC KEY-----\
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtDqEEnRd+dJIOF9SlVnw\
msWp7nFKC/4s38AjF80mYcDe+6mklo9jR4Ri9+EjM5zqWdd7xMZmtUG9GHU3Z16t\
6d6mxMbOXd41kXm6pjyOv1Qrj4imzsP4War0BZ5D/8DL1eSJcjrspWNhOtS3+6gk\
uEWehCDCXu4SCPOSKuJfqg7fU6AuQs+M1g+red59cjPdQtsaBKc4M9LMq3chCbS8\
uA32aBorK98omo6A7V5bz6nqHXNShs8Ajd3P0tdgALaTWFQXH9tBhTWVPfEQSHep\
Lf/fIsSN9bsJCOAHlf2OoD3lOXFZNsVdpbTkF+ytoBkykNyk2rAmmRhkGdsiVu6j\
qQIDAQAB\
-----END PUBLIC KEY-----'
    }
    production {
        grails.logging.jul.usebridge = false
		moip.user='lucas.ceni@gmail.com'
		moip.authToken='7GJJYAZOS6HL11OGOPQZ0ZDPQHJP2JH1'
		moip.authKey='LCFNOMCQSCJEGHVVXP44R096AZEO4NRJXGFFO0HM'
		moip.signatureKey="KG49QHXOGTWCLQA6CMVNABNFWSZYTJLN"
		moip.publicKey='\
-----BEGIN PUBLIC KEY-----\
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt9GLci6jWikcERGCxIP9\
30H6SQgkaJigKJrtO+XiBYCQ8Demxupde5/YWiaT0HGj1lJ0TU6uWF1sGZ1eBwVF\
pwHcs+8qfE+GjnS5gjIL1UldapV2txQ8/lmL/5s0u+6pVLqgB7m5E0a6JF5QXnej\
alOm0noY/gdkbibUJpNy2Rkg7wZqUJ1JeqJPUTaQVFpthymoOa1LECZX/1qo+TYM\
dd+sgt9a5I4AtfrsRrLcxE2jeVWMW5oZm749BtHICe3aytVgaoqztc6YW9zr0LEw\
O0yj49jFAVSK/SJc0zTQBk4WKN/8nRiQhuBzVRSN3luH4Fmt2TKUhOxFekmPePhS\
LQIDAQAB\
-----END PUBLIC KEY-----'

        grails.serverURL = "http://www.mxpro.ml"
    }
}

// log4j configuration
log4j.main = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

// Fix grails taglib g:paginate to work with bootstrap css.
grails.plugins.twitterbootstrap.fixtaglib = true

// spring security configuration
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/dashboard'
grails.plugin.springsecurity.userLookup.userDomainClassName = 'mxpro.User'
grails.plugin.springsecurity.securityConfigType = "InterceptUrlMap"
grails.plugin.springsecurity.interceptUrlMap = [
	'/':					['permitAll'],
	'/index':				['permitAll'],
	'/index.gsp':			['permitAll'],
	'/assets/**':			['permitAll'],
	'/**/js/**':			['permitAll'],
	'/**/css/**':			['permitAll'],
	'/**/images/**':		['permitAll'],
	'/**/favicon.ico':		['permitAll'],
	'/login/**':			['permitAll'],
	'/logout/**':			['permitAll'],
	'/domainCheck/**':		['permitAll'],
	'/createAccount/**':	['permitAll'],
	'/address/**':			['permitAll'],
	'/accountStatus/**':	['permitAll'],
	'/param/**':			['ROLE_ADMIN'],
	'/dashboard/**':		['isAuthenticated()'],
	'/emailAccount/**':		['isAuthenticated()'],
	'/billing/**':			['isAuthenticated()'],
	'/ticket/**':			['isAuthenticated()']
 ]

grails.gorm.failOnError = true
package mxpro


class Account {

	String id
	AccountStatus status
	Date expiration
	Date lastPayment
	BigDecimal amount
	BigDecimal balance
	Domain domain
	Plan currentPlan
	int maxSize // max size in MB for each email account
	int maxEmailAccounts // max number of email accounts
	Boolean notifyNextPaymentDates
	Boolean notifyBySMS
	String webmailURL
	String ticket // ticket for customer to see the account status
	Set<String> serversURL
	String emailAccountsBillingStatus
	String domainBillingStatus

	static embedded = ['serversURL']
	static hasMany = [invoices : Invoice, emailAccounts : EmailAccount]
	static belongsTo = [customer : Customer]
		
    static constraints = {
		lastPayment nullable: true
		amount nullable: true
		balance nullable: true
		currentPlan nullable: true
    }
}

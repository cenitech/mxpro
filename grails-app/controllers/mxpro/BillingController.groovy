package mxpro

import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly=true)
class BillingController {
	
	def springSecurityService
	def billingService
	
	def openPaymentForm() {
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		
		render view: 'payment', model: [currentCreditCard: customer.currentCreditCard, account: customer.account]
	}
	
	def makePayment(String security) {
		
		if (!security?.trim()) {
			flash.message = "Por favor informe o código de segurança."
			openPaymentForm()
			return
		}
		
		if (billingService.makePayment(security)) {
			flash.message = "Pagamento realizado com sucesso, seu novo plano será configurado em até 24 horas."
			render ([url:createLink(controller: 'dashboard', action: 'financeiro')]  as JSON)
		} else {
			flash.message = message(code: "creditCardNotValid")
			openPaymentForm()
			return
		}
	}
	
	def openChangePlanForm() {
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		
		def currentPlan = customer.account.currentPlan
		def availablePlans = Plan.findAllByActiveAndIdNotEqual(true, currentPlan.id, [sort:'showOrder'])
		 
		render view: 'changePlan', model: [currentPlan: currentPlan, availablePlans: availablePlans]
	}
	
	def saveNewPlan(Plan plan) {
		if (plan == null) {
			flash.message = "Nenhuma modificação foi feita, nenhum plano foi selecionado."
			openChangePlanForm()
			return
		}
		
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		customer.account.currentPlan = plan
		customer.account.save()
		
		flash.message = "Plano alterado, verifique sua fatura e realize um pagamento para ativá-lo. Se sua conta possui saldo suficiente, o novo plano será ativado automaticamente."
		render ([url:createLink(controller: 'dashboard', action: 'financeiro')]  as JSON)
	}
	
	def openPersonalDataForm() {
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		
		def personalData = new PersonalDataCommand()
		bindData(personalData, customer)
		bindData(personalData, customer.address)
		
		render view: 'personalData', model: [personalData: personalData]
	}
	
	def savePersonalData(PersonalDataCommand command) {
		if (command.hasErrors()) {
			render view: 'personalData', model: [personalData: command]
			return
		}
		
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		
		bindData(customer, command)
		bindData(customer.address, command)
		
		customer.save()
		
		flash.message = "Dados salvos com sucesso"
		render ([url:createLink(controller: 'dashboard', action: 'financeiro')]  as JSON)
	}
	
	def openCreditCardForm() {
		def customer = Customer.findByUser(springSecurityService.getCurrentUser())
		
		def creditCard = new CreditCardCommand()
		
		render view: 'creditCard', model: [creditCard: creditCard]
	}
	
	def saveCreditCard(CreditCardCommand command) {
		if (command.hasErrors()) {
			render view: 'creditCard', model: [creditCard: command]
			return
		}
		
		if (billingService.addCreditCardToCustomer(command.creditCardHash)) {
			flash.message = "Cartão de crédito salvo com sucesso na instituição financeira."
			render ([url:createLink(controller: 'dashboard', action: 'financeiro')]  as JSON)
		} else {
			command.errors.rejectValue('creditCardValidator', 'creditCardNotValid')
			render view: 'creditCard', model: [creditCard: command]
		}
	}
	
	def printStatement() {
		
	}
}

class PersonalDataCommand {
	def springSecurityService
	
	String name
	String idNumber
	String mobile
	String zip
	String street
	String number
	String complement
	String city
	String region
	
	static constraints = {
		idNumber cpf: true, validator: { val, obj ->
			def customer = Customer.findByUser(obj.springSecurityService.getCurrentUser())
			return Customer.countByIdNumber(val) == 0 || customer.idNumber.equals(val)
		}
		number nullable: true
		complement nullable: true
	}
	
	String getAddressString() {
		return "$street, $number - $city - $region"
	}
}

class CreditCardCommand {
	def springSecurityService
	
	String name
	String cardnumber
	String brand
	String expiration
	String security
	String zip
	String street
	String number
	String complement
	String city
	String region
	String creditCardHash
	def creditCardValidator // used to show messages in an specific part of response page in case of error from bank.
	
	static constraints = {
		brand nullable: true
		number nullable: true
		complement nullable: true
		creditCardHash nullable: true		
		creditCardValidator nullable: true
	}
}
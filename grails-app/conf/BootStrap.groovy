import mxpro.Param
import mxpro.Plan
import mxpro.Role
import mxpro.User

class BootStrap {

    def init = { servletContext ->
		initParams()
//		initUsers()
		initPlans()
    }
    def destroy = {
    }
	
	def initParams() {
		if (Param.count() == 0) {
			new Param([name:'mxpro.registrobr.price', value:'30.00']).save()
			new Param([name:'mxpro.registrobr.desc', value:'R$ 30,00']).save()
		}
	}
	
	def initUsers() {
		if (User.count() == 0) {
			User user = new User();
			user.username = 'mxpro'
			user.password = 'teste123'
			user.enabled = true
			user.authorities = [Role.ROLE_USER, Role.ROLE_ADMIN]
			user.save()
		}
	}
	
	def initPlans() {
		if (Plan.count() == 0) {
			Date now = new Date()
			new Plan([showOrder: 1, planName:'3 meses', planDescription:'3 meses sendo R$ 21,90/mês', priceDescription:'R$ 21,90', months: 3, price:new BigDecimal(21.90), startDate:now, maxSize: 50, maxEmailAccounts: 2, active:true, fullDescription: 'Trimestral - 50Gb - 2 contas de email.']).save()
			new Plan([showOrder: 2, planName:'6 meses', planDescription:'6 meses sendo R$ 18,90/mês', priceDescription:'R$ 18,90', months: 6, price:new BigDecimal(18.90), startDate:now, maxSize: 50, maxEmailAccounts: 2, active:true, fullDescription: 'Semestral - 50Gb - 2 contas de email.']).save()
			new Plan([showOrder: 3, planName:'1 ano', planDescription:'12 meses sendo R$ 14,90/mês', priceDescription:'R$ 14,90', months: 12, price:new BigDecimal(14.90), startDate:now, maxSize: 50, maxEmailAccounts: 2 ,active:true, fullDescription: 'Anual - 50Gb - 2 contas de email.']).save()
		}
	}
}

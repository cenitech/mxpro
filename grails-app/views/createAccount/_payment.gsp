<div class="row">
	<div class="col-xs-12">
		<fieldset>
			<legend>Assinatura</legend>
			<div class="btn-group btn-group-justified" data-toggle="buttons">
				<g:each in="${mxpro.Plan.findAllByActive(true, [sort:'showOrder'])}" var="plan" status="i">
					<label class="btn btn-default ${payment ? (payment.plan?.id == plan.id ? 'active' : '') : (i == 0 ? 'active' : '')}">
						<input type="radio" name="plan" value="${plan.id}" data-pricedesc="${plan.priceDescription}" ${payment ? (payment.plan?.id == plan.id ? 'checked' : '') : (i == 0 ? 'checked' : '')}/> ${plan.planName}
					</label>
				</g:each>
			</div>
			<div class="pull-right">
				<h3 class="price"><span id="price"></span><span class="month-label">/mês</span></h3>
			</div>
		</fieldset>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<fieldset>
			<legend>Registro</legend>
			<div class="pull-right">
				<h3 class="price">${mxpro.Param.findByName('mxpro.registrobr.desc').value}<span class="month-label">/ano</span></h3>
			</div>
		</fieldset>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<fieldset class="payment-fieldset">
			<legend>Pagamento</legend>
			<div class="form-group ${hasErrors(bean:payment,field:'holder','has-error')}">
				<label for="holder">Titular</label>
				<g:textField name="holder" class="form-control" value="${fieldValue(bean:payment,field:'holder')}"/>
			</div>
			<div class="row">
				<div class="col-xs-9">
					<div class="form-group ${hasErrors(bean:payment,field:'cardnumber','has-error')}">
						<label for="cardnumber">Número do cartão de crédito</label>
						<g:textField name="cardnumber" class="form-control" value="${fieldValue(bean:payment,field:'cardnumber')}"/>
					</div>
				</div>
				<div class="col-xs-3 credit-card">
					<img src="${assetPath(src: 'visa.jpg')}" width="60"/>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-4">
					<div class="form-group ${hasErrors(bean:payment,field:'expiration','has-error')}">
						<label for="expiration">Validade</label>
						<g:textField name="expiration" class="form-control" value="${fieldValue(bean:payment,field:'expiration')}"/>
					</div>
				</div>
				<div class="col-xs-1">
				</div>
				<div class="col-xs-6">
					<div class="form-group ${hasErrors(bean:payment,field:'security','has-error')}">
						<label for="security">Código de segurança</label>
						<g:textField name="security" class="form-control" value="${fieldValue(bean:payment,field:'security')}"/>
					</div>
				</div>
				<div class="col-xs-1">
				</div>
			</div>
			<g:hiddenField name="brand"/>
			<g:hiddenField name="creditCardHash"/>
			<g:hiddenField name="pubkey" value="${grailsApplication.config.moip.publicKey}"/>
			<g:submitToRemote id="btnSubmit" value="Próximo" class="btn btn-primary pull-right"
				url="[controller: 'createAccount', action: 'gotoConfirm']"
				update="createAccountForm" before="hash()"/>
			<g:submitToRemote value="Voltar" class="btn btn-default pull-left" url="[controller: 'createAccount', action: 'backToAddress']" update="createAccountForm"/>
		</fieldset>
	</div>
</div>
<script>
	function priceDesc() {
		var txt = $('input[name=\'plan\']:checked').data('pricedesc');
		jQuery('#price').text(txt);
	}

	function hash() {
		var cc = new Moip.CreditCard({
			number : $('input[name=\'cardnumber\']').val().replace(/\s/g, ''),
			cvc : $('input[name=\'security\']').val(),
			expMonth : $('input[name=\'expiration\']').val().substring(0,2),
			expYear : $('input[name=\'expiration\']').val().substring(5,7),
			pubKey : $('input[name=\'pubkey\']').val()
		});
		if (cc.isValid()) {
			var brand = Moip.Validator.cardType(cc.number).brand;
			
			$('input[name=\'brand\']').val(brand);
			$('input[name=\'creditCardHash\']').val(cc.hash());
		} else {
			$('input[name=\'creditCardHash\']').val('');
			return false; // Don't submit the form
		}
	}

	$(document).on('change', 'input[name=\'plan\']', function() {
		priceDesc();
	});

	priceDesc();

	$('input[name=\'cardnumber\']').mask('?9999 9999 9999 9999');
	$('input[name=\'expiration\']').mask('?99/9999');
	$('input[name=\'security\']').mask('?9999');
</script>
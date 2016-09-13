<div class="row">
	<div class="col-xs-12">
		<fieldset>
			<legend>Confirme seus dados</legend>
			<div class="form-group">
				<p><strong>Email: </strong><g:message message="${session['domainCheck/chosenEmailAddress']}"/></p>
				<p><strong>Cliente: </strong><g:message message="${session['createAccount/customer'].name}"/></p>
				<p><strong>CPF: </strong><g:message message="${session['createAccount/customer'].idNumber}"/></p>
				<p><strong>Telefone: </strong><g:message message="${session['createAccount/customer'].mobile}"/></p>
				<p><strong>Endereço: </strong><g:message message="${session['createAccount/address'].getAddressString()}"/></p>
				<hr/>
				<p><strong>Registro.br: </strong><g:message message="${mxpro.Param.findByName('mxpro.registrobr.desc').value}" /></p>
				<p><strong>Assinatura: </strong><g:message message="${session['createAccount/payment'].plan.planDescription}"/></p>
				<p><strong>Titular: </strong><g:message message="${session['createAccount/payment'].holder}"/></p>
				<p><strong>Número do cartão: </strong><g:message message="${session['createAccount/payment'].first4Digits} **** **** ${session['createAccount/payment'].last4Digits}"/></p>
				<hr/>
				<p><strong>Total desta fatura: <g:formatNumber number="${session['createAccount/payment'].total}" type="currency" currencyCode="BRL"/></strong></p>
			</div>
			<g:submitToRemote id="btnSubmit" value="Confirmar e assinar" class="btn btn-primary pull-right"
				url="[controller: 'createAccount', action: 'confirm']"
				update="createAccountForm" />
			<g:submitToRemote value="Voltar" class="btn btn-default pull-left" url="[controller: 'createAccount', action: 'backToPayment']" update="createAccountForm"/>
		</fieldset>
	</div>
</div>
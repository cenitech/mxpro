<fieldset>
	<legend>Endereço</legend>
	<div class="row">
		<div class="col-xs-5">
			<div class="form-group ${hasErrors(bean:address,field:'zip','has-error')}">
				<label for="zip">CEP</label>
				<g:textField name="zip" class="form-control" value="${fieldValue(bean:address,field:'zip')}"/>
			</div>
		</div>
		<div class="col-xs-7">
			<div class="zip-label"><a href="#">Não sei o meu CEP</a></div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-9">
			<div class="form-group ${hasErrors(bean:address,field:'street','has-error')}">
				<label for="street">Logradouro</label>
				<g:textField name="street" class="form-control" value="${fieldValue(bean:address,field:'street')}"/>
			</div>
		</div>
		<div class="col-xs-3">
			<div class="form-group ${hasErrors(bean:address,field:'number','has-error')}">
				<label for="number">Núm.</label>
				<g:textField name="number" class="form-control" value="${fieldValue(bean:address,field:'number')}"/>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group ${hasErrors(bean:address,field:'complement','has-error')}">
				<label for="city">Complemento</label>
				<g:textField name="complement" class="form-control" value="${fieldValue(bean:address,field:'complement')}"/>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-8">
			<div class="form-group ${hasErrors(bean:address,field:'city','has-error')}">
				<label for="city">Cidade</label>
				<g:textField name="city" class="form-control" value="${fieldValue(bean:address,field:'city')}"/>
			</div>
		</div>
		<div class="col-xs-4">
			<div class="form-group ${hasErrors(bean:address,field:'region','has-error')}">
				<label for="region">Estado</label>
				<g:select name="region" from="${mxpro.Regions.values()}" class="form-control" noSelection="['':'']" value="${fieldValue(bean:address,field:'region')}"/>
			</div>
		</div>
	</div>
	<g:submitToRemote id="btnSubmit" value="Próximo" class="btn btn-primary pull-right" url="[controller: 'createAccount', action: 'gotoPayment']" update="createAccountForm"/>
	<a href="${createLink(controller: 'createAccount', action: 'backToIndex')}" class="btn btn-default pull-left">Voltar</a>
</fieldset>
<script>
	$('input[name=\'zip\']').mask('?99999-999',{completed:function(){${remoteFunction(controller: 'address', action: 'zip', id: '\'+this.val()+\'', onSuccess: 'app.applyAddressData(data)')}}});
	$('input[name=\'zip\']').focus();
</script>
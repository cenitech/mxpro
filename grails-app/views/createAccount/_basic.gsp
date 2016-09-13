<fieldset>
	<legend><g:message message="${session['domainCheck/chosenEmailAddress']}"/></legend>
	<div class="form-group ${hasErrors(bean:customer,field:'name','has-error')}">
		<label for="name">Nome do cliente</label>
		<g:textField name="name" class="form-control" value="${fieldValue(bean:customer,field:'name')}"/>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="form-group ${hasErrors(bean:customer,field:'idNumber','has-error')}">
				<label for="idNumber">CPF</label>
				<g:textField name="idNumber" class="form-control" value="${fieldValue(bean:customer,field:'idNumber')}"/>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="form-group ${hasErrors(bean:customer,field:'mobile','has-error')}">
				<label for="mobile">Telefone celular</label>
				<g:textField name="mobile" class="form-control" value="${fieldValue(bean:customer,field:'mobile')}"/>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
		</div>
		<div class="col-sm-6">
			<div class="form-group ${hasErrors(bean:customer,field:'birthdate','has-error')}">
				<label for="birthdate">Data de Nascimento</label>
				<g:textField name="birthdate" class="form-control" value="${fieldValue(bean:customer,field:'birthdate')}"/>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="form-group ${hasErrors(bean:customer,field:'password','has-error')}">
				<label for="password">Senha</label>
				<g:passwordField name="password" class="form-control"/>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="form-group ${hasErrors(bean:customer,field:'confirmation','has-error')}">
				<label for="confirmation">Confirmar senha</label>
				<g:passwordField name="confirmation" class="form-control"/>
			</div>
		</div>
	</div>
	<g:submitToRemote id="btnSubmit" value="Próximo" class="btn btn-primary pull-right" url="[controller: 'createAccount', action: 'gotoAddress']" update="createAccountForm"/>
	<a href="${createLink(uri: '/')}" class="btn btn-default pull-left">Voltar</a>
</fieldset>
<script>
	$('input[name=\'idNumber\']').mask('?999.999.999-99');
	$('input[name=\'mobile\']').mask('?(99) 999999999');
	$('input[name=\'birthdate\']').mask('?99/99/9999');
	$('input[name=\'name\']').focus();
</script>
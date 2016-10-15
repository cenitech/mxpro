<style>
	.zip-label {
		margin-top: 35px;
		font-size: 12pt;
	}
</style>
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">
				<span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span>
			</button>
			<h4 class="modal-title">Novo Cartão de Crédito</h4>
		</div>
		<div class="modal-body">
			<g:if test="${hasErrors(bean:creditCard,field:'creditCardValidator', 'true')}">
				<div class="flash">
					<div class="bs-callout bs-callout-warning">
						${fieldError(bean: creditCard, field: 'creditCardValidator')}
					</div>
				</div>
				<script>
					$('.flash').delay(5000).slideUp(200);
				</script>
			</g:if>
			<g:form role="form" elementId="creditCardForm">
				<g:hiddenField name="brand"/>
				<g:hiddenField name="creditCardHash"/>
				<g:hiddenField name="pubkey" value="${grailsApplication.config.moip.publicKey}"/>
				
				<div class="form-group ${hasErrors(bean:creditCard,field:'name','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'name')}">
					<label for="holder">Titular do cartão de crédito</label>
					<g:textField name="name" class="form-control" value="${fieldValue(bean:creditCard,field:'name')}"/>
				</div>
				<div class="row">
					<div class="col-xs-4">
						<div class="form-group ${hasErrors(bean:creditCard,field:'idNumber','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'idNumber')}">
							<label for="idNumber">CPF</label>
							<g:textField name="idNumber" class="form-control" value="${fieldValue(bean:creditCard,field:'idNumber')}"/>
						</div>
					</div>
					<div class="col-xs-4">
						<div class="form-group ${hasErrors(bean:creditCard,field:'birthDate','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'birthDate')}">
							<label for="birthDate">Data de Nascimento</label>
							<g:textField name="birthDate" class="form-control" value="${fieldValue(bean:creditCard,field:'birthDate')}"/>
						</div>
					</div>
					<div class="col-xs-4">
						<div class="form-group ${hasErrors(bean:creditCard,field:'phoneNumber','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'phoneNumber')}">
							<label for="phoneNumber">Telefone</label>
							<g:textField name="phoneNumber" class="form-control" value="${fieldValue(bean:creditCard,field:'phoneNumber')}"/>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6">
						<div class="form-group ${hasErrors(bean:creditCard,field:'cardnumber','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'cardnumber')}">
							<label for="cardnumber">Número do cartão de crédito</label>
							<g:textField name="cardnumber" class="form-control" value="${fieldValue(bean:creditCard,field:'cardnumber')}"/>
							<div id="cc-brand" class="hidden" style="top: 37px; right: 20px;"></div>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group ${hasErrors(bean:creditCard,field:'expiration','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'expiration')}">
							<label for="expiration">Validade</label>
							<g:textField name="expiration" class="form-control" value="${fieldValue(bean:creditCard,field:'expiration')}"/>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group ${hasErrors(bean:creditCard,field:'security','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'security')}">
							<label for="security">CCV/CVC</label>
							<g:textField name="security" class="form-control" value="${fieldValue(bean:creditCard,field:'security')}"/>
						</div>
					</div>
				</div>
				<fieldset>
					<legend>Endereço</legend>
					<div class="row">
						<div class="col-xs-3">
							<div class="form-group ${hasErrors(bean:creditCard,field:'zip','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'zip')}">
								<label for="zip">CEP</label>
								<g:textField name="zip" class="form-control" value="${fieldValue(bean:creditCard,field:'zip')}"/>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="form-group ${hasErrors(bean:creditCard,field:'street','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'street')}">
								<label for="street">Logradouro</label>
								<g:textField name="street" class="form-control" value="${fieldValue(bean:creditCard,field:'street')}"/>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="form-group ${hasErrors(bean:creditCard,field:'number','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'number')}">
								<label for="number">Núm.</label>
								<g:textField name="number" class="form-control" value="${fieldValue(bean:creditCard,field:'number')}"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<div class="form-group ${hasErrors(bean:creditCard,field:'complement','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'complement')}">
								<label for="city">Complemento</label>
								<g:textField name="complement" class="form-control" value="${fieldValue(bean:creditCard,field:'complement')}"/>
							</div>
						</div>
						<div class="col-xs-5">
							<div class="form-group ${hasErrors(bean:creditCard,field:'city','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'city')}">
								<label for="city">Cidade</label>
								<g:textField name="city" class="form-control" value="${fieldValue(bean:creditCard,field:'city')}"/>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="form-group ${hasErrors(bean:creditCard,field:'region','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'region')}">
								<label for="region">Estado</label>
								<g:select name="region" from="${mxpro.Regions.values()}" class="form-control" noSelection="['':'']" value="${fieldValue(bean:creditCard,field:'region')}"/>
							</div>
						</div>
					</div>
				</fieldset>
			</g:form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-success"
					onclick="${remoteFunction(controller: 'billing', 
					action: 'saveCreditCard', 
					params: 'jQuery(\'#creditCardForm\').serialize() ',
					onSuccess: 'app.urlRedirect(data)',
					before: 'app.hash()')}">Salvar</button>
			<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancelar</button>
		</div>
	</div>
	<!-- /.modal-content -->
</div>
<script>
	$(document).ready(function() {
		$('input[name=\'idNumber\']').mask('?999.999.999-99');
		$('input[name=\'phoneNumber\']').mask('?(99) 999999999');
		$('input[name=\'birthDate\']').mask('?99/99/9999');
		$('input[name=\'cardnumber\']').mask('?9999 9999 9999 9999');
		$('input[name=\'cardnumber\']').blur(app.showCreditCardBrand);
		$('input[name=\'expiration\']').mask('?99/9999');
		$('input[name=\'security\']').mask('?9999');
		$('input[name=\'zip\']').mask('?99999-999',{completed:function(){${remoteFunction(controller: 'address', action: 'zip', id: '\'+this.val()+\'', onSuccess: 'app.applyAddressData(data)')}}});
		$('[data-toggle="tooltip"]').tooltip();
		$('input[name=name]').focus();
	});
</script>
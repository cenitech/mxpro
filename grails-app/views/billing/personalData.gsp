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
			<h4 class="modal-title">Titular da conta</h4>
		</div>
		<div class="modal-body">
			<g:form role="form" elementId="personalDataForm">
				<div class="form-group ${hasErrors(bean:personalData,field:'name','has-error')}" data-toggle="tooltip" title="${fieldError(bean: personalData, field: 'name')}">
					<label for="name">Nome do cliente</label>
					<g:textField name="name" class="form-control" value="${fieldValue(bean:personalData,field:'name')}"/>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group ${hasErrors(bean:personalData,field:'idNumber','has-error')}" data-toggle="tooltip" title="${fieldError(bean: personalData, field: 'idNumber')}">
							<label for="idNumber">CPF</label>
							<g:textField name="idNumber" class="form-control" value="${fieldValue(bean:personalData,field:'idNumber')}"/>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group ${hasErrors(bean:personalData,field:'mobile','has-error')}" data-toggle="tooltip" title="${fieldError(bean: personalData, field: 'mobile')}">
							<label for="mobile">Telefone celular</label>
							<g:textField name="mobile" class="form-control" value="${fieldValue(bean:personalData,field:'mobile')}"/>
						</div>
					</div>
				</div>
				<fieldset>
					<legend>Endereço</legend>
					<div class="row">
						<div class="col-xs-5">
							<div class="form-group ${hasErrors(bean:personalData,field:'zip','has-error')}" data-toggle="tooltip" title="${fieldError(bean: personalData, field: 'zip')}">
								<label for="zip">CEP</label>
								<g:textField name="zip" class="form-control" value="${fieldValue(bean:personalData,field:'zip')}"/>
							</div>
						</div>
						<div class="col-xs-7">
							<div class="zip-label"><a href="#">Não sei o meu CEP</a></div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-9">
							<div class="form-group ${hasErrors(bean:personalData,field:'street','has-error')}" data-toggle="tooltip" title="${fieldError(bean: personalData, field: 'street')}">
								<label for="street">Logradouro</label>
								<g:textField name="street" class="form-control" value="${fieldValue(bean:personalData,field:'street')}"/>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="form-group ${hasErrors(bean:personalData,field:'number','has-error')}" data-toggle="tooltip" title="${fieldError(bean: personalData, field: 'number')}">
								<label for="number">Núm.</label>
								<g:textField name="number" class="form-control" value="${fieldValue(bean:personalData,field:'number')}"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="form-group ${hasErrors(bean:personalData,field:'complement','has-error')}" data-toggle="tooltip" title="${fieldError(bean: personalData, field: 'complement')}">
								<label for="city">Complemento</label>
								<g:textField name="complement" class="form-control" value="${fieldValue(bean:personalData,field:'complement')}"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-8">
							<div class="form-group ${hasErrors(bean:personalData,field:'city','has-error')}" data-toggle="tooltip" title="${fieldError(bean: personalData, field: 'city')}">
								<label for="city">Cidade</label>
								<g:textField name="city" class="form-control" value="${fieldValue(bean:personalData,field:'city')}"/>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="form-group ${hasErrors(bean:personalData,field:'region','has-error')}" data-toggle="tooltip" title="${fieldError(bean: personalData, field: 'region')}">
								<label for="region">Estado</label>
								<g:select name="region" from="${mxpro.Regions.values()}" class="form-control" noSelection="['':'']" value="${fieldValue(bean:personalData,field:'region')}"/>
							</div>
						</div>
					</div>
				</fieldset>
			</g:form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-success"
					onclick="${remoteFunction(controller: 'billing', 
					action: 'savePersonalData', 
					params: 'jQuery(\'#personalDataForm\').serialize() ',
					onSuccess: 'app.urlRedirect(data)')}">Salvar</button>
			<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancelar</button>
		</div>
	</div>
	<!-- /.modal-content -->
</div>
<script>
	$(document).ready(function() {
		$('input[name=\'idNumber\']').mask('?999.999.999-99');
		$('input[name=\'mobile\']').mask('?(99) 999999999');
		$('input[name=\'zip\']').mask('?99999-999',{completed:function(){${remoteFunction(controller: 'address', action: 'zip', id: '\'+this.val()+\'', onSuccess: 'app.applyAddressData(data)')}}});
		$('[data-toggle="tooltip"]').tooltip();
		$('input[name=name]').focus();
	});
</script>
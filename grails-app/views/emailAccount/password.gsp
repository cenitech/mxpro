<asset:javascript src="home.js"/>
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">
				<span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span>
			</button>
			<h4 class="modal-title">Adicionar conta de email</h4>
		</div>
		<div class="modal-body">
			
			<g:form role="form" elementId="passwordForm">
				<div class="form-inline centered">
					<h4>${account.account}@${account.domain + account.suffix}</h4>
					<div class="form-group ${hasErrors(bean:password,field:'password','has-error')}" data-toggle="tooltip" title="${fieldError(bean: password, field: 'password')}">
						<label class="sr-only" for="account">Senha</label>
						<g:textField name="password" class="form-control text-lowercase centered" id="password" placeholder="Senha" style="width: 300px;" value="${password?.password}"/>
					</div>
				</div>
			</g:form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-success"
					onclick="${remoteFunction(controller: 'emailAccount', 
					action: 'finish', 
					params: 'jQuery(\'#passwordForm\').serialize() ',
					onSuccess: 'app.urlRedirect(data)')}">Concluir</button>
			<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancelar</button>
		</div>
	</div>
	<!-- /.modal-content -->
</div>
<script>
	$(document).ready(function() {
		$('input[name=password]').focus();

		$('[data-toggle="tooltip"]').tooltip();
	});
</script>
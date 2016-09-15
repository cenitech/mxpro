<asset:javascript src="home.js"/>
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">
				<span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span>
			</button>
			<h4 class="modal-title">Trocar senha</h4>
		</div>
		<div class="modal-body">
			
			<g:form role="form" elementId="passwordForm">
				<div class="form-inline centered">
					<p>Você está trocando a senha de uma ou mais contas de email:</p>
					<g:each in="${emails}" var="account">
						<h4>${account.fullAddress}</h4>
					</g:each>
					<div class="form-group ${hasErrors(bean:password,field:'password','has-error')}" data-toggle="tooltip" title="${fieldError(bean: password, field: 'password')}">
						<label class="sr-only" for="account">Nova senha</label>
						<g:textField name="password" class="form-control text-lowercase centered" id="password" placeholder="Nova senha" style="width: 300px;" value="${password?.password}"/>
					</div>
					<h5><strong>Atenção:</strong> A senha para acessar a dashboard será alterada imediatamente, no entanto, pode demorar até 1 dia útil para que a senha do webmail seja alterada, neste caso, continue utilizando a senha antiga até receber a confirmação pela dashboard.</h5>
				</div>
			</g:form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-success"
					onclick="${remoteFunction(controller: 'emailAccount', 
					action: 'performPasswordChange', 
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
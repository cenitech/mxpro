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
			<p>Digite o nome de contato e clique no botão adicionar. O novo email será composto do nome de contato, mais o seu domínio.</p>
			<g:form class="form-inline centered" role="form" elementId="newEmailAccountForm">
				<div class="form-group ${hasErrors(bean:account,field:'account','has-error')}" data-toggle="tooltip" title="${fieldError(bean: account, field: 'account')}">
					<label class="sr-only" for="account">Contato</label>
					<g:textField name="account" class="form-control text-lowercase" id="account" placeholder="contato" style="width: 150px;"/>
				</div>
				<div class="form-group">
					<strong>@</strong>
				</div>
				<div class="form-group">
					<label class="sr-only" for="domain">Domínio</label>
					<g:textField name="domain" class="form-control text-lowercase" id="domain" placeholder="minhaempresa" value="${account.domain}" readonly="readonly" style="background-color: white;"/>
				</div>
				<div class="form-group">
					<strong>.com.br</strong>
				</div>
			</g:form>
			
			<div class="preview-box centered">
				<h4><i><span class="example">contato@${account.domain}.com.br</span></i></h4>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-success pull-left"
					onclick="${remoteFunction(controller: 'emailAccount', 
					action: 'create', 
					params: 'jQuery(\'#newEmailAccountForm\').serialize() ',
					onSuccess: 'app.urlRedirect(data)')}">Adicionar</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
		</div>
	</div>
	<!-- /.modal-content -->
</div>
<script>
	$(document).ready(function() {
		$('input[name=account]').focus();

		$('[data-toggle="tooltip"]').tooltip();

		$(document).on('keyup', '[name=\'account\']', function() {
	    	home.fillExample();
	    });
	});
</script>
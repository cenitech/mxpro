<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">
				<span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span>
			</button>
			<h4 class="modal-title">Realizar pagamento</h4>
		</div>
		<div class="modal-body">
			<g:if test="${flash.message}">
				<div class="flash">
					<div class="bs-callout bs-callout-warning">
						${flash.message}
					</div>
				</div>
				<script>
					$('.flash').delay(5000).slideUp(200);
				</script>
			</g:if>
			<g:if test="${account.balance >= 0}">
				<h2><span class="glyphicon glyphicon-thumbs-up"></span> Não há débitos no momento, suas obrigações financeiras estão em dia aqui.</h2>
			</g:if>
			<g:else>
				<g:form role="form" elementId="paymentForm">
					<div class="form-group">
						<h4>Valor a ser debitado em seu cartão de crédito:</h4>
						<h3>
							<span class="label label-primary"><g:formatNumber number="${account.balance}" type="currency"/></span>
						</h3>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<div class="cc-template">
								<div class="cc-${currentCreditCard.brand.toLowerCase()}-picture"></div>
								<div class="cc-number">
									<div class="cc-hidden-number">•••• •••• ••••</div>
									<div class="cc-display-number">${currentCreditCard.last4Digits}</div>
								</div>
								<div class="cc-account-holder-name">${currentCreditCard.name}</div>
							</div>
						</div>
						<div class="col-xs-2">
							<div class="form-group ${hasErrors(bean:creditCard,field:'security','has-error')}" data-toggle="tooltip" title="${fieldError(bean: creditCard, field: 'security')}">
								<label for="security">CCV/CVC</label>
								<g:textField name="security" class="form-control"/>
							</div>
						</div>
						<div class="col-xs-6">
						</div>
						<div class="col-xs-12">
							<h4>Onde encontrar o número CCV/CVC</h4>
							<ul>
								<li>Este código é também conhecido por código de segurança.</li>
								<li>Master/Visa: verifique o verso do cartão, o código é composto por 3 números.</li>
								<li>American Express: O código está na frente do cartão, e é composto por 4 números.</li>
								<li>Se tiver dificuldades em encontrá-lo, sugerimos acessar este site (em inglês): <a href="https://support.apple.com/en-us/HT201912" target="_blank">Find the security code on your credit card</a></li>
							</ul>
						</div>
					</div>
					
				</g:form>
			</g:else>
		</div>
		<div class="modal-footer">
			<g:if test="${account.balance >= 0}">
				<button type="button" class="btn btn-success" data-dismiss="modal">Fechar</button>
			</g:if>
			<g:else>
				<button type="button" class="btn btn-success"
						onclick="${remoteFunction(controller: 'billing', 
						action: 'makePayment', 
						params: '\'security=\' + jQuery(\'input[name=security]\').val()',
						onSuccess: 'app.urlRedirect(data)')}">Pagar</button>
				<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancelar</button>
			</g:else>
		</div>
	</div>
	<!-- /.modal-content -->
</div>
<script>
	$(document).ready(function() {
		$('input[name=\'security\']').mask('?9999');
		$('input[name=\'security\']').focus();
	});
</script>
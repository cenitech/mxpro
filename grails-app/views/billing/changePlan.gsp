<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">
				<span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span>
			</button>
			<h4 class="modal-title">Alterar plano</h4>
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
			<g:form role="form" elementId="changePlanForm">
				<div class="form-group">
					<label for="current">Plano atual</label>
					<div id="current">${fieldValue(bean:currentPlan,field:'fullDescription')}</div>
					<div>${currentPlan.months} parcelas de ${currentPlan.priceDescription}/mês no cartão de crédito.</div>
					<div>Total de: <g:formatNumber number="${currentPlan.total()}" type="currency"/></div>
				</div>
				<fieldset>
					<legend>Planos disponíveis</legend>
					<p><span class="glyphicon glyphicon-warning-sign"></span> Não haverá reembolso se migrar para planos de menor valor ou cancelamento da conta fora do período de testes (primeiro mês).</p>
					<div class="btn-group btn-group-justified" data-toggle="buttons">
						<g:each in="${availablePlans}" var="plan" status="i">
							<label class="btn btn-default">
								<input type="radio" name="plan" value="${plan.id}" data-fulldesc="${plan.fullDescription}" data-pricedesc="${plan.priceDescription}"/> ${plan.planName}
							</label>
						</g:each>
					</div>
					<h3 class="center"><span id="fullDesc"></span></h3>
					<div class="pull-right">
						<h3 class="price"><span id="price"></span></h3>
					</div>
				</fieldset>
			</g:form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-success"
					onclick="${remoteFunction(controller: 'billing', 
					action: 'saveNewPlan', 
					params: '\'id=\' + jQuery(\'input[name=plan]:checked\').val()',
					onSuccess: 'app.urlRedirect(data)')}">Salvar</button>
			<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancelar</button>
		</div>
	</div>
	<!-- /.modal-content -->
</div>
<script>
	function printInfo() {
		var pricedesc = $('input[name=\'plan\']:checked').data('pricedesc');
		var fulldesc = $('input[name=\'plan\']:checked').data('fulldesc');
		jQuery('#price').text(pricedesc + '/mês');
		jQuery('#fullDesc').text(fulldesc);
	}

	$(document).on('change', 'input[name=\'plan\']', function() {
		printInfo();
	});
</script>
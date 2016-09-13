<div class="row">
	<div class="col-xs-12">
		<fieldset>
			<legend><g:message message="${chosenEmailAddress}"/></legend>
			<g:if test="${postProcessingResponse.error}">
				<h4>Há algo errado...</h4>
				<p>Nós tentamos cadastrar sua nova conta mas ocorreu o seguinte erro:</p>
				<p><strong><g:message message="${postProcessingResponse.error}"/></strong></p>
				<p>Você pode:</p>
				<ul>
					<li><a href="${createLink(controller: 'createAccount', action: 'index')}">Voltar ao início do cadastro</a></li>
					<li><a href="${createLink(controller: 'createAccount', action: 'cancel')}">Cancelar</a></li>
				</ul>
			</g:if>
			<g:else>
				<h4>Pronto!</h4>
				<p>
					Sua conta está sendo processada, caso tudo corra bem, ela estará disponível em até 1 dia útil.
				</p>
				<p>
					Você pode consultar o status do processamento através do link:
					<strong><a href="${createLink(controller: 'accountStatus', action: 'index', id: postProcessingResponse.ticket)}"><g:message message="${postProcessingResponse.ticket}"/></a></strong>
				</p>
				<a href="${createLink(controller: 'createAccount', action: 'done')}" class="btn btn-default pull-left">Voltar para home</a>
				<a href="${createLink(uri: '/dashboard')}" class="btn btn-default pull-right">Acessar Dashboard</a>
			</g:else>
			<p></p>
		</fieldset>
	</div>
</div>
<div class="bs-callout bs-callout-warning result-box pull-left" style="width: 540px;">
	<h4><strong>Desculpe, domínio indisponível <span class="glyphicon glyphicon-remove form-control-feedback"></span></strong></h4>
	<g:if test="${suggestions && !suggestions.isEmpty()}">
		<p>
			Tente outras opções como:
		</p>
		<ul>
			<g:each in="${suggestions}" var="address">
				<li><a href="#"><g:message message="${address}"/></a></li>
			</g:each>
		</ul>
	</g:if>
</div>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>MxPro.ml - Email Inteligente por R$ 14,90/mês</title>
<style type="text/css">
	.result-box {
		width: 70%;
		margin: auto;
	}
	.strong {
		font-weight: bold;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="first">
			<g:if test="${emailAccount}">
				<div class="top-description">
					<h4>Status da conta: <g:message message="${emailAccount.emailAccounts[0].fullAddress}"/></h4>
					<ul class="list-group">
						<li class="list-group-item strong">Confirmando os dados do CPF. <span class="label label-success pull-right">OK</span></li>
						<li class="list-group-item strong">Validando o cadastro. <span class="label label-success pull-right">OK</span></li>
						<li class="list-group-item">Registrando o domínio. <span class="label label-default pull-right">Pendente</span></li>
						<li class="list-group-item">Configurando a conta de email. <span class="label label-default pull-right">Pendente</span></li >
						<li class="list-group-item">Preparando o ambiente do usuário. <span class="label label-default pull-right">Pendente</span></li>
						<!--li class="list-group-item">Concluído.</li-->
					</ul>
				</div>
			</g:if>
			<g:else>
				<div class="bs-callout bs-callout-danger result-box">
					<h4><strong>Não encontramos nenhuma conta com este link. <span class="glyphicon glyphicon-remove form-control-feedback"></span></strong></h4>
					<p>
						O link que você usou parece estar inválido, por favor verifique.
					</p>
				</div>
			</g:else>
		</div>
	</div>
	<!-- /.container -->
</body>
</html>
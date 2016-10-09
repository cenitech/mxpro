<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>MxPro.ml - Email Inteligente por R$ 14,90/mês</title>
<style type="text/css">
.zip-label {
	margin-top: 30px;
	font-size: 10pt;
}
.month-label {
	font-size: 8pt;
}
.price {
	margin-top: 5px;
}
.payment-fieldset {
	margin-top: 15px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="first">
			<div class="top-description">
				<div class="row">
					<div class="col-md-6">
						<h3>Nova conta de email</h3>
						<p>Por questões de segurança, entraremos em contato assim que sua conta for ativada para validar as informações.</p>
						<ul>
							<li>Espaço de 50Gb para guardar seus emails e anexos.</li>
							<li>Conecte todas as suas contas de email em um só lugar. - Em Breve</li>
							<li>Agende o envio de seus emails. - Em Breve</li>
							<li>Custo de manutenção reduzido.</li>
							<li>Super seguro, nossos servidores ficam no Brasil.</li>
							<li>Servidores anti-quedas, disponibilidade todos os dias da semana, a qualquer hora.</li>
						</ul>
					</div>
					<div class="col-md-6">
						<g:form useToken="true" role="form" name="createAccountForm">
							<g:render template="basic"/>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->
	
	<script>
		home.init();
		$(document).keypress(function(e) {
		    if(e.which == 13) {
		        $('#btnSubmit').click();
		    }
		});
	</script>
</body>
</html>
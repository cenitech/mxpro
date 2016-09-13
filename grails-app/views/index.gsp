<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Email inteligente | Crie uma conta de email profissional</title>

<style type="text/css">
.preview-box {
	margin: 10px 0;
}
.result-box {
	width: 70%;
	text-align: left;
	margin: 20px auto; 
}
.btn-go {
	margin-left: 15px;
	width: 100px;
}
.btn-buy-now {
	margin-top: 5px;
}
</style>

<asset:javascript src="home.js"/>
</head>
<body>
	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<h1 style="font-family: 'Slabo 27px', serif;">Tenha endereços de email<br/>
					profissionais em sua empresa.</h1>
					<div style="margin: 0 0 30px 10px;">
						<p style="box-shadow: 10px 0 0 black, -10px 0 0 black; font-family: 'Slabo 27px', serif; color: white; font-size: 20px; background-color: black; line-height: 30px; display: inline; letter-spacing: 3px;">Empresas e profissionais liberais<br/>que utilizam email com domínio<br/>próprio <span style="font-size: 12px; letter-spacing: normal;">(ex. gutodesign.com.br)</span> vendem até<br/>80% mais que seus concorrentes.</p>
					</div>
					<div>
						<div style="font-family: 'Slabo 27px', serif; font-size: 24px; font-weight: bold; margin-bottom: 10px;">Verifique se seu endereço de email está disponível:</div>
						<div class="form-check-domain" style="color: white; font-size: 18px;">
							<g:form class="form-inline" role="form" elementId="form1">
								<div class="form-group">
									<label class="sr-only" for="account">Account</label>
									<g:textField name="account" class="form-control text-lowercase" id="account" placeholder="contato" style="width: 100px;"/>
								</div>
								<div class="form-group">
									<strong>@</strong>
								</div>
								<div class="form-group">
									<label class="sr-only" for="domain">Domain</label>
									<g:textField name="domain" class="form-control text-lowercase" id="domain" placeholder="minhaempresa"/>
								</div>
								<div class="form-group">
									<strong>.com.br</strong>
								</div>
								<g:submitToRemote id="btnSubmit" value="Verificar" class="btn btn-primary btn-go btn-lg" url="[controller: 'domainCheck', action: 'checkAccountAndDomain']" update="domainCheckResult"/>
							</g:form>
						</div>
						
						<div class="preview-box centered">
							<i><span class="example">contato@minhaempresa.com.br</span></i>
						</div>
						
						<div id="domainCheckResult">
						</div>
					</div>
				</div><!-- /col-lg-7 -->
				<div class="col-lg-5">
					<img class="img-responsive" src="${resource(dir: 'images', file: 'ipad-hand.png')}" alt="">
				</div><!-- /col-lg-5 -->
				
			</div><!-- /row -->
		</div><!-- /container -->
	</div><!-- /headerwrap -->
	
	<div class="container">
		<div class="row mt centered">
			<div class="col-lg-6 col-lg-offset-3">
				<h1 style="font-family: 'Slabo 27px', serif; font-size: 50px; font-weight: bold; color: #555;">Assine agora!<br/>R$ 14,90/mês</h1>
				<h3 style="color: #555;">O processo todo leva menos de 24 horas, veja as etapas:</h3>
			</div>
		</div><!-- /row -->
		
		<div class="row mt centered">
			<div class="col-lg-3">
				<h4 style="color: #555;">1. Disponibilidade <i class="glyphicon glyphicon-search"></i></h4>
				<p style="color: #555;">Você verifica se o endereço que escolheu, está disponível na internet.<br><span style="font-size: 14px;">(Por exemplo, compras@google.com.br não está disponível, pois alguém já o registrou anteriormente.)</span></p>
			</div><!--/col-lg-4 -->

			<div class="col-lg-3">
				<h4 style="color: #555;">2. Pagamento e Registro <i class="glyphicon glyphicon-globe"></i></h4>
				<p style="color: #555;">Se o email que escolheu está disponível, você faz o pagamento e nós iniciamos o processo de registro na internet. Em até 24 horas, você estará com um email novo, pronto para usar.</p>
			</div><!--/col-lg-3 -->
			
			<div class="col-lg-3">
				<h4 style="color: #555;">3. Caixas de entrada <i class="glyphicon glyphicon-cog"></i></h4>
				<p style="color: #555;">Com o registro concluído, nós iniciamos a configuração das suas caixas de entrada em nossos servidores. Este processo leva menos de uma hora.</p>
			</div><!--/col-lg-3 -->
			
			<div class="col-lg-3">
				<h4 style="color: #555;">4. Tudo OK <i class="glyphicon glyphicon-check"></i></h4>
				<p style="color: #555;">Assim que tudo estiver registrado e configurado, nós o notificaremos e você já pode começar a divulgar seu novo endereço de email.</p>
			</div><!--/col-lg-3 -->
			

		</div><!-- /row -->
	</div><!-- /container -->
	
	<div class="container">
		<hr/>
	</div><!-- /container -->
	
	<div class="container">
		<div class="row mt centered">
			<div class="col-lg-6 col-lg-offset-3">
				<h1 style="font-family: 'Slabo 27px', serif; font-size: 50px; font-weight: bold; color: #555;">Pacote mensal de serviços</h1>
			</div>
		</div><!-- /row -->
		
		<div class="row mt centered">
			<div class="col-lg-3">
				<span class="glyphicon glyphicon-envelope" aria-hidden="true" style="font-size: 60px"></span>
				<h4 style="color: #555;">E-mail</h4>
				<p style="color: #555;">Duas contas de email profissionais, com o seu domínio próprio na internet. Ex. compras@petshop.com.br e/ou chris@petshop.com.br</p>
			</div><!--/col-lg-3 -->

			<div class="col-lg-3">
				<span class="glyphicon glyphicon-inbox" aria-hidden="true" style="font-size: 60px"></span>
				<h4 style="color: #555;">Gerenciador</h4>
				<p style="color: #555;">Um gerenciador de emails profissional com agenda de contatos. Acesse seus emails, atualize sua lista de contatos, agrupe por assuntos.</p>

			</div><!--/col-lg-3 -->

			<div class="col-lg-3">
				<span class="glyphicon glyphicon-gift" aria-hidden="true" style="font-size: 60px"></span>
				<h4 style="color: #555;">Painel</h4>
				<p style="color: #555;">Configure suas contas de email através de um painel de configuração. Para empresas/profissionais que precisem de mais contas, compre diretamente através do painel.</p>

			</div><!--/col-lg-3 -->

			<div class="col-lg-3">
				<span class="glyphicon glyphicon-cloud" aria-hidden="true" style="font-size: 60px"></span>
				<h4 style="color: #555;">Suporte</h4>
				<p style="color: #555;">Suporte por email com atendimento em até 1 dia útil através de nossa central de atendimento exclusiva.</p>

			</div><!--/col-lg-3 -->
		</div><!-- /row -->
	</div><!-- /container -->
	
	<div class="container">
		<hr/>
		<p class="centered">MxPro.ml - 2016 - Todos os direitos reservados</p>
	</div><!-- /container -->
	
	<script>
		home.init();
		$('#form1').keypress(function(e) {
		    if(e.which == 13) {
		        $('#btnSubmit').click();
		    }
		});
	</script>
</body>
</html>
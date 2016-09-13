<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description"
		content="MxPro - Emails inteligentes.">
	<meta name="author" content="cenitech">
	<link rel="shortcut icon" href="${assetPath(src: 'favicon.png')}">
	
	<title><g:layoutTitle
			default="MxPro.ml - Email Inteligente por R\$ 14,90/mês" /></title>
	
	<asset:stylesheet src="application.css" />
	<asset:javascript src="application.js" />
	<!-- Fonts from Google Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Lato:300,400,900' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css'>
	   
	   <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	   <!--[if lt IE 9]>
	     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	     <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	   <![endif]-->
	<g:layoutHead />
</head>

  <body>
    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${createLink(uri: '/')}"><b>MxPro.ml - Email Inteligente por R$ 14,90/mês</b></a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <sec:ifNotLoggedIn>
				<li><a href="${createLink(uri: '/dashboard')}">Acessar</a></li>
			</sec:ifNotLoggedIn>
			<sec:ifLoggedIn>
				<li><span class="pseudo-a">Olá <util:nameOfUser/>!</span></li>
				<li><a href="${createLink(uri: '/j_spring_security_logout')}">Sair</a></li>
			</sec:ifLoggedIn>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

	<div class="mt">
		<g:layoutBody />
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-hidden="true"></div>
	<!-- /.modal -->
	
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
  </body>
</html>
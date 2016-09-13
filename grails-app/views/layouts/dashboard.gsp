<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title><g:layoutTitle
			default="MxPro.ml - Email Inteligente por R\$ 14,90/mês" /></title>
<style type="text/css">
	/*
	 * Base structure
	 */
	
	/* Move down content because we have a fixed navbar that is 50px tall */
	body {
		background-color: white;
	}
	
	/*
	 * Global add-ons
	 */
	.sub-header {
		padding-bottom: 10px;
		border-bottom: 1px solid #eee;
	}
	
	/*
	 * Top navigation
	 * Hide default border to remove 1px line.
	 */
	.navbar-fixed-top {
		border: 0;
	}
	
	/*
	 * Sidebar
	 */
	
	/* Hide for mobile, show later */
	.sidebar {
		display: none;
	}
	
	@media ( min-width : 768px) {
		.sidebar {
			position: fixed;
			top: 51px;
			bottom: 0;
			left: 0;
			z-index: 1000;
			display: block;
			padding: 20px;
			overflow-x: hidden;
			overflow-y: auto;
			/* Scrollable contents if viewport is shorter than content. */
			background-color: #f2f2f2;
			border-right: 1px solid #eee;
		}
	}
	
	/* Sidebar navigation */
	.nav-sidebar {
		margin-right: -21px; /* 20px padding + 1px border */
		margin-bottom: 20px;
		margin-left: -20px;
	}
	
	.nav-sidebar>li>a {
		padding-right: 20px;
		padding-left: 20px;
	}
	
	.nav-sidebar>.active>a, .nav-sidebar>.active>a:hover, .nav-sidebar>.active>a:focus
		{
		color: #fff;
		background-color: #3498db;
	}
	
	/*
	 * Main content
	 */
	.main {
		padding: 20px;
	}
	
	@media ( min-width : 768px) {
		.main {
			padding-right: 40px;
			padding-left: 40px;
		}
	}
	
	.main .page-header {
		margin-top: 0;
	}
	
	/* progress bar colors & styles */
	.progress-bar-none {
	    background-color: #f5f5f5;
	    border-radius: 4px;
	    -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, .1);
	    box-shadow: inset 0 1px 2px rgba(0, 0, 0, .1);
	    color: black;
	}
	
	.progress-bar-success {
	    background-color: green;
	}
	.progress-bar-warning {
	    background-color: #ffff00;
	    color: black;
	}
	.progress-bar-danger{
	    background-color: #ff0000;
	}
	
	.checkbox-col {
		width: 30px;
	}
</style>
<g:layoutHead />
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="${ pageProperty(name:'meta.nav').equals( 'inicio' ) ? 'active' : null }"><a href="${createLink(controller: 'dashboard', action: 'index')}">Início</a></li>
					<li class="${ pageProperty(name:'meta.nav').equals( 'contas' ) ? 'active' : null }"><a href="${createLink(controller: 'dashboard', action: 'contas')}">Contas de email</a></li>
					<li class="${ pageProperty(name:'meta.nav').equals( 'financeiro' ) ? 'active' : null }"><a href="${createLink(controller: 'dashboard', action: 'financeiro')}">Financeiro</a></li>
					<li class="${ pageProperty(name:'meta.nav').equals( 'configuracoes' ) ? 'active' : null }"><a href="${createLink(controller: 'dashboard', action: 'configuracoes')}">Configurações</a></li>
					<li class="${ pageProperty(name:'meta.nav').equals( 'suporte' ) ? 'active' : null }"><a href="${createLink(controller: 'dashboard', action: 'suporte')}">Suporte</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<g:if test="${flash}">
					<div class="row flash">
						<div class="bs-callout">
							<p>
								<g:message code="${flash.message}" />
							</p>
						</div>
					</div>
					<script>
						$('.flash').delay(5000).slideUp(200);
					</script>
				</g:if>
				<g:pageProperty name="page.breadcrumb"/>
				<g:layoutBody />
			</div>
		</div>
	</div>
</body>
</html>
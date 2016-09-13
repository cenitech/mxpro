<!DOCTYPE html>
<html>
<g:applyLayout name="dashboard">
<head>
<title>MxPro.ml - Dashboard - Início</title>
<meta name="nav" content="inicio"/>
</head>
<content tag="breadcrumb">
	<ol class="row breadcrumb">
		<li><a href="#">Dashboard</a></li>
		<li class="active">Início</li>
	</ol>
</content>
<body>
	<div class="row placeholders">
		<div class="col-xs-6 col-sm-3 placeholder">
			<h4>Status</h4>
			<span class="text-muted">${message(code: account.status)}</span>
		</div>
		<div class="col-xs-6 col-sm-3 placeholder">
			<h4>Validade</h4>
			<span class="text-muted">${account.expiration.format('dd/MM/yyyy')}</span>
		</div>
		<div class="col-xs-6 col-sm-3 placeholder">
			<h4>Último Pagamento</h4>
			<span class="text-muted">${account.lastPayment.format('dd/MM/yyyy')}</span>
		</div>
		<div class="col-xs-6 col-sm-3 placeholder">
			<h4>Valor</h4>
			<span class="text-muted"><g:formatNumber number="${account.amount}" type="currency"/></span>
		</div>
	</div>

	<h2 class="sub-header">Espaço em disco</h2>
	<g:each in="${emailAccounts}" var="emailAccount">
		<g:set var="used" value="${(int)(emailAccount.currentSize / account.maxSize*100)}"/>
		<g:set var="free" value="${(int)((account.maxSize - emailAccount.currentSize) / account.maxSize*100)}"/>
		
		<code>${emailAccount.fullAddress} - ${account.maxSize/1000}GB</code>
		<div class="progress">
			<div class="progress-bar progress-bar-success" style="width: ${used}%"
				role="progressbar">
				<span>${used}% Utilizado (${emailAccount.currentSize/1000}GB)</span>
			</div>
			<div class="progress-bar progress-bar-none" style="width: ${free}%"
				role="progressbar">
				<span>${free}% Livre (${(account.maxSize - emailAccount.currentSize)/1000}GB)</span>
			</div>
		</div>
	</g:each>

	<h2 class="sub-header">Webmail</h2>
	<div class="alert alert-info" role="alert">
		<a href="http://${account.webmailURL}" class="alert-link">http://${account.webmailURL}</a>
	</div>

	<h2 class="sub-header">Servidores</h2>
	<div class="alert alert-info" role="alert">
		<g:each in="${account.serversURL}" var="i">
			<strong>${i.substring(0,4)}</strong> - <span class="alert-link">${i}</span><br />
		</g:each>
	</div>
</body>
</g:applyLayout>
</html>
<!DOCTYPE html>
<html>
<g:applyLayout name="dashboard">
<head>
<title>MxPro.ml - Dashboard - Financeiro</title>
<meta name="nav" content="financeiro"/>
</head>
<content tag="breadcrumb">
	<ol class="row breadcrumb">
		<li><a href="#">Dashboard</a></li>
		<li class="active">Financeiro</li>
	</ol>
</content>
<body>
	<h2 class="sub-header">Status da conta</h2>
	<div class="row placeholders">
		<div class="col-xs-6 col-sm-2 placeholder">
			<h4>Contas de email</h4>
			<span class="text-muted">${account.emailAccountsBillingStatus}</span>
		</div>
		<div class="col-xs-6 col-sm-2 placeholder">
			<h4>Domínios</h4>
			<span class="text-muted">${account.domainBillingStatus}</span>
		</div>
		<div class="col-xs-6 col-sm-2 placeholder">
			<h4>Validade</h4>
			<span class="text-muted">Válido até ${account.expiration.format('dd/MM/yyyy')}.</span>
		</div>
		<div class="col-xs-6 col-sm-2 placeholder">
			<h4>Plano atual</h4>
			<span class="text-muted">${account.currentPlan.fullDescription}</span>
		</div>
		<div class="col-xs-6 col-sm-2 placeholder">
			<h4>Valor do plano atual</h4>
			<span class="text-muted"><g:formatNumber number="${account.currentPlan.months * account.currentPlan.price}" type="currency"/></span>
		</div>
		<div class="col-xs-6 col-sm-2 placeholder">
			<h4>Saldo</h4>
			<h3>
				<span class="label label-primary"><g:formatNumber number="${account.balance}" type="currency"/></span>
			</h3>
		</div>
	</div>
	<div style="margin-top: 10px;">
      	<div class="btn btn-default" data-toggle="modal" data-target="#modal" onclick="${remoteFunction(controller: 'billing', action: 'openPaymentForm', update: 'modal')}"><span class="glyphicon glyphicon-credit-card"></span> Realizar pagamento</div>
      	<div class="btn btn-default" data-toggle="modal" data-target="#modal" onclick="${remoteFunction(controller: 'billing', action: 'openChangePlanForm', update: 'modal')}"><span class="glyphicon glyphicon-pencil"></span> Alterar plano</div>
	</div>

	<h2 class="sub-header">Titular da Conta</h2>
	<div class="row">
		<div class="col-xs-6 col-sm-5">
			<div class="row">
				<div class="col-xs-12 col-sm-5">
					<strong>Nome:</strong>
				</div>
				<div class="col-xs-12 col-sm-7">${customer.name}</div>
				<div class="col-xs-12 col-sm-5">
					<strong>CPF:</strong>
				</div>
				<div class="col-xs-12 col-sm-7">${customer.idNumber}</div>
				<div class="col-xs-12 col-sm-5">
					<strong>Endereço:</strong>
				</div>
				<div class="col-xs-12 col-sm-7">
					${customer.address.street}, ${customer.address.number}<br />${customer.address.complement}<br />${customer.address.city} - ${customer.address.region} - ${customer.address.country}<br /> CEP ${customer.address.zip}<br />
				</div>
				<div class="col-xs-12 col-sm-5">
					<strong>Telefone:</strong>
				</div>
				<div class="col-xs-12 col-sm-7">${customer.mobile}</div>
				<div class="col-xs-12 col-sm-5">
					<strong>Email principal:</strong>
				</div>
				<div class="col-xs-12 col-sm-7">${user.username}</div>
			</div>
		</div>
		<div class="col-xs-6 col-sm-6">
			<div class="btn btn-default"
				data-toggle="modal" data-target="#modal"
				onclick="${remoteFunction(controller: 'billing', action: 'openPersonalDataForm', update: 'modal')}">
				<span class="glyphicon glyphicon-pencil"></span> Editar
			</div>
		</div>
	</div>

	<h2 class="sub-header">Dados de Cobrança</h2>
	<div class="row">
		<div class="col-xs-3 col-sm-3">
			<div class="cc-template">
				<div class="cc-${customer.currentCreditCard.brand.toLowerCase()}-picture"></div>
				<div class="cc-number">
					<div class="cc-hidden-number">•••• •••• ••••</div>
					<div class="cc-display-number">${customer.currentCreditCard.last4Digits}</div>
				</div>
				<div class="cc-account-holder-name">${customer.currentCreditCard.name}</div>
			</div>
		</div>
		<div class="col-xs-3 col-sm-3">
			<p>
				<strong>${customer.currentCreditCard.name}</strong><br/>
				Rua Bruno João da Silva, 59 TEMP<br/>
				Casa 1<br/>
				Curitiba - Paraná - Brasil
				<g:if test="${customer.currentCreditCard.address}">
					${customer.currentCreditCard.address.street}, ${customer.currentCreditCard.address.number}<br />
					${customer.currentCreditCard.address.complement}<br />
					${customer.currentCreditCard.address.city} - ${customer.currentCreditCard.address.region} - ${customer.currentCreditCard.address.country}<br /> CEP ${customer.currentCreditCard.address.zip}<br />
				</g:if>
			</p>
		</div>
		<div class="col-xs-6 col-sm-6">
			<div class="btn btn-default"
				data-toggle="modal" data-target="#modal"
				onclick="${remoteFunction(controller: 'billing', action: 'openCreditCardForm', update: 'modal')}">
				<span class="glyphicon glyphicon-pencil"></span> Editar
			</div>
		</div>
	</div>

	<h2 class="sub-header">Extrato financeiro</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Data/hora</th>
					<th>Descrição</th>
					<th>Valor</th>
					<th>Saldo</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${account.statements}" var="statement">
					<tr>
						<td>${statement.timestamp.format('dd/MM/yyyy - HH:mm:ss')}</td>
						<td>${statement.description}</td>
						<td><g:formatNumber number="${statement.amount}" type="currency"/></td>
						<td class="text-info"><g:formatNumber number="${statement.balance}" type="currency"/></td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
	<a href="${createLink(controller: 'billing', action: 'printStatement')}" class="btn btn-default"><span class="glyphicon glyphicon-print"></span> Imprimir</a>
</body>
</g:applyLayout>
</html>
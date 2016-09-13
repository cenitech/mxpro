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
			<span class="text-muted">Sem débitos pendentes.</span>
		</div>
		<div class="col-xs-6 col-sm-2 placeholder">
			<h4>Domínios</h4>
			<span class="text-muted">Sem débitos pendentes.</span>
		</div>
		<div class="col-xs-6 col-sm-2 placeholder">
			<h4>Validade</h4>
			<span class="text-muted">Válido até 26/08/2017.</span>
		</div>
		<div class="col-xs-6 col-sm-2 placeholder">
			<h4>Plano atual</h4>
			<span class="text-muted">Semestral - 50Gb - 2 contas de
				email.</span>
		</div>
		<div class="col-xs-6 col-sm-2 placeholder">
			<h4>Valor do plano atual</h4>
			<span class="text-muted">R$ 230,00 por semestre.</span>
		</div>
		<div class="col-xs-6 col-sm-2 placeholder">
			<h4>Saldo</h4>
			<h3>
				<span class="label label-primary">R$ 0,00</span>
			</h3>
		</div>
	</div>
	<div>
      	<div class="btn btn-default"><span class="glyphicon glyphicon-credit-card"></span> Realizar pagamento</div>
      	<div class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Alterar plano</div>
	</div>

	<h2 class="sub-header">Titular da Conta</h2>
	<div class="row">
		<div class="col-xs-6 col-sm-5">
			<div class="row">
				<div class="col-xs-12 col-sm-4">
					<strong>Nome:</strong>
				</div>
				<div class="col-xs-12 col-sm-8">Lucas Fagner Van Corte Ceni
					de Moura</div>
				<div class="col-xs-12 col-sm-4">
					<strong>CPF:</strong>
				</div>
				<div class="col-xs-12 col-sm-8">000.000.000-99</div>
				<div class="col-xs-12 col-sm-4">
					<strong>Endereço:</strong>
				</div>
				<div class="col-xs-12 col-sm-8">
					Av. Anita Garibaldi, 1380<br /> Apto 201<br /> Ahú - Curitiba
					- Paraná - Brasil<br /> CEP 80540-300<br />
				</div>
				<div class="col-xs-12 col-sm-4">
					<strong>Telefone:</strong>
				</div>
				<div class="col-xs-12 col-sm-8">+55 44 9999-3333</div>
				<div class="col-xs-12 col-sm-4">
					<strong>Email alternativo:</strong>
				</div>
				<div class="col-xs-12 col-sm-8">lucas.moura2560@gmail.com</div>
			</div>
		</div>
		<div class="col-xs-6 col-sm-6">
			<div class="btn btn-default">
				<span class="glyphicon glyphicon-pencil"></span> Editar
			</div>
		</div>
	</div>

	<h2 class="sub-header">Dados de Cobrança</h2>
	<div class="row">
		<div class="col-xs-6 col-sm-2">
			<div class="cc-template">
				<div class="cc-visa-picture"></div>
				<div class="cc-number">
					<div class="cc-hidden-number">•••• •••• ••••</div>
					<div class="cc-display-number">6051</div>
				</div>
				<div class="cc-account-holder-name">LUCAS F V C C MOURA</div>
			</div>
		</div>
		<div class="col-xs-6 col-sm-2">
			<p>
				LUCAS F V C C MOURA<br /> Rua Mateus Leme, 2555<br /> Curitiba
				- Paraná - Brasil<br /> CEP 82.200-000
			</p>
		</div>
		<div class="col-xs-6 col-sm-8">
			<div class="btn btn-default">
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
				<tr>
					<td>23/08/2016 - 15:31:01</td>
					<td>Conta criada "contato@mxpro.ml"</td>
					<td>R$ 0,00</td>
					<td class="text-info">R$ 0,00</td>
				</tr>
				<tr>
					<td>23/08/2016 - 15:31:01</td>
					<td>Débito "Plano semestral 50Gb - 2 contas"</td>
					<td>R$ 200,00</td>
					<td class="text-danger">(R$ 200,00)</td>
				</tr>
				<tr>
					<td>23/08/2016 - 15:31:01</td>
					<td>Débito "Registro.br"</td>
					<td>R$ 30,00</td>
					<td class="text-danger">(R$ 230,00)</td>
				</tr>
				<tr>
					<td>23/08/2016 - 15:38:01</td>
					<td>Pagamento realizado - cc final 6051</td>
					<td>R$ 230,00</td>
					<td class="text-info">R$ 0,00</td>
				</tr>
			</tbody>
		</table>
	</div>
	<a href="${createLink(controller: 'dashboard', action: 'imprimir')}" class="btn btn-default"><span class="glyphicon glyphicon-print"></span> Imprimir</a>
</body>
</g:applyLayout>
</html>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="none" />
<title>Extrato - mxpro.ml</title>
<link rel="stylesheet" type="text/css"
	href="${assetPath(src: 'bootstrap.min.css')}">
</head>
<body>
<div class="container">
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
		<a class="btn btn-default hidden-print" href="${createLink(controller: 'dashboard', action: 'financeiro')}"><span class="glyphicon glyphicon-arrow-left"></span> Voltar</a>
	</div>
</div>
<script>
	print();
</script>
</body>
</html>
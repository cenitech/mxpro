<!DOCTYPE html>
<html>
<g:applyLayout name="dashboard">
<head>
<title>MxPro.ml - Dashboard - Configurações</title>
<meta name="nav" content="configuracoes" />
</head>
<content tag="breadcrumb">
	<ol class="row breadcrumb">
		<li><a href="#">Dashboard</a></li>
		<li class="active">Configurações</li>
	</ol>
</content>
<body>
		<h2 class="sub-header">Migração de contas</h2>
		<h4>*Migre seus emails das contas que você possui como gmail,
			yahoo, hotmail entre outras, para seu novo domínio.</h4>

		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="checkbox-col"><input type="checkbox"
							class="check checkuncheck" /></th>
						<th>Origem</th>
						<th>Destino</th>
						<th>Última coleta</th>
						<th>Quantidade</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" class="check" /></td>
						<td>mxproemail@gmail.com</td>
						<td>contato@mxpro.ml</td>
						<td>16/08/2016 - 08:54h</td>
						<td>235 emails coletados</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="check" /></td>
						<td>lavanderiafarias@yahoo.com</td>
						<td>contato@lavanderiafarias.com.br</td>
						<td>17/08/2016 - 20:35h</td>
						<td>1 email coletado</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="pull-right">
			<div class="btn btn-danger hidden showwhenchecked">
				<span class="glyphicon glyphicon-minus"></span> Remover coleta
			</div>
			<div class="btn btn-success">
				<span class="glyphicon glyphicon-plus"></span> Adicionar configuração de coleta
			</div>
			<div class="btn btn-success">
				<span class="glyphicon glyphicon-refresh"></span> Sincronizar agora
			</div>
		</div>
		<div class="clearfix"></div>
		<div>
			* As coletas são executadas de 5 em 5 minutos, ou sempre que você clicar no botão <span class="badge bg-success"><span class="glyphicon glyphicon-refresh gi-08x"></span> Sincronizar agora</span></span>
		</div>
		
		<h2 class="sub-header">Outras configurações</h2>
		<dl class="dl-big-title dl-horizontal">
			<dt>Avisar datas de pagamento proximas</dt>
			<dd>
				<div class="btn-group btn-group-xs" role="group" aria-label="On/Off">
				  <button type="button" class="btn btn-default btn-primary">On</button>
				  <button type="button" class="btn btn-default btn-default">Off</button>
				</div>
			</dd>
		</dl>
		<dl class="dl-big-title dl-horizontal">
			<dt>Utilizar token via SMS para acessar a conta principal</dt>
			<dd>
				<div class="btn-group btn-group-xs" role="group" aria-label="On/Off">
				  <button type="button" class="btn btn-default btn-primary">On</button>
				  <button type="button" class="btn btn-default btn-default">Off</button>
				</div>
			</dd>
		</dl>
		
		<script>
    	app.checkuncheck('.checkuncheck', '.check');
    	app.showwhenchecked('.check', '.showwhenchecked', '.checkuncheck');
    </script>
</body>
</g:applyLayout>
</html>
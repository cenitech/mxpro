<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main" />
	<title>MxPro.ml - Email Inteligente por R$ 14,90/mês</title>
	<style>
		.checkbox-col {
			width: 30px;
		}
		.panel {
			margin-bottom: 0px;
		}
	</style>
</head>
<body>
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="#">MxPro</a></li>
			<li><a href="#">Configurações</a></li>
			<li class="active">Parâmetros do sistema</li>
		</ol>

		<div class="panel panel-default">
			<div class="panel-heading"><strong>Parâmetros do sistema</strong>
				<div class="btn-group btn-group-xs pull-right">
					<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span></button>
					<button type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span></button>
				</div>
			</div>
			
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="checkbox-col"><input type="checkbox" class="checkuncheck"/></th>
						<th>Chave</th>
						<th>Valor</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${mxpro.Param.list()}" var="p">
						<tr>
							<td><input type="checkbox" class="check"/></td>
							<td>${p.name}</td>
							<td><a href="#" class="editable" data-type="text" data-url="${createLink(action: 'update', id: p.id)}" data-name="${p.name}" data-title="${p.name}">${p.value}</a></td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<ul class="pagination pull-right">
			<li class="disabled"><a href="#">&laquo;</a></li>
			<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>
    <script>
    	app.editable();
    	app.checkuncheck('.checkuncheck', '.check');
    </script>
</body>
</html>
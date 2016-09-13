<!DOCTYPE html>
<html>
<g:applyLayout name="dashboard">
<head>
<title>MxPro.ml - Dashboard - Suporte</title>
<meta name="nav" content="suporte" />
</head>
<content tag="breadcrumb">
	<ol class="row breadcrumb">
		<li><a href="#">Dashboard</a></li>
		<li class="active">Suporte</li>
	</ol>
</content>
<body>
		<h2 class="sub-header">Abrir um chamado</h2>
		<p>Abra um chamado para a equipe de suporte descrevendo o problema.</p>
		<div class="row">
			<div class="col-md-6">
				<form>
					<div class="form-group">
						<label for="emailTel1">Email ou telefone:</label>
						<input type="text" class="form-control" id="emailTel1"></input>
					</div>
					<div class="form-group">
						<label for="desc1">Descrição:</label>
						<textarea class="form-control" id="desc1"></textarea>
					</div>
					<button type="submit" class="pull-right btn btn-success"><span class="glyphicon glyphicon-share-alt"></span> Enviar solicitação</button>
				</form>
			</div>
			<div class="col-md-6">
			<h4>Dicas para facilitar a resolução de problemas</h4>
			<ul>
				<li>Seja objetivo, envie o máximo de detalhes possíveis, assim fica mais fácil de identificar o problema.</li>
				<li>Aguarde o prazo mínimo do chamado, nossa equipe estará trabalhando duro para atendê-lo na primeira oportunidade.</li>
				<li>Inlcuia corretamente uma informação de contato, sem ela, não poderemos encontrá-lo se precisarmos de algo adicional.</li>
			</ul>
			</div>
		</div>
		<div class="clearfix"></div>

		<h2 class="sub-header">Histórico de chamados</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Número</th>
						<th>Data de abertura</th>
						<th>Descrição</th>
						<th>Data de fechamento</th>
						<th>Resolução</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1002</td>
						<td>16/08/2016 - 08:54h</td>
						<td>Problema ao realizar login em conta secundária</td>
						<td>16/08/2016 - 11:54h</td>
						<td>A senha foi reconfigurada e enviada ao cliente</td>
						<td>Encerrado</td>
					</tr>
					<tr>
						<td>1001</td>
						<td>11/08/2016 - 09:31h</td>
						<td>Cartão de crédito foi rejeitado para comprar um novo pacote</td>
						<td>14/08/2016 - 13:28h</td>
						<td>O usuário fez o pagamento via boleto bancário enviado pelo time de suporte</td>
						<td>Encerrado</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="clearfix"></div>
</body>
</g:applyLayout>
</html>
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
	<g:form role="form" elementId="suporteForm">
		<h2 class="sub-header">Abrir um chamado</h2>
		<p>Abra um chamado para a equipe de suporte descrevendo o problema.</p>
		<div class="row">
			<div class="col-md-6">
				<form>
					<div class="form-group">
						<label for="emailTel1">Email ou telefone:</label>
						<input type="text" class="form-control" id="emailTel1" name="contact"></input>
					</div>
					<div class="form-group">
						<label for="desc1">Descrição:</label>
						<textarea class="form-control" id="desc1" name="description"></textarea>
					</div>
					<button type="button" class="pull-right btn btn-success"
						onclick="${remoteFunction(controller: 'ticket', action: 'createTicket', params: 'jQuery(\'#suporteForm\').serialize()', onSuccess: 'app.urlRedirect(data)')}">
						<span class="glyphicon glyphicon-share-alt"></span>  Enviar solicitação
					</button>
				</form>
			</div>
			<div class="col-md-6">
				<h4>Dicas para facilitar a resolução de problemas</h4>
				<ul>
					<li>Seja objetivo, envie o máximo de detalhes possíveis, assim fica mais fácil de identificar o problema.</li>
					<li>Aguarde o prazo mínimo do chamado, nossa equipe estará trabalhando duro para atendê-lo na primeira oportunidade.</li>
					<li>Incluia corretamente uma informação de contato, sem ela, não poderemos encontrá-lo se precisarmos de algo adicional.</li>
				</ul>
			</div>
		</div>
	</g:form>
	<div class="clearfix"></div>

	<h2 class="sub-header">Histórico de chamados</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Número</th>
					<th>Data de abertura</th>
					<th>Telefone/email</th>
					<th>Descrição</th>
					<th>Data de fechamento</th>
					<th>Resolução</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${tickets}" var="ticket">
					<tr>
						<td>${ticket.number}</td>
						<td><g:formatDate format="dd/MM/yyyy - HH:mm:ss" date="${ticket.begin}"/></td>
						<td>${ticket.contact}</td>
						<td>${ticket.description.take(50)}</td>
						<td><g:formatDate format="dd/MM/yyyy - HH:mm:ss" date="${ticket.end}"/></td>
						<td>${ticket.resolution}</td>
						<td>${ticket.status}</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
	<div class="clearfix"></div>
</body>
</g:applyLayout>
</html>
<!DOCTYPE html>
<html>
<g:applyLayout name="dashboard">
<head>
<title>MxPro.ml - Dashboard - Contas</title>
<meta name="nav" content="contas" />
</head>
<content tag="breadcrumb">
	<ol class="row breadcrumb">
		<li><a href="#">Dashboard</a></li>
		<li class="active">Contas de email</li>
	</ol>
</content>
	<body>
	  <g:form role="form" elementId="contasForm">
		<h2 class="sub-header">Domínio</h2>
		<div class="alert alert-info" role="alert">
			<div>
				<strong>${domain.name}</strong>
			</div>
			<div>
				<g:set value="${emailAccounts.size()}" var="numberOfAccounts" />
				<g:set value="${account.maxEmailAccounts - numberOfAccounts}" var="numberOfAvailable" />
				<g:if test="${numberOfAccounts == 0}">
					Nenhuma conta de email cadastrada.
				</g:if>
				<g:elseif test="${numberOfAccounts == 1}">
					${numberOfAccounts} conta de email cadastrada.
				</g:elseif>
				<g:else>
					${numberOfAccounts} contas de email cadastradas.
				</g:else>
				<g:if test="${numberOfAvailable == 0}">
					Nenhuma conta adicional disponível.
				</g:if>
				<g:elseif test="${numberOfAvailable == 1}">
					${numberOfAvailable} conta adicional disponível para cadastro imediato.
				</g:elseif>
				<g:else>
					${numberOfAvailable} contas adicionais disponíveis para cadastro imediato.
				</g:else>
				<a href="#">Contratar mais contas clique aqui.</a>
			</div>
		</div>

		<h2 class="sub-header">Contas de email</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="checkbox-col"><input type="checkbox"
							class="check checkuncheck" /></th>
						<th>Endereço de email</th>
						<th>Espaço total</th>
						<th>Principal</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${emailAccounts}" status="i" var="account">
						<tr>
							<td><input type="checkbox" class="check" name="ids" value="${account.id}"/></td>
							<td>${fieldValue(bean: account, field: "fullAddress")}</td>
							<td>50Gb</td>
							<td>Sim</td>
							<td>${message(code: account.status)}</td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<div class="pull-left">
			<button type="button" class="btn btn-default hidden showwhenchecked"
				data-toggle="modal" data-target="#modal"
				onclick="${remoteFunction(controller: 'emailAccount', action: 'changePassword', params: 'jQuery(\'#contasForm\').serialize()', update: 'modal')}">
				<span class="glyphicon glyphicon-lock"></span> Trocar senha(s)
			</button>
		</div>
		<div class="pull-right">
			<button type="button" class="btn btn-danger hidden showwhenchecked"
				onclick="${remoteFunction(controller: 'emailAccount', action: 'delete', params: 'jQuery(\'#contasForm\').serialize()', onSuccess: 'app.urlRedirect(data)')}">
				<span class="glyphicon glyphicon-minus"></span> Remover conta(s) selecionada(s)
			</button>
			
			<button type="button" class="btn btn-success"
				data-toggle="modal" data-target="#modal"
				onclick="${remoteFunction(controller: 'emailAccount', action: 'index', update: 'modal')}">
				<span class="glyphicon glyphicon-plus"></span> Adicionar conta
			</button>
		</div>
		<div class="clearfix"></div>
		<div>
			* A conta principal tem acesso completo ao dashboard, incluindo o
			faturamento e configurações, e pode ainda adicionar novas contas ou
			remover existentes.<br /> * As contas adicionais podem apenas acessar
			o webmail.
		</div>
		<script>
			app.editable();
			app.checkuncheck('.checkuncheck', '.check');
			app.showwhenchecked('.check', '.showwhenchecked', '.checkuncheck');
		</script>
	  </g:form>
	</body>
</g:applyLayout>
</html>
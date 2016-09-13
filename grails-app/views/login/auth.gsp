
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>MXPro | Login</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    
    <asset:stylesheet src="application.css" />
	<asset:javascript src="application.js" />
	
	<!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${resource(dir: 'stylesheets', file: 'AdminLTE.min.css')}" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="${resource(dir: 'stylesheets', file: 'iCheck_blue.css')}" rel="stylesheet" type="text/css" />
    <style>
    	body {
    		font-size: 14px;
    	}
    	.form-control {
		    height: 34px;
		    font-size: 14px;
		    color: #555;
		    font-weight: normal;
		}
		p {
		    line-height: normal;
		    margin-bottom: 0px;
		    font-size: 14px;
		}
		.checkbox {
			padding-left: 0px;
		}
		.has-feedback .form-control-feedback {
			top: 0px;
		}
    </style>
  </head>
  <body class="login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="${createLink(uri: '/')}"><b>MXPro</b></a> | login
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Digite seu login (email principal) e senha.</p>
        <g:if test="${flash.message}">
        	<div class="alert alert-danger" role="alert">
			  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			  <span class="sr-only">Error:</span>
			  ${flash.message}
			</div>
        </g:if>
        <form action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
          <div class="form-group has-feedback">
            <input type="text" class="form-control" placeholder="Email" name="j_username" value="${session['j_username']}"/>
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="Senha" name="j_password"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">    
              <div class="checkbox icheck">
                <label>
                  <input type='checkbox' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/> Lembrar
                </label>
              </div>                        
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Acessar</button>
            </div><!-- /.col -->
          </div>
        </form>

        <a href="#">Esqueci minha senha</a><br>
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    <!-- iCheck -->
    <script src="${resource(dir: 'javascripts', file: 'icheck.min.js')}" type="text/javascript"></script>
    <script>
		$(document).ready(
			function() {
				$('input').iCheck({
					checkboxClass : 'icheckbox_square-blue',
					radioClass : 'iradio_square-blue',
					increaseArea : '20%' // optional
				});
	
				if ($('input[name=j_username]').val() == '') {
					$('input[name=j_username]').focus();
				} else {
					$('input[name=j_password]').focus();
				}
			}
		);
	</script>
  </body>
</html>
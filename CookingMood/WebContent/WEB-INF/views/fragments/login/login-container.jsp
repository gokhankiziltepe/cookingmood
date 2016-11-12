<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div th:fragment="login">
		<div class="hero-unit">
			<form class="form-signin" name='f' action="login" method='POST'>
				<input type="hidden" th:name="${_csrf.parameterName}"
					th:value="${_csrf.token}" />
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<h3 class="form-signin-heading">lütfen giriş yapın</h3>
						<div class="form-group">
							<label for="username" class="sr-only">kullanıcı adı</label> <input
								type="text" id="username" name="username" class="form-control"
								placeholder="kullanıcı adı" required="" autofocus="" />
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">şifre</label> <input
								type="password" id="password" name="password"
								class="form-control" placeholder="şifre" required="" />
						</div>
						<button class="btn btn-primary btn-block" type="submit">giriş
							yap</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
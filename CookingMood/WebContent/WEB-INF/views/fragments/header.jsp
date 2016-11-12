<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="navbar navbar-inverse" th:fragment="header">
		<div class="loader"></div>
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">cookingmood</a>
			</div>
			<div class="navbar-collapse collapse"
				th:if="${#authorization.expression('isAuthenticated()')}">
				<ul class="nav navbar-nav">
					<li><a href="#" th:href="@{/admin/recipe-entry}">tarif ekle</a></li>
					<li><a href="#" th:href="@{/admin/blog-entry}">blog ekle</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="javascript: document.logoutForm.submit()"
						role="menuitem">çıkış</a>
						<form name="logoutForm" th:action="@{/sign-out}" method="post"
							th:hidden="true">
							<input hidden="true" type="submit" value="Sign Out" />
						</form></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
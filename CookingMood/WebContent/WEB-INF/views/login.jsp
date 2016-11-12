<!DOCTYPE html>
<html>
<head th:include="fragments/headFragment :: headFragment">
<title id="pageTitle">giriş yap - cookingmood</title>
</head>
<body>
	<div th:replace="fragments/header :: header"></div>
	<div class="container">
		<div th:replace="fragments/login/login-container :: login"></div>
		<div th:replace="fragments/footer :: footer"></div>
	</div>
</body>
</html>
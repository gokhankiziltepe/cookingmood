<!DOCTYPE html>
<html>
<head th:include="fragments/headFragment :: headFragment">
<title id="pageTitle">yorum girişi - cookingmood</title>
</head>
<body>
	<div th:replace="fragments/header :: header"></div>
	<div class="container">
		<div th:replace="fragments/admin/comment-entry :: comment-entry"></div>
		<div th:replace="fragments/footer :: footer"></div>
	</div>
</body>
</html>
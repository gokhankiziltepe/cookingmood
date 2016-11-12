<head th:fragment="headFragment">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="_csrf_parameter" th:attr="content=${_csrf.parameterName}" />
<meta name="_csrf_header" content="X-CSRF-TOKEN" />
<meta name="_csrf" th:attr="content=${_csrf.token}" />
<title th:include=":: #pageTitle">cookingmood</title>
<link th:href="@{/resources/bootstrap/css/bootstrap.min.css}"
	href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link th:href="@{/resources/css/cookingmood.css}"
	href="/resources/css/cookingmood.css" rel="stylesheet" type="text/css" />
<link rel="icon" th:href="@{/resources/images/team/team-member-1.jpg}" />
<script type="text/javascript"
	th:src="@{/resources/js/jquery-2.1.0.min.js}"></script>
<script type="text/javascript"
	th:src="@{/resources/bootstrap/js/bootstrap.min.js}"></script>
<script type="text/javascript" th:src="@{/resources/js/cookingmood.js}"></script>
<script th:src="@{//cdn.ckeditor.com/4.5.11/full/ckeditor.js}"></script>
<script
	th:src="@{//cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js}"></script>
<script
	th:src="@{//cdn.jsdelivr.net/jquery.validation/1.15.1/additional-methods.min.js}"></script>
</head>
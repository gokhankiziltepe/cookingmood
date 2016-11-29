<head th:fragment="headFragment">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="_csrf_parameter" th:attr="content=${_csrf.parameterName}" />
<meta name="_csrf_header" content="X-CSRF-TOKEN" />
<meta name="_csrf" th:attr="content=${_csrf.token}" />
<meta name="keywords" th:content="${pageKeywords}">
<meta name="description" th:content="${pageTitle}">
<meta name="author" content="Ayça Erdem - CookingMood">
<title th:text="${pageTitle}"></title>
<link rel="icon" th:href="@{/resources/images/team/team-member-1.jpg}" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" th:href="@{/resources/css/style.css}" />
<link rel="stylesheet" th:href="@{/resources/css/cookingmood.css}" />
<script type="text/javascript" th:src="@{/resources/js/vendor/modernizr.js}"></script>
<script type="text/javascript" th:src="@{/resources/js/jquery-2.1.0.min.js}"></script>
<script type="text/javascript" th:src="@{/resources/js/foundation.min.js}"></script>
<script type="text/javascript" th:src="@{/resources/js/app.js}"></script>
<script type="text/javascript" th:src="@{/resources/js/wow.min.js}"></script>
<script type="text/javascript" th:src="@{/resources/js/cookingmood.js}"></script>
<script
	th:src="@{//cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js}"></script>
<script>
	$(function() {
		jQuery(document).foundation({
			equalizer : {
				equalize_on_stack : true
			}
		});
		wow = new WOW({
			mobile : false
		})
		wow.init();
	});
</script>
<script th:src="@{/resources/js/packery.js}"></script>
<script th:src="@{/resources/js/imagesloaded.pkgd.min.js}"></script>
<script th:src="@{/resources/js/jquery.flexslider-min.js}"></script>
</head>
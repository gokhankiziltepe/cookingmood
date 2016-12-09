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
<script type="text/javascript"
	th:src="@{/resources/js/vendor/modernizr.js}"></script>
<script type="text/javascript"
	th:src="@{/resources/js/jquery-2.1.0.min.js}"></script>
<script type="text/javascript"
	th:src="@{/resources/js/foundation.min.js}"></script>
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
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-88771416-1', 'auto');
	ga('send', 'pageview');
</script>
<!-- Google Tag Manager -->
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
		j.async = true;
		j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-MPVWTTQ');
</script>
<!-- End Google Tag Manager -->
</head>
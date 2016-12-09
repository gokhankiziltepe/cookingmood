<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<header id="header" th:fragment="header">
		<!-- Google Tag Manager (noscript) -->
		<noscript>
			<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MPVWTTQ"
				height="0" width="0" style="display: none; visibility: hidden"></iframe>
		</noscript>
		<!-- End Google Tag Manager (noscript) -->
		<nav class="wow fadeInDown" th:fragment="header-inner">
			<div class="row">
				<div class="large-3 medium-12 small-12 columns">
					<a th:href="@{/}" class="logo">cookingmood</a>
				</div>
				<div class="large-9 medium-12 small-12 columns">
					<span id="showmobilemenu" class="hide-for-large-up">MENÜ</span>
					<ul id="mainnav">
						<li><a
							th:classappend="${#strings.equals(path,'/') ? 'active' : ''}"
							th:href="@{/}">ANA SAYFA</a></li>
						<li><a
							th:classappend="${#strings.contains(path,'/about-me') ? 'active' : ''}"
							th:href="@{/about-me}">HAKKIMIZDA</a></li>
						<li><a
							th:classappend="${#strings.contains(path,'/recipe') ? 'active' : ''}"
							th:href="@{/recipe}">TARİFLER</a>
							<ul>
								<li th:each="type : ${recipeTypes}"><a
									th:href="@{'/recipe?type=' + ${type.status}}"
									th:text="${type.title}"></a></li>
							</ul></li>
						<li><a
							th:classappend="${#strings.contains(path,'/blog') ? 'active' : ''}"
							th:href="@{/blog}">BLOG</a>
							<ul>
								<li th:each="type : ${blogTypes}"><a
									th:href="@{'/blog?type=' + ${type.status}}"
									th:text="${type.title}"></a></li>
							</ul></li>
						<li><a
							th:classappend="${#strings.contains(path,'/contact-me') ? 'active' : ''}"
							th:href="@{/contact-me}">İLETİŞİM</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>
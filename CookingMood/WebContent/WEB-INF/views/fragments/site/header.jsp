<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<header id="header" th:fragment="header">
		<div class="loader"></div>
		<nav class="wow fadeInDown">
			<div class="row">
				<div class="large-3 medium-12 small-12 columns">
					<a href="index.html" class="logo">CookingMood</a>
				</div>
				<div class="large-9 medium-12 small-12 columns">
					<span id="showmobilemenu" class="hide-for-large-up">MENÜ</span>
					<ul id="mainnav">
						<li><a
							th:classappend="${#strings.equals(path,'/') ? 'active' : ''}"
							th:href="@{/}">ANA SAYFA</a></li>
						<li><a
							th:classappend="${#strings.contains(path,'/about-us') ? 'active' : ''}"
							th:href="@{/about-us}">HAKKIMIZDA</a></li>
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
							th:href="@{/blog}">BLOG</a></li>
						<li><a
							th:classappend="${#strings.contains(path,'/contact-us') ? 'active' : ''}"
							th:href="@{/contact-us}">İLETİŞİM</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>
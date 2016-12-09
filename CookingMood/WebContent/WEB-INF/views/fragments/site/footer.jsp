<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<footer id="footer" th:fragment="footer">
		<div class="loader"></div>
		<div id="footer-top">
			<div class="row">
				<div class="large-4 medium-4 small-12 columns"
					th:each="item : ${footerContents}">
					<span th:utext="${item.htmlContent}"></span>
				</div>
			</div>
		</div>

		<div id="footer-bottom">
			<div class="row">
				<div class="large-3 medium-12 small-12 columns">
					<a href="index.html" class="logo">cookingmood</a>
				</div>
				<div class="large-9 medium-12 small-12 columns">
					<ul>
						<li><a
							th:classappend="${#strings.equals(path,'/') ? 'active' : ''}"
							th:href="@{/}">ANA SAYFA</a></li>
						<li><a
							th:classappend="${#strings.contains(path,'/about-us') ? 'active' : ''}"
							th:href="@{/about-us}">HAKKIMIZDA</a></li>
						<li><a
							th:classappend="${#strings.contains(path,'/recipe') ? 'active' : ''}"
							th:href="@{/recipe}">TARİFLER</a></li>
						<li><a
							th:classappend="${#strings.contains(path,'/blog') ? 'active' : ''}"
							th:href="@{/blog}">BLOG</a></li>
						<li><a
							th:classappend="${#strings.contains(path,'/contact-us') ? 'active' : ''}"
							th:href="@{/contact-us}">İLETİŞİM</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>
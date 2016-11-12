<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<footer id="footer" th:fragment="footer">
		<div id="footer-top">
			<div class="row">
				<div class="large-4 medium-4 small-12 columns">
					<h4>Twitter</h4>
					<p>
						<a href="">@GoodFood</a> Nunc convallis sagittis metus, at
						vehicula orci lacinia a. Maecenas quis mollis dolor, vitae euismod
						arcu. Praesent nec.
					</p>
					<p>
						<a href="">@GoodFood</a> Nunc convallis sagittis metus, at
						vehicula orci lacinia a. Maecenas quis mollis dolor, vitae euismod
						arcu. Praesent nec.
					</p>
					<p>
						<a href="">@GoodFood</a> Nunc convallis sagittis metus, at
						vehicula orci lacinia a. Maecenas quis mollis dolor, vitae euismod
						arcu. Praesent nec.
					</p>
				</div>
				<div class="large-4 medium-4 small-12 columns">
					<h4>Recent Comments</h4>
					<p>
						<strong>Morgan Freeman</strong> on <a href="">Where Are These
							Small Birds Who Like to Sing – Self-Hosted Video Post Type</a>
					</p>
					<p>
						<strong>Nikole Kidman</strong> on <a href="">Just a Little
							Depressed and What I am Doing About It – Gallery Post Type</a>
					</p>
					<p>
						<strong>Robert Downey Jr.</strong> on <a href="">Isn’t Just a
							Sequence of Waiting For Things To Be Done! – Slideshow Post Type</a>
					</p>
					<p>
						<strong>Morgan Freeman</strong> on <a href="">Where Are These
							Small Birds Who Like to Sing – Self-Hosted Video Post Type</a>
					</p>
				</div>
				<div class="large-4 medium-4 small-12 columns">
					<h4>Lorem ipsum dolor</h4>
					<p>There are so many unexpected things I’ve gotten from
						blogging. Big and small things. A cookbook. A reason to use
						designer muffin cups. A community. A career. New friends. Offers
						to try a new line of microalgae.</p>
					<p>But my favourite things however, are those that involve
						super passionate people wanting to share their awesome</p>
					<p>
						<a href="">Read more...</a>
					</p>
				</div>
			</div>
		</div>

		<div id="footer-bottom">
			<div class="row">
				<div class="large-3 medium-12 small-12 columns">
					<a href="index.html" class="logo">CookingMood</a>
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
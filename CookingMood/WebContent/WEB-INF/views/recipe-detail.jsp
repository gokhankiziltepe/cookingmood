<!doctype html>
<html class="no-js" lang="tr">
<head
	th:include="fragments/site/headFragment :: headFragment (pageTitle=${recipeDetail?.header} + '- CookingMood', pageKeywords=${recipeDetail?.tags})">
</head>
<body>
	<!-- header -->
	<div th:replace="fragments/site/header :: header"></div>
	<!-- END header -->

	<section class="content-padding">
		<div class="row">
			<div class="large-12 medium-12 small-12 columns text-center">
				<div class="head align-center">
					<h3 class="margin0 fontsans">
						<span th:text="${recipeDetail?.header}"></span>
					</h3>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="large-12 medium-12 small-12 columns">

				<div class="recipe-slider flexslider wow flipInX"
					data-wow-offset="350">
					<ul class="slides">
						<li th:each="headerImagePath : ${headerImagePaths}">
							<div class="entry-cover"
								th:attr="style=${'background-image: url(' + webdavBase + '' + headerImagePath + ');'}">
								<a href="" class="like-it"><i class="fa fa-heart-o"></i></a><a
									href="" class="all"></a>
							</div>
						</li>
				</div>

			</div>
		</div>

		<div class="row">
			<div class="large-4 medium-4 small-12 blog-text columns">
				<div class="ingredients">
					<h5 class="fontsans">Genel Bilgiler:</h5>
					<ul>
						<li>Tür: <span th:text="${recipeDetail?.recipeType.title}"></span></li>
						<li>Zorluk: <span
							th:text="${recipeDetail?.recipeDifficulty.title}"></span></li>
						<li>Süre: <span th:text="${recipeDetail?.durationInMinutes}"></span></li>
					</ul>
				</div>
				<br />
				<div class="ingredients">
					<h5 class="fontsans">Araç-Gereçler:</h5>
					<div th:remove="tag" th:utext="${recipeDetail?.tools}"></div>
				</div>
				<br />
				<div class="ingredients">
					<h5 class="fontsans">Malzemeler:</h5>
					<div th:remove="tag" th:utext="${recipeDetail?.ingredients}">
					</div>
				</div>
			</div>
			<div class="large-8 medium-8 small-12 blog-text columns">
				<div th:remove="tag" th:utext="${recipeDetail?.entrance}"></div>
				<h5 class="fontsans">Reçete:</h5>
				<div th:remove="tag" th:utext="${recipeDetail?.recipe}"></div>
				<ul
					class="small-block-grid-2 medium-block-grid-3 large-block-grid-4 clearing-thumbs wow flipInX"
					data-clearing data-wow-offset="350">
					<li th:each="recipeImagePath : ${recipeImagePaths}"><a
						th:href="@{${webdavBase + recipeImagePath}}" target="_blank"><img
							th:src="@{${webdavBase + recipeImagePath}}"></a></li>
				</ul>

				<ul class="soc">
					<li><a class="soc-instagram" target="_blank"
						href="https://www.instagram.com/cookingmood/"></a></li>
					<li><a class="soc-facebook" target="_blank"
						href="https://facebook.com/cookingmoods/"></a></li>
					<li><a class="soc-pinterest" target="_blank"
						href="https://tr.pinterest.com/erdayca/"></a></li>
				</ul>
			</div>
		</div>

		<div class="row">
			<div
				class="large-12 medium-12 small-12 columns blog-text text-justify">
				<h4>Comments:</h4>

				<ul id="comments" class="wow zoomIn" data-wow-offset="350">
					<li class="comment">
						<div class="row">
							<div class="large-2 medium-2 small-3 columns hide-for-small-only">
								<p>
									<a href=""><img th:src="@{/resources/img/avatar.jpg}"></a>
								</p>
							</div>
							<div class="large-10 medium-10 small-12 columns">
								<p>
									<strong><a href="">John Doe</a></strong>, 22.12.2014, 12:09,
									Warsaw
								</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Etiam at luctus elit. Pellentesque ornare eros vel suscipit
									sodales. Duis accumsan ultricies massa ut dictum. Ut vitae
									blandit ligula, ac rhoncus sapien. In condimentum erat dui, ut
									lobortis dolor maximus nec. Phasellus a risus sit amet leo
									placerat imperdiet sit amet id ligula. Vivamus lobortis augue
									sollicitudin magna cursus mollis.</p>
								<p class="text-right">
									<a href="" class="read">Reply &raquo;</a>
								</p>
							</div>
						</div>
					</li>
					<li class="comment">
						<div class="row">
							<div class="large-2 medium-2 small-3 columns hide-for-small-only">
								<p>
									<a href=""><img th:src="@{/resources/img/avatar.jpg}"></a>
								</p>
							</div>
							<div class="large-10 medium-10 small-12 columns">
								<p>
									<strong><a href="">John Doe</a></strong>, 22.12.2014, 12:09,
									Warsaw
								</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Etiam at luctus elit. Pellentesque ornare eros vel suscipit
									sodales. Duis accumsan ultricies massa ut dictum. Ut vitae
									blandit ligula, ac rhoncus sapien. In condimentum erat dui, ut
									lobortis dolor maximus nec. Phasellus a risus sit amet leo
									placerat imperdiet sit amet id ligula. Vivamus lobortis augue
									sollicitudin magna cursus mollis.</p>
								<p class="text-right">
									<a href="" class="read">Reply &raquo;</a>
								</p>
							</div>
						</div>
					</li>
					<li class="comment">
						<div class="row">
							<div class="large-2 medium-2 small-3 columns hide-for-small-only">&nbsp;</div>
							<div class="large-2 medium-2 small-3 columns hide-for-small-only">
								<p>
									<a href=""><img th:src="@{/resources/img/avatar.jpg}"></a>
								</p>
							</div>
							<div class="large-8 medium-8 small-12 columns">
								<p>
									<strong><a href="">John Doe</a></strong>, 22.12.2014, 12:09,
									Warsaw
								</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Etiam at luctus elit. Pellentesque ornare eros vel suscipit
									sodales. Duis accumsan ultricies massa ut dictum. Ut vitae
									blandit ligula, ac rhoncus sapien. In condimentum erat dui, ut
									lobortis dolor maximus nec. Phasellus a risus sit amet leo
									placerat imperdiet sit amet id ligula. Vivamus lobortis augue
									sollicitudin magna cursus mollis.</p>
								<p class="text-right">
									<a href="" class="read">Reply &raquo;</a>
								</p>
							</div>
						</div>
					</li>
					<li class="comment">
						<div class="row">
							<div class="large-2 medium-2 small-3 columns hide-for-small-only">
								<p>
									<a href=""><img th:src="@{/resources/img/avatar.jpg}"></a>
								</p>
							</div>
							<div class="large-10 medium-10 small-12 columns">
								<p>
									<strong><a href="">John Doe</a></strong>, 22.12.2014, 12:09,
									Warsaw
								</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Etiam at luctus elit. Pellentesque ornare eros vel suscipit
									sodales. Duis accumsan ultricies massa ut dictum. Ut vitae
									blandit ligula, ac rhoncus sapien. In condimentum erat dui, ut
									lobortis dolor maximus nec. Phasellus a risus sit amet leo
									placerat imperdiet sit amet id ligula. Vivamus lobortis augue
									sollicitudin magna cursus mollis.</p>
								<p class="text-right">
									<a href="" class="read">Reply &raquo;</a>
								</p>
							</div>
						</div>
					</li>
				</ul>

				<h4>Yorum gönder:</h4>
				<form class="wow zoomIn" data-wow-offset="350">
					<div class="row">
						<div class="large-12 medium-12 small-12 columns">
							<textarea placeholder="Yorumun"></textarea>
						</div>
						<div class="large-4 medium-12 small-12 columns">
							<input type="email" placeholder="E-posta adresin">
						</div>
						<div class="large-4 medium-12 small-12 columns">
							<input type="text" placeholder="Adın">
						</div>
						<div class="large-4 medium-12 small-12 columns">
							<input type="submit" value="yorumu gönder">
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<div th:replace="fragments/site/footer :: footer"></div>
</body>
</html>
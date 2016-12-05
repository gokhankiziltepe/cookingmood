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
								th:attr="style=${'background-image: url(' + webdavBase + '' + headerImagePath + '), linear-gradient(to right, rgba(255,255,255,1), rgba(50,50,50,1), rgba(255,255,255,1));'}">
								<a href="javascript:void(0)" class="like-it"
									th:attr="data-entitybaseid=${entityBaseId}"><i
									class="fa fa-heart-o"></i></a><a href="javascript:void(0)"
									class="all"></a>
							</div>
						</li>
					</ul>
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
			<div class="large-8 medium-8 small-12 blog-text columns recipe-detail">
				<div th:remove="tag" th:utext="${recipeDetail?.entrance}"></div>
				<h5 class="fontsans">Reçete:</h5>
				<div th:remove="tag" th:utext="${recipeDetail?.recipe}"></div>
				<ul
					class="small-block-grid-6 medium-block-grid-6 large-block-grid-6 clearing-thumbs wow flipInX"
					data-clearing data-wow-offset="350">
					<li th:each="recipeImagePath : ${recipeImagePaths}"><a
						th:href="@{${webdavBase + recipeImagePath}}" target="_blank">
							<img th:src="@{${webdavBase + recipeImagePath}}" />
					</a></li>
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
		<script type="text/javascript" th:inline="javascript">
			$(function() {
				$('.like-it').click(function() {
					/*[+
					 var urlToload = [[@{/like/save}]];
					 +]*/
					var entityBaseId = $(this).data('entitybaseid');
					$.ajax({
						url : urlToload,
						type : 'POST',
						data : {
							likedEntityBaseId : entityBaseId
						},
						error : function(error) {
							alert(error.responseText);
						},
						dataType : "json",
						success : function(data) {
						},
					});
				});
			});
		</script>
		<div th:replace="fragments/site/comment :: comment"></div>
	</section>
	<div th:replace="fragments/site/footer :: footer"></div>
</body>
</html>
<!doctype html>
<html class="no-js" lang="tr">
<head
	th:include="fragments/site/headFragment :: headFragment (pageTitle='Tarifler - CookingMood', pageKeywords=${recipeDetail?.tags})">
</head>
<body>
	<!-- header -->
	<div th:replace="fragments/site/body-start :: body-start"></div>
	<div th:replace="fragments/site/header :: header"></div>
	<!-- END header -->
	<section class="content-padding">
		<div class="row">
			<div class="large-12 medium-12 small-12 columns text-center">
				<div class="head align-center">
					<h2 class="margin0">TARİFLER</h2>
					<div class="filters text-center">
						<a data-target='item'>Tümü</a> <a th:each="item : ${recipeTypes}"
							th:attrappend="data-target=${'category-' + item.name}"
							th:text="${item.title}"></a>
					</div>
				</div>
			</div>
		</div>

		<!-- recipe list -->
		<div class="wow bounceInUp" data-wow-offset="250">
			<div class="row entries" data-equalizer>
				<div th:each="item : ${recipes}"
					th:classappend="${'category-' + item.recipeType.name}"
					class="item large-3 medium-6 small-12 columns" data-equalizer-watch>
					<div class="recipe text-center">
						<div class="recipe-cover cover">
							<a th:href="@{'tarif/' + ${item.webdavPath}}" class="like"><i
								class="fa fa-heart-o"></i><span th:text="${likeMap[item.id]}"></span></a>
							<a th:href="@{'tarif/' + ${item.webdavPath}}" class="type"
								th:text="${item.recipeType.title}"></a> <a class="recipe-link"
								th:href="@{'tarif/' + ${item.webdavPath}}"></a> <img
								style="margin: 0 auto;"
								th:src="@{${webdavBase} + ${imageMap[item.id]}}">
						</div>
						<h5 class="margin0 big">
							<a th:href="@{'tarif/' + ${item.webdavPath}}" th:text="${item.header}"></a>
						</h5>
					</div>
				</div>
			</div>
		</div>
		<!-- END recipe list -->
		<script type="text/javascript" th:inline="javascript">
			$(function() {
				var type = cookingmood.util.getParameterByName('type');
				if (type) {
					setTimeout(function() {
						$('.filters a[data-target=category-' + type + ']').click();
					}, 1000);
				}
			});
		</script>
	</section>
	<div th:replace="fragments/site/footer :: footer"></div>
</body>
</html>
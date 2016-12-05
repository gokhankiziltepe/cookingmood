<!doctype html>
<html class="no-js" lang="tr">
<head
	th:include="fragments/site/headFragment :: headFragment (pageTitle='Blog - CookingMood', pageKeywords=${blogDetail?.tags})">
</head>
<body>
	<!-- header -->
	<div th:replace="fragments/site/header :: header"></div>
	<!-- END header -->
	<section class="content-padding">
		<div class="row">
			<div class="large-12 medium-12 small-12 columns text-center">
				<div class="head align-center">
					<h2 class="margin0">Bloglar</h2>
					<div class="filters text-center">
						<a data-target='item'>Tümü</a> <a th:each="item : ${blogTypes}"
							th:attrappend="data-target=${'category-' + item.status}"
							th:text="${item.title}"></a>
					</div>
				</div>
			</div>
		</div>

		<!-- recipe list -->
		<div class="wow bounceInUp" data-wow-offset="350">
			<div class="row blog-entries">
				<div th:each="item : ${blogs}"
					th:classappend="${'category-' + item.blogType.status}"
					class="item large-4 medium-6 small-12 columns">
					<div class="cover">
						<a th:href="@{'blog/' + ${item.id}}" class="like-it"><i
							class="fa fa-heart-o"></i>&nbsp;<span
							th:text="${likeMap[item.id]}"></span></a><a class="entry-link"
							th:href="@{'blog/' + ${item.id}}"></a><img
							style="margin: 0 auto;"
							th:src="@{${webdavBase} + ${imageMap[item.id]}}" />
					</div>
					<div class="entry-name">
						<p class="data"
							th:text="${#dates.format(item.updateDate, 'dd-MM-yyyy') + ' ' + item.blogType.title}"></p>
						<h4 class="fontsans entry-title">
							<a th:href="@{'blog/' + ${item.id}}" th:text="${item.header}"></a>
						</h4>
						<p>
							<span th:utext="${#strings.abbreviate(item.text,100)}"></span><a
								th:href="@{'blog/' + ${item.id}}" class="blue read">daha
								fazla...</a>
						</p>
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
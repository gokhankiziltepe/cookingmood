<!doctype html>
<html
	class="no-js"
	lang="tr"
>
<head
	th:include="fragments/site/headFragment :: headFragment (pageTitle='CookingMood', pageKeywords='CookingMood, cooking, mood, cooking mood,')"
>
</head>
<body>
	<!-- header -->
	<div th:replace="fragments/site/body-start :: body-start"></div>
	<header
		id="header"
		th:fragment="header"
	>
		<div th:replace="fragments/site/header :: header-inner"></div>
		<!-- END header -->
		<section id="header-content">
			<h1 class="wow fadeInDown">cookingmood</h1>
			<form
				id="findRecipe"
				name="findRecipe"
			>
				<div class="row collapse">
					<div class="large-10 medium-10 small-8 columns">
						<input
							type="text"
							name="searchText"
							maxlength="100"
							id="searchText"
							placeholder="TARİF BUL"
						>
					</div>
					<div class="large-2 medium-2 small-4 columns">
						<input
							type="submit"
							value=""
						>
					</div>
				</div>
				<div class="large-10 medium-10 small-8 columns hide">
					<span class="error">lütfen form alanlarını kontrol ediniz</span>
				</div>
			</form>
			<script
				type="text/javascript"
				th:inline="javascript"
			>
				$(function() {
					$("#findRecipe").validate({
						ignore : [],
						errorPlacement : function(error, element) {
						},
						invalidHandler : function(event, validator) {
							var errors = validator.numberOfInvalids();
							if (errors) {
								$("span.error").parent().removeClass('hide');
							}
						},
						rules : {
							searchText : {
								required : true,
								minlength : 2,
								maxlength : 100
							},
						},
						submitHandler : function(form) {
							$("span.error").parent().addClass('hide');
							var data = $("#commentForm").serialize();
							/*[+
							var urlToload=[[@{/tarif}]]; 
							+]*/
							var searchText = $('[name=searchText]').val();
							window.location.href = urlToload + '?searchText=' + searchText;

						}
					});
				});
			</script>
		</section>
		<section class="fullwidth">
			<div
				class="row collapse"
				data-equalizer
			>
				<div class="large-6 medium-6 small-12 columns">
					<div
						class="myphoto wow bounceInLeft"
						style="background: url(resources/images/team/team-member-1.jpg) no-repeat center center; max-height: 600px !important;"
						data-wow-offset="350"
						data-equalizer-watch
					>
						<a href=""></a>
					</div>
				</div>
				<div class="large-6 medium-6 small-12 columns">
					<div
						class="aboutme"
						data-equalizer-watch
					>
						<div class="head align-left">
							<h2 class="margin0">Ayça Erdem</h2>
							<h5 class="big">
								<strong>Pişirmeden</strong>
							</h5>
						</div>
						<p>Sene 2006 idi, sıcak bir yaz günü denizden çıkmış terlemiş
							acıkmıştım. Silivri’de arkadaşlarım ile beraber geçirdiğim basit
							bir tatil gününün akşamı evde yemek yiyecektik, yedik. Ardından
							da tatlı. Zengin menümüzün tatlısı çilek soslu muhallebi idi. Çok
							fazla sevmiyor olmama rağmen o kadar güzel ve tatlı geldi ki, o
							gün o tatlıyı fütursuzca yediğimi hatırlıyorum.</p>
						<p>Aynı senenin yazında babaanneme bir tatlı yapmayı teklif
							ettim tahmin ettiğiniz üzere o tatlı, tadı damağımda kalmış olan
							çilekli muhallebi idi. İlk defa mutfağa girecek ilk tatlımı
							yapacak olmanın heyecanı ile arkadaşımdan bu tatlının reçetesini
							annesinden almasını ve bana hemen yazmasını rica ettim.</p>
						<a
							th:href="@{/about-me}"
							class="button"
						>Devamını oku</a>
					</div>
				</div>
			</div>
		</section>
	</header>
	<section class="content-padding recipes">
		<div class="row">
			<div class="large-12 medium-12 small-12 columns text-center">
				<div class="head align-center">
					<h2 class="margin0">TARİFLER</h2>
					<h5 class="big">
						<strong>Son Eklenenler</strong>
					</h6>
				</div>
			</div>
		</div>
		<!-- recipe list -->
		<div
			class="wow bounceInUp"
			data-wow-offset="250"
		>
			<div
				class="row entries"
				data-equalizer
			>
				<div
					th:each="item : ${recipes}"
					th:classappend="${'category-' + item.recipeType.name}"
					class="item large-3 medium-6 small-12 columns"
					data-equalizer-watch
				>
					<div class="recipe text-center">
						<div class="recipe-cover cover">
							<a
								th:href="@{'tarif/' + ${item.webdavPath}}"
								class="like"
							><i class="fa fa-heart-o"></i><span
								th:text="${likeMap[item.id]}"
							></span></a> <a
								th:href="@{'tarif/' + ${item.webdavPath}}"
								class="type"
								th:text="${item.recipeType.title}"
							></a> <a
								class="recipe-link"
								th:href="@{'tarif/' + ${item.webdavPath}}"
							></a> <img
								style="margin: 0 auto;"
								th:src="@{${webdavBase} + ${imageMap[item.id]}}"
							>
						</div>
						<h5 class="margin0 big">
							<a
								th:href="@{'tarif/' + ${item.webdavPath}}"
								th:text="${item.header}"
							></a>
						</h5>
					</div>
				</div>
			</div>
		</div>
		<!-- END recipe list -->
	</section>
	<div th:replace="fragments/site/footer :: footer"></div>
</body>
</html>
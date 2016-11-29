<!doctype html>
<html class="no-js" lang="tr">
<head
	th:include="fragments/site/headFragment :: headFragment (pageTitle='CookingMood', pageKeywords='CookingMood, cooking, mood, cooking mood,')">
</head>
<body>
	<!-- header -->
	<header id="header" th:fragment="header">
		<div th:replace="fragments/site/header :: header-inner"></div>
		<!-- END header -->
		<section id="header-content">
			<h1 class="wow fadeInDown">CookingMood Blog</h1>
			<h6 class="big fontsans">EN İYİ TARİFLER, EN GÜZEL MEKANLAR
				dishes</h6>
			<form id="findRecipe" name="findRecipe">
				<div class="row collapse">
					<div class="large-10 medium-10 small-8 columns">
						<input type="text" name="searchText" maxlength="100"
							id="searchText" placeholder="tarif bul">
					</div>
					<div class="large-2 medium-2 small-4 columns">
						<input type="submit" value="">
					</div>
				</div>
			</form>
			<script type="text/javascript" th:inline="javascript">
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
							var urlToload=[[@{/recipe}]]; 
							+]*/
							var searchText = $('[name=searchText]').val();
							window.location.href = urlToload + '?searchText=' + searchText;

						}
					});
				});
			</script>
		</section>
		<section class="fullwidth">
			<div class="row collapse" data-equalizer>
				<div class="large-6 medium-6 small-12 columns">
					<div class="myphoto wow bounceInLeft"
						style="background: url(resources/images/team/team-member-1.jpg) no-repeat center center;"
						data-wow-offset="350" data-equalizer-watch>
						<a href=""></a>
					</div>
				</div>

				<div class="large-6 medium-6 small-12 columns">
					<div class="aboutme" data-equalizer-watch>
						<div class="head align-left">
							<h2 class="margin0">Ayça Erdem</h2>
							<h6 class="fontsans big">
								<strong>Pişirmeden</strong>
							</h6>
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
						<a th:href="@{/about-me}" class="button">Devamını oku</a>
					</div>
				</div>
			</div>
		</section>
	</header>
	<div th:replace="fragments/site/footer :: footer"></div>
</body>
</html>
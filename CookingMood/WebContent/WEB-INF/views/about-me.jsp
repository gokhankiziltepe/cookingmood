<!doctype html>
<html class="no-js" lang="tr">
<head
	th:include="fragments/site/headFragment :: headFragment (pageTitle=${blogDetail?.header} + '- CookingMood', pageKeywords=${blogDetail?.tags})">
</head>
<body>
	<!-- header -->
	<div th:replace="fragments/site/header :: header"></div>
	<!-- END header -->
	<section class="content-padding">
		<div class="row">
			<div class="large-12 medium-12 small-12 columns text-center">
				<div class="head align-center">
					<h2 class="margin0">Pişirmeden</h2>
				</div>
			</div>
		</div>
		<section class="fullwidth">
			<div class="row collapse" data-equalizer>
				<div class="large-6 medium-12 small-12 columns">
					<div class="myphoto wow bounceInLeft"
						style="background: url(resources/images/team/team-member-1.jpg) no-repeat center center;"
						data-equalizer-watch data-wow-offset="350">
						<a href=""></a>
					</div>
				</div>

				<div class="large-6 medium-12 small-12 columns">
					<div class="aboutme" data-equalizer-watch>
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
						<p>Hikaye buraya kadar reçeteye uygun ilerliyordu.. Arkadaşım
							tatlının tüm içeriğini yazıp bana mesaj yoluyla iletmişti. Bir
							heves ile un süt yağ hepsini karıştırdım ve istediğim kıvamı
							oluşturmak için var gücümle çabaladığımı hatırlıyorum. Bir türlü
							o kıvama gelmedi. Ne kadar un eklesem de (rengi kahverengiye
							dönene kadar) olmadı, başaramadım. Bir şey eksikti. Sordum
							sebebini. Arkadaşıma yaptığım her şeyi anlattım en ince
							ayrıntısına kadar, çaresizlik için de eksik olan şeyi söylemesini
							beklerken. “Ayça pişirmedin mi” dedi? Ben “Tarifte yazmıyordu
							ama” deyince bir daha cevap vermedi bana.</p>
						<p>Evet , ilk tatlımı pişirmeden sunmaya çalıştığımdan beri
							içimde dinmek bilmeyen bir mutfak merakı var. Pasta yapmaktan ,
							bunları tadan insanların yerken gözlerinin içine bakarak neler
							hissettiklerini kendi içimde çözümlemeye çalışmak benim için bir
							başlangıç yolu oldu diyebilirim.</p>
					</div>
				</div>
			</div>
		</section>
	</section>

	<!-- 	<section class="content-padding"> -->
	<!-- 		<div class="row"> -->
	<!-- 			<div class="large-12 medium-12 small-12 columns"> -->
	<!-- 				<div class="head align-center"> -->
	<!-- 					<h2 class="margin0">Some facts of my life</h2> -->
	<!-- 				</div> -->
	<!-- 				<section id="cd-timeline" class="cd-container"> -->
	<!-- 					<div class="cd-timeline-block"> -->
	<!-- 						<div class="cd-timeline-img cd-picture"> -->
	<!-- 							<i class="fa fa-picture-o"></i> -->
	<!-- 						</div> -->
	<!-- 						cd-timeline-img -->

	<!-- 						<div class="cd-timeline-content"> -->
	<!-- 							<h4 class="fontsans">My first own dish</h4> -->
	<!-- 							<div class="cover"> -->
	<!-- 								<img src="img/food1.jpg"> -->
	<!-- 							</div> -->
	<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. -->
	<!-- 								Iusto, optio, dolorum provident rerum aut hic quasi placeat iure -->
	<!-- 								tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus -->
	<!-- 								veritatis qui ut. Tempora laudantium ipsa ad debitis unde? Iste -->
	<!-- 								voluptatibus minus veritatis qui ut.</p> -->

	<!-- 							<span class="cd-date">Jan 14</span> -->
	<!-- 						</div> -->
	<!-- 						cd-timeline-content -->
	<!-- 					</div> -->
	<!-- 					cd-timeline-block -->

	<!-- 					<div class="cd-timeline-block"> -->
	<!-- 						<div class="cd-timeline-img cd-movie"> -->
	<!-- 							<i class="fa fa-paint-brush"></i> -->
	<!-- 						</div> -->
	<!-- 						cd-timeline-img -->

	<!-- 						<div class="cd-timeline-content"> -->
	<!-- 							<h4 class="fontsans">My first own dish</h4> -->
	<!-- 							<div class="cover"> -->
	<!-- 								<img src="img/food2.jpg"> -->
	<!-- 							</div> -->
	<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. -->
	<!-- 								Iusto, optio, dolorum provident rerum aut hic quasi placeat iure -->
	<!-- 								tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus -->
	<!-- 								veritatis qui ut. Tempora laudantium ipsa ad debitis unde? Iste -->
	<!-- 								voluptatibus minus veritatis qui ut.</p> -->

	<!-- 							<span class="cd-date">Jan 18</span> -->
	<!-- 						</div> -->
	<!-- 						cd-timeline-content -->
	<!-- 					</div> -->
	<!-- 					cd-timeline-block -->

	<!-- 					<div class="cd-timeline-block"> -->
	<!-- 						<div class="cd-timeline-img cd-picture"> -->
	<!-- 							<i class="fa fa-laptop"></i> -->
	<!-- 						</div> -->
	<!-- 						cd-timeline-img -->

	<!-- 						<div class="cd-timeline-content"> -->
	<!-- 							<h4 class="fontsans">My first own dish</h4> -->
	<!-- 							<div class="cover"> -->
	<!-- 								<img src="img/food3.jpg"> -->
	<!-- 							</div> -->
	<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. -->
	<!-- 								Iusto, optio, dolorum provident rerum aut hic quasi placeat iure -->
	<!-- 								tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus -->
	<!-- 								veritatis qui ut. Tempora laudantium ipsa ad debitis unde? Iste -->
	<!-- 								voluptatibus minus veritatis qui ut.</p> -->

	<!-- 							<span class="cd-date">Jan 24</span> -->
	<!-- 						</div> -->
	<!-- 						cd-timeline-content -->
	<!-- 					</div> -->
	<!-- 					cd-timeline-block -->

	<!-- 					<div class="cd-timeline-block"> -->
	<!-- 						<div class="cd-timeline-img cd-location"> -->
	<!-- 							<i class="fa fa-share-alt-square"></i> -->
	<!-- 						</div> -->
	<!-- 						cd-timeline-img -->

	<!-- 						<div class="cd-timeline-content"> -->
	<!-- 							<h4 class="fontsans">My first own dish</h4> -->
	<!-- 							<div class="cover"> -->
	<!-- 								<img src="img/food4.jpg"> -->
	<!-- 							</div> -->
	<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. -->
	<!-- 								Iusto, optio, dolorum provident rerum aut hic quasi placeat iure -->
	<!-- 								tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus -->
	<!-- 								veritatis qui ut. Tempora laudantium ipsa ad debitis unde? Iste -->
	<!-- 								voluptatibus minus veritatis qui ut.</p> -->

	<!-- 							<span class="cd-date">Feb 14</span> -->
	<!-- 						</div> -->
	<!-- 						cd-timeline-content -->
	<!-- 					</div> -->
	<!-- 					cd-timeline-block -->

	<!-- 					<div class="cd-timeline-block"> -->
	<!-- 						<div class="cd-timeline-img cd-location"> -->
	<!-- 							<i class="fa fa-life-ring"></i> -->
	<!-- 						</div> -->
	<!-- 						cd-timeline-img -->

	<!-- 						<div class="cd-timeline-content"> -->
	<!-- 							<h4 class="fontsans">My first own dish</h4> -->
	<!-- 							<div class="cover"> -->
	<!-- 								<img src="img/food5.jpg"> -->
	<!-- 							</div> -->
	<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. -->
	<!-- 								Iusto, optio, dolorum provident rerum aut hic quasi placeat iure -->
	<!-- 								tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus -->
	<!-- 								veritatis qui ut. Tempora laudantium ipsa ad debitis unde? Iste -->
	<!-- 								voluptatibus minus veritatis qui ut.</p> -->

	<!-- 							<span class="cd-date">Feb 18</span> -->
	<!-- 						</div> -->
	<!-- 						cd-timeline-content -->
	<!-- 					</div> -->
	<!-- 					cd-timeline-block -->

	<!-- 					<div class="cd-timeline-block"> -->
	<!-- 						<div class="cd-timeline-img cd-movie"> -->
	<!-- 							<i class="fa fa-tags"></i> -->
	<!-- 						</div> -->
	<!-- 						cd-timeline-img -->

	<!-- 						<div class="cd-timeline-content"> -->
	<!-- 							<h4 class="fontsans">My first own dish</h4> -->
	<!-- 							<div class="cover"> -->
	<!-- 								<img src="img/food6.jpg"> -->
	<!-- 							</div> -->
	<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. -->
	<!-- 								Iusto, optio, dolorum provident rerum aut hic quasi placeat iure -->
	<!-- 								tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus -->
	<!-- 								veritatis qui ut. Tempora laudantium ipsa ad debitis unde? Iste -->
	<!-- 								voluptatibus minus veritatis qui ut.</p> -->

	<!-- 							<span class="cd-date">Feb 26</span> -->
	<!-- 						</div> -->
	<!-- 						cd-timeline-content -->
	<!-- 					</div> -->
	<!-- 					cd-timeline-block -->
	<!-- 				</section> -->
	<!-- 				cd-timeline -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 		<div class="row collapse"> -->
	<!-- 			<div class="large-12 mecoim-12 small-12 columns text-center"> -->
	<!-- 				<div class="all"> -->
	<!-- 					<a href="" class="button dark">Load more...</a> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</section> -->
	<div th:replace="fragments/site/footer :: footer"></div>
</body>
</html>
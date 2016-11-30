<!doctype html>
<html class="no-js" lang="tr">
<head
	th:include="fragments/site/headFragment :: headFragment (pageTitle='İletişim - CookingMood', pageKeywords='CookingMood, cooking, mood, cookingmood, cooking-mood, hakkımızda')">
</head>
<body>
	<!-- header -->
	<div th:replace="fragments/site/header :: header"></div>
	<!-- END header -->
	<section class="content-padding">
		<div class="row">
			<div class="large-12 medium-12 small-12 columns text-center">
				<div class="head align-center">
					<h2 class="margin0">İletişime geçin</h2>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="large-9 medium-12 small-12 columns">
				<form name="contactForm" id="contactForm">
					<div class="formArea">
						<input type="text" placeholder="Adın-Soyadın" name="name"
							id="name" /> <input type="email" placeholder="E-posta Adresin"
							name="email" id="email" />
						<textarea placeholder="Mesajın" maxlength="1000" name="message"
							id="message"></textarea>
						<div class="large-12 medium-12 small-12 columns hide">
							<span class="error">lütfen form alanlarını kontrol ediniz</span>
						</div>
						<input type="submit" id="submit" value="Mesaj gönder">
					</div>
					<div class="resultArea hide text-center">
						<h3>
							<i class="fa fa-check-square" aria-hidden="true"></i> Mesajınız
							başarıyla iletildi
						</h3>
					</div>
				</form>
				<script type="text/javascript" th:inline="javascript">
					$(function() {
						$("#contactForm").validate({
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
								message : {
									required : true,
									minlength : 2,
									maxlength : 1024
								},
								email : {
									required : true,
									email : true,
									minlength : 2,
									maxlength : 255
								},
								name : {
									required : true,
									minlength : 2,
									maxlength : 255
								}
							},
							submitHandler : function(form) {
								$("span.error").parent().addClass('hide');
								var data = $("#contactForm").serialize();
								/*[+
								 var urlToload=[[@{/contact/save}]];
								+]*/
								$.ajax({
									url : urlToload,
									type : 'POST',
									data : data,
									error : function(error) {
										alert(error.responseText);
									},
									dataType : "json",
									success : function(data) {
										$("#contactForm .formArea").fadeOut();
										$("#contactForm .resultArea").fadeIn().removeClass('hide');
									},
								});

							}
						});
					});
				</script>
			</div>
			<div class="large-3 medium-12 small-12 columns text-right">
				<p>
					<strong>Mail:</strong><br> <a class="pink"
						href="mailto:info@cookingmood.co">info[at]cookingmood.co</a>
				</p>
				<p>
					<strong>Takip et</strong><br> <a
						href="https://facebook.com/cookingmoods/" target="_blank">facebook</a><br>
					<a href="https://www.instagram.com/cookingmood/" target="_blank">instagram</a><br>
					<a href="https://tr.pinterest.com/erdayca/" target="_blank">pinterest</a>
				</p>


			</div>
		</div>

	</section>
	<div th:replace="fragments/site/footer :: footer"></div>
</body>
</html>
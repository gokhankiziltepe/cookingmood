<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="row commentsList" th:fragment="comment"
		th:unless="${#lists.isEmpty(comments)}">
		<div
			class="large-12 medium-12 small-12 columns blog-text text-justify">
			<h4>Yorumlar:</h4>

			<ul id="comments" class="wow zoomIn" data-wow-offset="350">
				<li class="comment" th:each="comment : ${comments}">
					<div class="row">
						<div class="large-2 medium-2 small-3 columns hide-for-small-only">
							<p>
								<a href=""><img th:src="@{/resources/img/avatar.jpg}"></a>
							</p>
						</div>
						<div class="large-10 medium-10 small-12 columns">
							<p>
								<strong><a href="" th:text="${comment.name}"></a></strong>, <span
									th:text="${#dates.format(comment.createDate, 'dd/MM/yyyy HH:mm')}"></span>,
								<span th:text="${comment.email}"></span>
							</p>
							<p th:text="${comment.text}"></p>
							<p class="text-right"></p>
						</div>
					</div>
				</li>
			</ul>

			<h4>Yorum gönder:</h4>
			<form class="wow zoomIn" name="commentForm" id="commentForm"
				data-wow-offset="350">
				<input type="hidden" name="commentEntityBaseId"
					id="commentEntityBaseId" th:value="${entityBaseId}" />
				<div class="row">
					<div class="large-12 medium-12 small-12 columns">
						<textarea placeholder="Yorumun" id="commentText"
							name="commentText"></textarea>
					</div>
					<div class="large-4 medium-12 small-12 columns">
						<input type="email" placeholder="E-posta adresin"
							id="commentEmail" name="commentEmail">
					</div>
					<div class="large-4 medium-12 small-12 columns">
						<input type="text" placeholder="Adın" id="commentName"
							name="commentName">
					</div>

					<div class="large-4 medium-12 small-12 columns">
						<input type="submit" value="yorumu gönder">
					</div>
					<div class="large-12 medium-12 small-12 columns hide">
						<span class="error">lütfen form alanlarını kontrol ediniz</span>
					</div>
				</div>
			</form>
			<script type="text/javascript" th:inline="javascript">
				$(function() {
					$("#commentForm").validate({
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
							commentEntityBaseId : {
								required : true
							},
							commentText : {
								required : true,
								minlength : 2,
								maxlength : 4096
							},
							commentEmail : {
								required : true,
								email : true,
								minlength : 2,
								maxlength : 255
							},
							commentName : {
								required : true,
								minlength : 2,
								maxlength : 255
							}
						},
						submitHandler : function(form) {
							$("span.error").parent().addClass('hide');
							var data = $("#commentForm").serialize();
							/*[+
							 var urlToload = [[@{/comment/save}]];
							 var urlToload2 = [[@{/comment/get/}+${entityBaseId}]];
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
									$(".commentsList").load(urlToload2, function() {
										$(this).children(':first').unwrap();
									});
								},
							});

						}
					});
				});
			</script>
		</div>
	</div>
</body>
</html>
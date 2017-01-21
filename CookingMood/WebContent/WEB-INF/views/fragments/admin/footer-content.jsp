<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div th:fragment="footer-content">
		<div class="hero-unit">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<form
						name="footerContentForm"
						id="footerContentForm"
					>
						<input
							type="hidden"
							id="id"
							name="id"
							th:if="${footerContent != null}"
							th:value="${footerContent?.id}"
						/>
						<div class="form-group">
							<label for="htmlContent">içerik</label>
							<textarea
								class="form-control"
								name="htmlContent"
								rows="10"
								maxlength="100000"
								cols="80"
								id="htmlContent"
								th:text="${footerContent?.htmlContent}"
							></textarea>
						</div>
						<div class="form-group hide">
							<span class="error text-danger">lütfen form alanlarını
								kontrol ediniz</span>
						</div>
						<button
							type="submit"
							class="btn btn-default"
						>gönder</button>
					</form>
					<script type="text/javascript">
						$(function() {
							CKEDITOR.config.entities_latin = false;
							CKEDITOR.replace('htmlContent');
							setInterval(function() {
								for ( var instance in CKEDITOR.instances) {
									CKEDITOR.instances[instance].updateElement();
								}
							}, 1000);

							$("#footerContentForm").validate({
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
									htmlContent : {
										required : true,
										minlength : 2
									}
								},
								submitHandler : function(form) {
									$("span.error").parent().addClass('hide');
									var data = $("#footerContentForm").serialize();
									$.ajax({
										url : 'footer-content/save',
										type : 'POST',
										data : data,
										error : function(error) {
											alert(error.responseText);
										},
										dataType : "json",
										success : function(data) {
											window.location.href = '../admin';
										},
									});

								}
							});

						});
					</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
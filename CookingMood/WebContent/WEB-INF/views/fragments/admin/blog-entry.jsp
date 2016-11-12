<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div th:fragment="blog-entry">
		<div class="hero-unit">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<form name="blogEntryForm" id="blogEntryForm">
						<input type="hidden" id="id" name="id"
							th:if="${blogEntry != null}" th:value="${blogEntry?.id}" />
						<div class="form-group">
							<label for="blogHeader">başlık</label> <input type="text"
								class="form-control" name="blogHeader" id="blogHeader"
								th:value="${blogEntry?.header}" />
						</div>
						<div class="form-group">
							<label for="blogType">blog tipi</label> <select
								name="blogType" id="blogType" class="form-control">
								<option th:each="type : ${blogTypes}" th:value="${type}"
									th:selected="${type == blogEntry?.blogType}"
									th:text="${type.title}"></option>
							</select>
						</div>
						<div class="form-group">
							<label for="blogContent">içerik</label>
							<textarea class="form-control" name="blogContent" rows="10"
								maxlength="100000" cols="80" id="blogContent"
								th:text="${blogEntry?.text}"></textarea>
						</div>
						<div class="form-group hide">
							<span class="error text-danger">lütfen form alanlarını
								kontrol ediniz</span>
						</div>
						<button type="submit" class="btn btn-default">gönder</button>
					</form>
					<script type="text/javascript">
						$(function() {
							CKEDITOR.replace('blogContent');
							CKEDITOR.instances['blogContent'].on('contentDom', function() {
								this.document.on('keypress', function(e) {
									for ( var instance in CKEDITOR.instances) {
										CKEDITOR.instances[instance].updateElement();
									}
								});
							});

							$("#blogEntryForm").validate({
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
									blogHeader : {
										required : true,
										maxlength : 255,
										minlength : 2
									},
									blogContent : {
										required : true,
										minlength : 2
									}
								},
								submitHandler : function(form) {
									$("span.error").parent().addClass('hide');
									var data = $("#blogEntryForm").serialize();
									$.ajax({
										url : 'blog-entry/save',
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
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div th:fragment="image-entry">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="table-responsive">
					<h2>Resim Ekle</h2>
					<form name="imageEntryForm" id="imageEntryForm"
						enctype="multipart/form-data" method="post">
						<input type="hidden" id="resourceId" name="resourceId"
							th:value="${resourceId}" />
						<div class="form-group">
							<label for="imageType">Resim tipi</label> <select
								name="imageType" id="imageType" class="form-control">
								<option value="main">Ana [max 1 adet]</option>
								<option value="header">Başlık</option>
								<option value="recipe">Tarif</option>
							</select>
						</div>
						<div class="form-group">
							<label for="imageTag">Resim</label> <input type="file"
								class="form-control" name="imageFile" id="imageFile" />
						</div>
						<div class="form-group hide">
							<span class="error text-danger">lütfen form alanlarını
								kontrol ediniz</span>
						</div>
						<button type="submit" class="btn btn-default">gönder</button>
					</form>
					<br /> <br />
					<h3>Resimler</h3>
					<script type="text/javascript">
						$(function() {
							$.validator.addMethod('filesize', function(value, element, param) {
								return this.optional(element) || (element.files[0].size <= param)
							});
							$("#imageEntryForm").validate({
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
									imageType : {
										required : true
									},
									imageFile : {
										required : true,
										extension : "png|jpe?g|gif|PNG|JPE?G|GIF",
										filesize : 2222222
									}
								},
								submitHandler : function(form) {
									$("span.error").parent().addClass('hide');
									var data = $("#imageEntryForm").serialize();
									$.ajax({
										url : 'image/put',
										type : 'POST',
										data: new FormData($(form)[0]),
										cache : false,
										contentType : false,
										processData : false,
										error : function(error) {
											alert(error.responseText);
										},
										success : function(data) {
											window.location.reload();
										},
									});

								}
							});

						});
					</script>
					<table class="table">
						<thead>
							<tr>
								<th>resim</th>
								<th>ad</th>
								<th>tür</th>
								<th>işlem</th>
							</tr>
						</thead>
						<tbody>
							<tr th:each="image: ${mainImagePaths}"
								th:attr="data-imagepath=${image}">
								<td><img th:src="@{${webdavBase + image}}"
									class="img-fluid img-thumbnail" style="height: 100px; width: auto;" /></td>
								<td><a th:href="@{${webdavBase + image}}"
									th:text="${image}" target="_blank"></a></td>
								<td>Ana</td>
								<td><a href="javascript:;" class="delete-image">Sil</a></td>
							</tr>
							<tr th:each="image: ${headerImagePaths}"
								th:attr="data-imagepath=${image}">
								<td><img th:src="@{${webdavBase + image}}"
									class="img-fluid img-thumbnail" style="height: 100px; width: auto;" /></td>
								<td><a th:href="@{${webdavBase + image}}"
									th:text="${image}" target="_blank"></a></td>
								<td>Başlık</td>
								<td><a href="javascript:;" class="delete-image">Sil</a></td>
							</tr>
							<tr th:each="image: ${recipeImagePaths}"
								th:attr="data-imagepath=${image}">
								<td><img th:src="@{${webdavBase + image}}"
									class="img-fluid img-thumbnail" style="height: 100px; width: auto;" /></td>
								<td><a th:href="@{${webdavBase + image}}"
									th:text="${image}" target="_blank"></a></td>
								<td>Tarif</td>
								<td><a href="javascript:;" class="delete-image">Sil</a></td>
							</tr>
						</tbody>
					</table>
					<script type="text/javascript">
						$(function() {
							$('.delete-image').click(function() {
								var path = $(this).closest('tr').data('imagepath');
								$.ajax({
									url : 'image/delete',
									type : 'POST',
									data : {
										path : path
									},
									error : function(error) {
										alert(error.responseText);
									},
									dataType : "json",
									success : function(data) {
										window.location.reload();
									},
								});
							});
						});
					</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
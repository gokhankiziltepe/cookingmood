<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div th:fragment="admin">
		<div class="hero-unit">
			<div class="row">
				<div
					class="col-md-12"
					th:if="${not #lists.isEmpty(blogEntries)}"
				>
					<div class="table-responsive">
						<h2>bloglar</h2>
						<table class="table">
							<thead>
								<tr>
									<th>ad</th>
									<th>webdav yolu</th>
									<th>tür</th>
									<th>sıra</th>
									<th>tarih</th>
									<th>güncelleme</th>
									<th>versiyon</th>
									<th>işlem</th>
								</tr>
							</thead>
							<tbody>
								<tr
									th:each="blogEntry: ${blogEntries}"
									th:attr="data-blogid=${blogEntry.id}"
								>
									<td th:text="${blogEntry.header}"></td>
									<td th:text="${blogEntry.webdavPath}"></td>
									<td th:text="${blogEntry.blogType.title}"></td>
									<td th:text="${blogEntry.itemOrder}"></td>
									<td th:text="${blogEntry.createDate}"></td>
									<td th:text="${blogEntry.updateDate}"></td>
									<td th:text="${blogEntry.version}"></td>
									<td><a
										th:href="@{/admin/comment-entry?id=}+${blogEntry.id}"
										class="glyphicon glyphicon-comment btn btn-xs btn-default"
										title="yorumları gör"
									></a><a
										th:href="@{/admin/image-entry?id=}+${blogEntry.id}"
										class="glyphicon glyphicon-picture btn btn-xs btn-info"
										title="resim ekle"
									></a><a
										th:href="@{/admin/blog-entry?id=}+${blogEntry.id}"
										class="glyphicon glyphicon-pencil btn btn-xs btn-warning"
										title="güncelle"
									></a><a
										th:classappend="${blogEntry.active} ? 'delete-blog glyphicon glyphicon-eye-close btn btn-xs btn-danger' : 'activate-blog glyphicon glyphicon-eye-open btn btn-xs btn-success'"
										th:title="${blogEntry.active} ? 'pasifleştir' : 'aktifleştir'"
									></a></td>
								</tr>
								<script type="text/javascript">
									$(function() {
										$('.delete-blog').click(function() {
											var id = $(this).closest('tr').data('blogid');
											$.ajax({
												url : 'admin/blog-entry/delete',
												type : 'POST',
												data : {
													id : id
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
										$('.activate-blog').click(function() {
											var id = $(this).closest('tr').data('blogid');
											$.ajax({
												url : 'admin/blog-entry/activate',
												type : 'POST',
												data : {
													id : id
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
							</tbody>
						</table>
					</div>
				</div>
				<div
					class="col-md-12"
					th:if="${not #lists.isEmpty(recipeEntries)}"
				>
					<div class="table-responsive">
						<h2>tarifler</h2>
						<table class="table">
							<thead>
								<tr>
									<th>ad</th>
									<th>webdav yolu</th>
									<th>tür</th>
									<th>sıra</th>
									<th>tarih</th>
									<th>güncelleme</th>
									<th>versiyon</th>
									<th>işlem</th>
								</tr>
							</thead>
							<tbody>
								<tr
									th:each="recipeEntry: ${recipeEntries}"
									th:attr="data-recipeid=${recipeEntry.id}"
								>
									<td th:text="${recipeEntry.header}"></td>
									<td th:text="${recipeEntry.webdavPath}"></td>
									<td th:text="${recipeEntry.recipeType.title}"></td>
									<td th:text="${recipeEntry.itemOrder}"></td>
									<td th:text="${recipeEntry.createDate}"></td>
									<td th:text="${recipeEntry.updateDate}"></td>
									<td th:text="${recipeEntry.version}"></td>
									<td><a
										th:href="@{/admin/comment-entry?id=}+${recipeEntry.id}"
										class="glyphicon glyphicon-comment btn btn-xs btn-default"
										title="yorumları gör"
									></a><a
										th:href="@{/admin/image-entry?id=}+${recipeEntry.id}"
										class="glyphicon glyphicon-picture btn btn-xs btn-info"
										title="resim
											ekle"
									></a><a
										th:href="@{/admin/recipe-entry?id=}+${recipeEntry.id}"
										class="glyphicon glyphicon-pencil  btn btn-xs btn-warning"
										title="güncelle"
									></a><a
										th:classappend="${recipeEntry.active} ? 'delete-recipe glyphicon glyphicon-eye-close btn btn-xs btn-danger' : 'activate-recipe glyphicon glyphicon-eye-open btn btn-xs btn-success'"
										th:title="${recipeEntry.active} ? 'pasifleştir' : 'aktifleştir'"
									></a></td>
								</tr>
								<script type="text/javascript">
									$(function() {
										$('.delete-recipe').click(function() {
											var id = $(this).closest('tr').data('recipeid');
											$.ajax({
												url : 'admin/recipe-entry/delete',
												type : 'POST',
												data : {
													id : id
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
										$('.activate-recipe').click(function() {
											var id = $(this).closest('tr').data('recipeid');
											$.ajax({
												url : 'admin/recipe-entry/activate',
												type : 'POST',
												data : {
													id : id
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
							</tbody>
						</table>
					</div>
				</div>
				<div
					class="col-md-12"
					th:if="${not #lists.isEmpty(footerContents)}"
				>
					<div class="table-responsive">
						<h2>instagram postu</h2>
						<table class="table">
							<thead>
								<tr>
									<th>içerik</th>
									<th>tarih</th>
									<th>güncelleme</th>
									<th>versiyon</th>
									<th>işlem</th>
								</tr>
							</thead>
							<tbody>
								<tr
									th:each="footerContent : ${footerContents}"
									th:attr="data-footerid=${footerContent.id}"
								>
									<td th:utext="${footerContent.htmlContent}"></td>
									<td th:text="${footerContent.createDate}"></td>
									<td th:text="${footerContent.updateDate}"></td>
									<td th:text="${footerContent.version}"></td>
									<td><a
										th:href="@{/admin/footer-content?id=}+${footerContent.id}"
										class="glyphicon glyphicon-pencil btn btn-xs btn-warning"
										title="güncelle"
									></a><a
										th:classappend="${footerContent.active} ? 'delete-footer glyphicon glyphicon-eye-close btn btn-xs btn-danger' : 'activate-footer glyphicon glyphicon-eye-open btn btn-xs btn-success'"
										th:title="${footerContent.active} ? 'pasifleştir' : 'aktifleştir'"
									></a></td>
								</tr>
								<script type="text/javascript">
									$(function() {
										$('.delete-footer').click(function() {
											var id = $(this).closest('tr').data('footerid');
											$.ajax({
												url : 'admin/footer-content/delete',
												type : 'POST',
												data : {
													id : id
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
										$('.activate-footer').click(function() {
											var id = $(this).closest('tr').data('footerid');
											$.ajax({
												url : 'admin/footer-content/activate',
												type : 'POST',
												data : {
													id : id
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
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
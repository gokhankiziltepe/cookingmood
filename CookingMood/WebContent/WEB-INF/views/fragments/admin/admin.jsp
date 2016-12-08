<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div th:fragment="admin">
		<div class="hero-unit">
			<div class="row">
				<div class="col-md-12" th:if="${not #lists.isEmpty(blogEntries)}">
					<div class="table-responsive">
						<h2>bloglar</h2>
						<table class="table">
							<thead>
								<tr>
									<th>ad</th>
									<th>webdav yolu</th>
									<th>tür</th>
									<th>tarih</th>
									<th>güncelleme</th>
									<th>versiyon</th>
									<th>işlem</th>
								</tr>
							</thead>
							<tbody>
								<tr th:each="blogEntry: ${blogEntries}"
									th:attr="data-blogid=${blogEntry.id}">
									<td th:text="${blogEntry.header}"></td>
									<td th:text="${blogEntry.webdavPath}"></td>
									<td th:text="${blogEntry.blogType.title}"></td>
									<td th:text="${blogEntry.createDate}"></td>
									<td th:text="${blogEntry.updateDate}"></td>
									<td th:text="${blogEntry.version}"></td>
									<td><a
										th:href="@{/admin/comment-entry?id=}+${blogEntry.id}">yorumları
											gör</a> | <a th:href="@{/admin/image-entry?id=}+${blogEntry.id}">resim
											ekle</a> | <a th:href="@{/admin/blog-entry?id=}+${blogEntry.id}">güncelle</a>
										| <a
										th:classappend="${blogEntry.active} ? delete-blog : activate-blog"
										th:text="${blogEntry.active} ? 'sil' : 'aktifleştir'"></a></td>
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
				<div class="col-md-12" th:if="${not #lists.isEmpty(recipeEntries)}">
					<div class="table-responsive">
						<h2>tarifler</h2>
						<table class="table">
							<thead>
								<tr>
									<th>ad</th>
									<th>webdav yolu</th>
									<th>tür</th>
									<th>tarih</th>
									<th>güncelleme</th>
									<th>versiyon</th>
									<th>işlem</th>
								</tr>
							</thead>
							<tbody>
								<tr th:each="recipeEntry: ${recipeEntries}"
									th:attr="data-recipeid=${recipeEntry.id}">
									<td th:text="${recipeEntry.header}"></td>
									<td th:text="${recipeEntry.webdavPath}"></td>
									<td th:text="${recipeEntry.recipeType.title}"></td>
									<td th:text="${recipeEntry.createDate}"></td>
									<td th:text="${recipeEntry.updateDate}"></td>
									<td th:text="${recipeEntry.version}"></td>
									<td><a
										th:href="@{/admin/comment-entry?id=}+${recipeEntry.id}">yorumları
											gör</a> | <a
										th:href="@{/admin/image-entry?id=}+${recipeEntry.id}">resim
											ekle</a> | <a
										th:href="@{/admin/recipe-entry?id=}+${recipeEntry.id}">güncelle</a>
										| <a
										th:classappend="${recipeEntry.active} ? delete-recipe : activate-recipe"
										th:text="${recipeEntry.active} ? 'sil' : 'aktifleştir'"></a></td>
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
			</div>

		</div>
	</div>
</body>
</html>
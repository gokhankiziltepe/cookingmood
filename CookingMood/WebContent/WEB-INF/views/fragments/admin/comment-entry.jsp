<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div th:fragment="comment-entry">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="table-responsive">
					<h2>Yorumlar</h2>

					<table class="table">
						<thead>
							<tr>
								<th>yorum</th>
								<th>tarih</th>
								<th>işlem</th>
							</tr>
						</thead>
						<tbody>
							<tr th:each="comment: ${comments}"
								th:attr="data-commentid=${comment.id}">
								<td th:text="${comment.text}"></td>
								<td th:text="${comment.createDate}"></td>
								<td><a
									th:classappend="${comment.active} ? delete-comment : activate-comment"
									th:text="${comment.active} ? 'sil' : 'aktifleştir'"></a></td>
							</tr>
						</tbody>
					</table>
					<script type="text/javascript">
						$(function() {
							$('.delete-comment').click(function() {
								var id = $(this).closest('tr').data('commentid');
								$.ajax({
									url : 'comment-entry/delete',
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
							$('.activate-comment').click(function() {
								var id = $(this).closest('tr').data('commentid');
								$.ajax({
									url : 'comment-entry/activate',
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>
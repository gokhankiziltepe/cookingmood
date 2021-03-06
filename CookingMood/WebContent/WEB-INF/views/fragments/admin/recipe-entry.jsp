<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div th:fragment="recipe-entry">
		<div class="hero-unit">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<form name="recipeEntryForm" id="recipeEntryForm">
						<input type="hidden" id="id" name="id"
							th:if="${recipeEntry != null}" th:value="${recipeEntry?.id}" />
						<div class="form-group">
							<label for="recipeHeader">başlık</label> <input type="text"
								class="form-control" name="recipeHeader" id="recipeHeader"
								th:value="${recipeEntry?.header}" />
						</div>
						<div class="form-group">
							<label for="recipeTag">etiketler [virgülle ayrılmış]</label> <input
								type="text" class="form-control" name="recipeTag" id="recipeTag"
								th:value="${recipeEntry?.tags}" />
						</div>
						<div class="form-group">
							<label for="recipeItemOrder">sıra</label> <input type="number"
								class="form-control" name="recipeItemOrder" id="recipeItemOrder"
								th:value="${recipeEntry?.itemOrder}" />
						</div>
						<div class="form-group">
							<label for="recipeType">tarif tipi</label> <select
								name="recipeType" id="recipeType" class="form-control">
								<option th:each="type : ${recipeTypes}" th:value="${type}"
									th:selected="${type == recipeEntry?.recipeType}"
									th:text="${type.title}"></option>
							</select>
						</div>
						<div class="form-group">
							<label for="recipeType">tarif zorluğu</label> <select
								name="recipeDifficulty" id="recipeDifficulty"
								class="form-control">
								<option th:each="type : ${recipeDifficulties}"
									th:value="${type}"
									th:selected="${type == recipeEntry?.recipeDifficulty}"
									th:text="${type.title}"></option>
							</select>
						</div>
						<div class="form-group">
							<label for="recipeDuration">süre [dk]</label> <input
								type="number" class="form-control" name="recipeDuration"
								id="recipeDuration" th:value="${recipeEntry?.durationInMinutes}" />
						</div>
						<div class="form-group">
							<label for="recipeIngredient">malzemeler</label>
							<textarea class="form-control" name="recipeIngredient" rows="10"
								maxlength="100000" cols="80" id="recipeIngredient"
								th:text="${recipeEntry?.ingredients}"></textarea>
						</div>
						<div class="form-group">
							<label for="recipeTool">araç-gereçler</label>
							<textarea class="form-control" name="recipeTool" rows="10"
								maxlength="100000" cols="80" id="recipeTool"
								th:text="${recipeEntry?.tools}"></textarea>
						</div>
						<div class="form-group">
							<label for="recipeEntrance">giriş</label>
							<textarea class="form-control" name="recipeEntrance" rows="10"
								maxlength="100000" cols="80" id="recipeEntrance"
								th:text="${recipeEntry?.entrance}"></textarea>
						</div>
						<div class="form-group">
							<label for="recipeRecipe">tarif</label>
							<textarea class="form-control" name="recipeRecipe" rows="10"
								maxlength="100000" cols="80" id="recipeRecipe"
								th:text="${recipeEntry?.recipe}"></textarea>
						</div>
						<div class="form-group hide">
							<span class="error text-danger">lütfen form alanlarını
								kontrol ediniz</span>
						</div>
						<button type="submit" class="btn btn-default">gönder</button>
					</form>

					<script type="text/javascript">
						$(function() {
							CKEDITOR.config.entities_latin=false;
							
							CKEDITOR.replace('recipeTool');

							CKEDITOR.replace('recipeIngredient');

							CKEDITOR.replace('recipeEntrance');

							CKEDITOR.replace('recipeRecipe');

							setInterval(function() {
								for ( var instance in CKEDITOR.instances) {
									CKEDITOR.instances[instance].updateElement();
								}
							}, 1000);

							$("#recipeEntryForm").validate({
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
									recipeHeader : {
										required : true,
										maxlength : 255,
										minlength : 2
									},
									recipeIngredient : {
										required : true,
										minlength : 2
									},
									recipeRecipe : {
										required : true,
										minlength : 2
									},
									recipeDuration : {
										required : true,
										min : 2,
										max : 1000
									},
									recipeItemOrder : {
										required : true,
										number : true,
										maxlength : 4
									}
								},
								submitHandler : function(form) {
									$("span.error").parent().addClass('hide');
									var data = $("#recipeEntryForm").serialize();
									$.ajax({
										url : 'recipe-entry/save',
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
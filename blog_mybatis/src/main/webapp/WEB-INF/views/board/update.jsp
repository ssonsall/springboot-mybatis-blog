<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!-- 섬머노트 시작 -->
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<!-- 섬머노트 끝 -->

<!-- 네비게이션 바 시작 -->
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<!-- 네비게이션 바 끝 -->
<!-- ck editor 시작 -->
<!-- <script type="text/javascript" src="/ckeditor/ckeditor.js"></script> -->
<!-- ck editor 끝 -->

</header>
<!-- END header -->


<section class="site-section">
	<div class="container">
		<div class="row mb-4">
			<div class="col-md-6">
				<h1>Modify</h1>
			</div>
		</div>
		<div class="row blog-entries">
			<div class="col-md-12 col-lg-8 main-content">

				<form action="/board/update" method="post">
					<input type="hidden" name="id" value="${view.id}" />
					<div class="row">
						<div class="col-md-12 form-group">
							<label for="title">Title</label> <input type="text" id="title" name="title" value="${view.title}" class="form-control ">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group">
							<label for="summernote">Content</label>
							<!-- textarea id message였음 -->
							<textarea name="content" id="summernote" class="form-control " cols="30" rows="8">
							${view.content}
							</textarea>




						</div>
					</div>
					<div class="row">
						<div class="col-md-11"></div>
						<div class="col-md-1 form-group">
							<input type="submit" value="Modify" class="btn btn-primary">
						</div>
					</div>
				</form>


			</div>

			<!-- END main-content -->

			<!-- END sidebar -->

		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- END footer -->

</div>

<!-- loader -->
<div id="loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214" /></svg>
</div>


<script>
	$('#summernote').summernote({
		placeholder : '내용을 입력하세요.',
		tabsize : 2,
		height : 300
	});
	$('.dropdown-toggle').dropdown();
</script>

<%@ include file="/WEB-INF/views/include/script.jsp"%>

<!-- <script type="text/javascript">
	CKEDITOR.replace('p_content', {
		height : 500
	});
</script>
 -->

</body>
</html>
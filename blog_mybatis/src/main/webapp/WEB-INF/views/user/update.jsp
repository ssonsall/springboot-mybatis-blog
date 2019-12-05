<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 네비게이션 바 시작 -->
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<!-- 네비게이션 바 끝 -->
</header>
<!-- END header -->


<section class="site-section">
	<div class="container">
		<div class="row mb-4">
			<div class="col-md-6">
				<h1>Profile Modify</h1>
			</div>
		</div>
		<div class="row blog-entries">
			<div class="col-md-12 col-lg-8 main-content">
				<form action="/user/update" method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${sessionScope.user.id}" />
					<div class="row">
						<div class="col-md-12 form-group">
							<label for="name">ID</label> <input type="text" id="name" name="username" value="${user.username}" class="form-control" readonly>
						</div>
						<div class="col-md-12 form-group">
							<label for="password">Password</label> <input type="password" id="password" name="password" class="form-control ">
						</div>
						<div class="col-md-12 form-group">
							<label for="passwordCheck">Check Password</label> <input type="password" id="passwordCheck" class="form-control ">
						</div>
						<div class="col-md-12 form-group">
							<label for="email">Email</label> <input type="email" id="email" name="email" value="${user.email}" class="form-control" readonly>
						</div>
						<div class="col-md-12 form-group">
							<label for="photo">Profile Photo</label> <input type="file" id="photo" name="photo" class="form-control">
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

<%@ include file="/WEB-INF/views/include/script.jsp"%>

</body>
</html>
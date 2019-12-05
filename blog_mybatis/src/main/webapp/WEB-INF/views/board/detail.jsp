<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 네비게이션 바 시작 -->
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<!-- 네비게이션 바 끝 -->
</header>
<!-- END header -->

<section class="site-section py-lg">
	<div class="container">
		<div class="row blog-entries element-animate">
			<div class="col-md-12 col-lg-8 main-content">
				<div class="post-meta">
					<span class="author mr-2"><img src="${view.userProfile}" alt="Colorlib" class="mr-2">${view.username}</span>&bullet; <span class="mr-2">${view.createDate}</span>
				</div>
				<h1 class="mb-4">${view.title}</h1>
				<c:choose>
					<c:when test="${sessionScope.user.id eq view.userId}">
						<a class="category mb-5" href="/board/updatePage/${view.id}">Modify</a>
						<a class="category mb-5" href="/board/delete/${view.id}">Delete</a>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<div class="post-content-body">${view.content}</div>
			</div>

			<!-- END main-content -->

			<!-- END sidebar -->

		</div>
	</div>
</section>


<!-- END section -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- END footer -->



<!-- loader -->
<%-- <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/></svg></div> --%>
<%@ include file="/WEB-INF/views/include/script.jsp"%>

</body>
</html>
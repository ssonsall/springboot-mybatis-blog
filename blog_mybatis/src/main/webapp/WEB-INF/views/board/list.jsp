<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
﻿<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:parseNumber var="totalInteger" value="${total/3}" integerOnly="true"></fmt:parseNumber>
<!-- 네비게이션 바 시작 -->
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<!-- 네비게이션 바 끝 -->
</header>
<!-- END header -->

<!-- END section -->

<!-- 메인 리스트 -->
<section class="site-section pt-5">
	<div class="container">
		<div class="row mb-4">
			<div class="col-md-6">
				<h2 class="mb-4">Post List</h2>
			</div>
			<!-- 페이징 시작 -->
			<div class="row mt-5" style="margin-top: 5px !important; height: 50px;">
				<div class="col-md-12 text-center">
					<nav aria-label="Page navigation" class="text-center" style="height: 50px;">
						<ul class="pagination">
							<c:if test="${page ne 0}">
								<li class="page-item"><a class="page-link" href="/board/list/${page-1}">&lt;</a></li>
							</c:if>
							<c:if test="${totalInteger gt page}">
								<li class="page-item"><a class="page-link" href="/board/list/${page+1}">&gt;</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			<!-- 페이징 끝 -->
		</div>
		<div class="row blog-entries">
			<div class="col-md-12 col-lg-8 main-content">
				<div class="row mb-5 mt-5" style="margin-bottom: 0px !important;">
					<div class="col-md-12">
						<c:forEach var="view" items="${viewList}">
							<div class="post-entry-horzontal">
								<a href="/board/detail/${view.id}" style="width: 725px;">
									<div class="image element-animate" data-animate-effect="fadeIn" style="background-image: url(/images/snowman.png);"></div>
									<div class="text">
										<div class="post-meta">
											<span class="author mr-2"><img src="${view.userProfile}" alt="Colorlib"> ${view.username}</span>&bullet; <span class="mr-2">${view.createDate}</span>

										</div>
										<div>
											<h2>${view.title}</h2>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
						<!-- END post -->

					</div>
				</div>
			</div>
			<!-- END main-content -->


		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- END footer -->


<!-- loader -->
<div id="loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214" /></svg>
</div>

<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>
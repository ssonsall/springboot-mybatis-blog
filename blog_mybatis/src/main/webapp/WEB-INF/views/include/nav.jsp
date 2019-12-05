<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<title>MyBatis Blog</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700|Inconsolata:400,700" rel="stylesheet">

<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/animate.css">
<link rel="stylesheet" href="/css/owl.carousel.min.css">

<link rel="stylesheet" href="/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/fonts/flaticon/font/flaticon.css">

<!-- Theme Style -->
<link rel="stylesheet" href="/css/style.css">
</head>

<body>
	<div class="wrap">
		<header role="banner">
			<div class="container logo-wrap">
				<div class="row pt-5">
					<div class="col-12 text-center">
						<a class="absolute-toggle d-block d-md-none" data-toggle="collapse" href="#navbarMenu" role="button" aria-expanded="false" aria-controls="navbarMenu"><span class="burger-lines"></span></a>
						<h1 class="site-logo">
							<a href="/home">Hello MyBatis</a>
						</h1>
					</div>
				</div>
			</div>

			<nav class="navbar navbar-expand-md  navbar-light bg-light">
				<div class="container">


					<div class="collapse navbar-collapse" id="navbarMenu">
						<ul class="navbar-nav mx-auto">
							<li class="nav-item"><a class="nav-link active" href="/home">Home</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/writePage">Posting</a></li>
							<c:choose>
								<c:when test="${empty sessionScope.user}">
									<li class="nav-item"><a class="nav-link" href="/user/joinPage">Join</a></li>
								</c:when>
								<c:otherwise>
									<li class="nav-item"><a class="nav-link" href="/user/updatePage/${sessionScope.user.id}">Profile</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${empty sessionScope.user}">

									<li class="nav-item"><a class="nav-link" href="/user/loginPage">Login</a></li>
								</c:when>
								<c:otherwise>
									<li class="nav-item"><a class="nav-link" href="/user/logout">Logout</a></li>
								</c:otherwise>
							</c:choose>

						</ul>
						<c:if test="${!empty sessionScope.user}">
							<a href="/user/updatePage/${sessionScope.user.id}"><img src="${sessionScope.user.userProfile}" style="width: 50px; height: 50px;" />${sessionScope.user.username}</a>
						</c:if>
					</div>
				</div>
			</nav>
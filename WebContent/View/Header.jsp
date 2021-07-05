<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Header -->
	<header id="header">
		<!-- Nav -->
		<div id="nav">
			<!-- Main Nav -->
			<div id="nav-fixed">
				<div class="container">
					<!-- logo -->
					<div class="nav-logo">
						<a href="HomeController" class="logo"><img
							src="Frontend/img/logo.png" alt=""></a>
					</div>
					<!-- /logo -->
					<!-- nav -->
					<ul class="nav-menu nav navbar-nav">
						<li class="cat-2"><a href="HomeController">HOME</a></li>
						<c:forEach items="${listdanhmuc }" var="list">
							<li class="cat-3"><a
								href="ListByDanhMucController?categoryid=${list.categoryid}&pageid=1">${list.categoryname }</a></li>
						</c:forEach>
					</ul>
					<!-- /nav -->
					<div class="nav-btns">
						<div class="nav-search">
							<form action="SearchController" method="POST">
								<input class="nav-input" type="text" name="tieude"
									placeholder="Search" aria-label="Search">
								<button class="nav-button">
									<i class="fa fa-search"></i>
								</button>
							</form>
						</div>
						<button class="aside-btn">
							<i class="fa fa-bars"></i>
						</button>
						<a class="" href="LoginController">ĐĂNG NHẬP</a>
					</div>
					<!-- /search & aside toggle -->
				</div>
			</div>
			<!-- /Main Nav -->
			<!-- Aside Nav -->
			<div id="nav-aside">
				<!-- nav -->
				<div class="section-row">
					<ul class="nav-aside-menu">
						<li class="cat-1"><a href="HomeController">HOME</a></li>
						<c:forEach items="${listdanhmuc }" var="list">
							<li class="cat-2"><a
								href="ListByDanhMucController?categoryid=${list.categoryid}">${list.categoryname }</a></li>
						</c:forEach>
					</ul>
				</div>
				<!-- /nav -->
				<!-- aside nav close -->
				<button class="nav-aside-close">
					<i class="fa fa-times"></i>
				</button>
				<!-- /aside nav close -->
			</div>
			<!-- Aside Nav -->
		</div>
		<!-- /Nav -->
	</header>
	<!-- /Header -->
</body>
</html>
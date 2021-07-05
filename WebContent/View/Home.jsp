<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>

<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="Frontend/css/bootstrap.min.css" />
<!-- Font Awesome Icon -->
<link rel="stylesheet" href="Frontend/css/font-awesome.min.css">
<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="Frontend/css/style.css" />
</head>
<body>
	<!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>
	<!--end of Header -->
	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-9">
					<div class="row">
						<div class="col-md-12">
							<div class="section-title">
								<h2>TIN TỨC NỔI BẬT</h2>
							</div>
						</div>
						<c:forEach items="${listHomeNews }" var="listnews">
							<!-- post -->
							<div class="col-md-12">
								<div class="post post-row">
									<a class="post-img"
										href="ShowNewsController?newsid=${listnews.newsid}"><img
										src="Imageupload/${listnews.img}" alt=""></a>
									<div class="post-body">
										<div class="post-meta">
											<a class="post-category cat-4"
												href="ListByDanhMucController?categoryid=${listnews.categoryid}">
												<c:forEach items="${listdanhmuc}" var="listdanhmuc">
													<c:if
														test="${listnews.categoryid eq listdanhmuc.categoryid}"> 
                                             ${listdanhmuc.categoryname}
                                            </c:if>
												</c:forEach>
											</a> <span class="post-date">${listnews.date}</span>
										</div>
										<h3 class="post-title">
											<a href="ShowNewsController?newsid=${listnews.newsid}">${listnews.tieude}</a>
										</h3>
										<p>${listnews.mota}</p>
									</div>
								</div>
							</div>
							<!-- /post -->
						</c:forEach>
						<div class="col-md-12">
							<div class="section-row">
								<nav aria-label="Page navigation ">
									<ul class="pagination justify-content-start">
										<c:if test="${numberpage == 1}">
											<li class="disabled"><a class="page-link" href="">Prev</a></li>
											<li class="page-item"><a class="page-link"
												style="background: #555555 !important;"
												href="HomeverController?pageid=${numberpage}">${numberpage}</a></li>
											<li class="page-item"><a class="page-link"
												href="HomeverController?pageid=${numberpage+1}">${numberpage+1}</a></li>

											<li class="page-item"><a class="page-link"
												href="HomeverController?pageid=${numberpage+1}">Next</a></li>
										</c:if>
										<c:if test="${numberpage == maxpageid}">
											<li class="page-item"><a class="page-link"
												href="HomeverController?pageid=${numberpage-1}">Prev</a></li>
											<li class="page-item"><a class="page-link"
												href="HomeverController?pageid=${numberpage-1}">${numberpage-1}</a></li>
											<li class="page-item"><a class="page-link"
												style="background: #555555 !important;"
												href="HomeverController?pageid=${numberpage}">${numberpage}</a></li>
											<li class="disabled"><a class="page-link" href="">Next</a></li>
										</c:if>
										<c:if test="${numberpage > 1 && numberpage < maxpageid}">
											<li class="page-item"><a class="page-link"
												href="HomeverController?pageid=${numberpage-1}">Prev</a></li>
											<li class="page-item"><a class="page-link"
												style="background: #555555 !important;"
												href="HomeverController?pageid=${numberpage}">${numberpage}</a></li>
											<li class="page-item"><a class="page-link"
												href="HomeverController?pageid=${numberpage+1}">${numberpage+1}</a></li>
											<li class="page-item"><a class="page-link"
												href="HomeverController?pageid=${numberpage+1}">Next</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<!-- ad -->
					<div class="aside-widget text-center">
						<a href="#" style="display: inline-block; margin: auto;"> <img
							class="img-responsive" src="Frontend/img/banner_1.jpg" alt="">
						</a>
					</div>
					<!-- /ad -->
					<!-- catagories -->
					<div class="aside-widget">
						<div class="section-title">
							<h2>DANH MỤC</h2>
						</div>
						<div class="category-widget">
							<ul>
								<c:forEach items="${listdanhmuc }" var="list">
									<li><a
										href="ListByDanhMucController?categoryid=${list.categoryid}">${list.categoryname }</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- /catagories -->
					<!-- /tags -->
					<!-- post widget -->
					<div class="aside-widget">
						<div class="section-title">
							<h2>ĐỌC THÊM</h2>
						</div>
						<c:forEach items="${NewsMoi}" var="listnews">
							<div class="post post-widget">
								<a class="post-img"
									href="ShowNewsController?newsid=${listnews.newsid}"><img
									src="Imageupload/${listnews.img}" alt=""></a>
								<div class="post-body">
									<h3 class="post-title">
										<a href="ShowNewsController?newsid=${listnews.newsid}">${listnews.tieude}</a>
									</h3>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- /post widget -->
					<!-- ad -->
					<div class="aside-widget text-center">
						<a href="#" style="display: inline-block; margin: auto;"> <img
							class="img-responsive" src="Frontend/img/banner_1.jpg" alt="">
						</a>
					</div>
					<!-- /ad -->
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->
	<!-- footer -->
	<jsp:include page="Footer.jsp"></jsp:include>
	<!--end of footer -->

	<script src="Frontend/js/jquery.min.js"></script>
	<script src="Frontend/js/bootstrap.min.js"></script>
	<script src="Frontend/js/main.js"></script>
</body>
</html>
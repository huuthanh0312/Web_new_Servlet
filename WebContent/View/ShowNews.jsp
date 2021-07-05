<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nội Dung</title>
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet'>
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
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-8">
					<c:forEach items="${listnewsbyid}" var="lists">
						<h1>${lists.tieude}</h1>
						<div class="post-meta">
							<a class="post-category cat-4"
								href="ListByDanhMucController?categoryid=${lists.categoryid}">
								<c:forEach items="${listdanhmuc}" var="listdanhmuc">
									<c:if test="${lists.categoryid eq listdanhmuc.categoryid}"> 
                                             ${listdanhmuc.categoryname}
                                            </c:if>
								</c:forEach>
							</a> <span class="post-date">${lists.date}</span>
						</div>
						<br>
						<a class="post-img"><img src="Imageupload/${lists.img}"
							alt=""> </a>
						<br>
						<br>
						<h4>${lists.mota}</h4>
						<p>
							<c:set var="kq"
								value="${fn:replace(noidung,kitutrongdb,kitutronghtml)}" />
							<c:out value="${kq}" escapeXml="false" />
						</p>
						<br>
						<c:forEach items="${ listUser}" var="listuser">
							<c:if test="${lists.usersid eq listuser.usersid }">
								<p>Đăng bởi :${listuser.fullname}</p>
							</c:if>
						</c:forEach>
					</c:forEach>
					<!-- row -->
					<hr class="invis">
					<div class="section-title">
						<h2>Có Thể Bạn Sẽ Thích</h2>
					</div>
					<!-- post -->
					<c:forEach items="${NewsMoi}" var="lists">
						<div class="col-md-4">
							<div class="post">
								<a class="post-img"
									href="ShowNewsController?newsid=${lists.newsid}"><img
									src="Imageupload/${lists.img}" alt=""></a>
								<div class="post-body">
									<div class="post-meta">
										<a class="post-category cat-4"
											href="ListByDanhMucController?categoryid=${list.categoryid}">
											<c:forEach items="${listdanhmuc}" var="listdanhmuc">
												<c:if test="${lists.categoryid eq listdanhmuc.categoryid}"> 
                                             ${listdanhmuc.categoryname}
                                            </c:if>
											</c:forEach>
										</a> <span class="post-date">${lists.date}</span>
									</div>
									<h3 class="post-title">
										<a href="ShowNewsController?newsid=${lists.newsid}">${lists.tieude}</a>
									</h3>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- /post -->
				</div>

				<div class="col-md-4">
					<!-- post widget -->
					<div class="aside-widget">
						<div class="section-title">
							<h2>ĐỌC THÊM</h2>
						</div>
						<c:forEach items="${NewsMoi}" var="lists">
							<div class="post post-widget">
								<a class="post-img"
									href="ShowNewsController?newsid=${lists.newsid}"><img
									src="Imageupload/${lists.img}" alt=""></a>
								<div class="post-body">
									<h3 class="post-title">
										<a href="ShowNewsController?newsid=${lists.newsid}">${lists.tieude}</a>
									</h3>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- /post widget -->
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
					<!-- ad -->
					<div class="aside-widget text-center">
						<a href="#" style="display: inline-block; margin: auto;"> <img
							class="img-responsive" src="Frontend/img/banner_1.jpg" alt="">
						</a>
					</div>
					<!-- /ad -->
				</div>
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- footer -->
	<jsp:include page="Footer.jsp"></jsp:include>
	<!--end of footer -->

	<script src="Frontend/js/jquery.min.js"></script>
	<script src="Frontend/js/bootstrap.min.js"></script>
	<script src="Frontend/js/main.js"></script>
</body>
</html>
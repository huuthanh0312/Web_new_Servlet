<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="FrontendAdmin/css/bootstrap.min.css" rel="stylesheet"
	media="all">
<link href="FrontendAdmin/css/hamburgers.min.css" rel="stylesheet"
	media="all">
<link href="FrontendAdmin/css/theme.css" rel="stylesheet" media="all">
</head>
<body class="animsition">
	<div class="page-wrapper">
		<div class="page-content--bge5">
			<div class="container">
				<a href="HomeController" class="btn btn-danger btn-sm"> TRỞ VỀ
					TRANG CHỦ </a>
				<div class="login-wrap">
					<div class="login-content">
						<div class="login-logo">
							<a href="#"> <img src="FrontendAdmin/images/logo1.png"
								width="250px">
							</a>
						</div>
						<div class="login-form">
							<form action="LoginController" method="POST">
								<div class="form-group" style="color: red">
									<%=request.getAttribute("msglogin") != null ? request.getAttribute("msglogin") : " "%>
								</div>
								<div class="form-group">
									<label>NHẬP TÊN ĐĂNG NHẬP</label> <input
										class="au-input au-input--full" type="text" name="username"
										placeholder="Username">
								</div>
								<div class="form-group">
									<label>NHẬP MẬT KHẨU</label> <input
										class="au-input au-input--full" type="password"
										name="password" placeholder="Password">
								</div>
								<br>
								<button class="au-btn au-btn--block au-btn--green" type="submit">
									sign in</button>
							</form>

							<div class="register-link">
								<p>
									Don't you have account? <a href="RegisterController">REGISTER</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Main JS-->
	<script src="FrontendAdmin/js/main.js"></script>
</body>
</html>
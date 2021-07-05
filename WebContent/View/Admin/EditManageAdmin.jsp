<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QUẢN LÝ DANH MỤC</title>
    <!-- Fontawesome CSS--> 
    <link href="FrontendAdmin/css/fontawesome/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="FrontendAdmin/css/fontawesome/fontawesome-all.min.css" rel="stylesheet" media="all">
    <!-- Bootstrap CSS-->
    <link href="FrontendAdmin/css/bootstrap.min.css" rel="stylesheet" media="all">    
    <link href="FrontendAdmin/css/animsition.min.css" rel="stylesheet" media="all">
    <link href="FrontendAdmin/css/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="FrontendAdmin/css/bootstrap-markdown.min.css" rel="stylesheet" media="all">
    <!-- Main CSS--> 
    <link href="FrontendAdmin/css/theme.css" rel="stylesheet" media="all">
</head>
<body class="animsition">  
   <div class="page-wrapper">     
        <!-- MENU SIDEBAR-->  
         <jsp:include page="Menuslidebar.jsp"></jsp:include>     
        <!-- END MENU SIDEBAR-->   
        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
              <jsp:include page="Headerdesktop.jsp"></jsp:include>
            <!--END OF HEADER DESKTOP-->
            
            <!-- BREADCRUMB-->
            <section class="au-breadcrumb m-t-75">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                         <div class="row">
                           <ul class="list-unstyled list-inline au-breadcrumb__list">
                               <li class="list-inline-item active">
                                   <a href="AdminForward?pageid=1">Trang Chủ </a>
                               </li>
                               <li class="list-inline-item seprate">
                                   <span>/</span>
                               </li>
                               <li class="list-inline-item">
                               <a href="CategoryAdminController">Quản Lý ADMIN </a>
                               </li>
                               <li class="list-inline-item seprate">
                                   <span>/</span>
                               </li>
                               <li class="list-inline-item">Chỉnh Sửa ADMIN</li>                  
                           </ul>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END BREADCRUMB-->            
            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">        
                         <div class="card">
                                <div class="card-header">
                                    <strong>THÀNH VIÊN ADMIN</strong>
                                 </div>
                               <h3><%= request.getAttribute("msgeditadmin") != null ? request.getAttribute("msgeditadmin") :"" %></h3>
                                <div class="card-body card-block">
                                    <c:forEach items="${listAdmin}" var="l">
                                      <form action="EditManage?usersid=<%=request.getAttribute("usersid")%>" method="POST"  class="form-horizontal"> 
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Tên Đăng Nhập</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" name="username" value="${l.username }" placeholder="Text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Mật Khẩu</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" name="password" value="${l.password }" placeholder="Text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Tên Đầy Đủ</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" name="fullname" value="${l.fullname }" placeholder="Text" class="form-control">
                                                </div>
                                            </div>   
                                            <button type="submit" class="btn btn-primary btn-sm">
                                                <i class=""></i>SAVE
                                            </button> 
                                      </form>
                                   </c:forEach>
                                 </div>        
                              </div>
                 <!-- Footer -->
                 <jsp:include page="FooterAdmin.jsp"></jsp:include>
                 <!--End of Footer -->
                           </div>
                         </div>
                       </div>
            <!-- END MAIN CONTENT-->
                  </div>
                </div>
           
    <!-- Jquery JS-->
    <script src="FrontendAdmin/js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="FrontendAdmin/js/markdown.min.js"></script>
     <script src="FrontendAdmin/js/bootstrap-markdown.min.js"></script>
    <script src="FrontendAdmin/js/bootstrap.min.js"></script>
    <script src="FrontendAdmin/js/animsition.min.js"></script>
    <script src="FrontendAdmin/js/main.js"></script> 
</body>
</html>
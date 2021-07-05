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
                               <a href="CategoryAdminController">Quản Lý Danh Mục </a>
                               </li>
                               <li class="list-inline-item seprate">
                                   <span>/</span>
                               </li>
                               <li class="list-inline-item">Chỉnh Sửa Danh Mục</li>                  
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
                                    <strong>DANH MỤC</strong>
                                 </div>
                                 <h3><%= request.getAttribute("msgeditdanhmuc") != null ? request.getAttribute("msgeditdanhmuc") :"" %></h3>
                                <div class="card-body card-block">
                                    <c:forEach items="${listdmbyid}" var="l">
                                      <form action="EditCategoryController?categoryid=<%=request.getAttribute("categoryid")%>" method="POST"  class="form-horizontal"> 
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Nội Dung</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" name="categoryname" value="${l.categoryname }" placeholder="Text" class="form-control">
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
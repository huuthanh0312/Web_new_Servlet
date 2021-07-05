<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QUẢN LÝ TIN TỨC</title>
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
         <div class="menu-sidebar d-none d-lg-block">        
            <div class="logo">
                <a href="AdminForward?pageid=1">
                    <img src="FrontendAdmin/images/logo1.png" width="230px" />
                </a>
            </div>     
            <div class="menu-sidebar2__content js-scrollbar1">              
                <nav class="navbar-sidebar2">
                    <ul class="list-unstyled navbar__list">
                        <li class=" has-sub">
                            <a class="" href="MemberNewsADForward?pageid=1">
                               QUẢN LÝ TIN TỨC
                            </a>                
                        </li>
                                       
                    </ul>
                </nav>
            </div>
        </div>
        <!-- HEADER MOBILE-->
        <div class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href="AdminForward">
                            <img src="FrontendAdmin/images/logo1.png" width="250px"  />
                        </a>
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <nav class="navbar-mobile">
                <div class="container-fluid">
                    <ul class="navbar-mobile__list list-unstyled">
                       
                        <li class="has-sub">
                            <a class="" href="MemberNewsADForward?pageid=1">
                                QUẢN LÝ TIN TỨC</a>
                        </li>
                       
                    </ul>
                </div>
            </nav>
        </div>
       <!-- END HEADER MOBILE-->       
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
                                   <a href="MemberNewsADForward?pageid=1">Trang Chủ </a>
                               </li>                
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
                         <div class="row m-t-25">
                                <div class="overview-item overview-item--c1">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix"> 
                                            <div class="text">
                                                <h2>CHÀO MỪNG BẠN ĐẾN VỚI ĐẠI GIA ĐÌNH ADMIN</h2>
                                            </div>
                                        </div>
                                    </div>
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
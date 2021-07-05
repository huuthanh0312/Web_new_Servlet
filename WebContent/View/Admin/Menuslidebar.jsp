<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
                            <a class="" href="ManageAdminController">
                               QUẢN LÝ ADMIN
                            </a>                
                        </li>
                        <li class=" has-sub">
                            <a class="" href="NewsadminForward?pageid=1">
                               QUẢN LÝ TIN TỨC
                            </a>                
                        </li>
                        <li class="has-sub">
                            <a class="" href="CategoryAdminController">
                                QUẢN LÝ DANH MỤC
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
                        <li class=" has-sub">
                            <a class="" href="ManageAdminController">
                               QUẢN LÝ ADMIN
                            </a>                
                        </li>
                        <li class="has-sub">
                            <a class="" href="NewsadminForward?pageid=1">
                                QUẢN LÝ TIN TỨC</a>
                        </li>
                        <li class="has-sub">
                            <a class="" href="CategoryAdminController">
                                QUẢN LÝ DANH MỤC</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
       <!-- END HEADER MOBILE-->    
</body>
</html>
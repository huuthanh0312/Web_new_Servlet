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
                               <li class="list-inline-item">Quản Lý Danh Mục</li>                
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
                            <div class="row m-t-30">
                            <div class="col-md-12">
                                  <div class="row">
                                <div class="table-responsive  m-b-30 p-l-15 p-r-15">
                                    <table class="table table-borderless table-striped table-earning">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>DANH MỤC</th>
                                                <th>CHỨC NĂNG</th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <c:forEach items="${listdanhmuc}" var="l">
                                             <tr> 
                                                <td> ${l.categoryid }  </td>
                                                <td> ${l.categoryname } </td>                                         
                                                <td class="button">
                                                  <a  class="btn btn-danger btn-sm" href="DeleteCategoryController?categoryid=${l.categoryid }" >
                                                    <i class=""></i>DELETE
                                                  </a> 
                                                  <a  class="btn btn-primary btn-sm" href="EditCategoryController?categoryid=${l.categoryid }">
                                                    <i class=""></i> EDIT
                                                  </a> 
                                                 </td>
                                              </tr>
                                           </c:forEach>  
                                        </tbody>
                                    </table>
                                </div>
                             </div>   
                          </div>   
                        </div>
                         <div class="card">
                                <div class="card-header">
                                    <strong>DANH MỤC</strong>
                                 </div>
                                 <h3><%= request.getAttribute("msgdanhmuc") != null ? request.getAttribute("msgdanhmuc") :"" %></h3>
                                <div class="card-body card-block">
                                      <form action="CategoryAdminController" method="POST"  class="form-horizontal"> 
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Nội Dung</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" name="categoryname" placeholder="Text" class="form-control">
                                                </div>
                                            </div>
                                            
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            <i class=""></i> ADD
                                        </button>
                                        <button type="reset" class="btn btn-danger btn-sm">
                                            <i class=""></i> Cancel
                                        </button>        
                                        </form>
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
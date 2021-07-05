<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Trị Viên</title>
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
                                                <th>TIÊU ĐỀ</th>
                                                <th>MÔ TẢ</th>
                                                <th>NỘI DUNG CHÍNH</th>
                                                <th>DATE</th>
                                                <th>IMAGES</th>                                                          
                                            </tr>
                                        </thead>
                                        <tbody>
                                                <c:forEach items="${listHomeNews}" var="listnews">
                                                  <tr> 
                                                     <td> ${listnews.newsid }  </td>
                                                     <td>
                                                     <c:forEach items="${listdanhmuc}" var="listdanhmuc">
                                                       <c:if test="${listnews.categoryid eq listdanhmuc.categoryid}"> 
                                                         ${listdanhmuc.categoryname}
                                                       </c:if>
                                                       </c:forEach>
                                                     </td>
                                                     <td> ${listnews.tieude }   </td>
                                                     <td> ${listnews.mota }  </td>
                                                     <td> ${listnews.noidung }  </td>
                                                     <td> ${listnews.date }  </td>
                                                     <td> ${listnews.img }   </td>                                                                
                                                 </tr>
                                               </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                             </div> 
                             <div class="row">
                             <div class="col-md-12 ">
                                <nav aria-label="Page navigation ">
                                    <ul class="pagination justify-content-start">        
                                       <c:if test="${numberpage == 1}">
			                            <li class = "disabled"><a class="page-link" href = "">Prev</a></li>
                                        <li class="page-item" ><a  class="page-link" style="background: #e5e5e5;" href = "NewsadminController?pageid=${numberpage}">${numberpage}</a></li>
			                            <li class="page-item"><a  class="page-link" href = "AdminForward?pageid=${numberpage+1}">${numberpage+1}</a></li>
			                            <li class="page-item"><a   class="page-link"href = "AdminForward?pageid=${numberpage+1}">Next</a></li>
		                               </c:if>
		                               <c:if test="${numberpage == maxpageid}">
			                            <li class="page-item"><a  class="page-link" href = "AdminForward?pageid=${numberpage-1}">Prev</a></li>
			                            <li class="page-item"><a  class="page-link" href = "AdminForward?pageid=${numberpage-1}">${numberpage-1}</a></li>
			                            <li class="page-item"><a  class="page-link" style="background: #e5e5e5;" href = "NewsadminController?pageid=${numberpage}">${numberpage}</a></li>
			                            <li class = "disabled"><a  class="page-link" href = "">Next</a></li>
		                               </c:if> 
		                              <c:if test="${numberpage > 1 && numberpage < maxpageid}">
			                            <li class="page-item"><a  class="page-link" href = "AdminForward?pageid=${numberpage-1}">Prev</a></li>
			                            <li class="page-item"><a  class="page-link" style="background: #e5e5e5;" href = "NewsadminController?pageid=${numberpage}">${numberpage}</a></li>
			                            <li class="page-item"><a  class="page-link" href = "AdminForward?pageid=${numberpage+1}">${numberpage+1}</a></li>
			                            <li class="page-item"><a class="page-link" href = "AdminForward?pageid=${numberpage+1}">Next</a></li>
		                              </c:if>
                                    </ul>
                                </nav>
                            </div><!-- end col -->  
                          </div> 
                        </div><!-- end row -->  
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
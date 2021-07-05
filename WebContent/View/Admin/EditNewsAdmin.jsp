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
                                   <a href="NewsadminForward?pageid=1">Quản Lý Tin Tức </a>
                               </li>
                               <li class="list-inline-item seprate">
                                   <span>/</span>
                               </li>
                               <li class="list-inline-item">Chỉnh Sửa Tin Tức</li>                
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
                         <c:forEach items="${listnewsbyid }" var="listnews">
                          <div class="card-header">
                               <strong>
                                <c:forEach items="${ listdanhmuc }" var="list">
                                    <c:if test="${listnews.categoryid eq list.categoryid }">
                                        ${list.categoryname} 
                                    </c:if>
                                </c:forEach>
                               </strong>
                           </div>
                               <h3><%= request.getAttribute("msgeditnews") != null ? request.getAttribute("msgeditnews") :"" %></h3>
                              <div class="card-body card-block">
                                
                                 <form action="EditNewsController?newsid=<%=request.getAttribute("newsid")%>" method="POST" >
                                      <div class="row form-group">
                                         <div class="col col-md-3">
                                           <label  class=" form-control-label">Tiêu đề</label>
                                          </div>
                                          <div class="col-12 col-md-9">
                                            <input type="text"  name="tieude"  value="${ listnews.tieude}" class="form-control">
                                          </div>
                                          </div>
                                       <!--  div class="row form-group">
                                            <div class="col col-md-3">
                                             <label  class=" form-control-label">Danh Mục</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                               <select name="categoryid"  class="form-control">
                                                 <c:forEach items="${ listdanhmuc }" var="list">
                                                   <c:if test="${listnews.categoryid eq list.categoryid }">
                                                   <option value="${list.categoryid }">${list.categoryname} </option>
                                                   </c:if>
                                                 </c:forEach> 
                                               </select>
                                            </div>
                                           </div-->
                                        <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label  class=" form-control-label">Mô Tả</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text"  name="mota"  value="${ listnews.mota}" class="form-control">
                                                </div>
                                            </div>
                                         <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label  class=" form-control-label">Nội Dung Chính</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <textarea name="noidung"  data-provide="markdown" data-iconlibrary="fa" rows="10" class="form-control"> ${ listnews.noidung}</textarea>
                                                </div>
                                            </div>
                                         <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Thời Gian</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="date"  name="date"  value="${listnews.date}" class="form-control">
                                                </div>
                                            </div>
                                            
                                           <button type="submit" class="btn btn-primary btn-sm" >
                                               Save 
                                           </button>
                                         
                                        </form>
                                    </div>
                                   </c:forEach>  
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
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
    <script type="text/javascript">
				function Validate()
				{
					var tieude = document.myform.tieude.value;
					var mota = document.myform.mota.value;
					var noidung = document.myform.noidung.value;
					var date = document.myform.date.value;
					if (tieude == "" || mota == "" || noidung == "" || date == "" )
					{
						alert("Yêu cầu không bỏ trống bất kì nội dung nào");
						return false;			
					}	
					
				 }	
	</script>
    
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
                               <li class="list-inline-item">Quản Lý Tin Tức</li>                
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
                       <div class="row m-t-30  m-b-30">
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
                                           <th>    </th>
                                           <th>CHỨC NĂNG</th>     
                                         </tr>
                                      </thead>
                                      <tbody>
                                        <c:forEach items="${listHomeNews}" var="listnews">
                                          <tr>
                                          <td>${listnews.newsid }  </td>
                                          <td>
                                          <c:forEach items="${listdanhmuc}" var="listdanhmuc">
                                            <c:if test="${listnews.categoryid eq listdanhmuc.categoryid}"> 
                                             ${listdanhmuc.categoryname}
                                            </c:if>    
                                            </c:forEach>
                                          </td>
                                           <td>${listnews.tieude }  </td>
                                           <td>${listnews.mota } </td>
                                           <td>${listnews.noidung }  </td>
                                           <td>${listnews.date }  </td>
                                           <td >${listnews.img }  </td>
                                           <td >
                                           <a  class="btn btn-primary btn-sm" href="InsertimageController?newsid=${listnews.newsid }" >
                                                  <i class=""></i>Image
                                               </a>
                                           </td>             
                                           <td class="button">
                                               
                                               <a  class="btn btn-danger btn-sm" href="DeleteNewsController?newsid=${listnews.newsid }" >
                                                  <i class=""></i>DELETE
                                               </a> 
                                               <a  class="btn btn-primary btn-sm" href="EditNewsController?newsid=${listnews.newsid }">
                                                  <i class=""></i> EDIT
                                               </a> 
                                           </td>
                                          </tr>
                                        </c:forEach>
                                      </tbody>
                                 </table>
                               </div>
                               <div class="col-md-12 ">
                                <nav aria-label="Page navigation ">
                                    <ul class="pagination justify-content-start">        
                                       <c:if test="${numberpage == 1}">
			                            <li class = "disabled"><a class="page-link" href = "">Prev</a></li>
                                        <li class="page-item" ><a  class="page-link" style="background: #e5e5e5;" href = "NewsadminForward?pageid=${numberpage}">${numberpage}</a></li>
			                            <li class="page-item"><a  class="page-link" href = "NewsadminForward?pageid=${numberpage+1}">${numberpage+1}</a></li>
			                            <li class="page-item"><a   class="page-link"href = "NewsadminForward?pageid=${numberpage+1}">Next</a></li>
		                               </c:if>
		                               <c:if test="${numberpage == maxpageid}">
			                            <li class="page-item"><a  class="page-link" href = "NewsadminForward?pageid=${numberpage-1}">Prev</a></li>
			                            <li class="page-item"><a  class="page-link" href = "NewsadminForward?pageid=${numberpage-1}">${numberpage-1}</a></li>
			                            <li class="page-item"><a  class="page-link" style="background: #e5e5e5;" href = "NewsadminForward?pageid=${numberpage}">${numberpage}</a></li>
			                            <li class = "disabled"><a  class="page-link" href = "">Next</a></li>
		                               </c:if> 
		                              <c:if test="${numberpage > 1 && numberpage < maxpageid}">
			                            <li class="page-item"><a  class="page-link" href = "NewsadminForward?pageid=${numberpage-1}">Prev</a></li>
			                            <li class="page-item"><a  class="page-link" style="background: #e5e5e5;" href = "NewsadminForward?pageid=${numberpage}">${numberpage}</a></li>
			                            <li class="page-item"><a  class="page-link" href = "NewsadminForward?pageid=${numberpage+1}">${numberpage+1}</a></li>
			                            <li class="page-item"><a class="page-link" href = "NewsadminForward?pageid=${numberpage+1}">Next</a></li>
		                              </c:if>
                                    </ul>
                                </nav>
                            </div><!-- end col -->  
                            </div>   
                          </div>   
                       </div>       
                      <div class="card">
                          <div class="card-header">
                               <strong>News</strong>
                           </div>
                               <h3><%= request.getAttribute("msgnews") != null ? request.getAttribute("msgnews") :"" %></h3>
                              <div class="card-body card-block">
                                 <form action="NewsadminController" method="POST" name="myform" onsubmit="return Validate()" > 
                                      <div class="row form-group">
                                         <div class="col col-md-3">
                                           <label  class=" form-control-label">Tiêu đề</label>
                                          </div>
                                          <div class="col-12 col-md-9">
                                            <input type="text"  name="tieude" placeholder="Text" class="form-control">
                                          </div>
                                          </div>
                                       <div class="row form-group">
                                            <div class="col col-md-3">
                                             <label  class=" form-control-label">Danh Mục</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                               <select name="categoryid"  class="form-control">
                                                 <c:forEach items="${ listdanhmuc }" var="l">
                                                   <option value="${l.categoryid }">${l.categoryname} </option>        
                                                 </c:forEach> 
                                               </select>
                                            </div>
                                           </div>
                                        <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label  class=" form-control-label">Mô Tả</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text"  name="mota" placeholder="Text" class="form-control">
                                                </div>
                                            </div>
                                         <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label  class=" form-control-label">Nội Dung Chính</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <textarea name="noidung"  data-provide="markdown" data-iconlibrary="fa" rows="10"  placeholder="Content..."></textarea>
                                                </div>
                                            </div>
                                         <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Thời Gian</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="date"  name="date" placeholder="" class="form-control">
                                                </div>
                                            </div>
                                             <!-- div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label  class=" form-control-label">Upload file</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="file"  name="file" class="form-control-file">
                                                </div>
                                             </div-->            
                                           <button type="submit" class="btn btn-primary btn-sm" >
                                               ADD 
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
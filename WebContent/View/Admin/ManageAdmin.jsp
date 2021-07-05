<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QUẢN LÝ ADMIN</title>
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
					var username = document.myform.username.value;
					var password = document.myform.password.value;
					var fullname = document.myform.fullname.value;
					if (fullname == "" || username == "" || password == "")
					{
						alert("Yêu cầu không bỏ trống bất kì thông tin nào");
						return false;			
					}	
					else{
	                       if (password.length <= 5)
								{
									document.getElementById("errorpass").innerHTML = "Length Pass Bigger 5";
									return false;             		
							    }		
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
                               <li class="list-inline-item">Quản Lý Admin</li>                
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
                       <div class="row m-t-30  m-b-100">
                          <div class="col-md-12">
                            <div class="row">
                              <div class="table-responsive  m-b-30 p-l-15 p-r-15">
                                 <table class="table table-borderless table-striped table-earning">
                                     <thead>
                                        <tr>
                                           <th>ID</th>   
                                            <th>TÊN ĐĂNG NHẬP</th>       
                                           <th>MẬT KHẨU</th>
                                           <th>TÊN ĐẦY ĐỦ</th>
                                           <th>CHỨC NĂNG</th>     
                                         </tr>
                                      </thead>
                                      <tbody>
                                        <c:forEach items="${listAdmin}" var="l">
                                             <tr> 
                                                <td> ${l.usersid }  </td>
                                                <td> ${l.username } </td>
                                                <td> ${l.password }  </td>
                                                <td> ${l.fullname } </td>                                          
                                                <td class="button">
                                                  <a  class="btn btn-danger btn-sm" href="DeleteManage?usersid=${l.usersid }" >
                                                    <i class=""></i>DELETE
                                                  </a> 
                                                  <a  class="btn btn-primary btn-sm" href="EditManage?usersid=${l.usersid }">
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
                       <div class="row m-t-30  m-b-30">
                          <div class="col-md-12">
                            <div class="row">
                            <button class="btn btn-primary" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">ĐĂNG KÍ THÀNH VIÊN ADMIN MỚI</button>
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
            <!-- Modal -->
             <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <div class="login-logo">
                            <a href="#">
                                <img src="FrontendAdmin/images/logo1.png" width="250px"  >
                            </a>
                        </div>
        
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div> 
        <div class="modal-body">
            <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-form">
                            <form name="myform" action="ManageAdminController" method="POST" onsubmit="return Validate()">
                                 <div class="form-group" style="color: blue">
                                 <%=request.getAttribute("msgregister")!=null ? request.getAttribute("msgregister") :" "%> 
                                 </div>
                               <div class="form-group">
                                    <label>NHẬP TÊN ĐẦY ĐỦ</label>
                                    <input class="au-input au-input--full" type="text" name="fullname" placeholder="Fullname">
                              </div>                                    
                                <div class="form-group">
                                    <label>NHẬP TÊN ĐĂNG KÝ</label> 
                                    <input class="au-input au-input--full" type="text" name="username" placeholder="Username">          
                                </div>  
                                <div class="form-group">
                                    <label>NHẬP MẬT KHẨU</label>
                                    <input class="au-input au-input--full" type="password" name="password" placeholder="Password">
                                </div>
                                <label id="errorpass" style="color: red"></label>
                                <input class="au-btn au-btn--block au-btn--green" type="submit" value="REGISTER" >                           
                            </form>
                        </div>
                    </div>
                </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger " data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
             <!--End of Modal -->
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
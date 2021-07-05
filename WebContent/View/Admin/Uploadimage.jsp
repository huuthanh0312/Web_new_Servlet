<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Images</title>
    <link href="FrontendAdmin/css/bootstrap.min.css" rel="stylesheet" media="all"> 
    <link href="FrontendAdmin/css/hamburgers.min.css" rel="stylesheet" media="all"> 
    <link href="FrontendAdmin/css/theme.css" rel="stylesheet" media="all">
</head>
<body  class="animsition">
  <div class="page-wrapper">
       <div class="page-content--bge5">
           <div class="container">
               <a href="NewsadminForward?pageid=1" class="btn btn-danger btn-sm" >
                  Trở Lại 
                </a>
              <div class="login-wrap">
                  <div class="login-content">
                      <div class="login-logo">
                            <a href="#">
                                <img src="FrontendAdmin/images/logo1.png" width="250px">
                            </a>
                        </div>
                        <div class="login-form">
                           <form action="InsertimageController?newsid=<%=request.getAttribute("newsid")%>" method="POST" enctype="multipart/form-data">
		                     <h4>Thêm hình bài tin tức</h4>
		                       <div class="row form-group">					                           
                                 <label  class=" form-control-label">
                                 <%=request.getAttribute("msgimage")!=null?request.getAttribute("msgimage"):" "%>
                                 </label>
                              </div>
                              <div class="col col-md-7">
                                 <input type="file"  name="file" class="form-control-file">
                              </div> 	
		                      <br/>
		          	          <button type="submit" class="btn btn-primary btn-sm" >
                                ADD IMAGES
                              </button>
                              
		                   </form>		                     
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
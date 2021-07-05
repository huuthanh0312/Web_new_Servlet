<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="header-desktop">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
               <div class="header-wrap">
                   <div class="header-button">
                        <div class="account-wrap">
                             <div class="account-item clearfix js-item-menu">
                                   <div class="image">
                                   <img src="FrontendAdmin/images/admin1.png" />
                                   </div>
                                   <div class="content">
                                   <p style="color: black; font-size: 20px;"> <%=session.getAttribute("sessionadmin")%></p>
                                   </div>                                                        
                             </div>
                         </div>         
                    </div>
                <div class="header-button">
                   <a href="LogoutController">ĐĂNG XUẤT </a>  
                </div>                                                      
               </div>
            </div>
          </div>  
      </div>
</body>
</html>
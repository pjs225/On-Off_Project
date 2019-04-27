<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>On & Off</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
      
        <!-- All Plugin Css -->  
      <link rel="stylesheet" href="css/plugins.css">
      
      <!-- Style & Common Css --> 
      <link rel="stylesheet" href="css/common.css">
        <link rel="stylesheet" href="css/main.css">

    </head>
    
   <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   <script type="text/javascript">
   

   
   </script>

<body>
   
<!-- Navigation Start  -->
      <nav class="navbar navbar-default navbar-sticky bootsnav">
         <div class="container">      
            <!-- Start Header Navigation -->
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                  <i class="fa fa-bars"></i>
               </button>
               <a class="navbar-brand" href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>
            </div>
            <!-- End Header Navigation -->
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
               <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                     <li><a href="index.jsp">Home</a></li> 
                     <c:set var="user" value="${dto.username }"/>
                     <c:choose>
                     <c:when test="${user==null }">
                        <li class="login"><a href="login.do">Login</a></li>
                     </c:when>
                     <c:otherwise>
                        <li class="dropdown">
                           <a href="#" class="dropdown-toggle" data-toggle="dropdown">${dto.username }</a>
                           <ul class="dropdown-menu animated fadeOutUp" style="display: none; opacity: 1;">
                              <li class="active"><a href="mypage.do">마이페이지</a></li>
                              <li><a href="logout.do">로그아웃</a></li>
                           </ul>
                        </li>
                     </c:otherwise>
                  </c:choose>
               </ul>
            </div><!-- /.navbar-collapse -->
         </div>   
      </nav>
<!-- Navigation End  -->


      
      <!-- search password section start -->
      <section class="regist-wrapper">
      <div class="container">
         <div class="col-md-12">
            <div class="row">
               <div><br/><br/></div>
               <div style="font-size:40pt;color:black;">성공적으로 탈퇴되었습니다. 감사합니다. :)</div>
               <div><br/><br/></div>
               
               <div class="row">
                  <input type="button" class="btn brows-btn" value="메인 페이지로 이동" onclick="location.href='index.jsp'"/>      
               </div>
               
            </div>
         </div>
      </div>
      </section>
      <!-- search password section End -->   
      
      <!-- footer start -->
      <footer>
         <div class="copy-right">
          <p>&copy;Copyright 2018 Final Project | Design By <a href="#"> Kh정보교육원_On조 </a></p>
         </div>
      </footer>
       
      <script type="text/javascript" src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script type="text/javascript" src="js/owl.carousel.min.js"></script>
      <script src="js/bootsnav.js"></script>
      <script src="js/main.js"></script>
    </body>
</html>
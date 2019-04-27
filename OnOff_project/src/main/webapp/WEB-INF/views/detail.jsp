<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>On & Off</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
			
	<!-- All Plugin Css -->  
	<link rel="stylesheet" href="css/plugins.css">
			
	<!-- Style & Common Css --> 
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/main.css">
	
	<style>
		.container div {
			display: inline-block;
			vertical-align: middle;
			margin-top: 15px;
		}
		#menu2 > li{
			display: inline;
			font: bold 12px Dotum;
			padding: 0 10px;
		}
		li > a:hover{
			color: #da0833;
		}
		#midContainer{
			margin-top: 10px;
		}
		.navbar-header{
			vertical-align: middle;
		}
	</style>
	


</head>

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

 
	
	<div class="container">		
		<div id = "midContainer">
			<div id="topInfo">
				<img alt="sample" src="img/sample_koala.jpg" style="width: 500px; height: 300px;" id="mainImg">
			</div>			
			<div id="sInfo" style="margin-left: 80px;">
				<h3>제목</h3>
				<h5>모임이름</h5>
				<div style="margin-bottom: 10px;">
					<h6>설명</h6>
					<span>고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으</span>
				</div>
				<br/>
				<div id="hashTag" style="margin-bottom: 10px;">
					<a href="#">#태그1</a>
					<a href="#">#태그2</a>
				</div>
				<br/>
				<div>
					<button id="singUpBtn">가입하기</button>
				</div>
			</div>
		</div>
		
		<!-- 수평선 경계 -->

	</div>
	<hr size="8" noshade="noshade">
		
	<div style="margin-left: 300px;">
		<div class="collapse navbar-collapse" id="navbar-menu" style="border-bottom: 50px;">
			<ul id="menu2" data-in="fadeInDown" data-out="fadeOutUp">
				<li><a>자유게시판</a></li>			
				<li><a>갤러리</a></li>
				<li><a>모임일정</a></li>
				<li><a>라이브</a></li>
				<li><a>채팅</a></li>
			</ul>
		</div>
	</div>
	
		

      <!-- footer start -->
      <footer>
         <div class="copy-right">
          <p>&copy;Copyright 2018 Final Project | Design By <a href="#"> Kh정보교육원_On조 </a></p>
         </div>
      </footer>	
	

</body>


</html>
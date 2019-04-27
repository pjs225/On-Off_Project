<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html class="no-js">
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



	<!-- Inner Banner -->
	<section class="inner-banner"
		style="backend: #242c36 url(https://via.placeholder.com/1920x600) no-repeat;">
		<div class="container">
			<div class="caption">
				<h2>갤러리</h2>
				<p>
					let's take picture <span>make memory</span>
				</p>
			</div>
		</div>
	</section>

 	<section class="jobs">
		<div class="container">
			
			<div class="companies">
			<!-- 게시글 -->
				<div class="company-list">
					<div class="row">
						<!-- 사진 -->
						<div class="col-md-2 col-sm-2">
							<div class="company-logo">
								<img src="img/google.png" class="img-responsive" alt="" />
							</div>
						</div>
						<!-- 내용 -->
						<div class="col-md-8 col-sm-8">
							<div class="company-content" onclick="location.href='boardDetailPhoto.do'">
								<h3>게시판 제목</h3>
								<p>
									<span class="company-name"><i class="fa fa-briefcase"></i>모임이름</span>
									<span class="company-location"><i class="fa fa-map-marker"></i>
										위치</span>
<!-- 									<span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span> -->
								</p>
							</div>
						</div>
<!-- 						<div class="col-md-2 col-sm-2"> -->
<!-- 							<button type="submit" class="btn view-job" name="View Job">글수정</button> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>

			<div class="paging">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">&laquo;</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
				</ul>
			</nav>
			</div>
			
			<!-- 글쓰기버튼 -->
			<div class="row">
				<input type="button" class="btn brows-btn" value="글쓰기" onclick="location.href='boardWrite.do'" />
			</div>
		</div>
	</section>




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
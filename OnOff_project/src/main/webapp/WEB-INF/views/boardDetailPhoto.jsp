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
<meta charset="UTF-8">
<title>Insert title here</title>
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



	<section class="profile-detail">
		<div class="container">
			<div class="col-md-12">
				<div class="row">
					<div class="basic-information">
						<div class="col-md-9 col-sm-9">
							<div class="profile-content">
								<h2>
									제목<span>2019-03-05</span>
								</h2>
								<p>내용</p>
							</div>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-user fa-fw"></i> About 글쓴이
							</div>
							<!-- /.panel-heading -->
							<div class="panel-content">
								<div class="testimonial" style="text-align: left; margin-top: 60px;">
										<div class="pic">
											<img src="img/client-1.jpg" alt="">
										</div>
									</div>
								<!-- <div>
									<ul class="WriterInformation">
										<li><span>Address:</span>Menlo Park, CA</li>
										<li><span>Website:</span>Google.com</li>
										<li><span>Employee:</span>50,000 - 70,000 employer</li>
										<li><span>Mail:</span>info@google.com</li>
										<li><span>From:</span>1998</li>
									</ul>
								</div> -->
							</div>
						</div>

						<div class="container">
						
							<!-- for문 시작 -->
							<!-- 이미지 클릭 시 다운로드를 할지?? 파일 다운로드를 따로 만들지 고민 해봅시다. -->
							<div class="col-md-4 col-sm-4">
								<div class="features-content">
									<img style="width: 100%;" class="sampleimg" src="img/sample_koala.jpg" />
								</div>
							</div>
							<!-- for문 종료 -->

							<div class="col-md-4 col-sm-4">
								<div class="features-content">
									<img style="width: 100%;" class="sampleimg" src="img/sample_koala.jpg" />
								</div>
							</div>

							<div class="col-md-4 col-sm-4">
								<div class="features-content">
									<img style="width: 100%;" class="sampleimg" src="img/sample_koala.jpg" />
								</div>
							</div>

							<div class="col-md-4 col-sm-4">
								<div class="features-content">
									<img style="width: 100%;" class="sampleimg" src="img/sample_koala.jpg" />
								</div>
							</div>

							<div class="col-md-4 col-sm-4">
								<div class="features-content">
									<img style="width: 100%;" class="sampleimg" src="img/sample_koala.jpg" />
								</div>
							</div>

							<div class="col-md-4 col-sm-4">
								<div class="features-content">
									<img style="width: 100%;" class="sampleimg" src="img/sample_koala.jpg" />
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="testimonials dark">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div id="testimonial-slider" class="owl-carousel">
							<div class="testimonial">
								<div class="pic">
									<img src="img/client-1.jpg" alt="">
								</div>
								<p class="description">
									" 댓글내용 "
								</p>
								<h3 class="testimonial-title">댓글 작성일</h3>
								<span class="post">작성자</span>
							</div>

							<div class="testimonial">
								<div class="pic">
									<img src="img/client-2.jpg" alt="">
								</div>
								<p class="description">
									" 댓글내용 "
								</p>
								<h3 class="testimonial-title">댓글 작성일</h3>
								<span class="post">작성자</span>
							</div>
							
							<div class="testimonial">
								<div class="pic">
									<img src="img/client-3.jpg" alt="">
								</div>
								<p class="description">
									" 댓글내용 "
								</p>
								<h3 class="testimonial-title">댓글 작성일</h3>
								<span class="post">작성자</span>
							</div>
							
							<div class="testimonial">
								<div class="pic">
									<img src="img/client-4.jpg" alt="">
								</div>
								<p class="description">
									" 댓글내용 "
								</p>
								<h3 class="testimonial-title">댓글 작성일</h3>
								<span class="post">작성자</span>
							</div>
						</div>
					</div>
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
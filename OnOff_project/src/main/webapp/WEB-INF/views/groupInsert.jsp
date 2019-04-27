<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html class="no-js">

	<head>
	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>On & Off | 자z</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- All Plugin Css -->
		<link rel="stylesheet" href="css/plugins.css">
		
		<!-- Style & Common Css -->
		<link rel="stylesheet" href="css/common.css">
		<link rel="stylesheet" href="css/main.css">
		
		<script src="https://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
		
		<script type="text/javascript">

			var openWin;
	
			 function openPre()
		     {
		         // window.name = "부모창 이름"; 
		         window.name = "parentForm";
		         // window.open("open할 window", "자식창 이름", "팝업창 옵션");
		         openWin = window.open("preView.do",
		                 "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
		     }

		</script>
		<script type="text/javascript">
			$(function() {
				$("#insertGroup").click(function() {
					
					if($("#title").val().length == 0){
						alert("그룹명을 넣어주세요");
						return ;
					}
					if($("#intext").val().length == 0){
						alert("사진을 등록해주세요");
						return ;
					}
					if($("#content").val().length == 0){
						alert("설명을 입력해주세요");
						return ;
					}
					if($("#title").val().length != 0 && $("#intext").length != 0 && $("#content").val().length != 0){
						$("#insertGroupForm").submit();
					}
				});
			});
		</script>
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
							<div class="col-md-9 col-sm-9" style="width: 100%;">
								<div class="profile-content">
									<!-- <h2> -->
									<!-- 	Daniel Duke<span>Web designer</span> -->
									<!-- </h2> -->
									<!-- <p>Soft Techi Infoteck Pvt.</p> -->
									<form action="groupInsertRes.do" id="insertGroupForm" enctype="multipart/form-data">
										<ul class="information">
											<li>
												<span>그룹명</span>
												<div class="features-content" style="float: none; max-width: 100%; display: inline-block; ">
													<input type="text" name="grouptitle" id="title" size="73" style="border:0; outline: none;" />
												</div>
											</li>
											<li>
												<span>대표이미지<br/><br/><br/><br/><br/></span>
												<div class="features-content" style="float: none; max-width: 100%; display: inline-block; ">
													<div style="max-width: 600px;">
														<img style="width: 100%;" id="inimg" class="sampleimg" src="img/logo.png" />
													</div>
													<div>
                										<input type="button" class="btn brows-btn" value="이미지 등록" onclick="openPre()">
                										<input type="hidden"  id="intext" name="groupimg" />
            										</div>
												</div>
											</li>
											<li>
												<span>설명<br/><br/><br/></span>
												<div class="features-content" style="float: none; max-width: 100%; display: inline-block; ">
													<textarea name="groupcontent" id="content" cols="73" rows="7" style="border:0; resize: none; outline: none;"></textarea>
												</div>
											</li>
										</ul>
									</form>
								</div>
							</div>
						</div>
	
						<!-- 글쓰기버튼 -->
						<div class="row">
							<input type="button" class="btn brows-btn" value="그룹 만들기" id="insertGroup" />
							<!-- <input type="button" class="btn brows-btn" id="insertBoard" value="글 올리기" style="margin-left: 300px;" /> -->
						</div>
					</div>
				</div>
			</div>
		</section>
	
		<!-- footer start -->
		<footer>
			<div class="container">
				<div class="col-md-3 col-sm-6">
					<h4>Featured Job</h4>
					<ul>
						<li><a href="#">Browse Jobs</a></li>
						<li><a href="#">Premium MBA Jobs</a></li>
						<li><a href="#">Access Database</a></li>
						<li><a href="#">Manage Responses</a></li>
						<li><a href="#">Report a Problem</a></li>
						<li><a href="#">Mobile Site</a></li>
						<li><a href="#">Jobs by Skill</a></li>
					</ul>
				</div>
	
				<div class="col-md-3 col-sm-6">
					<h4>Latest Job</h4>
					<ul>
						<li><a href="#">Browse Jobs</a></li>
						<li><a href="#">Premium MBA Jobs</a></li>
						<li><a href="#">Access Database</a></li>
						<li><a href="#">Manage Responses</a></li>
						<li><a href="#">Report a Problem</a></li>
						<li><a href="#">Mobile Site</a></li>
						<li><a href="#">Jobs by Skill</a></li>
					</ul>
				</div>
	
				<div class="col-md-3 col-sm-6">
					<h4>Reach Us</h4>
					<address>
						<ul>
							<li>1201, Murakeu Market, QUCH07<br> United Kingdon
							</li>
							<li>Email: Support@job.com</li>
							<li>Call: 044 123 458 65879</li>
							<li>Skype: job@skype</li>
							<li>FAX: 123 456 85</li>
						</ul>
					</address>
				</div>
	
				<div class="col-md-3 col-sm-6">
					<h4>Drop A Mail</h4>
					<form>
						<input type="text" class="form-control input-lg"
							placeholder="Your Name"> <input type="text"
							class="form-control input-lg" placeholder="Email...">
						<textarea class="form-control" placeholder="Message"></textarea>
						<button type="submit" class="btn btn-primary">Login</button>
					</form>
				</div>
	
	
			</div>
			<div class="copy-right">
				<p>
					&copy;Copyright 2018 Jober Desk | Design By <a
						href="https://themezhub.com/">ThemezHub</a>
				</p>
			</div>
		</footer>
	
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/owl.carousel.min.js"></script>
		<script src="js/bootsnav.js"></script>
		<script src="js/main.js"></script>
	</body>
</html>
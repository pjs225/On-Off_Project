<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>On & Off | 상세보기</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- All Plugin Css -->
<link rel="stylesheet" href="css/plugins.css">

<!-- Style & Common Css -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	var content = $("#test");
	var inputdiv = $("#inphoto");
	var tttt = $("#tttt");
	
	var child = content.find("img");
	var nott = content.children("p").not("img");
	
	for(var i = 0; i < child.length; i++){
		var src = child.eq(i).attr("src");
		inputdiv.append(
			"<div class='col-md-4 col-sm-4'>" +
				"<div class='features-content'>" +
					"<img style='width: 100%;' class='sampleimg' src=" + src + " />" +
				"</div>" +
			"</div>"	
		);
	}
		
	tttt.append(nott.text());
	
});
</script>

<script type="text/javascript">
	$(function() {
		$("#deletebtn").click(function() {
			var res = confirm("삭제하시겠습니까?");

			if (res) {
				$("#deleteImgBoardFrm").submit();
			} else {
				alert("다음기회에");
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
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-menu">
					<i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="index.jsp"><img src="img/logo.png"
					class="logo" alt=""></a>
			</div>
			<!-- End Header Navigation -->
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-menu">
				<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
					data-out="fadeOutUp">
					<li><a href="index.jsp">Home</a></li>
					<c:set var="user" value="${dto.username }" />
					<c:choose>
						<c:when test="${user==null }">
							<li class="login"><a href="login.do">Login</a></li>
						</c:when>
						<c:otherwise>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">${dto.username }</a>
								<ul class="dropdown-menu animated fadeOutUp"
									style="display: none; opacity: 1;">
									<li class="active"><a href="mypage.do">마이페이지</a></li>
									<li><a href="logout.do">로그아웃</a></li>
								</ul></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
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
									${imgboarddto.imgboardtitle }<span>${imgboardregdate }</span>
								</h2>
								<p id="tttt"></p>
							</div>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-user fa-fw"></i> ${imgboarddto.userid }
							</div>
						</div>
						
						<c:set var="loginid" value="${dto.userid }" />
						<c:set var="writerid" value="${imgboarddto.userid }" />
						<c:if test="${loginid eq writerid }">
							<!-- 본인만 보이게 할겁니다 ㅇㅇㅇ -->
							<div align="right">
								<form action="imgBoardUpdate.do" method="get" style="display: inline-block;">
									<input type="hidden" name="imgboardno" value="${imgboarddto.imgboardno }" /> 
									<input type="hidden" name="groupno" value="${imgboarddto.groupno }" /> 
									<input type="submit" class="btn brows-btn" value="수정" style="display: inline-block; margin-right: 5px;" />
								</form>
								<form action="imgBoardDelete.do" method="get" id="deleteImgBoardFrm" style="display: inline-block;">
									<input type="hidden" name="imgboardno" value="${imgboarddto.imgboardno }" /> 
									<input type="hidden" name="groupno" value="${imgboarddto.groupno }" /> 
									<input type="hidden" name="pagenum" value="1" />
									<input type="button" id="deletebtn" class="btn brows-btn" value="삭제" style="display: inline-block; margin-right: 10px;" />
								</form>
							</div>
						</c:if>
						

						<div class="container" id="inphoto">
						
							<!-- for문 시작 -->
							<!-- 이거를 다 가져와야 되넹?? -->
							<div class="col-md-4 col-sm-4">
								<div class="features-content">
									<img style="width: 100%;" class="sampleimg" src="${imgboarddto.imgboardimg }" />
								</div>
							</div>
							<!-- for문 종료 -->
							
							<div id="test" style="display: none;" >${imgboarddto.imgboardcontent }</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<form action="imgBoardAnsInsert.do" method="get">
		<div class="row" align="center">
			<div class="features-content"
				style="float: none; max-width: 100%; display: inline-block;">
				<input type="text" name="imganscontent" size="50" style="font-size: 15pt; vertical-align: middle; border: 0; outline: none;" />
				<input type="hidden" name="imgboardno" value="${imgboarddto.imgboardno }" /> 
				<input type="hidden" name="moimno" value="${imgboarddto.moimno }" />
				<input type="hidden" name="userid" value="${dto.userid }" /> 
				<input type="hidden" name="groupno" value="${imgboarddto.groupno }" />
			</div>
			<input type="submit" class="btn brows-btn" value="댓글쓰기" style="font-size: 10pt; display: inline-block; margin-left: 20px;" />
			<input type="button" class="btn brows-btn" value="목록으로" onclick="location.href='imgBoardList.do?groupno=${imgboarddto.groupno }&pagenum=1'" style="font-size: 10pt;display: inline-block; margin-left: 20px;" />
		
		</div>
	</form>

	<!-- 댓글 -->
	<section class="testimonials dark" style="padding: 20px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div id="testimonial-slider" class="owl-carousel" style="">

						<!-- for문 시작 -->

						<c:choose>
							<c:when test="${empty imgboardanslist }">
								<div class="testimonial">
									<p class="description">아직 댓글이 없습니다.</p>
									<h3 class="testimonial-title">당장!!</h3>
									<span class="post">운영자</span>
								</div>
							</c:when>
							
							<c:otherwise>
								<c:forEach items="${imgboardanslist }" var="imgboardansdto">
									<div class="testimonial">
									<p class="description">${imgboardansdto.imganscontent }</p>
									<h3 class="testimonial-title">${imgboardansdto.imgansregdate }</h3>
									<span class="post">${imgboardansdto.userid }</span>
									<c:set var="answriter" value="${imgboardansdto.userid }" />
									<c:if test="${loginid eq answriter }">
										<a href="imgBoardAnsDelete.do?imgansno=${imgboardansdto.imgansno }&imgboardno=${imgboardansdto.imgboardno }">삭제</a>
									</c:if>
								</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<!-- for문 종료 -->

					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- footer start -->
	<footer>
		<div class="copy-right">
			<p>
				&copy;Copyright 2018 Final Project | Design By <a href="#">
					Kh정보교육원_On조 </a>
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
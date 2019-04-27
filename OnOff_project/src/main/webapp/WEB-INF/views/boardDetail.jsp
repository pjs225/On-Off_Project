<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	SimpleDateFormat sys = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html class="no-js">
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

<style type="text/css">
	img{
		max-width: 100%;
	}
</style>


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#deletebtn").click(function() {
			var res = confirm("삭제하시겠습니까?");

			if (res) {
				$("#deleteBoardFrm").submit();
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
									${freeboarddetail.boardtitle }<span>${boardregdate }</span>
								</h2>
								<p>${freeboarddetail.boardcontent }</p>
							</div>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-user fa-fw"></i> ${freeboarddetail.userid }
							</div>
						</div>

						<c:set var="loginid" value="${loginid }" />
						<c:set var="writerid" value="${freeboarddetail.userid }" />
						<c:if test="${loginid eq writerid }">
							<!-- 본인만 보이게 할겁니다 ㅇㅇㅇ -->
							<div align="right">
								<form action="boardUpdate.do" method="get" style="display: inline-block;">
									<input type="hidden" name="boardno" value="${freeboarddetail.boardno }" /> 
									<input type="hidden" name="groupno" value="${freeboarddetail.groupno }" /> 
									<input type="submit" class="btn brows-btn" value="수정" style="display: inline-block; margin-right: 5px;" />
								</form>
								<form action="boardDelete.do" method="get" id="deleteBoardFrm" style="display: inline-block;">
									<input type="hidden" name="boardno" value="${freeboarddetail.boardno }" /> 
									<input type="hidden" name="groupno" value="${freeboarddetail.groupno }" /> 
									<input type="hidden" name="pagenum" value="1" />
									<input type="button" id="deletebtn" class="btn brows-btn" value="삭제" style="display: inline-block; margin-right: 10px;" />
								</form>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>

	<br />

	<form action="freeBoardAnsInsert.do" method="get">
		<div class="row" align="center">
			<div class="features-content" style="float: none; max-width: 100%; display: inline-block;">
				<input type="text" name="boardanscontent" size="50" style="font-size: 15pt; vertical-align: middle; border: 0; outline: none;" />
				<input type="hidden" name="boardno" value="${freeboarddetail.boardno }" /> 
				<input type="hidden" name="userid" value="${dto.userid }" /> 
				<input type="hidden" name="groupno" value="${freeboarddetail.groupno }" />
			</div>
			<input type="submit" class="btn brows-btn" value="댓글쓰기" style="font-size: 10pt; display: inline-block; margin-left: 20px;" />
			<input type="button" class="btn brows-btn" value="목록으로" onclick="location.href='boardList.do?groupno=${freeboarddetail.groupno }&pagenum=1'" style="font-size: 10pt;display: inline-block; margin-left: 20px;" />
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
							<c:when test="${empty freeboardanslist }">
								<div class="testimonial">
									<p class="description">아직 댓글이 없습니다.</p>
									<span class="post">운영자</span>
								</div>
							</c:when>
							
							<c:otherwise>
								<c:forEach items="${freeboardanslist }" var="freeboardansdto">
									<div class="testimonial">
									<p class="description">${freeboardansdto.boardanscontent }</p>
									<h3 class="testimonial-title"><fmt:formatDate value="${freeboardansdto.boardansregdate }" pattern="yyyy-MM-dd"/></h3>
									<span class="post">${freeboardansdto.userid }</span>
									<c:set var="answriter" value="${freeboardansdto.userid }" />
									<c:if test="${loginid eq answriter }">
										<a href="freeBoardAnsDelete.do?boardansno=${freeboardansdto.boardansno }&boardno=${freeboardansdto.boardno }">삭제</a>
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
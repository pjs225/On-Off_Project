<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var size = document.getElementById("listsize").value;
		var taga = document.getElementById("pagingT");
		var groupno = document.getElementById("groupno").value;

		for (var i = 0; i < size / 5; i++) {
			taga.innerHTML += " <a  class='page-link' href='boardList.do?groupno="
					+ groupno
					+ "&pagenum="
					+ (i + 1)
					+ "'>"
					+ (i + 1)
					+ "</a> ";
			////<a class="page-link" href="#">1</a>
		}
	};
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

	<!-- Inner Banner -->
	<section class="inner-banner"
		style="background-image: url('photoUpload/20190321170938dee127de-4e73-49b1-8f80-2608f8e4f287.png');">
		<div class="container">
			<div class="caption">
				<h2>자유게시판</h2>
			</div>
		</div>
	</section>

	<section class="jobs">
		<div class="container">

			<div class="companies">

				<c:choose>
					<c:when test="${empty freeboardlist }">
						<!-- 게시글 -->
						<div class="company-list">
							<div class="row">
								<!-- 내용 -->
								<div class="col-md-8 col-sm-8">
									<div class="company-content" style="text-align: center;">
										<h3>현재 작성된 글이 없습니다.</h3>
									</div>
								</div>
								<!-- <div class="col-md-2 col-sm-2"> -->
								<!-- <button type="submit" class="btn view-job" name="View Job">글수정</button> -->
								<!-- </div> -->
							</div>
						</div>
					</c:when>

					<c:otherwise>
						<c:forEach items="${freeboardlist }" var="freeboarddto">
							<div class="company-list"
								onclick="location.href='boardDetail.do?boardno=${freeboarddto.boardno}'">
								<div class="row">
									<div class="col-md-8 col-sm-8">
										<!-- 여기서 그거 detail 수정 -->
										<div class="company-content">
											<h3>${freeboarddto.boardtitle }</h3>
											<p style="margin: 0; margin-top: 12px;">
												<span class="company-name"><i
													class="fa fa-user fa-fw"></i>${freeboarddto.userid }</span> <span
													class="company-location" id="regdate"><i
													class="fa fa-calendar-times-o"></i>${freeboarddto.boardregdate }</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

						<!-- 없으면 보이지 않게 합시당~~ -->
						<div class="paging">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<li class="page-item disabled">
										<c:set var="pagenum" value="${pagenum }" /> 
										<c:set var="size" value="${listsize }" /> 
										<c:choose>
											<c:when test="${size/5 == 0 }">

											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${pagenum <= 1 }">
														<a class="page-link">&laquo;</a>
													</c:when>
													<c:otherwise>
														<a class="page-link" href="boardList.do?groupno=${groupno }&pagenum=${pagenum-1}">&laquo;</a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</li>
										
									<li class="page-item" id="pagingT"></li>
									
									<li class="page-item disabled">
										<c:choose>
											<c:when test="${size/5 == 0 }">

											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${pagenum >= size/5 }">
														<a class="page-link">&raquo;</a>
													</c:when>
													<c:otherwise>
														<a class="page-link" href="boardList.do?groupno=${groupno }&pagenum=${pagenum+1}">&raquo;</a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</li>
								</ul>
							</nav>
						</div>
					</c:otherwise>
				</c:choose>

			</div>

			<!-- 스크립트에 필요한 값 -->
			<input type="hidden" id="listsize" value="${listsize }" /> <input
				type="hidden" id="groupno" value="${groupno }" />

			<!-- 글쓰기버튼 -->
			<div class="row" align="right">
				<input type="button" class="btn brows-btn" value="글쓰기"
					onclick="location.href='boardWrite.do?groupno=${groupno}'"
					style="display: inline-block;" /> <input type="button"
					class="btn brows-btn" value="그룹으로"
					onclick="location.href='groupDetail.do?groupno=${groupno}'"
					style="display: inline-block;" />
			</div>
		</div>
	</section>

	<footer>
		<div class="copy-right">
			<p>
				&copy;Copyright 2018 Final Project | Design By <a href="#">
					Kh정보교육원_On조 </a>
			</p>
		</div>
	</footer>


	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script src="js/bootsnav.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>On&Off</title>
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

#menu2>li {
	display: inline-block;
	font: bold 12px Dotum;
	padding: 0 10px;
}

#menu2>li>button {
	margin: 0;
	font: bold 10pt Dotum;
}

#midContainer {
	margin-top: 10px;
}

.navbar-header {
	vertical-align: middle;
}
</style>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#join").click(function() {
			var conf = confirm("가입하시겠습니까?");
			var gtitle = $("#gtitl").val();

			if (conf) {
				alert(gtitle + " 그룹에 가입하신 것을 환영합니다!!");
				$("#joinFrm").submit();
			} else {
				alert(gtitle + " 그룹은 언제나 열려있습니다^^");
			}
		});

		$("#bye").click(function() {
			var conf2 = confirm("탈퇴하시겠습니까?");
			var gtitle = $("#gtitl").val();

			if (conf2) {
				var prom = prompt("그룹명을 입력해주세요.");
				

				if (prom == gtitle) {
					alert("활동한 내역은 다 지워집니다.\n그동안 감사했습니다.");
					$("#byeFrm").submit();
				}
				else{
					alert("잘못입력하셨습니다.");
				}
				
			} else {
				alert(gtitle + " 그룹에 남아주셔서 감사합니다.");
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


	<div class="container">
		<div id="midContainer" style="width: 100%;">
			<div id="topInfo" class="features-content" style="margin: 0;">
				<img alt="sample" src="${groupdto.groupimg }"
					style="width: 500px; height: 300px;" id="mainImg">
			</div>
			<div id="sInfo" style="margin-left: 80px;">
				<h3>${groupdto.grouptitle }</h3>
				<input type="hidden" id="gtitl" value="${groupdto.grouptitle }" />
				<h5>${groupregdate }</h5>
				<div style="margin-bottom: 10px;">
					<textarea rows="7" cols="60" readonly="readonly"
						style="border: 0; resize: none; outline: none;">${groupdto.groupcontent }</textarea>
				</div>
				<br />
				<c:set var="resUser" value="${resUser.userid }" />
				<c:if test="${empty resUser }">
					<!-- 여기 잘 처리해야한당 -->
					<form action="groupUserIn.do" method="get" id="joinFrm">
						<input type="hidden" value="${dto.userid }" name="userid" /> 
						<input type="hidden" value="${groupdto.groupno }" name="groupno" /> 
						<input type="button" value="가입하기" class="btn brows-btn" id="join" style="display: inline-block; margin: 0;" />
					</form>
				</c:if>

				<c:if test="${!empty resUser }">
					<!-- 여기 잘 처리해야한당 -->
					<form action="groupUserOut.do" method="get" id="byeFrm">
						<input type="hidden" value="${dto.userid }" name="userid" /> <input
							type="hidden" value="${groupdto.groupno }" name="groupno" /> <input
							type="button" value="탈퇴하기" class="btn brows-btn" id="bye"
							style="display: inline-block; margin: 0;" />
					</form>
				</c:if>
				<!-- <button class="btn brows-btn" style="display: inline-block; margin: 0;">가입하기</button> -->
			</div>
		</div>

		<!-- 수평선 경계 -->

	</div>
	<hr size="8" noshade="noshade">
	<c:if test="${!empty resUser }">
		<div class="container" style="margin-bottom: 100px;">
			<div class="collapse navbar-collapse" id="navbar-menu">
				<ul id="menu2" data-in="fadeInDown" data-out="fadeOutUp">
					<li><button class="btn brows-btn"
							onclick="location.href='boardList.do?groupno=${groupdto.groupno}&pagenum=1'">자유게시판</button></li>
					<li><button class="btn brows-btn"
							onclick="location.href='imgBoardList.do?groupno=${groupdto.groupno}&pagenum=1'">사진게시판</button></li>
					<li><button class="btn brows-btn"
							onclick="location.href='moim.do?groupno=${groupdto.groupno}'">소모임일정</button></li>
					<li><button class="btn brows-btn" id="stream">스트림</button></li>
                	<li><button class="btn brows-btn" onclick="location.href='pullstream.do?groupnum=${groupdto.groupno}'">라이브</button></li>
					<li><button class="btn brows-btn" id="chatting">채팅</button></li>
				</ul>
			</div>
		</div>
	</c:if>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#chatting").click(
							function() {
								window.open(
										"chat.do?groupnum=${groupdto.groupno}",
										"a",
										"width=400,height=550,left=100,top=50")

							});

					if ($("#join").val() == "가입하기") {
						$("#menu2").hide();
					} else {
						$("#menu2").show();
					}
					
					
					$("#stream").click(function(){
						alert("실행");
				   		 window.open("stream.do?groupnum=${groupdto.groupno}","a","width=400,height=550,left=100,top=50");
						
					});	

					
					
				});
	</script>

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
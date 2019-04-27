<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>On & Off | 마이페이지</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- All Plugin Css -->
<link rel="stylesheet" href="css/plugins.css">

<!-- Style & Common Css -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">

<style>
body {
	margin: 20px auto;
	padding: 0;
	font-family: "맑은 고딕";
	font-size: 1.5em;
}

ul#navi {
	width: 200px;
	text-indent: 10px;
} 

ul#navi, ul#navi ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

li.group {
	margin-bottom: 3px;
}

ul.sub li {
	margin-bottom: 2px;
	height: 35px;
	line-height: 35px;
	background: #f4f4f4;
	cursor: pointer;
}

ul.sub li a {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	color: #000;
}

ul.sub li:hover {
	background: #da0833;
}

footer {
position:fixed;
left: 0;
right: 0;   
bottom:0px;
width:100%;
}	
</style>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("#myPage").load("groupUpdate.do?groupno=${groupno}");
		
		$("#groupUpdate").click(function() {
			$("#myPage").load("groupUpdate.do?groupno=${groupno}");
		});

		$("#userInGroup").click(function() {
			$("#myPage").load("userInGroup.do?groupno=${groupno}");
		});

		$("#d3").click(function() {
			$("#myPage").load("D3.do?groupno=${groupno}");
		});

		$("#delGroupinfo").click(function() {
			if(confirm("그룹을 삭제하시겠습니까?")){
				$("#myPage").load("delGroupinfo.do?groupno=${groupno}");
			}else {
				$("#myPage").load("groupUpdate.do?groupno=${groupno}");  
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



	<table>
		<tr>
			<td valign="top">

				<ul id="navi">
					<li class="group">
						<ul class="sub">
							<li><a id="groupUpdate">그룹 정보 수정</a></li>
							<li><a id="userInGroup">회원 조회</a></li>
							<li><a id="d3">설문조사 통계</a></li>
							<li><a id="delGroupinfo">그룹 삭제</a></li>
							<!-- 관리자/주최자 권한 if문 -->
						</ul>
					</li>
				</ul>

			</td>

			<td style="width: 83%;">
				<div id="myPage" style="margin:50px 50px;  width: 100%;"></div>
			</td>
		</tr>
	</table>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/owl.carousel.min.js"></script>
		<script src="js/bootsnav.js"></script>
		<script src="js/main.js"></script>
</body>
</html>
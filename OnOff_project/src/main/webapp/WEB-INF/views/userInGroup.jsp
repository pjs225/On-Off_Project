<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>마이페이지</title>
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

#calendar {
	max-width: 75%;
}
</style>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script>

</script>

</head>
<body>	
<div id="where">
		<span><a href="mypage.do">마이페이지 > </a></span> <span>그룹관리 > </span> <span><a href="#">회원조회</a></span>
</div>
	<section class="regist-wrapper">
		<div class="container">
			<div class="col-md-12">
				<div class="row">
					<form>
						<div class="basic-information" style="width:70%;text-align:center;">
							<div class="col-md-9 col-sm-9">
								<div class="profile-content">
									<ul class="information">
										<li><span style="margin-left:20px;">아이디</span><span style="margin-left:40px;">등급</span><span style="margin-left:40px;">가입날짜</span></li>
										<c:choose>
										<c:when test="${empty groupuserdto }">
											<h3>가입된 회원이 없습니다.</h3>
										</c:when>
										<c:otherwise>
										<c:forEach items="${groupuserdto }" var="groupuserdto">	
											<li><span style="margin-left:20px;">${groupuserdto.userid }</span><span style="font-weight:normal;margin-left:40px;">${groupuserdto.groupusergrade }</span><span style="font-weight:normal;margin-left:40px;"><fmt:formatDate value="${groupuserdto.groupuserregdate }" pattern="yyyy-MM-dd"/></span></li>
										</c:forEach>	
										</c:otherwise>
										</c:choose>
									</ul>	
											
								</div>
							</div>
						</div>
						
						<div class="row">
						<input type="button" class="btn brows-btn" value="마이페이지로 돌아가기" id="backbtn" style="margin-right:355px;"
							onclick="location.href='mypage.do'" />
						</div>

					</form>	
				</div>
			</div>
		</div>
		</section>
		
		
</body>
</html>
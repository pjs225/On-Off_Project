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

</head>
<body>
	<div id="where">
		<span>마이페이지 > </span> <span><a href="#">그룹관리</a></span>
	</div>
	<input type="button" class="btn brows-btn2" value="그룹 생성하기" id="btn_update" onclick="location.href='groupInsert.do'" />
<div class="companies">

	<!-- 여기에서 포문 시작 -->
	<c:choose>
	<c:when test="${empty list }">
		<h3>저장된 그룹이 없습니다.</h3>
	</c:when>
	<c:otherwise>
	<c:forEach items="${list }" var="dto">	
		<div class="company-list" style="min-width: 80%;">
			<div class="row" onclick="location.href='myGroupManagerPage.do?groupno=${dto.groupno}'">
				<div class="col-md-2 col-sm-2">
					<div class="company-logo">
						<img src="${dto.groupimg }" class="img-responsive" alt="" />
					</div>
				</div>
				<div class="col-md-10 col-sm-10">
					<div class="company-content">
						<h3>
							${dto.grouptitle }<span class="full-time" ><fmt:formatDate value="${dto.groupregdate }" pattern="yyyy-MM-dd"/></span>
						</h3>
						<p>
							<span class="company-name">${dto.groupcontent }</span>
						</p>
					</div>
				</div>
			</div>		
		</div>
		
	</c:forEach>	
	</c:otherwise>
	</c:choose>
	<!-- 여기세서 포문 종료 -->

</div>

	
</body>
</html>
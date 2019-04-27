<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8"); //받아올 데이터의 인코딩
  String groupno = request.getParameter("groupno"); //넘겨오는 데이터중에 irum속성을 가져옴
  %>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title> On & Off | 설문조사</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://unpkg.com/jquery"></script>
<!-- Your platform (jquery) scripts. -->
<script src="https://surveyjs.azureedge.net/1.0.73/survey.jquery.min.js"></script>

<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<style type='text/css'>
.btn-green {
	background-color: #1ab394;
	color: #fff;
	border-radius: 3px;
}

.btn-green:hover, .btn-green:focus {
	background-color: #18a689;
	color: #fff;
}

.panel-footer {
	padding: 0 15px;
	border: none;
	text-align: right;
	background-color: #fff;
}

</style>
<script src="https://unpkg.com/surveyjs-widgets/surveyjs-widgets.js"></script>

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
		
        <div id="surveyElement"></div>
        <div id="surveyResult"></div>

	<!-- survey section start -->
	<section class="login-wrapper">
		<div class="container">
			<div class="col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2">
				<div id="surveyContainer"></div><!-- 설문조사  -->
			</div>
		</div>
	</section>
	<!-- survey section End -->
	
<script type="text/javascript">
Survey.Survey.cssType = "bootstrap";

var surveyJSON = 	

	{
		pages : [ {
			name : "page1",
			elements : [ {
				type : "radiogroup",
				name : "Q1",
				title : "장소는 적당했는가?",
				isRequired : true,
				choices : [ {
					value : "0",
					text : "Bad"
				}, {
					value : "5",
					text : "So So"
				}, {
					value : "10",
					text : "Good"
				} ]
			}, {
				type : "radiogroup",
				name : "Q2",
				title : "분위기는 좋았는가?",
				isRequired : true,
				choices : [ {
					value : "0",
					text : "Bad"
				}, {
					value : "5",
					text : "So So"
				}, {
					value : "10",
					text : "Good"
				} ]
			}, {
				type : "radiogroup",
				name : "Q3",
				title : "주최자는 친절했는가?",
				isRequired : true,
				choices : [ {
					value : "0",
					text : "Bad"
				}, {
					value : "5",
					text : "So So"
				}, {
					value : "10",
					text : "Good"
				} ]
			}, {
				type : "radiogroup",
				name : "Q4",
				title : "주제에 잘 맞는 모임인가?",
				isRequired : true,
				choices : [ {
					value : "0",
					text : "Bad"
				}, {
					value : "5",
					text : "So So"
				}, {
					value : "10",
					text : "Good"
				} ]
			}, {
				type : "radiogroup",
				name : "Q5",
				title : "본인에게 유익하였나?",
				isRequired : true,
				choices : [ {
					value : "0",
					text : "Bad"
				}, {
					value : "5",
					text : "So So"
				}, {
					value : "10",
					text : "Good"
				} ]
			}, {
				type : "text",
				name : "Q6",
				title : "자유로운 의견을 작성해 주세요",
				isRequired : true
			} ]
		} ]
	};
	
	function sendDataToServer(survey) {
		//send Ajax request to your web server.
		var allData = survey.data; //object
		allData["groupno"]="<%=groupno%>";
		//alert("The results are:" + JSON.stringify(allData)); //{"Q1":"10","Q2":"10","Q3":"10","Q4":"5","Q5":"10","Q6":"ㅎㅎ"}
		$.ajax({
			url : "surveyResult.do",
			type : "GET",
			data : allData,
			success : function(data) {
				if(data=='o'){
					alert("설문조사에 응해주셔서 감사합니다.");
					location.href = "mypage.do";			
					self.close;
				}else {
					alert("이미 이 그룹에 대한 설문조사를 마치셨습니다.");
					location.href = "mypage.do";			
					self.close;
				}	
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("ajax전송중에 문제가 생겼습니다.\n" + textStatus + " : " + errorThrown);
				self.close;
			}
		});
	}

	var survey = new Survey.Model(surveyJSON);
	$("#surveyContainer").Survey({
		model : survey,
		onComplete : sendDataToServer
	});
</script>

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
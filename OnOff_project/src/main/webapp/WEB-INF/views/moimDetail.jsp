<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" >
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
	
	.up-box{
		font-size: 40px;
		border-bottom: 1px solid black;
		padding-bottom: 30px;
		word-wrap:break-word;
		height: 100px;
		background-color: white;
	}
	
	.down-box{
		padding-top: 30px;
		word-wrap:break-word;
		height: auto;
		background-color: white;
	}
	
	.map-box{
		
		padding-top: 30px;
		word-wrap:break-word;
		padding-left: 700px;
		height: 400px;
		background-color: white;
		
	}
	
	img{
		max-width: 50%;
	}
	
	
	
	
	</style>


	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<script type="text/javascript">
	
	
	$(function () {
		
		/* alert($("#ri").val()); */
		
		var insertid = $("#ri").val();
		var sessionid = $("#di").val();
		
		
		if(insertid == sessionid){
			
			$("#moimjoin").hide();
			$("#moimout").hide();
		}else{
			$("#moimedit").hide();
			$("#moimdelete").hide();
		};
	});
	
	function moimjoin() {
		
		$.ajax({
			type:"GET",
			url:"moimjoin.do?moimno="+${res.moimno}+'&groupno='+${groupno}+"&userid="+$("#di").val(),
			success: function(msg) {
				
				alert(msg);
				
			},error: function() {
				alert("에러");
				
			}
			
		});
		
		
		
		/* location.href="moimjoin.do?moimno="+${res.moimno}+'&groupno='+${groupno}+"&userid="+$("#di").val();
		 */
		
	}
	
	
	function moimout() {
		
		$.ajax({
			type:"GET",
			url:"moimout.do?moimno="+${res.moimno}+'&groupno='+${groupno}+"&userid="+$("#di").val(),
			success: function(msg) {
				
				alert(msg);
				
			},error: function() {
				alert("에러");
				
			}
			
		});
		
		/* location.href="moimout.do?moimno="+${res.moimno}+'&groupno='+${groupno}+"&userid="+$("#di").val();
		 */
	}
	</script>
	
	



    </head>
	
    <body>
	<input type="text" value="${res.userid }" id="ri" style="display: none;">
	<input type="text" value="${dto.userid }" id="di" style="display: none;">
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


	
    <!-- Main jumbotron for a primary marketing message or call to action -->
	<section class="inner-banner" style="backend:#242c36 url(https://via.placeholder.com/1920x600)no-repeat;">
		<div class="container">
			<div class="caption">
				<h2>선택한 일정</h2>
				<p>현재 진행 예정인 모임<span>ㅇㅇ</span></p>
			</div>
		</div>
	</section>
	
<!-- 	<section class="jobs">
		<div class="container">
			<div class="row heading">
				<h2></h2>
				<p>참여를 원하는 곳에 참가신청을 하세요</p> 
			</div>
		</div>
	</section> -->
	
	<section>
		
		<div class="up-box" style="display: block; padding-left: 700px;">
			
<%-- 			<p>${editTitle }</p>
 --%>			<p>제목 : ${res.moimtitle }</p>
		
		</div>
			
		<div class="down-box" style="display: block; padding-left: 700px;" >
			
				<p>주최자 : ${res.userid }</p>
				<p>모집인원 : ${res.moimrecruit }</p>
				<p>모임 위치 : ${res.moimaddr }</p>
				<p>모집 기간 : ${res.moimenddate}</p>
				<p>모임 날짜 : ${res.moimdate }</p>
		
				<p>내용 : ${res.moimcontent }</p>
					
				
			
		</div>
		
		
		
		<div class="map-box" >
		<p style="font-size: 40px;"><모임장소></p>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d1595fcdba49530de07a8fead7b83da"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d1595fcdba49530de07a8fead7b83da&libraries=services,clusterer,drawing"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(${res.lat }, ${res.lng }),// 지도의 중심좌표
			level: 3                   // 지도의 확대 레벨
		};

		var map = new daum.maps.Map(container, options); // 지도를 생성합니다
		
		
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(${res.lat }, ${res.lng }); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
		
		
	</script>
		
		</div>
		
		</br>
		</br>
		</br>
		</br>
		<button class="btn brows-btn" id="moimjoin" style="display: inline-block; margin-left: 700px;" onclick="moimjoin();">참가신청</button>
		<button class="btn brows-btn" id="moimout" style="display: inline-block; margin-left: 260px;" onclick="moimout();">참가취소</button>
		<button class="btn brows-btn" id="moimedit" style="display: inline-block; margin-left: 700px;" onclick="location.href='moimedit.do?moimno=${res.moimno}&groupno=${groupno}'">수정하기</button>
		<button class="btn brows-btn" id="moimdelete" style="display: inline-block; margin-left:260px;" onclick="location.href='moimdelete.do?moimno=${res.moimno}&groupno=${groupno}'">삭제하기</button>
		
	</section>		

<br></br>
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
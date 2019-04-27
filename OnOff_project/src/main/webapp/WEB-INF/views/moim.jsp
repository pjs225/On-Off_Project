<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<!doctype html>
<html class="no-js" lang="en">
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

	<!-- 달력 css/script -->	
    <link href='css/fullcalendar.min.css' rel='stylesheet' />
	<link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script src='js/moment.min.js'></script>
	<script src='js/fullcalendar.min.js'></script>


	<style type="text/css">
	
	.left-box{
		float:left;
		width: 70%;
		border-right: 1px solid black;
		padding-right: 30px;
		word-wrap:break-word;
		height: 600px;
		background-color: white;
		padding-left: 350px;
		
		
	} 
	
	.right-box{
		float: right;
		width: 30%;
		padding-left: 20px;
		word-wrap:break-word;
		height: 600px;
		background-color: white;
	}
	
	
	#calendar{
		height:600px;
	
	}
		
	table.blueTable {
  border: 1px solid #1C6EA4;
  background-color: #EEEEEE;
  border-collapse: collapse;
    }
    
    table.blueTable td, table.blueTable th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
	}
	
	
	
	table.blueTable tr:nth-child(even) {
  background: #D0E4F5;
	}
	
	table.blueTable thead {
  background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  border-bottom: 2px solid #444444;
	}
	
	table.blueTable thead th {
  font-size: 15px;
  font-weight: bold;
  color: #FFFFFF;
  border-left: 2px solid #D0E4F5;
	}
    
    table.blueTable thead th:first-child {
  border-left: none;
	}
	
	table.blueTable tfoot {
  font-size: 14px;
  font-weight: bold;
  color: #FFFFFF;
  background: #D0E4F5;
  background: -moz-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: -webkit-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: linear-gradient(to bottom, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  border-top: 2px solid #444444;
	}
	
	table.blueTable tfoot td {
  font-size: 14px;
	}
	
	table.blueTable tfoot a{
  display: inline-block;
  background: #1C6EA4;
  color: #FFFFFF;
  padding: 2px 8px;
  border-radius: 5px;
	}
	

	table.blueTable tfoot {
  text-align: right;
	}
	</style>



		<script>
		 
		$(document).ready(
				function() {
					//{"title":"value"}
					//{title:}
					
					$.ajax({
					type:"GET",
					url:"calAjax.do?groupno="+${groupno},
//					data: {groupno:${groupno}},
					success: function(msg) {
						
						//String을 JSON형식으로 파싱
						var jsonMsg = JSON.parse(msg);
						
						//객체생성
						var test = [];
						
						//반복문으로 createObj 메소드를 반복적으로 실행해서 리턴받은 객체를 test배열에 push로 반복해서 넣어줌
						for(var i=0; i<jsonMsg.events.length; i++){
							
							test.push(createObj(jsonMsg.events[i].start,jsonMsg.events[i].title,jsonMsg.events[i].addr,jsonMsg.events[i].url));
							
						};
						
						/* alert(test); */
						
						//달력에 배열을 넣어줌
						$('#calendar').fullCalendar(
							{
								events:test
								
							}		
						);
						
					},error: function() {
						alert("에러");
						
					}
					});
					/* 
					//ajax로 접근해서 데이터 받아와야겠는데여
					$('#calendar').fullCalendar(
							{	
								 events :  [
										{
											title : '제목 : ' + '받자' + '\n장소 : '
													+ '받자' + '\n시간 : ' + '받자',
											url : 'http://naver.com/',
											start : '2019-03-01'
										},
										{
											title : '제목2 : ' + '받자' + '\n장소2 : '
													+ '받자' + '\n시간2 : ' + '받자',
											start : '2019-03-01'
										}, {
											title : 'Click for Google',
											url : 'http://google.com/',
											start : '2019-03-28'
										},{
											title : 'Click for Google',
											url : 'http://google.com/',
											start : '2019-03-28'
										},
										
										
										
										] 
							});
	 */
				});
		
		function createObj(startVal,titleVal,addrVal,urlVal){
			return {
				start : startVal,
				title : '제목:' + titleVal + '\n장소:' + addrVal,
				url : urlVal
			}
		}
		
		
		
		
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


	
    <!-- Main jumbotron for a primary marketing message or call to action -->
	<section class="inner-banner" style="backend:#242c36 url(https://via.placeholder.com/1920x600)no-repeat;">
		<div class="container">
			<div class="caption">
				<h2>소모임 일정</h2>
				<p>현재 진행 예정인 모임<span></span></p>
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
		
		<div class="left-box">
			
				<form action="" method="post">
					<h1 style="font-size:40px;">일정</h1>
					<input type="hidden" value="">
							<table class="blueTable" border="1">
								<%-- 	<col width="50px"> --%>
									<col width="450px">
									<col width="100px">
									<col width="100px">
								<thead>	
								<tr id="">
								<!-- 	<th>No.</th> -->
									<th>진행중인 일정</th>
									<th>주최자</th>
									<th>작성일자</th>
								</tr>
								</thead>
								<c:choose>
								<c:when test="${empty list }">
									<tr>
										<td style="text-align: center;">소모임 일정이 없습니다 :(</td>
									</tr>
								</c:when>
									<c:otherwise>
										<c:forEach items="${list }" var="dto">
									
								<tr>
								<%-- 	<td>${dto.moimno }</td> --%>
									<td><a href="moimDetail.do?moimno=${dto.moimno }&groupno=${groupno}">${dto.moimtitle }</a></td>
									<td>${dto.userid }</td>
									<td><fmt:formatDate value="${dto.moimregdate }" pattern="yyyy-MM-dd"/></td>
								</tr>		
									
										</c:forEach>
									</c:otherwise>
								</c:choose>
						
						


							<tfoot>
								 <tr>
			 						<td colspan="3">
			 							<input type="button" value="일정 만들기" onclick="location.href='moimwrite.do?groupno=${groupno}'" style="background-color: #1C6EA4; font-weight:bold;">
			 							     <div id="paging" style="font-weight:bold; display: inline-block;" >
       
        <c:if test="${pageMaker.prev}">
         <a href="moim.do?page=${startPage - 1}&groupno=${groupno}">이전&nbsp;&nbsp;&nbsp;&nbsp;</a>
        </c:if> 
         
        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
         <a href="moim.do?page=${idx}&groupno=${groupno}">${idx}&nbsp;&nbsp;</a>
        </c:forEach>
          
        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
         <a href="moim.do?page=${pageMaker.endPage + 1}&groupno=${groupno}">&nbsp;&nbsp;다음</a>
        </c:if> 
      
      </div>
									</td>
									
								</tr>
								</tfoot>	
							</table>						

<%-- 

      <div id="paging" style="padding-left:350px;font-weight:bold;">
       
        <c:if test="${pageMaker.prev}">
         <a href="moim.do?page=${startPage - 1}&groupno=${groupno}">이전&nbsp;&nbsp;&nbsp;&nbsp;</a>
        </c:if> 
         
        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
         <a href="moim.do?page=${idx}&groupno=${groupno}">${idx}&nbsp;&nbsp;</a>
        </c:forEach>
          
        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
         <a href="moim.do?page=${pageMaker.endPage + 1}&groupno=${groupno}">&nbsp;&nbsp;다음</a>
        </c:if> 
      
      </div>
 --%>

				</form>
		</div>
		<div class="right-box">
		
			<div id="calendar"></div>
			
			<%-- <jsp:include page="myCal.jsp"></jsp:include> --%>
			<%-- 	<%@ include file="myCal.jsp" %> --%>
			
		</div>
	</section>		


      <!-- footer start -->
      <footer>
         <div class="copy-right">
          <p>&copy;Copyright 2018 Final Project | Design By <a href="#"> Kh정보교육원_On조 </a></p>
         </div>
      </footer>
		 
<!-- 		<script type="text/javascript" src="js/jquery.min.js"></script> -->
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/owl.carousel.min.js"></script>
		<script src="js/bootsnav.js"></script>
		<script src="js/main.js"></script>
    </body>
</html>
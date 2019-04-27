<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>On & Off | 채팅</title>
<style type="text/css">
#data{
	height: 300px;
	overflow: auto;
}
#data::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 10px;
	background-color: #F5F5F5;
}
#data::-webkit-scrollbar {
	width: 10px;
	background-color: #F5F5F5;
}
#data::-webkit-scrollbar-thumb{
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
	background-color: #555;
}
.writeInput {
    border: 1px solid #ccc;
    border-radius: 2px;
    margin-bottom: 10px;
    box-shadow: none;
    font-size: 14px;
    text-transform: uppercase;
    border-radius: 2px;
    box-shadow: none;
    padding: 10px 25px;
}
</style>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- All Plugin Css -->
<link rel="stylesheet" href="css/plugins.css">
<!-- Style & Common Css -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<%
	String id = (String)request.getAttribute("id");
	String groupnum = (String)request.getAttribute("groupnum");
	System.out.println(id + " : " + groupnum);
	
	//session.setAttribute("groupnum",groupnum);	
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script src="js/bootsnav.js"></script>
<script src="js/main.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#sendBtn").click(function() {
		sendMessage();
	});
});
var sock;
//웸소켓을 지정한 url로 연결한다.   
sock = new SockJS("<c:url value="/echo"/>");
/*
(1) onopen : 웹 소켓이 열리면 호출
(2) onmessage : 메시지가 도착하면 호출	
(3) onerror : 에러가 발생하면 호출
(4) onclose : 웹 소켓이 닫히면 호출
(5) send : 메시지 전송
(6) close : 웹 소켓 닫기
*/
//sock.onopen = onOpen;
//자바스크립트 안에 function을 집어넣을 수 있음.
//데이터가 나한테 전달되었을 때 자동으로 실행되는 function
sock.onmessage = onMessage;
//데이터를 끊고싶을때 실행하는 메소드
sock.onclose = onClose;
function sendMessage() {
	// websocket으로 메세지를 보내겠다.
	sock.send($("#message").val());
	$("#message").val('');
}

function onMessage(evt) {
	// evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
	var data = evt.data;
	var sessionid = null;
	var message = null;
	// evt 문자열 split
	var strArray = data.split('|');
	
	sessionid = strArray[0];
	message = strArray[1];
	
	$("#data").append(data + "<br/>");
	$("#data").animate({ scrollTop: $('#data').prop("scrollHeight")}, 0);
		
}
function onClose(evt) {
	$("#data").append("연결 끊김");
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


	
		<!-- login section start -->
		<section class="login-wrapper" style="padding-top: 0px;">
			<div class="container">
				<div class="col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2">
				<p>모 임 이 름<a href="">다모여</a></p>
<!-- 					<img class="img-responsive" alt="logo" src="img/logo.png">	 -->
					<div id="popupchat">
						<div id="data" class="form-control input-lg"></div>
						<span><%=id %></span>
						<input type="text" id="message" class="writeInput" style="width: 200px;" onkeypress="if(event.keyCode==13){sendMessage();}" /> 
						<input type="button" id="sendBtn" class="btn btn-primary" value="send"/>
					</div>
				</div>
			</div>
		</section>
		<!-- login section End -->	
		
      <!-- footer start -->
      <footer>
         <div class="copy-right">
          <p>&copy;Copyright 2018 Final Project | Design By <a href="#"> Kh정보교육원_On조 </a></p>
         </div>
      </footer>

</body>
</html>

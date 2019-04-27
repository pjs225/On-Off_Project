<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    </head>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>   
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
        $("#id").keydown(function(key) {
            if (key.keyCode == 13) {
              login();
            }
        });
        $("#pw").keydown(function(key) {
            if (key.keyCode == 13) {
              login();
            }
        });
    });
	//일반 로그인
	function login(){
		
		var idVal = $("#id").val();
		var pwVal = $("#pw").val();
		
		if(idVal == null || idVal==""){
			alert("아이디를 확인해 주세요");
		}else if(pwVal == null || pwVal==""){
			alert("비밀번호를 확인해 주세요");
		}else{
			
			$.ajax({
				type:"post",
				url:"loginajax.do",
				data:"id="+idVal+"&pw="+pwVal,
				success:function(msg){
					if(msg.loginchk == true){
						location.href="index.jsp";
					}else{
						alert("잘못 입력했습니다.");
					}
				},
				error:function(){
					alert("로그인 실패");
				}				
			});			
		}	
	}
	
	</script>
	<style>
	body {
    min-height: 100%;
}
footer {
position:fixed;
left: 0;
right: 0;   
bottom:0px;
width:100%;
}	
	</style>
    <body>
<script type="text/javascript">
var msg = '${msg }';
if(msg != ""){
	alert(msg);
}
</script>	
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
		<section class="login-wrapper">
			<div class="container">
				<div class="col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2">
					<!-- <form> -->
						<img class="img-responsive" alt="logo" src="img/logo.png">
						<input type="text" class="form-control input-lg" placeholder="User ID" id="id">
						<input type="password" class="form-control input-lg" placeholder="Password" id="pw">
						<label><a href="forgetPassword.do">Forget Password?</a></label>
						<button type="button" class="btn btn-primary" onclick="login();">Login</button>
						<p>Have't Any Account <a href="registUser.do">Create An Account</a></p>
					<!-- </form> -->
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
		 
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/owl.carousel.min.js"></script>
		<script src="js/bootsnav.js"></script>
		<script src="js/main.js"></script>
    </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	function dropUser(){
		var confirm = window.confirm("정말 탈퇴하겠습니까?");
		
		if(confirm==true){
			location.href="dropUser.do";
			
			/* $.ajax({
				type:"post",
				url:"dropUser.do",
				success:function(msg){
					if(msg.dropchk == true){
						alert("성공적으로 탈퇴되었습니다.");
						location.href="home.do";
					}else{
						alert("시스템 오류로 탈퇴에 실패했습니다. 다시 시도하십시오.");
					}
				},
				error:function(){
					alert("탈퇴 실패");
				}				
			}); */		
		} 
	}
	
	$(function() {
		
		$("#btn_update").click(function() {
			$("#myPage").load("updateMyInfo.do");
		});

	});
</script>

</head>
<body>	
<div id="where">
<span>마이페이지 > </span> <span><a href="#">내정보</a></span>
</div>
	<section class="regist-wrapper">
		<div class="container">
			<div class="col-md-12">
				<div class="row">
					<form>
						<div class="basic-information">
							<div class="col-md-9 col-sm-9">
								<div class="profile-content">
									<ul class="information">
										<li><span>아이디</span><label style="font-weight:normal;">${dto.userid }</label></li>
										<li><span>이름</span><label style="font-weight:normal;">${dto.username }</label></li>
										<li><span>성별</span><label style="font-weight:normal;">${dto.usergender }</label></li>
										<li><span>생년월일</span>${dto.userbirth }<label></label></li>
										<li><span>이메일</span>${dto.useremail }<label></label></li>
										<li><span>휴대전화</span>${dto.userphone }<label></label></li>
										<li><span>주소</span>${dto.useraddr }<label></label></li>
									</ul>	
											
								</div>
							</div>
						</div>

						<div id="twobtn">
						<input type="button" class="btn brows-btn2" value="수정하기" id="btn_update" />
						<input type="button" class="btn brows-btn2" value="탈퇴하기" id="btn_delete" onclick="dropUser();" />
						</div>
					</form>	
				</div>
			</div>
		</div>
		</section>
		
		
</body>
</html>
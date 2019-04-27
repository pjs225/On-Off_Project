<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html class="no-js">

	<head>
	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>On & Off | 자유 글쓰기</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- All Plugin Css -->
		<link rel="stylesheet" href="css/plugins.css">
		
		<!-- Style & Common Css -->
		<link rel="stylesheet" href="css/common.css">
		<link rel="stylesheet" href="css/main.css">
		
		<script src="https://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
		
		<script type="text/javascript">
			$(function() {
				//전역변수
				var obj = [];
				//스마트에디터 프레임생성
				nhn.husky.EZCreator.createInIFrame({
					oAppRef : obj,
					elPlaceHolder : "editor",
					sSkinURI : "./resources/editor/SmartEditor2Skin.html",
					htParams : {
						// 툴바 사용 여부
						bUseToolbar : true,
						// 입력창 크기 조절바 사용 여부
						bUseVerticalResizer : true,
						// 모드 탭(Editor | HTML | TEXT) 사용 여부
						bUseModeChanger : true,
					}
				});
				//전송버튼
				$("#updateImgBoard").click(function() {
					//id가 smarteditor인 textarea에 에디터에서 대입
					obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
					//폼 submit
					$("#updateImgBoardFrm").submit();
				});
				
				
			});
			
			
		</script>
		
		<script type="text/javascript">

			var openWin;
	
			 function openPre()
		     {
		         // window.name = "부모창 이름"; 
		         window.name = "parentForm";
		         // window.open("open할 window", "자식창 이름", "팝업창 옵션");
		         openWin = window.open("preView.do",
		                 "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
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
	
		<section class="profile-detail">
			<div class="container">
				<div class="col-md-12">
					<div class="row">
						<div class="basic-information">
							<div class="col-md-9 col-sm-9">
								<div class="profile-content">
									<!-- <h2> -->
									<!-- 	Daniel Duke<span>Web designer</span> -->
									<!-- </h2> -->
									<!-- <p>Soft Techi Infoteck Pvt.</p> -->
									<form action="imgBoardUpdateRes.do" id="updateImgBoardFrm" enctype="multipart/form-data">
										<ul class="information">
											<li><span>모임명</span><input type="text" name="imgboardtitle" value="${imgboarddto.imgboardtitle }" readonly="readonly"></li>
											<li>
												<span>대표이미지<br/><br/><br/><br/><br/></span>
												<div class="features-content" style="float: none; max-width: 100%; display: inline-block; ">
													<div style="max-width: 600px;">
														<img style="width: 100%;" id="inimg" class="sampleimg" src="${imgboarddto.imgboardimg }" />
													</div>
													<div>
                										<input type="button" class="btn brows-btn" value="이미지 등록" onclick="openPre()">
                										<input type="hidden"  id="intext" name="imgboardimg" value="${imgboarddto.imgboardimg }" />
            										</div>
												</div>
											</li>
											
											<li>
												<span>한마디 및 사진 등록</span>
												<textarea name="imgboardcontent" id="editor" style="width: 700px; height: 400px;">${imgboarddto.imgboardcontent }</textarea>
											</li>
											<li>
												<span>참여자</span>
												<span></span>
											</li>
										</ul>
										
										<!-- hidden을 이용하여 나머지 값을 다 받아 옵시당 여기에 userid가 필요합니다. -->
										<input type="hidden" name="imgboardno" value="${imgboarddto.imgboardno }"/>
										<input type="hidden" name="moimno" value="${imgboarddto.moimno }"/>
										<input type="hidden" name="userid" value="${dto.userid }"/>
										<input type="hidden" name="groupno" value="${imgboarddto.groupno }"/>
									</form>
								</div>
							</div>
						</div>
	
						<!-- 글쓰기버튼 -->
						<div class="row">
							<input type="button" class="btn brows-btn" value="수정하기" id="updateImgBoard" />
							<input type="button" class="btn brows-btn" value="뒤로가기" onclick="history.back(); return false;" />			
						</div>
					</div>
				</div>
			</div>
		</section>
	
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
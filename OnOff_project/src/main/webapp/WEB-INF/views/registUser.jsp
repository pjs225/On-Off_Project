<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
    
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
	
	// 아이디 중복 확인
	function id_check(){
		var id = document.getElementById("id");
		if(id.value.trim()==""||id.value==null){
			alert("아이디를 입력해 주세요");
		}else{
			open("idchk.do?id=" + id.value, "", "width=250,height=130");
		}
	}
	
	
	// 비밀번호 확인
	function isSame(){
		var pw = document.getElementById("pw").value;
		var pw_chk = document.getElementById("pw_chk").value;
		if(pw.length<7){
			alert("비밀번호는 7자리 이상 설정 가능합니다.");
			document.getElementById("pw").value="";
			document.getElementById("pw_chk").value="";
		} else if(document.getElementById("pw").value!="" && document.getElementById("pw_chk").value!=""){
			if(document.getElementById("pw").value==document.getElementById("pw_chk").value){
				document.getElementById("same").innerHTML="비밀번호가 일치합니다.";
				document.getElementById("same").style.color="blue";
			} else {
			document.getElementById("same").innerHTML="비밀번호가 일치하지 않습니다.";
			document.getElementById("same").style.color="red";
			}
		}
	}


	// 우편번호 찾기
    function DaumPostCode() {

        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   // document.getElementById("extraAddress").value = extraAddr;
                
                } /* else {
                    document.getElementById("extraAddress").value = '';
                } */

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
               // document.getElementById("detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                document.getElementById('layer').style.display = 'none';
                
                
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(document.getElementById('layer'));

        // iframe을 넣은 element를 보이게 한다.
        document.getElementById('layer').style.display = "block";

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 document.getElementById('layer')의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        document.getElementById('layer').style.width = width + 'px';
        document.getElementById('layer').style.height = height + 'px';
        document.getElementById('layer').style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        document.getElementById('layer').style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        document.getElementById('layer').style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
    
    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        document.getElementById('layer').style.display = 'none';
    }
    
    
 	// 폼 다 채워졌나 확인
    function nullChk(){
    	if(document.getElementById("id").value==""||document.getElementById("pw").value==""||document.getElementById("pw_chk").value==""
    			||document.getElementById("name").value==""||document.getElementById("email").value==""
    			||document.getElementById("phone").value==""||document.getElementById("address").value=="" || document.getElementById("captchares").innerHTML==""){
    		alert("양식을 모두 작성해주세요");
    	} else if(document.getElementById("captchares").innerHTML=="다시 입력하십시오.") {
    		alert("자동 등록 방지를 확인해주세요");
    	} else if(document.getElementById("idchk").value=="1"){
    		alert("아이디 중복 확인을 해주세요");
    	}else {
    		document.getElementById("registform").submit();
    	}
    }
	
    $(document).ready(function() {
    	
    	
    	
	    
    
    // 자동 등록 방지	
		$.ajax({
			url : "captcha.do",
			dataType:"json",
			success : function(data) {
				console.log(decodeURIComponent(data.key));
				$("#captchakey").val(decodeURIComponent(data.key));
				$("#captchaimg").attr("src","captchaImage/"+decodeURIComponent(data.captchaImageName));
			},
			error : function(jqXHR, textStatus, errorThrown){
				console.log('ERRORS: ' + textStatus);
			}
		});
		
		$("#refresh").on("click",function(){
			$.ajax({
				url : "captcha.do",
				dataType:"json",
				success : function(data) {
					console.log(decodeURIComponent(data.key));
					$("#captchakey").val(decodeURIComponent(data.key));
					$("#captchaimg").attr("src","captchaImage/"+decodeURIComponent(data.captchaImageName));
				},
				error : function(jqXHR, textStatus, errorThrown){
					console.log('ERRORS: ' + textStatus);
				}
			});
		});
		$("#btn_captcha").on("click",function(){
			var key = $("#captchakey").val();
			var value = $("#captchavalue").val();
			console.log(key);
			console.log(value);
			$.ajax({
				url : "captcha.do",
				data : "key="+key+"&value="+value,
				dataType:"json",
				success : function(data) {
					if(decodeURIComponent(data.result)=="true"){
						document.getElementById("captchares").innerHTML="확인됐습니다.";
						document.getElementById("captchares").style.color="blue";
					} else {
						document.getElementById("captchares").innerHTML="다시 입력하십시오.";
						document.getElementById("captchares").style.color="red";
						$("#refresh").trigger("click");
					}
					
				},
				error : function(jqXHR, textStatus, errorThrown){
					console.log('ERRORS: ' + textStatus);
				}
			});
		});
	});
    
	</script>

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


		
		<!-- regist section start -->
		<section class="regist-wrapper">
		<div class="container">
			<div class="col-md-12">
				<div class="row">
					<form action="regist.do" id="registform" method="post">
					<div class="basic-information">
						<div class="col-md-9 col-sm-9">
							<div class="profile-content">
								<ul class="information">
									<li><span>아이디</span><input type="text" name="userid" id="id">&nbsp;&nbsp;<a href="javascript:id_check();" style="font-weight:bold;">[아이디 중복 확인]</a><input type="hidden" id="idchk" value="1"/></li>
									<li><span>비밀번호</span><input type="password" name="userpw" id="pw" onchange="isSame()">&nbsp;&nbsp;7자리 이상</li>
									<li><span>비밀번호 확인</span><input type="password" id="pw_chk" onchange="isSame()">&nbsp;&nbsp;<span id="same" style="width:300px;"></span></li>
									<li><span>이름</span><input type="text" name="username" id="name"></li>
									<li><span>성별</span>여성&nbsp;<input type="radio" name="usergender" id="gen_w" value="여성" checked />&nbsp;남성&nbsp;<input type="radio" name="usergender" id="gen_m" value="남성"></li>
									<li><span>생년월일</span><input type="date" name="userbirth" id="birth"></li>
									<li><span>이메일</span><input type="email" name="useremail" id="email" size="40"></li>
									<li><span>휴대전화</span><input type="tel" name="userphone" id="phone">&nbsp;&nbsp;'-' 제외 입력</li>
									<li><span>주소</span><input type="text" name="useraddr" id="postcode" size="10" placeholder="우편번호" readonly="readonly"><input type="button" value="우편번호 찾기" onclick="DaumPostCode()"/>
										<br/><span style="margin-left:150px;font-weight:normal;"><input type="text" name="useraddr" id="address" placeholder="주소" size="50" readonly="readonly"><br/><input type="text" name="useraddr" id="detailAddress" placeholder="상세주소" size="50"></span></li>
									<li><span>자동 등록 방지</span><img id="captchaimg"/><a href="#" id="refresh" style="font-weight:bold;">&nbsp;&nbsp;[이미지 새로고침]</a><br/><input type="hidden" id="captchakey"><span style="margin-left:150px;font-weight:normal;"><input type="text" id="captchavalue" placeholder="이미지 속 문자 입력" ></span><button type="button" id="btn_captcha" style="width:50px;">확인</button>&nbsp;&nbsp;<span id="captchares" style="width:300px;"></span></li>
								</ul>	
									<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
									<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
									</div>	
							</div>
						</div>
					</div>

					<div class="row">
						<input type="button" class="btn brows-btn" value="가입하기" id="btn_regist"
							onclick="nullChk();" />
					</div>	
					</form>	
				</div>
			</div>
		</div>
		</section>
		<!-- regist section End -->	
		
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
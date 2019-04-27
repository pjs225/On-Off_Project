<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <style>
        #paging li a:focus {
			color:#fff;
			border:1px solid #f40;
			background-color:#f40;
		}
		
		#selectType{position:relative; width:220px; height:40px; line-height:40px; border:0;  text-transform:uppercase; background:#fff;}
		#selectType label{position:absolute; width:100%; font-size:.90em; color:#6b797c; font-weight:normal; top:0; left:0; padding:0 5%; margin-right:5%;}
		#selectType label:after{content:'▼'; width:40px; height:40px; position:absolute; top:0; right:0; font-size:.90em; color:#fff; text-align:center; background:#da0833; }
		#selectType select{width:100%; height:40px; opacity:0; filter:alpha(opacity=0); -ms-filter:alpha(opacity=0)/* IE 8 */;}
		
		
		

        </style> 
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
		function selSearch(val){
			

			if(val=="t"){
				$("#selLabel").text("제목");
			} else if(val=="c"){
				$("#selLabel").text("내용");
			} else if(val=="tc"){
				$("#selLabel").text("제목+내용");
			}
	        
		} 
		
	    function enterKey(){
	    	if (window.event.keyCode == 13) {
	             search();
	        }
	    }
		 
		
		function search(){
			
	    	 location.href="search.do?searchType="+$("select option:selected").val()+"&keyword="+encodeURIComponent($('#search_input').val());
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
		<section class="main-banner" style="background:#242c36 url(img/slider-01.jpg) no-repeat">
			<div class="container">
				<div class="caption">
					<h2><img src="img/logo.png" class="logo" alt=""></h2>
					<!-- <form action="" method="post"> -->
						<fieldset> 
							<div class="col-md-10 col-sm-4 no-pad" id="selectType">
								<label id="selLabel">조건을 선택하세요</label>
								<select name="searchType" style="color:black;" id="sel" onchange="selSearch(this.value)">
								  <%-- <option value="n"<c:out value="${sc.searchType == null ? 'selected' : ''}"/>>전체 목록</option> --%>
								  <option value="t"<c:out value="${sc.searchType eq 't' ? 'selected' : ''}"/> selected>제목</option>
								  <option value="c"<c:out value="${sc.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								  <option value="tc"<c:out value="${sc.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
								 </select>
							</div>
							<div class="col-md-10 col-sm-4 no-pad">
								<input type="text" class="form-control border-right" name="searchText" id="search_input" placeholder="소모임을 검색하세요" onkeyup="enterKey();"/>
							</div>
							<div class="col-md-2 col-sm-2 no-pad">
								<input type="button" class="btn seub-btn" id="search" value="SEARCH" onclick="search();" />
							</div>
						</fieldset>
					<!-- </form> -->
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

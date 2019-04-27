<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드</title>

	<!-- All Plugin Css -->
		<link rel="stylesheet" href="css/plugins.css">
		
		<!-- Style & Common Css -->
		<link rel="stylesheet" href="css/common.css">
		<link rel="stylesheet" href="css/main.css">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	var sel_file;
	
	$(document).ready(function(){
		$("#input_img").on("change",handleImgFileSelect);
	});
	
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지만 등록 가능합니다.");
				$("#input_img").val("");
				return ;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#img").attr("src",e.target.result);
			}
			reader.readAsDataURL(f)
		});
	}

</script>

<style type="text/css">
	.img_wrap{
		width: 200px;
		margin-top: 50px;
	}
	
	.img_wrap img{
		width: 100%;
	}
</style>

</head>
<body>
<label>이미지가 보일 때까지 기다려주세요.</label>
<div>
	<div class="img_wrap">
		<img id="img" />
	</div>
</div>

 <form:form method="post" enctype="multipart/form-data" action="preViewUpload.do" id="subs">
	<!-- modelAttribute form tag에서 UploadFile.class에 있는 set method와 get method를 이용해서 각각의 속성들과 mapping을 자동으로 해준다. -->
		<label for="input_img">이미지 찾기</label><br/>
		<input type="file" name="uploadfile" id="input_img" multiple="multiple" style="display: none;"/>
		<input type="submit" class="btn brows-btn" value="전송" style="display: inline-block; margin: 0; margin-top: 10px;" />
		<input type="button" class="btn brows-btn" onclick="window.close();" value="취소" style="display: inline-block; margin: 0; margin-top: 10px;" />
</form:form> 

</body>
</html>
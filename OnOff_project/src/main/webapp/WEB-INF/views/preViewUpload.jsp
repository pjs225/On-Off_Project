<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	 $(function() {
		$("#inimg",opener.document).attr("src",$("#test").val());
		$("#intext",opener.document).val($("#test").val());
		window.close();
	}); 
</script>

</head>
<body>
	<input type="text" value="${test }" id="test" />
</body>
</html>
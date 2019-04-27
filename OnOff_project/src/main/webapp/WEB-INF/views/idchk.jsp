<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On & Off</title>
<script type="text/javascript">

	// 화면이 실행되자마자 실행
	onload=function(){
		var id = opener.document.getElementById("id").value;
		document.getElementsByName("id")[0].value = id;
	}
	
	function confirm(bool) {
		if(bool=="true"){
			opener.document.getElementById("pw").focus();
			opener.document.getElementById("idchk").value="0";
		} else {
			opener.document.getElementById("id").focus();
			opener.document.getElementById("id").value="";
			
			opener.document.getElementById("idchk").value="1";
		}
		
		self.close();
	} 
	
</script>

</head>
<body>


	<table style="text-align:center;">
		<tr>
			<td><input type="text" name="id" readonly="readonly"></td>
		</tr>
		<tr>
			<td style="font-weight:bold">
				<c:if test="${idNotUse eq 'true' }">
					아이디를 사용할 수 있습니다.
				</c:if>
				<c:if test="${idNotUse eq 'false' }">
					중복된 아이디가 존재합니다. 
				</c:if>	
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" id="btn" value="확인" onclick="confirm('${idNotUse}')" style="background:#da0833;color:white;border-style:none;">
			</td>
		</tr>
	</table>
	
</body>
</html>
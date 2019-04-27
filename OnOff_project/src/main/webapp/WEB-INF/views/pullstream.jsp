<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%
	String id = (String)request.getAttribute("id");
	String groupnum = (String)request.getAttribute("groupnum");
	System.out.println(id + " : " + groupnum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base target="_blank">
<title>getUserMedia</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<script type="text/javascript">
	
var ws = new WebSocket("ws:192.168.0.9:8787/s/video");
ws.binaryType = "blob";

ws.onmessage = function(msg) {
	var target = document.getElementById("target");
	url = window.webkitURL.createObjectURL(msg.data);
	target.onload = function() {
		window.webkitURL.revokeObjectURL(url);
	};
	target.src = url;
}
	//---------------------------------------------------------------
</script>
</head>
<body>
	<div>
		<img width="320" height="240" id="target" style="display: inline;" />
	</div>
	<pre id="output"></pre>
</body>
</html>
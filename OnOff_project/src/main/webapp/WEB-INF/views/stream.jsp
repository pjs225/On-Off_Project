<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base target="_blank">
<title>getUserMedia</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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

	var options = {
		"video" : true
	};
	function capture() {
		var img = new Image;
		const canvas1 = document.getElementById("canvas1");
		const video = document.getElementById("live");
		const ctx = canvas1.getContext("2d");
		ctx.drawImage(video, 0, 0, 320, 240);
		var data = canvas1.toDataURL('image/png');
		var blob = convertToBinary(data);
		ws.send(blob);
	}

	function startAlert() {
		setInterval(function() {
			capture();
		}, 100);

	};

	function convertToBinary(dataURI) {
		var byteString = atob(dataURI.split(',')[1]);
		var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]
		var ab = new ArrayBuffer(byteString.length);
		var ia = new Uint8Array(ab);
		for (var i = 0; i < byteString.length; i++) {
			ia[i] = byteString.charCodeAt(i);
		}
		var bb = new Blob([ ab ], {
			"type" : mimeString
		});
		return bb;
	}
</script>
</head>
<body>
	<div>
		<video controls id="live" width="320" height="240">
		</video>
		<canvas width="320" id="canvas1" height="240" style="display: inline;"></canvas>
		<input type="button" onclick="startAlert()" value="start">
	</div>
	<script src="js/stream.js"></script>
	<pre id="output"></pre>
	<br />
	<div>
		<img id="target" style="display: inline;" />
	</div>
</body>
</html>
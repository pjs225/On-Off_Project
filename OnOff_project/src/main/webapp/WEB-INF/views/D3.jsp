<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On & Off</title>

<style>
.bar {
    fill: #fffc16;
    fill-opacity: 0.3;
    stroke: #da0833;
    
}
.bar:hover {
    fill: #da0833;
    fill-opacity: 1;
}

.text {
    fill: #b57e7e;
    font-weight:bold;
}


</style>
</head>
<body>
<div id="where">
		<span><a href="mypage.do">마이페이지 > </a></span> <span>그룹관리 > </span> <span><a href="#">설문조사통계</a></span>
</div>
<svg width="500" height="300"></svg>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script>
var dataset = ${array};
var svg = d3.select("svg");

svg.selectAll("rect")
    .data(dataset)
    .enter().append("rect")
        .attr("class", "bar")
        .attr("height", function(d, i) {return (d*20)})//도형(rect)의 크기(height)가 바뀌고
        .attr("width", 40)
        .attr("x", function(d, i) {return (50 * i)})//도형의 위치(x)가 지정
        .attr("y", function(d, i) {return (200-d*20)});
//차이를 벌리고싶으면 d에다 배수를 곱해준다.

svg.selectAll("text")
.data(dataset)
.enter().append("text")
.text(function(d) {return d})
    .attr("class", "text")
    .attr("x", function(d, i) {return 50 * i + 15})
    .attr("y", function(d, i) {return 200-d*20 + 15});
</script>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 달력 css/script -->
<link href='css/fullcalendar.min.css' rel='stylesheet' />
<link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src='js/moment.min.js'></script>
<script src='js/fullcalendar.min.js'></script>

<style>

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>

		<script>
		 
		$(document).ready(
				
				
				function() {
					//{"title":"value"}
					//{title:}
					
					var userid = $("#jaxid").val();
					/* alert(userid); */

					
					$.ajax({
					type:"GET",
					url:"mycalAjax.do?userid='"+userid+"'",
//					data: {groupno:${groupno}},
					success: function(msg) {
						
						//String을 JSON형식으로 파싱
						var jsonMsg = JSON.parse(msg);
						
						//객체생성
						var test = [];
						
						//반복문으로 createObj 메소드를 반복적으로 실행해서 리턴받은 객체를 test배열에 push로 반복해서 넣어줌
						for(var i=0; i<jsonMsg.events.length; i++){
							
							test.push(createObj(jsonMsg.events[i].start,jsonMsg.events[i].title,jsonMsg.events[i].addr,jsonMsg.events[i].url));
							
						};
						
						/* alert(test); */
						
						//달력에 배열을 넣어줌
						$('#calendar').fullCalendar(
							{
								events:test
								
							}		
						);
						
					},error: function() {
						alert("에러");
						
					}
					});
					/* 
					//ajax로 접근해서 데이터 받아와야겠는데여
					$('#calendar').fullCalendar(
							{	
								 events :  [
										{
											title : '제목 : ' + '받자' + '\n장소 : '
													+ '받자' + '\n시간 : ' + '받자',
											url : 'http://naver.com/',
											start : '2019-03-01'
										},
										{
											title : '제목2 : ' + '받자' + '\n장소2 : '
													+ '받자' + '\n시간2 : ' + '받자',
											start : '2019-03-01'
										}, {
											title : 'Click for Google',
											url : 'http://google.com/',
											start : '2019-03-28'
										},{
											title : 'Click for Google',
											url : 'http://google.com/',
											start : '2019-03-28'
										},
										
										
										
										] 
							});
	 */
				});
		
		function createObj(startVal,titleVal,addrVal,urlVal){
			return {
				start : startVal,
				title : '제목:' + titleVal + '\n장소:' + addrVal,
				url : urlVal
			}
		}
		
		
		
		
	</script>

</head>
<body>
<div id="where">
<span>마이페이지 > </span> <span><a href="#">소모임 달력</a></span>
</div>
	<!-- 
		정보는 스크립트에서 처리하면 알아서 들어옵니다...
		이건 그때가서 생각해 봅시다.
		어차피 넘겨서 받는거니까 model에 값 넣어줘서 
		여기에 hidden 영역 만들어서 값 받아서 넣어줘도 될거 같아요
	--><input id="jaxid" value="${dto.userid}" style="display: none;"/>
	<div id='calendar'></div>
</body>
</html>
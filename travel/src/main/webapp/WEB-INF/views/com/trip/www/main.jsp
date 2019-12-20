<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Document</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">

<style>
.jumbotron {
	background-image: url("/img/main/hongkong.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: right center;
	height: 800px;
}

.mainSearch {
	width: 400px;
	height: 500px;
	background: white;
	padding: 20px;
	position: relative;
	left: -200px;
	top: 50px;
}

.form-control {
	width: 350px;
}

.mainSubmit {
	float: right;
	background:
}

.disabled {
	color: white;
	margin-left: 50px;
}

.navbar {
	background: white;
	float: right;
	margin-left: 20px;
	position: relative;
	right: -100px;
	
}

.ui-datepicker select.ui-datepicker-month{
	margin-left: 4%;
	padding-bottom: 1.6%;
}
.ui-datepicker select.ui-datepicker-year{
	padding-top: 1.6%;
	
}
.ui-widget-header {
	background: white;

}
.ui-state-default, 
.ui-widget-content .ui-state-default, 
.ui-widget-header .ui-state-default, 
.ui-button, html .ui-button.ui-state-disabled:hover, 
html .ui-button.ui-state-disabled:active {
    border: 1px solid white;
    text-align: center;
    background: white;
    font-weight: normal;
    color: #454545;
}
.city{
	width : 359px;
}
.peopleClick{
	width: 359px;
	height : 200px;
	background : white;
	display : none;
}
.city{
   width : 359px;
}
.peopleClick{
   width: 359px;
   height : 120px;
   background : white;
   display : none;
   position : absolute;
   border : 1px solid gray;
   border-radius : 3px;
   padding : 10px;
   margin-top : 2px;
}
</style>
<script>
$(function() {
	$('#login').click(function () {
		$(location).attr('href', '/member/login.kit')
	});
	
	$('#join').click(function () {
		$(location).attr('href', '/member/join.kit')
	});
	
	$('#make').click(function () {
		$(location).attr('href', '/schedule/scheduleUp.kit')
	});
	
	  $("#people").focusin(function(){
	         $(".peopleClick").css("display" , "block");
	      });
	      $("#people").focusout(function(){
	         $(".peopleClick").css("display" , "none");
	      });
	
/* 	캘린더  */
	$('#calendarArea1').click(function(e) {
		e.preventDefault();
		$('#startDatePicker').focus();
	});
	$('#calendarArea2').click(function(e) {
		e.preventDefault();
		$("#endDatePicker").focus();
	});
	//예약발행 달력_시작 
	$('#startDatePicker').datepicker({	
		
				dateFormat : 'yy-mm-dd',
				showMonthAfterYear : true,
				changeMonth : true,
				changeYear : true,
				numberOfMonths : 1,
				
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ],
				minDate : -0
				//오늘날짜 이후부터만 설정되게 
				,
				onClose : function(selectedDate) {
					$('#endDatePicker').datepicker("option", "minDate",
							selectedDate);
				}

			});
	//기간발행_끝 
	$("#endDatePicker").datepicker(
			{
				dateFormat : 'yy-mm-dd',
				showMonthAfterYear : true,
				changeMonth : true,
				changeYear : true,
				numberOfMonths : 1,
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월','8월', '9월', '10월', '11월', '12월' ],
				minDate : -0
				//오늘날짜 이후부터만 설정되게 
				,
				onClose : function(selectedDate) {
					$('#startDatePicker').datepicker("option", "maxDate",
							selectedDate);
				},
				
			});
		$("#people").focusin(function(){
			$(this).style("display" , "block");
			
		});
	});
</script>
</head>
<body>
<form method="POST" action="/schedule/scheduleLi.kit">
	<header class="jumbotron">
		<div class="container">
			<button type="button" class="btn btn-default navbar"
				data-toggle="tooltip" data-placement="right" id="join">회원가입</button>
			<button type="button" class="btn btn-default navbar"
				data-toggle="tooltip" id="login" data-placement="right">로그인</button>
			<div class="mainSearch">
				<h3>떠나고 싶은 곳 어디든</h3>
				<h2>지금 검색해보세요.</h2>
				<div class="form-group">
					<label for="inputArea"> 여행가는 도시 </label> 
					<input type="text" class="form-control city" id="inputArea" name="sCountry" placeholder="떠나실 장소를 검색해보세요">
				</div>
				<div class="row">

				<div class="form-group col-md-6 ">

					<label for="calendarArea" id="calendarArea1"> 출발일 선택 </label> 
					<input type="text" class="form-control col-md-12" id="startDatePicker" name="sSdate" placeholder="언제부터 ?">
				</div>
				<div class="form-group col-md-6">
					<label for="calendarArea"> 도착일 선택 </label>
					<input type="text" class="form-control col-md-12" id="endDatePicker" name="sEdate" placeholder="언제까지 ?">

				</div>
				</div>
				<div class="form-group">
					<label for="inputArea"> 인원수 </label> 
					<input type="text" class="form-control city" id="people" name="sPtotal" placeholder="인원수를 선택해주세요">
					<div class="peopleClick">
					성인 
                     <button class="left"></button>
                     <button class="right"></button>
                	  아이
					
					</div>
				</div>
				<button class="btn btn-default" id="make" type="button">스케쥴 만들기</button>
				<button type="submit" class="btn btn-default mainSubmit">검색</button>
			</div>
		</div>
		
	</header>
	<section>
		<div class="container"></div>
	</section>
	<footer>
		<div class="container"></div>
	</footer>
	</form>
</body>
</html>
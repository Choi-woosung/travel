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
<script src="/js/j-query-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH7Hg6_GJq3uKTQJdLZudqW_vQHbRcy0s&libraries=places"></script>
<title>My Travel</title>

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

.ui-datepicker select.ui-datepicker-month {
	margin-left: 4%;
	padding-bottom: 1.6%;
}

.ui-datepicker select.ui-datepicker-year {
	padding-top: 1.6%;
}

.ui-widget-header {
	background: white;
}

.ui-state-default, .ui-widget-content .ui-state-default,
	.ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover,
	html .ui-button.ui-state-disabled:active {
	border: 1px solid white;
	text-align: center;
	background: white;
	font-weight: normal;
	color: #454545;
}

.city {
	width: 359px;
}

.pCount {
	width: 359px;
	height: 120px;
	background: white;
	position: absolute;
	border: 1px solid gray;
	border-radius: 3px;
	padding: 10px;
	margin-top: 2px;
	display: none;
}

.pCount.view {
	display: block;
}

.totalChange {
	margin-bottom: 20px;
}

.left, .right, .total {
	width: 13px;
	height: 20px;
	background: white;
	float: right;
}

.headertext {
	color: white;
	font-size: 25px;
	float: right;
	font-weight: bold;
	margin-left: 30px;
}

.barcolor {
	background: #222222;
}

.nav-link {
	font-size: 20px;
}

<%--
인원수 정하는 div --%> .adult {
	display: flex;
	justify-content: space-between;
}

.count {
	font-size: 23px;
}

<%--
Footer 관련 css --%>
footer {
	background: #333333;
	text-align: center;
	color: gray;
	height: 400px;
	font-size: 12px;
	padding: 20px;
}
</style>
<script>
	$(function() {
		$('#login').click(function() {
			$(location).attr('href', '/member/login.kit');
		});

		$('#join').click(function() {
			$(location).attr('href', '/member/join.kit');
		});


		/* 인원수 클릭 시 인원 수 창 뜨고 없어지는 기능 */
		$('#people').click(function() {
			$('.pCount').addClass('view');
		});

		$('body').on('click', function(e) {
			var pClass = $(e.target).hasClass('city');
			var psClass = $(e.target).parents().hasClass('tCount');

			if (!pClass && !psClass) {
				$('.pCount').removeClass('view');
			} else if (psClass) {
				return false;
			}
		});

		/* 	캘린더  */
		$('#calendarArea1').click(function(e) {
			e.preventDefault();
			$('#sSdate').focus();
		});
		$('#calendarArea2').click(function(e) {
			e.preventDefault();
			$("#sEdate").focus();
		});
		//예약발행 달력_시작 
		$('#sSdate').datepicker(
				{

					dateFormat : 'yy-mm-dd',
					showMonthAfterYear : true,
					changeMonth : true,
					changeYear : true,
					numberOfMonths : 1,

					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					minDate : -0
					//오늘날짜 이후부터만 설정되게 
					,
					onClose : function(selectedDate) {
						$('#sEdate').datepicker("option", "minDate",
								selectedDate);
					}

				});
		//기간발행_끝 
		$("#sEdate").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					showMonthAfterYear : true,
					changeMonth : true,
					changeYear : true,
					numberOfMonths : 1,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					minDate : -0
					//오늘날짜 이후부터만 설정되게 
					,
					onClose : function(selectedDate) {
						$('#sSdate').datepicker("option", "maxDate",
								selectedDate);
					},

				});

		/* $('#search').click(function () {
			
			$('#frm').attr('action', '/schedule/scheduleList.kit');
			$('#frm').submit();
		
		}); */

		/* $('#make').click(function (e) {

				$('#frm').attr('action', '/schedule/scheduleUp.kit');
				$('#frm').submit();
			}); */

	});
	function getmake() {
		var formid = document.myform;
		if (formid.sCountry.value == "") {
			formid.sCountry.focus();
			alert("여행 가실 곳을 입력해주세요");
			return;
		} else if (formid.sSdate.value == "") {
			alert("출발일을 입력해주세요");
			formid.sSdate.focus();
			return;
		} else if (formid.sEdate.value == "") {
			alert("도착일을 입력해주세요");
			formid.sEdate.focus();
			return;
		} else {
			$('#frm').attr('action', '/schedule/scheduleUp.kit');
			$('#frm').submit();
		};
	};
	
	function getsearch() {
		var formid = document.myform;
		if (formid.sCountry.value == "") {
			formid.sCountry.focus();
			alert("여행 가실 곳을 입력해주세요");
			return;
		} else if (formid.sSdate.value == "") {
			alert("출발일을 입력해주세요");
			formid.sSdate.focus();
			return;
		} else if (formid.sEdate.value == "") {
			alert("도착일을 입력해주세요");
			formid.sEdate.focus();
			return;
		} else {
			$('#frm').attr('action', '/schedule/scheduleList.kit');
			$('#frm').submit();
		};
	};
</script>
<script>
	// 구글 맵 api 자동완성기능 //
	$(document).ready(function(){
		var autocomplete;
	    var options = {
	    	        types: ['geocode']
	    	      };
		autocomplete = new google.maps.places.Autocomplete(document.getElementById('inputArea'), options);
	});
</script>
</head>
<body>
<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">MY TRAVEL</a>
		<div class="collapse navbar-collapse justify-content-end"
			id="navbarCollapse">
			<ul class="navbar-nav">
				<c:if test="${empty SID }">
					<li class="nav-item"><a class="nav-link"
						href="/member/login.kit">
							<button class="btn btn-outline-success my-2 my-sm-0">로그인</button>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/member/join.kit">
							<button class="btn btn-outline-success my-2 my-sm-0">회원가입</button>
					</a></li>
				</c:if>
				<c:if test="${!empty SID }">
					<li class="nav-item"><a class="nav-link"
						href="/member/logout.kit">
							<button class="btn btn-outline-success my-2 my-sm-0">로그아웃</button>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/member/memberForm.kit">
							<button class="btn btn-outline-success my-2 my-sm-0">회원정보보기</button>
					</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
</header>
	<div class="jumbotron">
		<div class="container">
			<div class="mainSearch">
				<h3>떠나고 싶은 곳 어디든</h3>
				<h2>지금 검색해보세요.</h2>
				<form method="POST" name="myform" id="frm">
					<div class="form-group">
						<label for="inputArea"> 여행가는 도시 </label>
					 	<input type="text" class="form-control city" id="inputArea" name="sCountry"
							placeholder="떠나실 장소를 검색해보세요">
					</div>
					<div class="row">
						<div class="form-group col-md-6 ">
							<label for="calendarArea" id="calendarArea1"> 출발일 선택 </label> 
							<input type="text" class="form-control col-md-12" id="sSdate"
								name="sSdate" placeholder="언제부터 ?">
						</div>
						<div class="form-group col-md-6">
							<label for="calendarArea"> 도착일 선택 </label> 
							<input type="text" class="form-control col-md-12" id="sEdate" name="sEdate"
								placeholder="언제까지 ?">
						</div>
					</div>
					<div class="form-group tCount">
						<label for="inputArea"> 인원수 </label> <input type="text"
							class="form-control city" id="people" name="sPtotal"
							placeholder="인원수를 선택해주세요">
						<div class="pCount" id="pCount">
							<div class="adult">
								<label> <span class="totalcount">성인</span>
								</label>
								<div class="count">
									<span><img
										src="/img/asset/icons/chevron-compact-left.svg" width="40"
										height="20"></span> <span class="count">0</span> <span><img
										src="/img/asset/icons/chevron-compact-right.svg" width="40"
										height="20"></span>
								</div>
							</div>
							<div class="adult">
								<label> <span class="totalcount">어린이</span>
								</label>
								<div class="count">
									<span><img
										src="/img/asset/icons/chevron-compact-left.svg" width="40"
										height="20"></span> <span class="count">0</span> <span><img
										src="/img/asset/icons/chevron-compact-right.svg" width="40"
										height="20"></span>
								</div>
								<button class="btn btn-info">확인</button>
							</div>
						</div>
					</div>
					<button type="button" class="btn btn-info" id="make" onclick="getmake()">스케쥴만들기</button>
					<button type="button" class="btn btn-info" id="search" onclick="getsearch()">검색</button>
				</form>
			</div>
		</div>
	</div>	
<section>
	<div class="container">
	</div>
</section>
<hr>
<footer>
	<div class="container">
		<p>All material © 2019 – 2019 MyTravel Company Pte. Ltd., AllRights Reserved.</p>
		<p>마이 트레블은 온라인 여행에 관한 각종 정보를 한 곳에서 찾아볼 수 있고 스케쥴을 짤 수 있는 사이트 입니다.</p>
		<p>해당 사이트에 등록된 모든 정보는 MyTravel Company 의 지적 자산이므로 당사의 협의없는 상업적	사용은 불허합니다.</p>
	</div>
</footer>
</body>
</html>
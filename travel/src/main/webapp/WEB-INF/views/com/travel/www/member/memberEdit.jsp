<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="shortcut icon" type="image/x-icon"
	href="/img/main/favicon2.ico" />
<title>Document</title>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<title>Document</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/js/bootstrap.min.js">

<style>
.main {
	width: 80%;
	height: auto;
	background: white;
	padding: 20px;
	position: relative;
	left: 10%;
	top: 50px;
}

.text1 {
	width: 600px;
}

.add {
	display: none;
}

.barcolor {
	background: #222222;
}

.nav-link {
	font-size: 20px;
}

.use {
	user-select: none;
}

.back {
	background: #2cb5e9;
}
.profile_select {
	width: 213px;
	height: 28px;
	margin-left: 15px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var passRule = /^(?=.*[0-9])(?=.*[a-z]).{8,20}$/;//숫자와 문자 포함 형태의 8~20자리  암호 정규식
		var blank_pattern = /[\s]/g; // 공백입력 불가
			$('#pw').keyup(function() {
				if (!passRule.test($("#pw").val())) {
			//정규식 false div 출력
					$('.pwex').css('display', 'block');
				} else { 
					$('.pwex').css('display', 'none');
				}
			});

					//입력한 비밀번호가 같은지
					$('#pw2').keyup(function() {
						var pw1 = $('#pw').val();
						var pw2 = $('#pw2').val();

						if (pw1 == pw2) {
							$('.pwok').css('display', 'block');
							$('.pwx').css('display', 'none');
						} else {
							$('.pwok').css('display', 'none');
							$('.pwx').css('display', 'block');
						}
					});

					// 취소 버튼 누르면 뒤로가기
					$('#cancel').click(function() {
						$(location).attr('href', '/main.kit');
					});

					//저장
					$('#save').click(function() {
						var mId = $('#id').text();
						var mPw = $('#pw').val();
						var mPw2 = $('#pw2').val();
						var mMail = $('#mail').val();
						var mMobile = $('#tel').val();
						var mAddress = $('#roadAddress').val()+ " "+ $('#detailAddress').val();
						var mAvatar= $('#profile_select').val();
						alert(mAddress);
						if (mPw != mPw2) {
							alert("입력하신 비밀번호가 다릅니다.");
						$('#pw').focus();
						} else if (!passRule.test($("#pw").val())) {
							alert("비밀번호 형식이 잘못되었습니다.");
						$('#pw').focus();
						} else if (blank_pattern.test($("#pw").val()) == true) {
							alert('공백이 포함되어있습니다.');
						$('#pw').focus();
						} else {
					$.ajax({
						url : "/member/memberEditProc.kit",
						type : "POST",
						dataType : "json",
						data : {
						"mId" : mId,
						"mPw" : mPw,
						"mPw2" : mPw2,
						"mMail" : mMail,
						"mMobile" : mMobile,
						"mAddress" : mAddress,
						"mAvatar" : mAvatar
						},
						success : function(data) {
								if (data == 1) {
									alert("변경완료");
									$('#id')
									.html('${DATA.mId}');
									$('#name').html('${DATA.mName}');
									$('#mail').html('${DATA.mMail}');
									$('#tel').html('${DATA.mMobile}');
									$('#adr').html('${DATA.mAddress}');
									$('#adr').css('display','block');
									$('.add').css('display','none');
									$(location).attr('href','/main.kit');
								} else {
									alert("변경실패");
									}
								},
								error : function() {
									alert("수정실패");
									}
								});
							}
						});
					});
	//주소 검색
	function sample4_execDaumPostcode() {
		$('#adr').css('display', 'none');
		$('.add').css('display', 'block');
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("roadAddress").value = roadAddr;

				var guideTextBox = document.getElementById("guide");
				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if (data.autoRoadAddress) {
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr
							+ ')';
					guideTextBox.style.display = 'block';

				} else {
					guideTextBox.innerHTML = '';
					guideTextBox.style.display = 'none';
				}
			}
		}).open();

	}
</script>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', () => {
		let profile_select = document.getElementById('profile_select');
		let profile_img = document.getElementById('profile_img');
		
		for (var i = 0; i < 10; i++) {
			let el = document.createElement('option');
			el.textContent = '프로필 이미지 ' + (i + 1);
			el.value = (i + 11); 
			if (el.value == '${DATA.mAvatar}') {
				el.selected = true;
			}
			profile_select.appendChild(el);
		}
		
		profile_img.src = '/img/profile/profile' + (${DATA.mAvatar} - 10) + '.png'; 
		
		profile_select.addEventListener('change', e => {
			let num = e.target.value - 10;
			
			profile_img.src = '/img/profile/profile' + num + '.png'; 
		});
	});
</script>
</head>
<body>
	<header>
		<c:import url="/navigationBar.kit"></c:import>
	</header>

	<!-- 회원 정보 수정 모달 -->

	<div class="container" id="edit">
		<h2 class=".col-md-4 text-center">회원 정보 수정</h2>
		<input type="hidden" name="mId" value="${DATA.mId}">
		<div class="col-md-12 border main">
			<div class="ml-4">
				<div class="p-4 row">
					<pre>아   이   디 :</pre>
					<h5 class="ml-4" id="id">${DATA.mId }</h5>
				</div>
				<div class="p-4 row">
					<pre>회 원  이 름 :</pre>
					<h5 class="ml-4" id="name">${DATA.mName }</h5>
				</div>
				<div class="p-4 row">
					<pre>프로필 이미지 :</pre>
					<select class="profile_select" id="profile_select"></select>
					<img id="profile_img" width="128" height="128">
				</div>
				<div class="p-4 row">
					<pre>비 밀  번 호 :</pre>
					<h5 class="" id="name"></h5>
					<h5 class="">
						<input type="password" class="ml-4" id="pw" name="mPw"
							required="required">
					</h5>
				</div>
				<div class="pwex" style="display: none; color: red;">
					<h5 class="">숫자와 문자 포함 형태의 8~20자리 이내의 비밀번호를 입력해주세요</h5>
				</div>
				<div class="p-4 row">
					<pre>비밀번호확인 :</pre>
					<h5 class="" id="name"></h5>
					<h5 class="">
						<input type="password" class="ml-4" id="pw2" name="mPw2"
							required="required">
					</h5>
				</div>

				<div class="pwx" style="display: none; color: red;">
					<h5 class="">비밀번호가 틀립니다.</h5>
				</div>
				<div class="pwok" style="display: none; color: green;">
					<h5 class="">비밀번호가 같습니다.</h5>
				</div>
				<div class="p-4 row">
					<pre>이   메  일 :</pre>
					<h5 class="ml-4" id="mail">${DATA.mMail }</h5>
				</div>
				<div class="p-4 row">
					<pre>전 화 번 호 :</pre>
					<h5 class="ml-4">
						<input type="text" class=" text1" id="tel" name="mMobile"
							value="${DATA.mMobile }" required="required">
					</h5>
				</div>
				<div class="p-4 row">
					<pre>주       소 :</pre>
					<h5 class="ml-4">
						<input type="text" id="postcode" placeholder="우편번호"> <input
							type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기"><br> <input type="text"
							class=" text1" id="adr" name="mAddress" value="${DATA.mAddress }"
							required="required" style="display: block;">
					</h5>
				</div>
				<div class="p-4 row">
					<input type="text" class="text1 add" id="roadAddress"
						placeholder="도로명주소"> <span id="guide"
						style="color: #999; display: none"></span> <input type="text"
						class="add" id="detailAddress" placeholder="상세주소">
				</div>
				<div class="p-4 row">
					<pre>가   입   일 :</pre>
					<h5 class="ml-4" id="date">${DATA.mJdate }</h5>
				</div>
				<div class="">
					<div class="btn btn-info" id="cancel">취소</div>
					<button class="btn btn-info" id="save">저장</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
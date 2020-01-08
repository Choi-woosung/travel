<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/js/bootstrap.min.js">
<link rel="stylesheet" href="/css/w3.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원가입</title>
    <style>
    
  	body{
	background-color: #f5f5f5;
	}    
    
	button {
		border: 1px solid white;
		width: 150px;
		height: 50px;
		outline: none;
		background: none;
		color:white;
	}    
    
	.form_container{
		background-color: #e0f2f1;
	}
	
    #wrap{
            width:700px;           
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
            background-color: #e0f2f1;
            margin-top:50px;
   }
   
	.ullist{
		position: relative;
		top: -30px;		
		list-style: none;	
	}    
	
	.ullist input{
		width:100%;
		height: 30px;
		border: none;
		outline: none;
		background: none;
		border-bottom: 1px solid skyblue;		
	}
	
	.pw2 {
		position: absolute;
		left: 150px;
		font-size: 10px;
	}        
	
	li{	
		height:1px;
		font-size: 20px;
		margin: 30px;
		padding: 30px;
	}	
	
	.inputlist{
		position: relative;
		top: -20px;
		left: 115px;
	}
	
        #id_form{
        	float:left;
        }
        
        #Idbtn{
        	float:right;
        }
        
        .pw_form{
        	float:left;
        }
        
        .id_check{
        	float:right;
        }
        
        .pw2_form{
        	float:left;
        }
        
        .name_form{
        	float:left;
        }
        .email_form{
        	float:left;
        }
        
        .phone_form{
        	float:left;
        }
        
        .address_form{
        	float:left;
        }
        
        .date_form{
        	float:left;
        }
        
        .grade_form{
        	float:left;
        }
        
        .point_form{
        	float:left;
        }
        
        #mail_in{
        	float:right;
        }	
  	.w3-lobster {
  		
  		font-family: "Lobster", serif;
}	

	.write_address input{
		float:right;
	}



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



.avtChoose{
	float:right;
}

    </style>



<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript">
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

		};
		
	$(function(){
		$('#Idbtn').click(function(){
			var sid = $('#userId').val();
			
			$.ajax({
				url  : "idCheck.kit",
				type : "post",
				dataType : "text",
				data : {
					"id" : sid
				},
			
			
			success : function(data){
				var ok = data;
				
				if(ok == 1){
					// 이미 회원가입 된거
					$('#userId').val("");
					alert("이미 가입된 아이디입니다.");
						
				} else {
					// 회원가입 가능		
					
					alert("사용 가능한 아이디입니다.");
				}
			},
			error : function(){
				alert("Error");
			}
		});
	});
		
	$('#mail_in').click(function(){
			$(location).attr('href', '/member/email.kit');
	});
	
	$('#btn1').click(function(){
		var tadr2 = $('#detailAddress').val();
		var tadr1 = $('#adr').val() + tadr2;
		$('#adr').val(tadr1);
		$('#frm').submit();
	}); 
});
</script>
</head>
<body>
	
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray" class="w3-lobster">회원가입</font></b>
        <br><br><br>
    
        <form method="post" action="/member/joinProc.kit" class="form_container" id="frm">
            <ul class="ullist w3-margin-bottom w3-padding">
                <li id="id_container">
                    <label for="id" id="id_form" class="w3-serif"><b>아이디</b></label>             
                        <button type="submit" id="Idbtn" class="id_check w3-teal w3-text-light-gray">중복확인</button> 
                        <input type="text" id="userId" name="mId" required class="">
               </li>
                          
                        
               <li id="id_container">
               		<label for="pw" class="pw_form w3-serif"><b>비밀번호</b></label>
                    <input type="password" id="userPw" name="mPw" required class="" >   
               </li>
                
                
               <li><label for="pw_e" class="pw2_form w3-serif"><b>비밀번호 확인</b></label>
  					<input type="password" id="userPw2" name="mPw2" required class="">
                    <p class="pw2" id="pw2_check"></p>
               </li>
                    
                <li>
                    <label for="name" class="name_form w3-serif"><b>이름</b></label>
               		<input type="text" id="name" name="mName" required class=""> 
                </li>
                    
                    
                <li>
                    <label for="email" class="email_form w3-serif"><b>이메일</b></label>
                    <button type="submit" id="mail_in" class="w3-teal w3-text-light-gray">이메일 인증</button>
                    <input type="email" id="email" name="mMail" >
                </li>
				<br>
				
				<li>
					<label for="address" class="address_form w3-serif"><b>주소</b></label>
					<h5 class="wrtie_address">
						<input type="text" id="postcode" placeholder="우편번호">
						<input	type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기"><br> 
						<input type="text" class=" text1" id="adr" name="mAddress" value="${DATA.mAddress }"
							required="required" style="display: block;">
					</h5>
				</li>
				
				<li>
					<input type="text" class="text1 add" id="roadAddress"
						placeholder="도로명주소"> <span id="guide"
						style="color: #999; display: none"></span> <input type="text"
						class="add" id="detailAddress" placeholder="상세주소">	
				</li>   

        		<li>
                   	<label for="num" class="phone_form w3-serif"><b>핸드폰</b></label>
                    <input type="text" id="userMobile" name="mMobile" required class="">
                </li>
                
                
		<li id="avtChoose">
				<label for="avt" class="phone_form w3-serif"><b>프로필</b></label>
				<div class="w3-col avtM">
					<div class="w3-col m4">
						<input type="radio" name="mAvatar" value="11">
						<div>
							<img src="/img/avatar/pro1.PNG" width="90" height="90" class="avt_form">
						</div>
					</div>
					<div class="w3-col m4">
						<input type="radio" name="mAvatar" value="12">
						<div>
							<img src="/img/avatar/pro2.PNG" width="90" height="90" class="avt_form">
						</div>
					</div>
					<div class="w3-col m4">
						<input type="radio" name="mAvatar" value="13">
						<div>
							<img src="/img/avatar/pro3.PNG" width="90" height="90" class="avt_form">
						</div>
					</div>
				</div>
		</li>	

		<br>
		<br>
		<br>
		<br>
		<br>
			
    
               <li class="li_button">  
               		<button type="button" id="btn1" class="w3-margin w3-center w3-cyan">가입</button>     
            		<button type="button" onclick="history.go(-1);" id="btn2" class="w3-margin w3-center w3-gray">취소</button>	
			   </li>
		<br>
		<br>			   

            </ul>
        </form>
            
        
    </div>






</body>
</html>
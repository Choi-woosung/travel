<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css" >
<link rel="stylesheet" href="/css/bootstrap.css" >
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
	
	
	$('#findBtn').click(function(){
		$.ajax({
			url : "/member/find_pw.kit",
			type : "post",
			data : {
				id : $('#id').val(),
				email : $('#email').val()
			},
			success : function(result){
				alert(result);
			},
		});
	});
	
	$('#edit').click(function(){
		
	});
	

	
	
	$('#Check').click(function(){
		var sid = $('#id').val();
		
		$.ajax({
			url : "/member/idCheck.kit",
			type : "POST",
			dataType : "text",
			data : {
				"id" : sid
			},
			success : function(data){
				var ch = data;
				console.log(ch);
				
				if(ch == 1){
					$('#id').val();
					alert("존재하는 아이디입니다");
					
				}else{
					alert("존재하지않는 아이디입니다.");
				}
			},
			error : function(){
				alert("Error");
			}
	});
});
	
	
	$('#Injeung').click(function(){
		$(location).attr('href', 'pw_email.kit');
		
	});
	
	
});

</script>
<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
      
      .form-signin{
      	width : 500px;
      	margin : 0 auto;
      }
      
  	body{
	background-color: #f5f5f5;
	}

	.text-center{
		margin-top:100px;
	}
	
	#container{
		margin:0 auto;
	}


</style>
<title>비밀번호 찾기</title>
</head>
<body  class="text-center">
	<div id="container" class="text-center mb-1">
		<div class="w3-container w3-card-4">
			<div class="h3 mb-3 font-weight-normal">
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				<p>
					<label class="w3-margin">아이디
					<button type="button" id="Check" class="w3-green">아이디 체크</button></label>
					<input class="w3-input" type="text" id="id" name="mId" required>
				</p>
				<p>
					<label class="w3-margin">이메일
					<button type="button" id="Injeung" class="w3-blue">이메일 인증</button></label>
					<input class="w3-input" type="hidden" id="email" name="mMail" required>
				</p>
				<p class="w3-center">
					<button type="submit" id="findBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">OK</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
				</p>
			</div>
		</div>
	</div>
	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style>

  .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
html,
body {
  height: 100%;
}

body {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 420px;
  padding: 15px;
  margin: auto;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group > input,
.form-label-group > label {
  height: 3.125rem;
  padding: .75rem;
}

.form-label-group > label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0; /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  pointer-events: none;
  cursor: text; /* Match the input under the label */
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: 1.25rem;
  padding-bottom: .25rem;
}

.form-label-group input:not(:placeholder-shown) ~ label {
  padding-top: .25rem;
  padding-bottom: .25rem;
  font-size: 12px;
  color: #777;
}

/* Fallback for Edge
-------------------------------------------------- */
@supports (-ms-ime-align: auto) {
  .form-label-group > label {
    display: none;
  }
  .form-label-group input::-ms-input-placeholder {
    color: #777;
  }
}

/* Fallback for IE
-------------------------------------------------- */
@media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
  .form-label-group > label {
    display: none;
  }
  .form-label-group input:-ms-input-placeholder {
    color: #777;
  }
}      
</style>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<title>Document</title>

<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/js/bootstrap.min.js">
<script type="text/javascript">
	$(document).ready(function() {
		$('#cancel').click(function() {
			history.back();
		});
	});
</script>
</head>
<body class="bg-light">
	<form method="POST" class="form-signin" action="/member/memberCheck.kit">
		<div class="text-center mb-4">
    <img class="mb-4" src="/img/main/favicon2.ico" alt="" width="72" height="72" style="border-radius : 20px;">
    <h1 class="h3 mb-3 font-weight-bold">회원정보수정</h1>
      <p>${SID }님 어서오세요!</p>
      <p>회원정보를 수정하기 위해서 <span style="font-weight : bold;" class="text-danger">비밀번호</span>를 다시 한번</p>
      <p>입력하여 주십시오.</p>
  </div>
  <input type="hidden" name="mId" value="${DATA.mId}">

  <div class="form-label-group">
    <input type="password" id="pw" name="mPw" class="form-control" placeholder="Password" required>
    <label for="inputPassword">Password</label>
  </div>
  
  <button class="btn btn-lg btn-primary btn-block" id="save" type="submit">수정하기</button>
  <button class="btn btn-lg btn-block" id="cancel" style="background-color: gray; color: white;">뒤로가기</button>
  <p class="mt-5 mb-3 text-muted text-center">© 2019 – 2020 ConsulTravel Company Pte. Ltd., AllRights Reserved.</p>
			
					
						
			
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
<title>Insert title here</title>
</head>
<body>
<div class="jumbotron">
    <h1>로그인</h1>
</div>
<c:url var="loginPath" value="/user/login" />
<c:url var="signUpPath" value="/signup" />
<form action="${ loginPath }" method="post">
    <div class="form-group form-group-lg">
        <div class="form-group">
            <label>이메일</label>
            <input type="text" name="email" class="form-control" placeholder="이메일">
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="password" class="form-control" placeholder="비밀번호">
        </div>
        <div class="form-group">
        </div>
        <div class="form-action">
            <sec:csrfInput />
            <input type="submit" class="btn btn-primary btn-lg" value="로그인">
            <a href="${ signUpPath }" class="btn btn-default btn-lg">회원 가입</a>
        </div>
    </div>
</form>
</body>
</html>
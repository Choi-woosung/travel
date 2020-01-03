<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/w3.css" >
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
</head>
<body>
	<table border="1" width="300" height="300" align= "center">
		<tr>
			<td>
				<form action="/member/auth.kit" method="post">
					<label>이메일</label>
					<input type="email" name="email" placeholder="이메일주소를 입력하세요.">
					<button type="submit" name="submit">이메일 인증받기 (이메일 보내기)</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
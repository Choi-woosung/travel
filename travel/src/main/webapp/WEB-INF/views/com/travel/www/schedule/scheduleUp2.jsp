<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%-- meta --%>
<meta charset='UTF-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<%-- CSS --%>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<%-- Script --%>
<script src="/js/j-query-3.4.1.min.js"></script>
<%-- title --%>
<title>My Travel</title>
<%-- style --%>
<style>
	<%-- ALL --%>
	*{
	    box-sizing: border-box;
	    margin: 0;
	    padding: 0;
	}
	<%-- topDiv --%>
	.topDiv{
		position: fixed;
		top: 0;
		left: 0;
	    width: 100%;
	    height: 70px;
	}
</style>
</head>
<%-- body --%>
<body>
    <%-- topDiv --%>
	<div class="topDiv">
		<c:import url="/navigationBar.kit"></c:import>
	</div>
</body>
</html>
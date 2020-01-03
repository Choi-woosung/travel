<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- <link rel='stylesheet' type='text/css' media='screen' href='main.css'> -->
    <!-- <script src='main.js'></script> -->
    <style>
    	*{
    		box-sizing: border-box;
    		margin: 0;
    		padding: 0;
    	}
    	div{
    		margin: 0 auto;
    		width: 80%;
    		min-height: 50vh;
    		height: auto;
    	}
    	.mainBtn{
    		display: block;
    		width: 120px;
    		height: 64px;
    		background-color: black; 
    		color: white;
    		margin: 0 auto;
    		font-size: 1.25rem;
    		margin-top: 10%;
    	}
    </style>
</head>
<body>
	<div>${CRAWLING}</div>
	
	<input type="button" onclick="location.href = '/main.kit';" value="메인" class="mainBtn">
</body>
</html>
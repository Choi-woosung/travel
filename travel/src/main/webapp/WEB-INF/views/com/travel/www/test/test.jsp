<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- <link rel='stylesheet' type='text/css' media='screen' href='main.css'> -->
    <!-- <script src='main.js'></script> -->
</head>
<body>
	<div id="content"></div>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const content = document.getElementById('content');
            
            fetch('https://www.googleapis.com/travelpartner/v2.0/account_id/hotels')
            .then(response => response.json())
            .then(myJson => console.log(myJson));
        });
    </script>
</body>
</html>
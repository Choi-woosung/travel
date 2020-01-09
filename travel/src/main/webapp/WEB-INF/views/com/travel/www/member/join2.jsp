<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    .form-label-group{
	padding-top : 30px;
	}

	.form-control{
	display: block; 
	width: 50%;
	line-height: 1.5;
	align-items: center;
	}
	
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
	
	 #wrap{
                      
            margin-left:auto; 
            margin-right:auto;
            text-align:center;           
            margin-top:50px;
        }
		
   </style>        
        
 
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/css/w3.css" >
<link rel="stylesheet" href="/css/bootstrap.css" >
<link rel="stylesheet" href="/css/bootstrap.min.css" >
<link rel="stylesheet" href="/css/bootstrap-grid.css" >
<link rel="stylesheet" href="/css/bootstrap-grid.min.css" >
<link rel="stylesheet" href="/css/bootstrap-reboot.css" >
<link rel="stylesheet" href="/css/bootstrap-reboot.min.css" >
<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
</head>

<body class="text-center">
    <form method="POST" class="form-signin justify-content-md-center">
<div class="text-center mb-1">
  <img class="mb-4" src="/img/main/favicon2.ico" alt="" width="80" height="80" style="border-radius : 20px;">
  <h1 class="h3 mb-3 font-weight-normal">비밀번호 찾기</h1>
 


<div class="w3-margin">

	<label class="w3-margin">
	<input class="form-control" size="20" type="text" id="id" name="mId"  placeholder="아이디" required></label>
	<input type="submit" id="Check" size="10" value="아이디 체크">
	<input class="w3-input" type="hidden"  >
	


	<label class="W3-margin">
    <input type="email" size="31" id="email" name="mMail" class="form-control" placeholder="이메일" maxlength="30" required></label>
 	<span id="find_email"></span>
 

 </div> 

  <p class="w3-center">    
  	<button class="w3-margin btn btn-lg btn-primary btn-block" id="btn1" type="submit">OK</button>
  	<button class="w3-margin btn btn-lg btn-primary btn-block" onclick="history.go(-1);" id="btn2" type="submit">Cancel</button>
  </p>
</div>
</form>


</body>
</html>
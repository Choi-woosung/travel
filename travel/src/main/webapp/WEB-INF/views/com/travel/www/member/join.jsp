<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
<link rel="stylesheet" href="/css/w3.css" >
<title>회원가입</title>
    <style>
    
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
    </style>



<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript">
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
});
</script>
</head>
<body>
	
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray" class="w3-lobster">회원가입</font></b>
        <br><br><br>
    
        <form method="post" action="/member/joinProc.kit" class="form_container">
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
               		<input type="none" id="name" name="mName" required class=""> 
                </li>
                    
                    
                <li>
                    <label for="email" class="email_form w3-serif"><b>이메일</b></label>
                    <button type="submit" id="mail_in" name="mMail" class="w3-teal w3-text-light-gray">이메일 인증</button>
                    <input type="email" id="email" name="mMail" >
                </li>
                    

                <li>
                    <label for="text" class="address_form w3-serif"><b>주소</b></label>
                    <input type="text" id="address" name="mAddress" required class="">
                </li>
 <!--                
                <li>
                    <label for="date" class="date_form w3-serif"><b>PCdate</b></label>
                   	<input type="text" id="userNo" name="sPcdate" required class="">
                </li>
 -->               
                 <li>
                   	<label for="num" class="phone_form w3-serif"><b>핸드폰</b></label>
                    <input type="text" id="userMobile" name="mMobile" required class="">
                </li>
 <!--              
        		<li>
                    <label for="grade" class="grade_form w3-serif"><b>grade</b></label>
                    <input type="text" id="userGrdae" name="mGrade" required class="">
                </li>     
                            
        		<li>
                    <label for="point" class="point_form w3-serif"><b>point</b></label>
                    <input type="number" id="userPoint" name="mPoint" required class="">
                </li>   
  -->               
               <li class="li_button">  
               		<button type="submit" id="btn1" class="w3-margin w3-left w3-center w3-col m2 w3-cyan">가입</button>     
            		<button type="submit" id="btn2" class="w3-margin w3-right w3-center w3-col m2 w3-gray">취소</button>	
			   </li>
            </ul>
        </form>
            
        
    </div>


	




</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Web Crawler</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- <link rel='stylesheet' type='text/css' media='screen' href='main.css'> -->
    <!-- <script src='main.js'></script> -->
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        .mainBox {
            margin: 0 auto;
            width: 50%;
            height: auto;
            user-select: none;
        }
        .mainBox div {
            display: block;
            margin: 0 auto;
            width: 300px;
            padding: 16px;
            border: 1px solid rgb(230, 221, 221);
            border-radius: 8px;
            margin-top: 10%;
        }
        .mainBox div input {
            display: block;
            margin: 0 auto;
            width: 250px;
            border: none;
            font-size: 1.25rem;
        }
        .mainBox input#crawBtn {
            display: block;
            margin: 0 auto;
            width: 300px;
            padding: 16px;
            margin-top: 8px;
            border: 1px solid rgb(230, 221, 221);
            background-color: rgb(194, 210, 224);
            border-radius: 8px;
            font-size: 1.25rem;
            color: rgb(23, 24, 23);
        }
        .mainBox div input:focus {
            outline: none;
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
    <div class="mainBox">
        <div id="queryBox">
            <input type="text" placeholder="Query" autocomplete="off" id="query">
        </div>
        <input type="button" value="Crawling" id="crawBtn" />
        <input type="button" onclick="location.href = '/main.kit';" value="메인" class="mainBtn">
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', () => {

        	const crawBtn = document.getElementById('crawBtn');
            const query = document.getElementById('query');

            query.addEventListener('focus', e => {
                e.target.parentElement.style.outline = '1px solid rgb(77, 144, 254)';
            });

            query.addEventListener('focusout', e => {
                e.target.parentElement.style.outline = 'none';
            });
            
            query.addEventListener('keyup', e => {
                if (e.keyCode == 13) {
                    crawBtn.click();
                }
            });
        });
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {

            const crawBtn = document.getElementById('crawBtn');
            const query = document.getElementById('query');

            let bool = true;

            crawBtn.addEventListener('click', () => {

                let val = query.value;

				if (bool) {
                    if(val != '') {
                        bool = false;

                        location.href = '/crawling.kit?query=' + val;
                    }
                }
            });
        });
    </script>
</body>
</html>

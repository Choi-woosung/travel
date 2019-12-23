<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>TRAVEL </title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- <link rel='stylesheet' type='text/css' media='screen' href='main.css'> -->
    <!-- <script src='main.js'></script> -->
    <style>
        /* all s */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            list-style: none;
            border: none;
            outline: none;
            color: #8EC0E4;
            font-family: -apple-system,
            			 BlinkMacSystemFont,
            			 "Segoe UI",Roboto,
            			 "Helvetica Neue",
            			 Arial,"Noto Sans",
            			 sans-serif,
            			 "Apple Color Emoji",
            			 "Segoe UI Emoji",
            			 "Segoe UI Symbol",
            			 "Noto Color Emoji";
        }

        /* all e */

        /* body s */
        .mainBody {
            background-color: #6AAFE6;
        }

        /* body e */

        /* main s */
        .mainBox {
            width: 100%;
            height: 100vh;
            margin-top: 4%;
        }

        /* main e */

        /* schedule s */
        .scheduleBox {
            width: 85%;
            height: 100%;
            float: left;
        }

        .schedule {
            width: 50%;
            min-height: 50%;
            height: auto;
            margin: 0 auto;
            background-color: #CADBE9;
            margin-top: 2.5%;
            margin-bottom: 2.5%;
            padding-bottom: 2.5%;
            border-radius: 16px;
        }

        .toDay {
            font-weight: bold;
            user-select: none;
            text-align: center;
            font-size: 2rem;
        }

        .elCls {
            display: block;
            min-width: 90%;
            max-width: 90%;
            min-height: 5vh;
            height: auto;
            margin: 0 auto;
            margin-top: 2.5%;
            margin-bottom: 2.5%;
            border-radius: 16px;
            padding: 8px;
            font-size: 1.25rem;
            font-weight: bold;
        }

        /* schedule e */

        /* sidebar s */
        .sidebarBox {
            position: fixed;
            bottom: 0;
            right: 0;
            width: 15%;
            height: 93.5%;
            background-color: #D4DFE6;
        }

        .sidebar img {
            display: block;
            width: 100px;
            height: 100px;
            margin: 5% auto;
        }

        .sidebar li {
            display: block;
        }

        .saveBtn {
            display: block;
            width: 80%;
            height: 80px;
            margin: 0 auto;
            font-size: 1.5rem;
            font-weight: bold;
            border-radius: 16px;
        }

        /* sidebar e */

        /* del s */
        .del {
            display: none;
        }

        /* del e */

        /* modal s */
        .loginModal {
            position: fixed;
            top: 0;
            left: 0;
            display: none;
            width: 100%;
            height: 100vh;
            background-color: black;
            opacity: 0.4;
        }

        .loginModalBox {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
        }

        .modalFrame {
            display: block;
            flex-basis: 800px;
            height: 800px;
            margin: auto;
        }

        /* modal e */
        
        /* topMenu s */
        .topMenu{
        	position: fixed;
        	top: 0;
        	left: 0;
        	width: 100%;
        	height: 62px;
        	background-color: rgb(248, 249, 250);;
        	display: flex;
        	overflow: hidden;
        }
        .travel, .loginNav, .signUpNav{
        	margin-top: auto;
        	margin-bottom: auto;
        	padding-bottom: 1px;
       	}
        .travel{
        	margin-left: 16px;
        	font-size: 20px;
        	color: rgba(0, 0, 0, 0.9);
        	font-weight: 400;
        }
        .loginNav{
        	margin-left: auto;
        	font-size: 1.25rem;
        	margin-right: 16px;
        	color: rgba(0, 0, 0, 0.5);
        }
        .signUpNav{
        	margin-right: 24px;
        	font-size: 1.25rem;
        	color: rgba(0, 0, 0, 0.5);
        }
        .travel:hover, .loginNav:hover, .signUpNav:hover{
			cursor: pointer;
		}
		.loginNav:hover, .signUpNav:hover{
			color: rgba(0, 0, 0, 0.9);
		}
        /* topMenu e */
    </style>
</head>
<body class="mainBody">
    <!-- main s -->
    <div class="mainBox" dropzone="true">
    	<!-- topMenu s -->
		<div class="topMenu">
			<div class="travel">TRAVEL</div>
			<div class="loginNav">로그인</div>
			<div class="signUpNav">회원가입</div>
		</div>
		<!-- topMenu e -->
    
        <!-- schedule s -->
        <ul class="scheduleBox">
            <li class="schedule">
                <div class="toDay">Day 1</div>
            </li>
            <li class="schedule">
                <div class="toDay">Day 2</div>
            </li>
            <li class="schedule">
                <div class="toDay">Day 3</div>
            </li>
        </ul>
        <!-- schedule e -->

        <!-- sidebar s -->
        <div class="sidebarBox">
            <!-- side s -->
            <ul class="sidebar">
                <li><img src="/img/schedule/hotel.jpg" alt="hotel" class="side">
                </li>
                <li><img src="/img/schedule/restaurant.jpg" alt="restaurant" class="side"></li>
                <li><img src="/img/schedule/taxi.jpg" alt="taxi" class="side">
                </li>
                <li><img src="/img/schedule/text.jpg" alt="text" class="side">
                </li>
                <li><img src="" alt=""></li>
            </ul>
            <!-- side e -->

            <!-- menu s -->
            <ul class="menu">
                <li><input type="button" class="saveBtn" value="저장">
                </li>
            </ul>
            <!-- menu e -->
        </div>
        <!-- sidebar e -->
    </div>
    <!-- main e -->

    <!-- del s -->
    <div class="del"></div>
    <!-- del e -->

    <!-- modal s -->
    <div class="loginModal"></div>
    <div class="loginModalBox">
        <!-- <iframe src="http://localhost/member/login.kit" class="modalFrame"></iframe> -->
    </div>
    <!-- modal e -->

    <!-- mainScript s -->
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // all s
            localStorage.removeItem('cnt');
            // all e

            // var s
            const mainBox = id('.mainBox');
            const schedule = document.getElementsByClassName('schedule');
            const sidebar = id('.sidebar');
            const saveBtn = id('.saveBtn');
            const del = id('.del');
            const travel = id('.travel');
            const loginNav = id('.loginNav');
            const signUpNav = id('.signUpNav');
            let cnt = localStorage.getItem('cnt');
            // var e

            // if s
            if (cnt == undefined) {
                localStorage.setItem('cnt', 0);
                cnt = localStorage.getItem('cnt');
            }
            // if e

            // for s
            for (let i = 0; i < sidebar.children.length; i++) {
                let id = sidebar.children[i].firstElementChild;
                id.setAttribute('draggable', true);
                evt(id, 'dragstart', dragstart_);
            }
            for (let i = 0; i < schedule.length; i++) {
                schedule[i].setAttribute('dropzone', true);
                evt(schedule[i], 'dragover', dragover_); 
                evt(schedule[i], 'drop', drop_);
                evt(schedule[i], 'dragstart', dragstart_);
            }
            // for e

            // event s
            evt(sidebar, 'dragstart', dragstart_);
            // evt(saveBtn, 'click', saveEvt);
            evt(saveBtn, 'click', saveClick);
            evt(mainBox, 'dragover', dragover_);
            evt(mainBox, 'drop', drop_box);
            evt(travel, 'click', () => {
            	location.href = '/';
            });
            evt(loginNav, 'click', () => {
            	location.href = '/member/login.kit';
            });
            evt(signUpNav, 'click', () => {
            	location.href = '/member/join.kit';
            });
            // event e

            // function s
            // querySelector
            function id(id = new String) {
                return document.querySelector(id);
            }
            // addEventListener
            function evt(id = new Object, evt = new String, fun = new Function) {
                id.addEventListener(evt, fun);
            }
            // dragstart_ 
            function dragstart_(e) {
                let id = e.target;
                e.dataTransfer.setData('alt', id.getAttribute('alt'));
            }
            function dragover_(e) {
                e.preventDefault();
            }
            function drop_(e) {
                e.preventDefault();
                let id = e.dataTransfer.getData('alt');
                let el = getEl(id);

                this.appendChild(el);
            }
            // menu event
            function getEl(id) {
                let attr;

                cnt++;

                // sidebar s 
                switch (id) {
                    case 'hotel':
                        attr = createEl('textarea');
                        break;
                    case 'restaurant':
                        attr = createEl('textarea');
                        break;
                    case 'taxi':
                        attr = createEl('textarea');
                        break;
                    case 'text':
                        attr = createEl('textarea');
                        break;
                }
                // sidebar e

                if (attr != undefined) {
                    attr.setAttribute('alt', 'el' + cnt);
                    attr.setAttribute('draggable', true);
                    attr.setAttribute('class', 'elCls');
                }

                return attr;
            }
            function createEl(id) {
                return document.createElement(id);
            }
            function saveEvt() {
                location.href = '/schedule/scheduleList.kit';
            }
            function drop_box(e) {
                e.preventDefault();
                let id = e.dataTransfer.getData('alt');
                let el = document.querySelector('[alt=' + id + ']');

                if (el.alt == undefined) {
                    el.style.display = 'none';
                    del.appendChild(el);
                    del.removeChild(el);
                }
            }
            function saveClick(e) {
                e.preventDefault();

                if (id('.loginModal') != undefined) {
                    id('.loginModal').style.display = 'block';
                    id('.loginModalBox').style.display = 'flex';
                    id('.mainBody').style.overflow = 'hidden';
                }
            }
            // function e
        });
    </script>
    <!-- mainScript e -->
</body>
</html>

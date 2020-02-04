<%@page import="Project_Home_Model.Home_Student_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/animate.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="css/jquery.bxslider.css" />
<link rel="shortcut icon" href="imgs/favicon.ico">
<style type="text/css">
	.subbanner{
		margin: 0px auto;
		margin-top: -10px;
		text-align: center;
	}
	.subbanner img{
		max-width: 100%;
		height: auto;
		margin-bottom: 20px;
	}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.js"></script>
<script type="text/javascript" src="js/wow.js"></script>
<script type="text/javascript">
<%
Home_Student_Dto login=(Home_Student_Dto)session.getAttribute("login");
%>
	$(document).ready(function(){
		
		
		eleSub=('#submenu');
		new WOW().init(); 
		$('.bxslider').bxSlider({
			auto: true
			, mode: 'fade'
			, autoStart: true
			, controls: true
			, pause: 3000
			, pager: true
		});
		
		$('#menu a:nth-child(3)').on("mouseenter", function(){
			$('#submenu').fadeIn();
		});
		$('#menu a:nth-child(4)').on("mouseenter", function(){
			$('#submenu').fadeOut();
		});
		$('#menu a:nth-child(2)').on("mouseenter", function(){
			$('#submenu').fadeOut();
		});
		$('#header').on("mouseenter", function(){
			$('#submenu').fadeOut();
		});
		$('#submenu').on("mouseleave", function(){
			$('#submenu').fadeOut();
		});
		$('#menu a:nth-child(3)').click(function () {
			return false;
		});
		
	});
	
</script>
<title>국가기간전략산업직종 | 비트캠프 | </title>
</head>
<body>
<c:url value="/" var="root"></c:url>
	<div class="wow fadeInUp">
		<div id="top">
			<ul>
				<li>구리센터</li>
				<li><a href="http://sch.bitcamp.co.kr/index.php?main_page=home">서초본원</a></li>
				<li><a href="http://gn.bitcamp.co.kr/index.php?main_page=home">강남센터</a></li>
				<li><a href="http://sc.bitcamp.co.kr/index.php?main_page=home">신촌센터</a></li>
				<li><a href="http://jn.bitcamp.co.kr/index.php?main_page=home">종로센터</a></li>
			</ul>
		</div>
		<div id="blank">
			<ul>
				<li></li>
			</ul>
		</div>
		<div id="header">
			<ul>
				<li><a href="${root }index.html"><img src="imgs/logo/widelogo.jpg"/></a></li>
			</ul>
		</div>
		<div id="menu">
			<a class="first after" href="${root }Home/intro.html">학원소개</a>
			<a class="first after" href="${root }Home/regnot.html">취업교육과정</a>
			<a style="cursor: default;" class="first after" href="#">고객센터</a>
			<%if(login==null){ %>
			<a class="first after" href="${root }Home/login.html">로그인</a>
			<%}else{ %>
			<a class="first after" href="${root }Home/MyPage/check.html">마이페이지</a>
			<%} %>
		</div>
		<div id="submenu">
			<ul>
				<li><a href="${root }Home/notice.html">공지사항</a></li>
				<li><a href="${root }Home/faq.html">FAQ</a></li>
			</ul>
		</div>
		<div class="wow bounceInRight">
			<div class="bxslider">
				<div><img src="imgs/banner/bg1.jpg" /></div>
				<div><img src="imgs/banner/bg2.jpg" /></div>
				<div><img src="imgs/banner/bg3.jpg" /></div>
			</div>
		</div>
		<div class="subbanner">
			<img src="imgs/index/benefit.jpg">
			<img src="imgs/index/job.jpg">
		</div>
		<div id="footer">
			<ul>
				<li>
					<div class="logo">
						<img src="imgs/logo/logo.png" />	
					</div>
				</li>
				<li>
					<div class="addr">
						비트캠프 서울시 서초구 강남대로 459 (서초동, 백암빌딩) | 대표이사 : 조현정<br/>
						Copyright © 비트캠프 All rights reserved.<br/>
						<button id="loginButton" type="button" onclick="window.open('${root}LMS/lmsLogin.html', 'LMS 관리자시스템 | 비트캠프', 'width=1200, height=700, top=20, left=100, location=no, status=no, directories=no, scrollbars=yes');">관리자 로그인</button>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
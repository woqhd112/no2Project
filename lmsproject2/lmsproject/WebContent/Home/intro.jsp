<%@page import="Project_Home_Model.Home_Student_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="../imgs/favicon.ico">
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/index.css" />
<style type="text/css">

	.sub1{
		margin: 0px auto;
		margin-top: 30px;
		width: 906px;
		height: 164px;
		background-image: url(../imgs/intro/introsub1.jpg);  
		position: relative;                                                            
		background-size: cover;
	}
	.sub2{
		margin: 0px auto;
		margin-bottom: 60px;
		width: 907px;
		height: 967px;
		background-image: url(../imgs/intro/introsub2.jpg);  
		position: relative;                                                            
		background-size: cover;
	}
	.img{
		width: 100%;
		height: 200px;
		position: relative;
    	background-image: url(../imgs/submenu/intro.jpg);                                                               
		background-size: cover;
	}
	
	.img .content{
		position: absolute;
		top: 50%;
		left: 40%;
		transform: translate(-50%, -50%);      
		color: white;
		z-index: 2;
		text-align: left;
	}
	
	.img .content h1{                                          
		font-size: 30px;
		font-weight: bold;
	}
	.img .content h2{                                          
		font-size: 15px;
		margin-bottom: 20px;
	}
	.img .content h3{                                          
		font-size: 10px;
	}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery.bxslider.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		eleSub=('#submenu');
		
		$('html, body').animate({
			scrollTop: $('.img').offset().top
			}, 'slow');
		
		$('.bxslider').bxSlider({
			auto: true
			, mode: 'fade'
			, autoStart: true
			, controls: false
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
		$('#menu a:first-child').click(function () {
			return false;
		});
		$('#menu a:nth-child(3)').click(function () {
			return false;
		});
		
	});
	
</script>
<title>학원소개 | 비트캠프</title>
</head>
<body>
<c:url value="/" var="root"></c:url>
<%
	Home_Student_Dto login=(Home_Student_Dto)session.getAttribute("login");
%>
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
			<li><a href="${root }index.html"><img src="../imgs/logo/widelogo.jpg"/></a></li>
		</ul>
	</div>
	<div id="menu">
		<a style="cursor: default;" class="first after" href="${root }Home/intro.html">학원소개</a>
		<a class="first after" href="${root }Home/regnot.html">취업교육과정</a>
		<a class="first after" href="#">고객센터</a>
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
	<div class="img">
		<div class="content">
			<h1>교육센터 소개</h1>
			<h2>실무중심 교육 및 신기술을 선도하는 교육센터!</h2>
			<h3>IT분야 국비지원교육 비트캠프_고용노동부 및 산업인력공단 사업을 통한 무료교육, 취업처 발굴 및 취업연계
지원, <br/> K-MOVE(해외취업) 사업을 통해 일본, 베트남 등에 IT전문가 및 비즈니스 관리자 양성을 하고 있습니다.</h3>
		</div>
	</div>
	<div class="sub">
		<div class="sub1"></div>
		<div class="sub2"></div>
	</div>
	<div id="footer">
		<ul>
			<li>
				<div class="logo">
					<img src="../imgs/logo/logo.png" />	
				</div>
			</li>
			<li>
				<div class="addr">
					비트캠프 서울시 서초구 강남대로 459 (서초동, 백암빌딩) | 대표이사 : 조현정<br/>
					Copyright © 비트캠프 All rights reserved.<br/>
					<button id="loginButton" type="button" onclick="window.open('${root}LMS/lmsLogin.html', 'LMS 관리자시스템 | 비트캠프', 'width=1200, height=750, top=0, left=100, location=no, status=no, directories=no, scrollbars=yes');">관리자 로그인</button>
				</div>
			</li>
		</ul>
	</div>
</body>
</html>
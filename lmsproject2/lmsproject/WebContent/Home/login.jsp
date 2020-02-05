<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/animate.css" />
<link rel="shortcut icon" href="../imgs/favicon.ico">
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/index.css" />
<style type="text/css">
	.img{
		width: 100%;
		height: 200px;
		position: relative;
    	background-image: url(../imgs/submenu/login.jpg);                                                               
		background-size: cover;
	}
	
	.img .content{
		position: absolute;
		top: 50%;
		left: 42%;
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
	.error::placeholder {
		font-size:12px;
		font-weight:bold;
		color:red;
	}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery.bxslider.js"></script>
<script type="text/javascript" src="../js/wow.js"></script>
<script type="text/javascript">
<c:url value="/" var="root"></c:url>
	
	$(document).ready(function(){
		new WOW().init(); 
		
		eleSub=('#submenu');

		$('.login')[0].scrollIntoView();
		
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
		$('#menu a:nth-child(3)').click(function () {
			return false;
		});
		$('#menu a:nth-child(4)').click(function () {
			return false;
		});
		
		$('.btns .btn2').on("click", function(){
			var id=$('input#id').val();
			var pw=$('input#password').val();
			
			$.post('login.html', 'id='+id+'&pw='+pw, function(data){
				 if(data=='fail'){
	        		 alert('정보 불러오기 실패하였습니다.');
	        	 }else{
		             if(data==1){
		                alert('접속하였습니다.');
		                window.location.href="${root}Home/MyPage/check.html";
		             }else{
		                  $('#id').val('');
		                  $("#id").addClass("error");
		                  $('#id').attr('placeholder', '아이디 및 비밀번호를 확인해주세요.');
		                  $('#password').val('');
		                  $('#password').attr('placeholder', '비밀번호를 입력해주세요.');
		             }
	        	 }
			});
		});
	});
	
</script>
<title>학생 로그인 | 비트캠프</title>
</head>
<body>

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
		<a class="first after" href="${root }Home/intro.html">학원소개</a>
		<a class="first after" href="${root }Home/regnot.html">취업교육과정</a>
		<a class="first after" href="#">고객센터</a>
		<a style="cursor: default;" class="first after" href="${root }Home/login.html">로그인</a>
	</div>
	<div id="submenu">
		<ul>
			<li><a href="${root }Home/notice.html">공지사항</a></li>
			<li><a href="${root }Home/faq.html">FAQ</a></li>
		</ul>
	</div>
	<div class="img">
		<div class="content">
			<h1>든든 학습 파트너, 비트캠프 학습지원센터</h1>
			<h2>IT계열 취업, 진짜 준비는 지금부터입니다!</h2>
			<h3>비트캠프에서는 교육과정에 입학하시는 모든 교육생분들의 역량을 <br/> 
			향상시킬 수 있도록 체계적이고 효율적인 관리와 밀착지원을 약속드립니다.</h3>
		</div>
	</div>
	<div class="focus"></div>
	<div id="effect" class="wow fadeInUp">
		<div class="login">
			<div class="loginForm">
				<h2 style="color:#044879">비트캠프&nbsp;</h2><h2>로그인</h2><br/>
				<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요.">
	           	<br/>
	           	<input type="password" id="password" name="pw" placeholder="비밀번호를 입력해주세요.">
	           	<br/>
	           	<div class="btns">
					<a href="${root }Home/member.html"><button class="btn" id="joinBtn" type="button">JOIN</button></a>
					<button class="btn2" id="loginBtn" type="submit">LOGIN</button>
	   			</div>
	           	<div class="search">
					<a href="${root }Home/idcheck.html">아이디 찾기</a><span style="cursor: default">&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;</span>
					<a href="${root }Home/pwcheck.html">비밀번호 찾기</a>
	   			</div>
	   		</div>
		</div>
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
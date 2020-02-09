<%@page import="Project_Home_Model.Home_Student_Dto"%>
<%@page import="Project_Home_Model.Home_Student_Dao"%>
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
		
		$('.btn3').on("click", function(){
			var search=confirm('정보를 맞게 입력하셨습니까?');
			if(search){
				var name=$('#id').val();
				var name2=$.trim(name);
				console.log(name);
				var num=$('#num').val();
				var num2=$.trim(num);
				console.log(num);
				if(name2==""){
					alert('공백은 입력할 수 없습니다.')
					$('#id').addClass("error");
					$('#id').attr('placeholder', '공백은 불가능합니다.');
					$('#id').focus();
					return false;
				}
				if(num2==""){
					alert('공백은 입력할 수 없습니다.')
					$('#num').addClass("error");
					$('#num').attr('placeholder', '공백은 불가능합니다.');
					$('#num').focus();
					return false;
				}
				$.post('pwcheck.html','id='+name+'&num='+num, function(data){
					if(data!="wow"){
						alert('당신의 비밀번호는 ['+data+'] 입니다.');
						location.href = 'login.html';
						return false;
					}else{
						$('#id').val("");
						$('#num').val("");
						alert('등록된 정보가 없습니다.');
						return false;
					}
				});
			}else{
				alert('등록된 정보가 없습니다.');
				return false;
			}
		});
	});
	
</script>
<title>아이디 찾기 | 비트캠프</title>
</head>
<body>
<c:url value="/" var="root"></c:url>
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
		<a class="first after" href="${root }Home/login.html">로그인</a>
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
				<h2 style="color:#044879">비밀번호&nbsp;</h2><h2>찾기</h2><br/>
				<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요.">
	           	<br/>
	           	<input type="text" id="num" name="num" placeholder="전화번호를 입력해주세요.">
	           	<br/>
	           	<div class="btns">
					<button class="btn3" id="loginBtn" type="submit">비밀번호 찾기</button>
	   			</div>
	           	<div class="idsearch">
					<a href="${root }Home/login.html">로그인 하기</a><span style="cursor: default">&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;</span>
					<a href="${root }Home/idcheck.html">아이디 찾기</a>
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
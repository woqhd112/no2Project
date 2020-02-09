<%@page import="Project_LMS_Model.LMS_AttendInfo_Dto"%>
<%@page import="Project_Home_Model.Home_Student_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/animate.css" />
<link rel="shortcut icon" href="../../imgs/favicon.ico">
<link rel="stylesheet" href="../../css/reset.css" />
<link rel="stylesheet" href="../../css/index.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
	.stuMenus>li:nth-child(2){
		font-weight: bold;
		background-color: #304047;
	}
	.stuMenus>li:nth-child(2) a{
		color: white;
	}
	.img{
		width: 100%;
		height: 200px;
		position: relative;
    	background-image: url(../../imgs/submenu/login.jpg);                                                               
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
	
	
	.u.i-progressbar {
		position: relative;
		text-align: center;
		margin: 0px auto;
	}
	
	.colorBar {
		width: 295px;
		height: 30px;
		margin: 0px auto;
		position: relative;
		
	}
	.colorBar-label{
		position: absolute;
		line-height: 30px;
		text-align: center;
		top:50%; 
		left: 50%; 
		transform:translate(-50%, -50%);

	}
	
</style>
<script type="text/javascript" src="../../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../js/jquery.bxslider.js"></script>
<script type="text/javascript" src="../../js/wow.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.js"></script>
<script type="text/javascript">
<c:url value="/" var="root"></c:url>
	$(document).ready(function(){
		
		$(".focus")[0].scrollIntoView(); 
		
//		new WOW().init(); 
		
		eleSub=('#submenu');
		
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
		$('#menu a:nth-child(3)').on("click", function () {
			return false;
		});
		$('.stuMenus>li:nth-child(2) a').on("click", function () {
			return false;
		});
		$('#menu a:nth-child(4)').on("click", function () {
			return false;
		});
		$('#headerBtn a').eq(1).on("click",function(){
			var logout=confirm('로그아웃 하시겠습니까?');
			if(logout){
				$.post('${root}Home/logout.html',function(){
					alert('로그아웃이 완료되었습니다.');
					window.location.href="${root}Home/login.html";
				});
			}
			return false;
		});
	});
	

	
	$(function(){
		
		var pct1 = $('#attendPct').text().split('%');
		var pct2 = $('#progressPct').text().split('%');
		console.log('출석률은'+pct1[0]+'%');
		console.log('강좌진행률은'+pct2[0]+'%');
		
		var colorNum1 = (pct1[0]+1-1)/10;
		var colorNum2 = (pct2[0]+1-1)/10;
		console.log(colorNum1);
		console.log(colorNum2);
		
		if(colorNum1!=0)
		$('#attendPct').eq(0).progressbar({value:colorNum1});
		$('#attendPct').eq(0).find(".ui-progressbar-value").css({"background":"rgb(4,72,121,0.3)"});
		
		if(colorNum2!=0)
		$('#progressPct').eq(0).progressbar({value:colorNum2});
		$('#progressPct').eq(0).find(".ui-progressbar-value").css({"background":"rgb(4,72,121,0.3)"});

		
		if(colorNum1==0){
		$('#attendPct').eq(0).progressbar({value:colorNum1});
		$('#attnedPct .colorBar-label').css({"color":"black",});
		}
		
		if(colorNum2==0){
		$('#progressPct').eq(0).progressbar({value:colorNum2});
		$('#progressPct .colorBar-label').css({"color":"black","margin":"auto"});
		}
	});
	
</script>
<title>내 수강정보 | 비트캠프</title>
</head>
<body>
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
			<li><a href="${root }index.html"><img src="../../imgs/logo/widelogo.jpg"/></a></li>
		</ul>
	</div>
	<div id="menu">
		<a class="first after" href="${root }Home/intro.html">학원소개</a>
		<a class="first after" href="${root }Home/regnot.html">취업교육과정</a>
		<a class="first after" href="#">고객센터</a>
		<%if(login==null){ %>
		<a class="first after" href="${root }Home/login.html">로그인</a>
		<%}else{ %>
		<a style="cursor: default;" class="first after" href="${root }Home/MyPage/check.html">마이페이지</a>
		<%} %>
	</div>
	<div id="submenu">
		<ul>
			<li><a href="${root }Home/notice.html">공지사항</a></li>
			<li><a href="${rot }Home/faq.html">FAQ</a></li>
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
	<div class="wow fadeInUp">
		<div class="default">
			<div class="conHeader">
				<div class="welcome">&nbsp;※&nbsp;&nbsp;<%=login.getStuname() %>&nbsp;님이 로그인하였습니다.</div>
				<div id="headerBtn">
					<a href="${root }Home/MyPage/inforup.html">정보수정</a>
					<a href="${root }Home/logout.html">로그아웃</a>
				</div>
			</div>
			<div class="box">
				<ul class="stuMenus">
					<li id="check"><a href="${root }Home/MyPage/check.html">◎&nbsp;&nbsp;출석체크</a></li>
					<li id="subinfor"><a style="cursor: default;" href="${root }Home/MyPage/subInfor.html">◎&nbsp;&nbsp;수강정보</a></li>
					<li id="examview"><a href="${root }Home/MyPage/examView.html">◎&nbsp;&nbsp;시험조회</a></li>
					<li id="gradeoepn"><a href="${root }Home/MyPage/gradeOpen.html">◎&nbsp;&nbsp;성적열람</a></li>
					<li id="employ"><a href="${root }Home/MyPage/employ.html">◎&nbsp;&nbsp;채용정보</a></li>
				</ul>
				<ul class="mainbox">
					<li class="title" style="margin-top:50px; margin-bottom: 40px">[ 수강 정보 ]</li>
					<li>
	              		<table class="infor">
	              		<%
	              		Object[] obj=(Object[])request.getAttribute("bean");
	              		Home_Student_Dto bean1=(Home_Student_Dto)obj[0];
	              		LMS_AttendInfo_Dto bean2=(LMS_AttendInfo_Dto)obj[1];
            		%>
	              			<tr>
	                   			<th>강좌명</th>
	                   			<td style="font-size: 16px; color: #044879; font-weight: bold;"><%=bean1.getClassname() %></td>
	               			</tr>
	               			<tr>
	                   			<th>출석</th>
	                   			<td><%=bean2.getOntime() %>회</td>
	               			</tr>
	               			<tr>
	                   			<th>지각</th>
	                   			<td><%=bean2.getLate() %>회</td>
	               			</tr>
	               			<tr>
	                   			<th>결석</th>
	                   			<td><%=bean2.getAbsent() %>회</td>
	               			</tr>
	               			<tr>
	                   			<th>출석률</th>
	                   			<td><div class="colorBar" id="attendPct"><div class="colorBar-label"><%=bean2.getCheckpct()+"%" %></div></div></td>
	               			</tr>
	               			<tr>
	                   			<th>강좌 진행률</th>
	                   			<td><div class="colorBar" id="progressPct"><div class="colorBar-label"><%=bean2.getAttendpct()+"%" %></div></div></td>
	                   		</tr>
	            		</table>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="footer">
		<ul>
			<li>
				<div class="logo">
					<img src="../../imgs/logo/logo.png" />	
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
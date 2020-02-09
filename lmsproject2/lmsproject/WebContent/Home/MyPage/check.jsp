<%@page import="Project_Home_Model.Home_AttendTime_Dto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Project_Home_Model.Home_Student_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/animate.css" />
<link rel="shortcut icon" href="../../imgs/favicon.ico">
<link rel="stylesheet" href="../../css/reset.css" />
<link rel="stylesheet" href="../../css/index.css" />
<style type="text/css">
	.default .box .mainbox .title{
		position: relative;
		top: -145px;
		padding: 10px;
		padding-left: 20px;
		background-color: #f9f9f9;
		text-align: left;
		font-size: 14px;
		font-weight: bold;
		margin-bottom: 15px;
	}
	.stuMenus>li:FIRST-CHILD{
		font-weight: bold;
		background-color: #304047;
	}
	.stuMenus>li:FIRST-CHILD a{
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
</style>
<script type="text/javascript" src="../../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../js/jquery.bxslider.js"></script>
<script type="text/javascript" src="../../js/wow.js"></script>
<script type="text/javascript">
<c:url value="/" var="root"></c:url>
	<%
	Home_AttendTime_Dto bean=(Home_AttendTime_Dto)request.getAttribute("bean");
	Home_Student_Dto login=(Home_Student_Dto)session.getAttribute("login");
	Home_AttendTime_Dto check=(Home_AttendTime_Dto)session.getAttribute("check");
	%>
	$(document).ready(function(){
		
		$(".focus")[0].scrollIntoView(); 
		new WOW().init(); 
		
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
		$('#menu a:nth-child(4)').on("click", function () {
			return false;
		});
		$('.stuMenus>li:FIRST-CHILD a').on("click", function () {
			return false;
		});
		
		<%if(login.getClassname().equals("미배정")){%>
		$('.btn2').prop("disabled", true).css("color","silver").css("background-color","gray");
        $('.default .box .mainbox .notice').eq(0).text('반을 배정받지 않았습니다.');
		$('.default .box .mainbox .notice').eq(1).text('반을 배정받지 않았습니다.');                                        
		<%}%>
		
		<%if(check.getArrtime()==null&&check.getLeavetime()==null){%>
			$('.btn3').prop("disabled", true).css("color","silver");
			$('.btn2').on("click", function(){
				<%
				Date today=new Date();
				SimpleDateFormat date=new SimpleDateFormat("HHmmss");
				int time=Integer.parseInt(date.format(today));
				
				if(time>0&&time<240000){
				%>
				$('.btn2').prop("disabled", true).css("color","silver").css("background-color","gray");
				$('.btn3').prop("disabled", true).css("color","black").css("background-color","#f0f0f0");
				$('.btn3').prop("disabled", false);
				var data=${login.stunum}+',arrive';
				$.post('../../Home/MyPage/check.html','data='+data,function(data1){
					if(data1=='fail'){
						alert('제대로 작동하지 않았습니다. 재로그인 부탁드립니다.');
					}else{
						alert('입실이 완료되었습니다.');
					}
				});
				setTimeout(function(){
					location.reload();
				}, 300);
				<%}else{%>
				alert('입실시간이 아닙니다.');
				<%}%>
			});
		<%}else if(check.getArrtime()!=null&&check.getLeavetime()==null){%>
			$('.btn3').on("click", function(){
				$('.btn3').prop("disabled", true).css("color","silver").css("background-color","gray");
				var data=${login.stunum}+',leave';
				$.post('../../Home/MyPage/check.html','data='+data,function(data1){
					if(data1=='fail'){
						alert('제대로 작동하지 않았습니다. 재로그인 부탁드립니다.');
					}else{
						alert('퇴실이 완료되었습니다.');
					}
				});
				setTimeout(function(){
					location.reload();
				}, 300);
			});
            <%if(bean.getArrtime()!=null){%>
				$('.default .box .mainbox .notice').eq(0).text('<%=bean.getArrtime()%>에 입실하였습니다.');
			<%}else{%>
				$('.default .box .mainbox .notice').eq(0).text('출석마감 되었습니다. 재접속 해주세요.');
			<%}%>                                                             
			$('.btn2').prop("disabled", true).css("color","silver").css("background-color","gray");
			$('.btn3').prop("disabled", true).css("color","black").css("background-color","#f0f0f0");
			$('.btn3').prop("disabled", false);
		<%}else if(check.getArrtime()!=null&&check.getLeavetime()!=null){
			if(bean.getArrtime()!=null&&bean.getLeavetime()!=null){
		%>
				$('.default .box .mainbox .notice').eq(0).text('<%=bean.getArrtime()%>에 입실하였습니다.');
				$('.default .box .mainbox .notice').eq(1).text('<%=bean.getLeavetime()%>에 퇴실하였습니다.');
		<%	}else{%>
				$('.default .box .mainbox .notice').eq(0).text('출석마감 되었습니다. 재접속 해주세요.');
				$('.default .box .mainbox .notice').eq(1).text('출석마감 되었습니다. 재접속 해주세요.');
		<%	}%>
				$('.btn2').prop("disabled", true).css("color","silver").css("background-color","gray");
				$('.btn3').prop("disabled", true).css("color","silver").css("background-color","gray");
		<%}%>
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
	
</script>
<title>출석체크 | 비트캠프</title>
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
			<li><a href="${root }index.html"><img src="../../imgs/logo/widelogo.jpg"/></a></li>
		</ul>
	</div>
	<div id="menu">
		<a class="first after" href="${root }Home/intro.html">학원소개</a>
		<a class="first after" href="${root }Home/regnot.html">취업교육과정</a>
		<a style="cursor: default;" class="first after" href="#">고객센터</a>
		<%if(login==null){ %>
		<a class="first after" href="${root }Home/login.html">로그인</a>
		<%}else{ %>
		<a style="cursor: default;" class="first after" href="${root }Home/MyPage/check.html">마이페이지</a>
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
					<li id="check"><a style="cursor: default;" href="${root }Home/MyPage/check.html">◎&nbsp;&nbsp;출석체크</a></li>
					<li id="subinfor"><a href="${root }Home/MyPage/subInfor.html">◎&nbsp;&nbsp;수강정보</a></li>
					<li id="examview"><a href="${root }Home/MyPage/examView.html">◎&nbsp;&nbsp;시험조회</a></li>
					<li id="gradeoepn"><a href="${root }Home/MyPage/gradeOpen.html">◎&nbsp;&nbsp;성적열람</a></li>
					<li id="employ"><a href="${root }Home/MyPage/employ.html">◎&nbsp;&nbsp;채용정보</a></li>
				</ul>
				<ul class="mainbox">
				<%Date today=new Date();
				  SimpleDateFormat date1=null;
				  date1=new SimpleDateFormat("yyyy년 MM월 dd일");
				%>
					<li><img class="checkimg" src="../../imgs/logo/colorlogo2.png" /></li>
					<%if(login.getClassname().equals("미배정")){ %>
						<li class="title">[ 반을 배정받지 않았습니다. ]</li>
					<%}else{ %>
						<li class="title">[ <%=date1.format(today) %> 출석체크 ]</li>
					<%} %>
					<li class="notice">에 입실하였습니다.</li>
					<li class="margin"><button type="submit" class="btn2">입실</button></li>
					<li class="notice">에 퇴실하였습니다.</li>
					<li><button type="submit" class="btn3">퇴실</button></li>
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
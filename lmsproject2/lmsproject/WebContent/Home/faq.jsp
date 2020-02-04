<%@page import="Project_Utils.Paging"%>
<%@page import="Project_Home_Model.Home_Student_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="../imgs/favicon.ico">
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/index.css" />
<style type="text/css">
	.img{
		width: 100%;
		height: 200px;
		position: relative;
    	background-image: url(../imgs/submenu/notice.jpg);                                                               
		background-size: cover;
	}
	
	.img .content{
		position: absolute;
		top: 50%;
		left: 39%;
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
		$('#menu a:nth-child(3)').click(function () {
			return false;
		});
		$('#submenu ul>li:nth-child(2)>a').click(function () {
			return false;
		});
		
	});
	
</script>
<title>FAQ | 비트캠프</title>
</head>
<body>
<c:url value= "/" var= "root" /> 
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
			<li><a href="../index.jsp"><img src="../imgs/logo/widelogo.jpg"/></a></li>
		</ul>
	</div>
	<div id="menu">
		<a class="first after" href="${root}Home/intro.html">학원소개</a>
		<a class="first after" href="${root}Home/regnot.html">취업교육과정</a>
		<a style="cursor: default;" class="first after" href="#">고객센터</a>
		<%if(login==null){ %>
		<a class="first after" href="${root}Home/login.html">로그인</a>
		<%}else{ %>
		<a class="first after" href="${root}Home/MyPage/check.html">마이페이지</a>
		<%} %>
	</div>
	<div id="submenu">
		<ul>	
			<li><a href="${root}Home/notice.html">공지사항</a></li>
			<li><a style="cursor: default;" href="${root}Home/faq.html">FAQ</a></li>
		</ul>
	</div>
		<div class="img">
		<div class="content">
			<h1>FAQ</h1>
			<h2>언제라도 전화주시면 친절하고 정확하게 답변드리도록 하겠습니다!</h2>
			<h3>전문적인 역량과 상담자격을 보유한 전문가로 구성된 취업지원 조직을 활용해 지속적으로 기업체를 발굴하고<br/> 
취업 역량강화를 위한 취업특강, 상담과 이력서, 자기소개서 컨설팅을 진행하여 취업성공을 지원합니다.</h3>
		</div>
	</div>
	<div class="focus"></div>
	<img style="width:100%; margin-top: 30px;" src="../imgs/title/faq.jpg" />
	<div id="main">
		<div id="faq">
			<!--  start -->
			<c:forEach items="${alist}" var="bean">
				<div id="faqtitle">
					Q.&nbsp;${bean.faqtitle}
				</div>
				<div id="faqcontent">
					A.&nbsp;${bean.faqcontent}
				</div>
				<br>
			</c:forEach>
			<!--  end -->
		</div>
		<div id="page" style="text-align: center;">
				<%
					Paging paging=(Paging)request.getAttribute("paging");
					int page1=paging.getPage();
					int begin=paging.getBeginPage();
					int end=paging.getEndPage();
					boolean prev=paging.isPrev();
					boolean next=paging.isNext();
					
					if(prev==true){
				%>
					<a class="prnx" href="${root }Home/faq.html?page=<%=begin-10 %>">＜</a>
				<%	}
					for(int i=begin; i<=end; i++){
						if(page1==i){
				%>			
					<a class="page" style="color:#881e1e; font-size: 15px; font-weight:bold;">&nbsp;<%=i %>&nbsp;</a>
				<%		}else{ %>
					<a class="page" style=" font-size: 13px; " href="${root }Home/faq.html?page=<%=i %>">&nbsp;<%=i %>&nbsp;</a>
				<%		}}
					if(next==true){	
				%>
					<a class="prnx" href="${root }Home/faq.html?page=<%=end+1 %>">＞</a>
				<%} 
				%>
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
					<button id="loginButton" type="button" onclick="window.open('${root}LMS/lmsLogin.html', 'LMS 관리자시스템 | 비트캠프', 'width=1200, height=700, top=20, left=100, location=no, status=no, directories=no, scrollbars=yes');">관리자 로그인</button>
				</div>
			</li>
		</ul>
	</div>
</body>
</html>
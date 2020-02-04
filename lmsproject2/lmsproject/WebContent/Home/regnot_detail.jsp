<%@page import="Project_LMS_Model.LMS_Class_Dto"%>
<%@page import="Project_LMS_Model.LMS_Regnot_Dto"%>
<%@page import="Project_LMS_Model.LMS_Notice_Dto"%>
<%@page import="Project_Utils.Paging"%>
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
<link rel="stylesheet" href="../css/animate.css" />
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
	}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery.bxslider.js"></script>
<script type="text/javascript" src="../js/wow.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		eleSub=('#submenu');
		
		$(".focus")[0].scrollIntoView(); 
		
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
		$('#menu a:nth-child(2)').click(function () {
			return false;
		});
		$('#menu a:nth-child(3)').click(function () {
			return false;
		});
		
	});
	
</script>
<title>모집공고 조회 | 비트캠프</title>
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
		<a class="first after" href="${root }Home/intro.html">학원소개</a>
		<a style="cursor: default;" class="first after" href="${root }Home/regnot.html">취업교육과정</a>
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
			<h1>글로벌 IT분야 전문교육기관 비트캠프</h1>
			<h2>SI사업과 교육사업을 병행하고 있는 교육센터입니다!</h2>
			<h3>스마트폰 개발 기술과 자바, Web 2.0 기술 등을 활용한 시스템 통합과 <br/> 
소프트웨어, 솔루션 개발을 맡아 전방에서 진두지위하고 그것을 바탕으로 비트캠프를 운영하고 있습니다.</h3>
		</div>
	</div>
	<div class="focus"></div>
	<img style="width:100%; margin-top: 30px;" src="../imgs/title/regnot_detail.jpg" />
	<div id="main">
		<div id="regnotdetail">
		<%
		Object[] obj=(Object[])request.getAttribute("bean");
		LMS_Regnot_Dto bean1=(LMS_Regnot_Dto)obj[0];
		LMS_Class_Dto bean2=(LMS_Class_Dto)obj[1];
		String start=bean2.getStartdate();
		String end=bean2.getEnddate();
		//시간자르는부분
		String startdate=start.substring(0,10);
		String enddate=end.substring(0,10);
		%>
			<table>
				<thead>
					<tr>
						<th>강좌명</th>
						<td class="title" colspan="3"><%=bean2.getClassname() %></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>관리자</td>
						<th>교육기간</th>
						<td><%=startdate %> 부터 <%=enddate %> 까지</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><%=bean1.getRegdate() %></td>
						<th>조회수</th>
						<td><%=bean1.getRegcnt() %></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4" >
							<textarea class="textarea" readonly="readonly"><%=bean1.getRegcontent() %></textarea>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<%if(bean1.getRegfile()!=null){ %>
						<td colspan="3"><a style="text-align: left;" href="${root }LMS/Sales/regnot_down.html?file=<%=bean1.getRegfile()%>&origin=<%=bean1.getOrigin()%>"><%=bean1.getOrigin() %></a></td>
						<%}else{ %>
						<td colspan="3" style="text-align:left">파일명</td>
						<%} %>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="regnotbtn">
			<button class="btn" type="submit" onclick="history.back()">리스트</button>
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
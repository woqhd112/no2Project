<%@page import="Project_Utils.Paging"%>
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
   .default .box .mainbox .title:FIRST-CHILD{
      top: 0px;
      margin-bottom: 30px;
   }
	.stuMenus>li:nth-child(5){
		font-weight: bold;
		background-color: #304047;
	}
	.stuMenus>li:nth-child(5) a{
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
		$('#menu a:nth-child(4)').on("click", function () {
			return false;
		});
		$('.stuMenus>li:nth-child(5) a').on("click", function () {
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
	
</script>
<title>채용정보 | 비트캠프</title>
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
		<a class="first after" href="${root }intro.html">학원소개</a>
		<a class="first after" href="${root }Home/regnot.html">취업교육과정</a>
		<a style="cursor: default;" class="first after" href="#">고객센터</a>
		<%if(login==null){ %>
		<a class="first after" href="${root }Home/login.html">로그인</a>
		<%}else{ %>
		<a style="cursor: default;" class="first after" href="${root}Home/MyPage/check.html }">마이페이지</a>
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
					<li id="check"><a href="${root }Home/MyPage/check.html">◎&nbsp;&nbsp;출석체크</a></li>
					<li id="subinfor"><a href="${root }Home/MyPage/subInfor.html">◎&nbsp;&nbsp;수강정보</a></li>
					<li id="examview"><a href="${root }Home/MyPage/examView.html">◎&nbsp;&nbsp;시험조회</a></li>
					<li id="gradeoepn"><a href="${root }Home/MyPage/gradeOpen.html">◎&nbsp;&nbsp;성적열람</a></li>
					<li id="employ"><a style="cursor: default;" href="${root }Home/MyPage/employ.html">◎&nbsp;&nbsp;채용정보</a></li>
				</ul>
				<ul class="mainbox">
					<li class="title">[ 채용 정보 ]</li>
					<li>
						<div id="employ">
							<table>
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>접수마감일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${alist}" var="bean">
										<tr>
											<td>${bean.inforn}</td>
											<td><a href="${root }Home/MyPage/employ_detail.html?num=${bean.infonum}&cnt=${bean.infocnt}">${bean.infotitle}</a></td>
											<td>${bean.cmpexp }</td>
											<td>${bean.infocnt}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div id="page" style="margin-top:20px;">
							<%
								Paging paging=(Paging)request.getAttribute("paging");
								int page1=paging.getPage();
								int begin=paging.getBeginPage();
								int end=paging.getEndPage();
								boolean prev=paging.isPrev();
								boolean next=paging.isNext();
								
								
								System.out.println("첫페이지,마지막페이지 : "+begin+","+end);
								if(prev==true){
							%>
								<a class="prnx" href="${root }Home/MyPage/employ.html?page=<%=begin-10 %>">＜</a>
							<%	}
								for(int i=begin; i<=end; i++){
									if(page1==i){
							%>			
								<a class="page" style="color:#881e1e; font-size: 15px; font-weight:bold;">&nbsp;<%=i %>&nbsp;</a>
							<%		}else{ %>
								<a class="page" style=" font-size: 13px; " href="${root }Home/MyPage/employ.html?page=<%=i %>">&nbsp;<%=i %>&nbsp;</a>
							<%		}}
								if(next==true){	
							%>
								<a class="prnx" href="${root }Home/MyPage/employ.html?page=<%=end+1 %>">＞</a>
							<%} 
							%>
							</div>
						</div>
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
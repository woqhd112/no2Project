<%@ page import="Project_Utils.Paging"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Project_LMS_Model.LMS_Emp_Dto"%>
<%@ page import="Project_LMS_Model.LMS_HireInfo_Dto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/animate.css" />
<link rel="shortcut icon" href="../../imgs/favicon.ico">
<link rel="stylesheet" href="../../css/reset.css" />
<link rel="stylesheet" href="../../css/lms.css" />
<link rel="stylesheet" href="../../css/lms/employ.css" />
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
</style>
<script type="text/javascript" src="../../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../js/jquery.bxslider.js"></script>
<script type="text/javascript" src="../../js/wow.js"></script>
<script type="text/javascript">
<c:url value="/" var="root"></c:url>
<%
LMS_Emp_Dto login=(LMS_Emp_Dto)session.getAttribute("lmslogin");
%>
	$(document).ready(function(){
	
		//new WOW().init(); 
		
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
		$('.stuMenus>li:nth-child(2) a').on("click", function () {
			return false;
		});
		$('#headerBtn a').eq(1).on("click",function(){
			var logout=confirm('로그아웃 하시겠습니까?');
			if(logout){
				$.post('${root}LMS/logout.html',function(){
					alert('로그아웃이 완료되었습니다.');
					window.location.href="${root}LMS/lmsLogin.html";
				});
			}
			return false;
		});
		
	});
	
</script>
<title>취업팀 | 비트캠프</title>
</head>
<body>
	<div class="wow fadeInUp">
		<div class="lms">
			<div class="conHeader">
			<div class="welcome">&nbsp;※&nbsp;&nbsp;취업팀 <%=login.getEmpname() %>님이 로그인하였습니다.</div>
				<div id="headerBtn">
					<a href="${root }LMS/Employ/inforup.html?empnum=<%=login.getEmpnum()%>">정보수정</a>
					<a href="${root }LMS/logout.html">로그아웃</a>
				</div>
			</div>
			<div class="box">
				<ul class="stuMenus">
					<li id="check"><a href="${root }LMS/Employ/employTeam.html">◎&nbsp;&nbsp;교직원 정보</a></li>
					<li id="check"><a style="cursor: default;" href="${root }LMS/Employ/employ.html">◎&nbsp;&nbsp;채용정보 등록</a></li>
					<li id="check"><a href="${root }LMS/Employ/gradeOpen.html">◎&nbsp;&nbsp;학생 성적조회</a></li>
				</ul>
				<ul style="margin-top: 50px;" class="mainbox">
                    <li class="title">[ 채용정보 등록 ]</li>
					<li>
						<input class="addbtn" type="button" onclick="location.href='./employ_insert.html'" value="등록">
					</li>
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
								<c:forEach items="${alist }" var="bean">
									<tr>
										<td>${bean.infonum}</td>
										<td><a href="${root }LMS/Employ/employ_detail.html?num=${bean.infonum}&cnt=${bean.infocnt}">${bean.infotitle}</a></td>
										<td>${bean.cmpexp}</td>
										<td>${bean.infocnt}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<div id="page">
								<%
									Paging paging=(Paging)request.getAttribute("paging");
									int page1=paging.getPage();
									int begin=paging.getBeginPage();
									int end=paging.getEndPage();
									boolean prev=paging.isPrev();
									boolean next=paging.isNext();
									
									if(prev==true){
								%>
									<a class="prnx" href="${root }LMS/Employ/employ.html?page=<%=begin-5 %>">＜</a>
								<%	}
									for(int i=begin; i<=end; i++){
										if(page1==i){
								%>			
									<a class="page" style="color:#881e1e; font-size: 15px; font-weight:bold;">&nbsp;<%=i %>&nbsp;</a>
								<%		}else{ %>
									<a class="page" href="${root }LMS/Employ/employ.html?page=<%=i %>">&nbsp;<%=i %>&nbsp;</a>
								<%		}}
									if(next==true){	
								%>
									<a class="prnx" href="${root }LMS/Employ/employ.html?page=<%=end+1 %>">＞</a>
								<%} 
								%>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
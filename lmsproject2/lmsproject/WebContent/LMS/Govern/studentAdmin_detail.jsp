<%@page import="Project_LMS_Model.LMS_AttendInfo_Dto"%>
<%@page import="Project_Home_Model.Home_AttendTime_Dto"%>
<%@page import="Project_Home_Model.Home_Student_Dto"%>
<%@page import="Project_Utils.Paging"%>
<%@page import="Project_LMS_Model.LMS_Emp_Dto"%>
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
<link rel="stylesheet" href="../../css/lms/govern.css" />
<style type="text/css">
	.examdetail td {
		padding-left: 0px;
	}
	.stuMenus>li:nth-child(3){
		font-weight: bold;
		background-color: gray;
	}
	.stuMenus>li:nth-child(3) a{
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
Object[] obj=(Object[])request.getAttribute("bean");
Home_Student_Dto bean1=(Home_Student_Dto)obj[0];
Home_AttendTime_Dto bean2=(Home_AttendTime_Dto)obj[1];
LMS_AttendInfo_Dto bean3=(LMS_AttendInfo_Dto)obj[2];
%>
	$(document).ready(function(){
	
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
		$('.stuMenus>li:nth-child(3) a').on("click", function () {
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

		if(<%=bean3.getCheckpct()%> < 80){
			$('.btn1').removeAttr("disabled");
			$('.btn1').css('background-color', 'darkred').css('color','white').css('font-weight','bold');
			$('.out').css('color', 'darkred').css('font-weight','bold').css('font-size', '14px');
		}
		
		$('.btn1').on('click',function(){
			var con=confirm('삭제하시겠습니까?');
			if(con){
				$.post('${root}LMS/Govern/studentAdmin_delete.html','num=<%=bean1.getStunum()%>',function(data){
					if(data=="ok"){
						alert('삭제가 완료되었습니다.');
						window.location.href="${root}LMS/Govern/studentAdmin.html";
					}else if(data=="fail"){
						alert('삭제에 실패하였습니다.');
					}else if(data=="fail1"){
						alert('삭제에 실패하였습니다.');
					}
				});
			}
		});
		
	});
	
</script>
<title>행정팀 | 비트캠프</title>
</head>
<body>
	<div class="lms">
		<div class="conHeader">
			<div class="welcome">행정팀 [<%=login.getEmpname() %>]님이 로그인하였습니다.</div>
			<div id="headerBtn">
				<a href="${root }LMS/Govern/inforup.html?empnum=<%=login.getEmpnum()%>">정보수정</a>
				<a href="${root }LMS/logout.html">로그아웃</a>
			</div>
		</div>
		<div class="box">
			<ul class="stuMenus">
				<li id="check"><a href="${root }LMS/Govern/staffAdmin.html">교직원 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/subCreate.html">강좌 개설</a></li>
				<li id="check"><a style="cursor: default;" href="${root }LMS/Govern/studentAdmin.html">수강생 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/notice.html">공지사항 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/faq.html">FAQ 관리</a></li>
			</ul>
			<ul class="mainbox">
				<li class="title" style="margin-top:50px; margin-bottom:50px">수강생 관리</li>	
				<li>
					<div class="examdetail">
						<table>
						
							<tr>
								<th style="width:15%">이름</th>
								<td><%=bean1.getStuname() %></td>
								<th style="width:15%">전화번호</th>
								<td><%=bean1.getStuphone() %></td>
							</tr>
							<tr>
								<th>강좌명</th>
								<td style="text-align: center; font-size: 14px" class="title" colspan="3">
									<%=bean1.getClassname() %>
								</td>
							</tr>
							<tr>
								<th>출석률</th>
								<td class="out"><%=bean3.getCheckpct()%>%</td>
								<th>출석</th>
								<td><%=bean3.getOntime() %>회</td>
							</tr>
							<tr>
								<th>지각</th>
								<td><%=bean3.getLate() %>회</td>
								<th>결석</th>
								<td><%=bean3.getAbsent() %>회</td>
							</tr>
							<tr>
								<th>입실</th>
								<%if(bean2.getArrtime()!=null){ %>
									<td style="font-size: 14px; font-weight: bold;">O</td>
								<%}else{ %>
									<td style="font-size: 14px; font-weight: bold; color:#044879;">X</td>
								<%} %>
								
								<th>퇴실</th>
								<%if(bean2.getLeavetime()!=null){ %>
									<td style="font-size: 14px; font-weight: bold;">O</td>
								<%}else{ %>
									<td style="font-size: 14px; font-weight: bold; color:#044879;">X</td>
								<%} %>
							</tr>
						</table>
					</div>
					<div class="btnbox">
						<button class="btn1" type="submit" disabled="disabled" style="color:silver; background-color:white">삭제</button>
						<button class="btn2" type="button" onclick="location.href='studentAdmin.html'">리스트</button>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
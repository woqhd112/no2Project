<%@page import="Project_LMS_Model.LMS_Class_Dto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<link rel="stylesheet" href="../../css/lms/teacher.css" />
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
LMS_Class_Dto bean1=(LMS_Class_Dto)request.getAttribute("bean4");
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
		$('.stuMenus>li:nth-child(2) a').on("click", function () {
			return false;
		});
		$('#headerBtn a').eq(2).on("click",function(){
			var logout=confirm('로그아웃 하시겠습니까?');
			if(logout){
				$.post('${root}LMS/logout.html',function(){
					alert('로그아웃이 완료되었습니다.');
					window.location.href="${root}LMS/lmsLogin.html";
				});
			}
			return false;
		});
		
		<%if(bean1.getClassname()==null){%>
		$('#headerBtn a').eq(0).hide();
		<%}
		Date today=new Date();
		SimpleDateFormat date=new SimpleDateFormat("HHmmss");
		int time=Integer.parseInt(date.format(today));
		System.out.println(time);
		if(time>0&&time<183000){
		%>
		$('#headerBtn a').eq(0).hide();
		<%}%>
		
		$('#headerBtn a').eq(0).on("click",function(){
			var con=confirm('정말 마감하시겠습니까?');
			if(con){
				$.post('${root}LMS/Teacher/checkEnd.html','name=<%=login.getEmpname()%>&start=<%=bean1.getStartdate()%>&end=<%=bean1.getEnddate()%>',function(data){
					if(data=="ok"){
						alert('출석 마감이 완료되었습니다.');
					}else if(data=="fail"){
						alert('출석 마감에 실패하였습니다.');
					}else if(data=="Exception"){
						alert('학생이 없습니다.');
					}
				});
			}
			return false;
		});
	});


</script>
<title>강사팀 | 비트캠프</title>
</head>
<body>
	<div class="lms">
		<div class="conHeader">
				<%if(bean1.getClassname()==null){ %>
				<div class="welcome">※&nbsp;&nbsp;반을 배정받지 않았습니다.&nbsp;/&nbsp;강사팀 <%=login.getEmpname() %>님이 로그인하였습니다.</div>
				<%}else{ %>
				<div class="welcome">※&nbsp;&nbsp;<%=bean1.getClassname() %>&nbsp;/&nbsp;강사팀 <%=login.getEmpname() %>님이 로그인하였습니다.</div>
				<%} %>
			<div id="headerBtn">
				<a style="font-weight: bold" href="${root }LMS/Teacher/checkEnd.html">출석마감</a>
				<a href="${root }LMS/Teacher/inforup.html?empnum=<%=login.getEmpnum()%>&name=<%=login.getEmpname()%>">정보수정</a>
				<a href="${root }LMS/logout.html">로그아웃</a>
			</div>
		</div>
		<div class="box">
			<ul class="stuMenus">
				<li id="check"><a href="${root }LMS/Teacher/teacherTeam.html">◎&nbsp;&nbsp;교직원 정보</a></li>
				<li id="check"><a style="cursor: default;" href="${root }LMS/Teacher/examWrite.html?name=<%=login.getEmpname()%>">◎&nbsp;&nbsp;시험 출제</a></li>
				<li id="check"><a href="${root }LMS/Teacher/gradeAdmin.html">◎&nbsp;&nbsp;성적 관리</a></li>
			</ul>
			<ul class="mainbox">
				<li class="title" style="margin-top:50px; margin-bottom:10px">[ 시험 리스트 ]</li>
				<li>
					<input type="button" onclick="location.href='${root}LMS/Teacher/examWrite_insert.html?name=<%=login.getEmpname() %>'" value="등록"  style=" margin-bottom: 15px;" class="addbtn" >
				</li>
				<li>
					<div id="exam">
						<c:forEach items="${alist }" var="bean">
							<div id="examtitle">
								<a style="text-align: left; padding-left:20px;" href="${root }LMS/Teacher/examWrite_detail.html?num=${bean.examnum}&name=<%=login.getEmpname()%>">${bean.teachername}강사 | ${bean.examorder } | ${bean.examname }</a>
							</div>
						</c:forEach>
					</div>
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
							<a class="prnx" href="${root }LMS/Teacher/examWrite.html?page=<%=begin-5 %>">＜</a>
						<%	}
							for(int i=begin; i<=end; i++){
								if(page1==i){
						%>			
							<a class="page" style="color:#881e1e; font-size: 15px; font-weight:bold;">&nbsp;<%=i %>&nbsp;</a>
						<%		}else{ %>
							<a class="page" href="${root }LMS/Teacher/examWrite.html?page=<%=i %>">&nbsp;<%=i %>&nbsp;</a>
						<%		}}
							if(next==true){	
						%>
							<a class="prnx" href="${root }LMS/Teacher/examWrite.html?page=<%=end+1 %>">＞</a>
						<%} 
						%>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
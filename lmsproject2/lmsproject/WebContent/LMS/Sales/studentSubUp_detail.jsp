<%@page import="Project_LMS_Model.LMS_Emp_Dto"%>
<%@page import="Project_Home_Model.Home_Student_Dto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="../../imgs/favicon.ico">
<link rel="stylesheet" href="../../css/animate.css" />
<link rel="stylesheet" href="../../css/reset.css" />
<link rel="stylesheet" href="../../css/lms.css" />
<link rel="stylesheet" href="../../css/lms/sales.css" />
<style type="text/css">
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
Home_Student_Dto bean=(Home_Student_Dto)request.getAttribute("bean");
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
		$('#headerBtn a').eq(1).on('click',function(){
			var con=confirm('로그아웃 하시겠습니까?');
			if(con){
				$.post('${root}LMS/logout.html',function(){
					alert('로그아웃이 완료되었습니다.');
					window.location.href="${root}LMS/lmsLogin.html";
				});
			}
			return false;
		});
		$('#classname2').hide();
		$('.btn1_1').hide();
		$('.btn2').hide();
		$('.btn1').click(function(){
			$('.btn1_1').show();
			$('.btn2').show();
			$('.btn1').hide();
			$('.btn3').hide();
			$('#classname2').show();
			$('#classname1').hide();
		});
		
		$('.btn2').click(function(){
			$('.btn1').show();
			$('.btn1_1').hide();
			$('.btn2').hide();
			$('.btn3').show();
			$('#classname2').hide();
			$('#classname1').show();
		});
		
		$('.btn1_1').on('click',function(){
			var con=confirm('수정하시겠습니까?');
			if(con){
				$.post('${root}LMS/Sales/studentSubUp_detail.html','num=<%=bean.getStunum()%>&classname='+$('#classname2 select').val(),function(data){
					if(data=="ok"){
						alert('수정이 완료되었습니다.');
						window.location.reload();
					}else if(data=="fail"){
						alert('수정을 실패하셨습니다.');
					}else if(data=='fail1'){
						alert('비정상적으로 데이터가 접근하였습니다.');
						$.post('${root}LMS/logout.html',function(){
							window.location.href="${root}LMS/lmsLogin.html";
						});
					}
				});
			}
		});
	});
	
</script>
<title>영업팀 | 비트캠프</title>
</head>
<body>
	<div class="lms">
		<div class="conHeader">
			<div class="welcome">영업팀 [<%=login.getEmpname() %>]님이 로그인하였습니다.</div>
			<div id="headerBtn">
				<a href="${root }LMS/Sales/inforup.html?empnum=<%=login.getEmpnum()%>">정보수정</a>
				<a href="${root }LMS/logout.html">로그아웃</a>
			</div>
		</div>
		<div class="box">
			<ul class="stuMenus">
				<li id="check"><a href="${root }LMS/Sales/salesTeam.html">교직원 정보</a></li>
				<li id="check"><a href="${root }LMS/Sales/regnot.html">모집공고 등록</a></li>
				<li id="check"><a style="cursor: default;" href="${root }LMS/Sales/studentSubUp.html">학생 수강등록</a></li>
			</ul>
			<ul class="mainbox">
				<li class="title" style="margin-top:50px; margin-bottom:50px">학생 수강등록</li>
				<li>
					<table class="infor">
					
              			<tr>
                   			<th>이름</th>
                   			<td colspan="3"><%=bean.getStuname() %></td>
               			</tr>
               			<tr id="classname1">
                   			<th style="width: 20%">강좌명</th>
                   			<td colspan="3"><%=bean.getClassname() %></td>
               			</tr>
               			<tr id="classname2">
							<th style="width: 20%">강좌명</th>
							<td class="title" colspan="3" style=" width:80%; text-align: center;">
								<select style="width: 90%; height:40px;">
									<c:forEach items="${alist }" var="bean1">
										<option>${bean1[0].classnum-1}-${bean1[0].teachername}강사 ${bean1[1].examnum-1 }강의실 ${bean1[0].classname }</option>
									</c:forEach>
								</select>
							</td>
               			</tr>
					</table>
					<div class="btnbox">
						<button class="btn1" type="submit" >수정</button>
						<button class="btn1_1" type="submit" >완료</button>
						<button class="btn2" type="submit" >뒤로</button>
						<button class="btn3" type="button" onclick="location.href='studentSubUp.html'">리스트</button>
					</div>
					<br/>
					<br/>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
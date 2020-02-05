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
	.lms .box .mainbox .title{
		text-align: left;
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 15px;
	}
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
		
		$('.name').on('focusout', function(){
			var name=$('.name').val();
			var name=$.trim(name);
			if($('.name')=="" || name==""){
				$('.name').val('');
				$('.name').addClass("error");
				$('.name').attr('placeholder', '공백은 입력할 수 없습니다.');
				$('.name').focus();
				return false;
			}
		});
		
		$('.btn1').on('click',function(){
			var con=confirm('등록하시겠습니까?');
			if(con){
				var name=$('.name').val();
				var name=$.trim(name);
				if($('.name')=="" || name==""){
					alert('공백은 입력할 수 없습니다.');
					$('.name').val('');
					$('.name').addClass("error");
					$('.name').attr('placeholder', '공백은 입력할 수 없습니다.');
					return false;
				}
				var classname=$('input[type=text]').val();
				var teachername=$('#select').val();
				var start=$('input[type=date]').eq(0).val();
				var end=$('input[type=date]').eq(1).val();
				if($('input[type=date]').eq(0).val().split('-')[2]=='01'&&$('input[type=date]').eq(1).val().split('-')[2]=='01'){
					if(($('input[type=date]').eq(1).val().split('-')[1]-$('input[type=date]').eq(0).val().split('-')[1])==3){
						$.post('${root}LMS/Govern/subCreate_insert.html','classname='+classname+'&teachername='+teachername+'&start='+start+'&end='+end,function(data){
							if(data=='fail1'){
								alert('이미 강좌가 진행중인 강사입니다.');
							}else if(data=='ok'){
								alert('등록에 성공하였습니다.');
								window.location.href="${root}LMS/Govern/subCreate.html";
							}else if(data=='fail'){
								alert('등록에 실패하였습니다.');
							}else if(data=='fail2'){
								alert('데이터가 비정상적으로 접근하였습니다.');
								$.post('${root}LMS/logout.html',function(){
									window.location.href="${root}LMS/lmsLogin.html";
								});
							}
						});
						
					}else{
						alert('강좌진행은 3개월입니다.');
					}
				}else{
					alert('강좌개설은 매월 1일만 가능합니다.');
				}
			}
		});
		
	});
	
</script>
<title>행정팀 | 비트캠프</title>
</head>
<body>
	<div class="lms">
		<div class="conHeader">
			<div class="welcome">&nbsp;※&nbsp;&nbsp;행정팀 <%=login.getEmpname() %>님이 로그인하였습니다.</div>
			<div id="headerBtn">
				<a href="${root }LMS/Govern/inforup.html?empnum=<%=login.getEmpnum()%>">정보수정</a>
				<a href="${root }LMS/logout.html">로그아웃</a>
			</div>
		</div>
		<div class="box">
			<ul class="stuMenus">
				<li id="check"><a style="cursor: default;" href="${root }LMS/Govern/staffAdmin.html">◎&nbsp;&nbsp;교직원 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/subCreate.html">◎&nbsp;&nbsp;강좌 개설</a></li>
				<li id="check"><a href="${root }LMS/Govern/studentAdmin.html">◎&nbsp;&nbsp;수강생 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/notice.html">◎&nbsp;&nbsp;공지사항 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/faq.html">◎&nbsp;&nbsp;FAQ 관리</a></li>
			</ul>
				<ul class="mainbox">
					<li class="title" style="margin-top:50px;">[ 강좌 개설 ]</li>	
					<li>
					<div>
						<table class="sub_detail" style="margin-top: 90px;">
							<tr>
								<th style="width: 15%">강좌명</th>
								<td style="font-size: 14px; text-align: center;" class="title">
									<input class="name" type="text" style="padding-left: 5px; height:30px; width:93%; margin-right: 10px;" value="" />
								</td>
								<th style="width: 15%">강사명</th>
								<td style="width: 15%;">
									<select id="select" style="height: 35px; width:95%">
										<c:forEach items="${alist }" var="bean">
											<option>${bean.empname }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>교육기간</th>
								<td colspan="3">
									<input style="height:30px; width:40%;" type="date">&nbsp;부터 &nbsp; <input style="height:30px; width:40%;" type="date">&nbsp;까지
								</td>
							</tr>
							<tr style="border:none; ">
								<td colspan="4" style="height: 20px; font-size:10px; padding-top: 10px; ">강좌개설은 매월 1일에 가능합니다.</td>
							</tr>
						</table>
					</div>
					<div class="btnbox">
						<button class="btn1" type="submit" >등록</button>
						<button class="btn2" type="button" onclick="history.back()">뒤로</button>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
<%@ page import="Project_Utils.Paging"%>
<%@ page import="Project_LMS_Model.LMS_Emp_Dto"%>
<%@ page import = "Project_LMS_Model.LMS_FAQ_Dto" %>
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
	.error::placeholder {
		font-size:12px;
		font-weight:bold;
		color:red;
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
		$('.stuMenus>li:nth-child(5) a').on("click", function () {
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
		
		$('#newTitle').on('focusout', function(){
			var text=$('#newTitle').val();
			var text=$.trim(text);
			if($('#newTitle')=="" || text==""){
				$('#newTitle').val('');
				$('#newTitle').addClass("error");
				$('#newTitle').attr('placeholder', '공백은 입력할 수 없습니다.');
				return false;
			}
		});
		$('.textarea2').on('focusout', function(){
			var text=$('.textarea2').val();
			var text=$.trim(text);
			if($('.textarea2')=="" || text==""){
				$('.textarea2').val('');
				$('.textarea2').addClass("error");
				$('.textarea2').attr('placeholder', '공백은 입력할 수 없습니다.');
				return false;
			}
		});
		
		$('.btn1').on('click',function(){
			var con=confirm('등록 하시겠습니까?');
			if(con){
				var text=$('#newTitle').val();
				var text=$.trim(text);
				var text2=$('.textarea2').val();
				var text2=$.trim(text2);
				if(text=="" || text2==""){
					$('#newTitle').addClass("error");
					$('#newTitle').attr('placeholder', '공백은 입력할 수 없습니다.');
					$('.textarea2').addClass("error");
					$('.textarea2').attr('placeholder', '공백은 입력할 수 없습니다.');
					return false;
				}
				alert('등록이 완료되었습니다.');
			}else{
				return false;
			}
		});
		
	});
	
</script>
<title>행정팀 | 비트캠프</title>
</head>
<body>
<form method="post">
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
				<li id="check"><a href="${root }LMS/Govern/staffAdmin.html">◎&nbsp;&nbsp;교직원 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/subCreate.html">◎&nbsp;&nbsp;강좌 개설</a></li>
				<li id="check"><a href="${root }LMS/Govern/studentAdmin.html">◎&nbsp;&nbsp;수강생 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/notice.html">◎&nbsp;&nbsp;공지사항 관리</a></li>
				<li id="check"><a style="cursor: default;" href="${root }LMS/Govern/faq.html">◎&nbsp;&nbsp;FAQ 관리</a></li>
			</ul>
			<ul class="mainbox">
				<li class="title" style="margin-top:50px;">[ FAQ 등록 ]</li>	
				<li>
					<div id="noticedetail">
						<table>
							<thead>
								<tr>
									<th style="width:15%">질문</th>
									<td class="title" colspan="3">
										<input id="newTitle" type="text" value="" style="padding-left: 10px; width: 96%; height:30px;" name="faqtitle"/>
									</td>
								</tr>
								<tr>
									<th colspan="4" style="text-align: center; width:100%;">답변</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4" >
										<textarea class="textarea2" name="faqcontent"></textarea>
									</td>	
								</tr>
							</tbody>
						</table>
					</div>
					<input type="hidden" name="faqauthor" value="관리자" />
					<div class="btnbox">
						<button class="btn1" type="submit">등록</button>
						<button class="btn2" type="button" onclick="location.href='faq.html'">뒤로</button>
					</div>
				</li>
			</ul>
		</div>
	</div>
</form>
</body>
</html>
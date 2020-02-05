<%@ page import="Project_Utils.Paging"%>
<%@ page import="Project_LMS_Model.LMS_Emp_Dto"%>
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
	.error::placeholder {
		font-size:12px;
		font-weight:bold;
		color:red;
	}
</style>
<script type="text/javascript" src="../../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../js/jquery.bxslider.js"></script>
<script type="text/javascript" src="../../js/wow.js"></script>
<c:url value="/" var="root"></c:url>
<script type="text/javascript">
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
		
		$('#name').on('focusout', function(){
			var text=$('#name').val();
			var text=$.trim(text);
			if($('#name')=="" || text==""){
				$('#name').val('');
				$('#name').addClass("error");
				$('#name').attr('placeholder', '공백은 입력하실 수 없습니다.');
				return false;
			}
		});
		$('#company').on('focusout', function(){
			var text=$('#company').val();
			var text=$.trim(text);
			if($('#company')=="" || text==""){
				$('#company').val('');
				$('#company').addClass("error");
				$('#company').attr('placeholder', '공백은 입력하실 수 없습니다.');
				return false;
			}
		});
		$('#link').on('focusout', function(){
			var text=$('#link').val();
			var text=$.trim(text);
			if($('#link')=="" || text==""){
				$('#link').val('');
				$('#link').addClass("error");
				$('#link').attr('placeholder', '공백은 입력하실 수 없습니다.');
				return false;
			}
		});
		$('.btn1').on('click',function(){
			var con=confirm('등록하시겠습니까?');
			if(con){
				var date=$('#date').val();
				var date=$.trim(date);
				console.log(date);
				console.log(date=="");
				if(date==""){
					alert('접수마감일을 선택해주세요');
					$('#date').focus();
					return false;
				}
				var text=$('#name').val();
				var text=$.trim(text);
				if($('#name')=="" || text==""){
					$('#name').val('');
					$("#name").addClass("error");
					$('#name').attr('placeholder', '공백은 입력하실 수 없습니다.');
					return false;
				}
				var text=$('#company').val();
				var text=$.trim(text);
				if($('#company')=="" || text==""){
					$('#company').val('');
					$('#company').addClass("error");
					$('#company').attr('placeholder', '공백은 입력하실 수 없습니다.');
					return false;
				}
				var text=$('#link').val();
				var text=$.trim(text);
				if($('#link')=="" || text==""){
					$('#link').val('');
					$('#link').addClass("error");
					$('#link').attr('placeholder', '공백은 입력하실 수 없습니다.');
					return false;
				}
				alert('등록이 완료되었습니다.');
			}else{
				return false;
			}
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
<form method="post">
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
				<ul class="mainbox">
              		<li class="title" style="margin-top:50px;">[ 채용정보 등록 ]</li>
					<li>
						<div id="employ_insert">
							<table>
								<thead>
									<tr>
										<th style="width: 15%">제목</th>
										<td class="title" colspan="3" style="text-align: center;">
											<input id="name" type="text" style="padding-left: 10px; height: 26px; width:93%" name="infotitle" />
										</td>
									</tr>
									<tr>
										<th style="width: 15%">업체명</th>
										<td style="width: 35%"><input id="company" type="text" name="cmpname" style="padding-left: 10px; height: 26px; width: 83%" /></td>
										<th style="width: 15%">접수마감일</th>
										<td><input id="date" type="date" style="height: 26px; width: 88%" name="cmpexp" /></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th style="width: 15%">공고 링크</th>
										<td class="title" colspan="3" style="text-align: center;">
											<input id="link" class="link" type="text" name="cmplink" style="padding-left: 10px; height: 26px; width:93%" />
										</td>
									</tr>
								</tbody>
							</table>
						
						</div>
						<div class="btnbox">
							<input type="hidden" name="infoauthor" value="관리자" />
							<button class="btn1" type="submit">완료</button>
							<button class="btn2" type="button" onclick="location.href='employ.html'">뒤로</button>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</form>
</body>
</html>
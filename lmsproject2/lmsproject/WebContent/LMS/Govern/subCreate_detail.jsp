<%@page import="Project_LMS_Model.LMS_Class_Dto"%>
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
		background-color: gray;
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
LMS_Class_Dto bean=(LMS_Class_Dto)request.getAttribute("bean");
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
		
		$('#btn2').hide();
		$('#btn5').hide();
		$('input[type=text]').hide();
		$('#date2').hide();
		$('#select').hide();
		$('input[type=date]').hide();
		
		$('#btn1').on('click',function(){
			$('#btn2').show();
			$('#btn3').hide();
			$('#btn5').show();
			$('#btn1').hide();
			$('#btn4').hide();
			$('input[type=text]').show();
			$('#select').show();
			$('input[type=date]').show();
			$('#classname p').hide();
			$('#teachername p').hide();
			$('#date1').hide();
			$('#date2').show();
		});
		
		$('#btn5').on('click',function(){
			$('#btn2').hide();
			$('#btn3').show();
			$('#btn5').hide();
			$('#btn1').show();
			$('#btn4').show();
			$('input[type=text]').hide();
			$('#select').hide();
			$('input[type=date]').hide();
			$('#classname p').show();
			$('#teachername p').show();
			$('#date1').show();
			$('#date2').hide();
		});

		$('.name').on('focusout', function(){
			var name=$('.name').val();
			var name=$.trim(name);
			if($('.name')=="" || name==""){
				$('.name').val('');
				$('.name').addClass("error");
				$('.name').attr('placeholder', '공백은 입력할 수 없습니다.');
				return false;
			}
		});
		
		$('#btn2').on('click',function(){
			var con=confirm('수정하시겠습니까?');
			if(con){
				var name=$('.name').val();
				var name=$.trim(name);
				if($('.name')=="" || name==""){
					alert('공백은 입력할 수 없습니다.');
					$('.name').val('');
					$('.name').addClass("error");
					$('.name').attr('placeholder', '공백은 입력할 수 없습니다.');
					$('.name').focus();
					return false;
				}
				var sub=$('input[type=text]').val();
				var teacher=$('#select').val();
				var start=$('input[type=date]').eq(0).val();
				var end=$('input[type=date]').eq(1).val();
				
				//날짜 체킹 01일이 아니면 처리x
				if($('input[type=date]').eq(0).val().split('-')[2]=='01'&&$('input[type=date]').eq(1).val().split('-')[2]=='01'){
					if(($('input[type=date]').eq(1).val().split('-')[1]-$('input[type=date]').eq(0).val().split('-')[1])==3){
						$.post('${root}LMS/Govern/subCreate_detail.html','num=<%=bean.getClassnum()%>&sub='+sub+'&teacher='+teacher+'&start='+start+'&end='+end,function(data){
							if(data=="ok"){
								alert('수정에 성공하였습니다.');
								window.location.reload();
							}else if(data=="fail"){
								alert('수정에 실패하셨습니다.');
							}else if(data=="fail1"){
								alert('이미 강좌가 진행중인 강사입니다.');
							}else if(data=='fail2'){
								alert('데이터가 비정상적으로 접근하였습니다.');
								$.post('${root}LMS/logout.html',function(){
									window.location.href="${root}lmsLogin.html";
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
		
		
		$('#btn3').on('click',function(data){
			var con=confirm('삭제하시겠습니까?');
			if(con){
			
				$.post('${root}LMS/Govern/subCreate_delete.html','num=<%=bean.getClassnum()%>',function(data){
					if(data=='ok'){
						alert('삭제가 완료되었습니다.');
						window.location.href="${root}LMS/Govern/subCreate.html";
					}else if(data=='fail'){
						alert('삭제에 실패하였습니다.');
					}else if(data=='fail1'){
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
				<li id="check"><a style="cursor: default;" href="${root }LMS/Govern/subCreate.html">강좌 개설</a></li>
				<li id="check"><a href="${root }LMS/Govern/studentAdmin.html">수강생 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/notice.html">공지사항 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/faq.html">FAQ 관리</a></li>
			</ul>
				<ul class="mainbox">
					<li class="title" style="text-align:center; margin-top:50px; margin-bottom:50px">강좌 보기</li>	
					<li>
					<div>
						<table class="sub_detail" >
							<tr>
								<th style="width: 15%">강좌명</th>
								<td id="classname" style="font-size: 14px" class="title">
									<p><%=bean.getClassname() %></p>
									
									<input class="name" type="text" style="padding-left: 5px; height:30px; width:94% " value="<%=bean.getClassname() %>" />
									
								</td>
								<th style="width: 15%">강사명</th>
								<td id="teachername" style="width: 15%;">
									<p><%=bean.getTeachername() %></p>
									
									<select id="select" style="height: 35px; width:95%">
										<c:forEach items="${alist }" var="bean1">
											<option>${bean1.empname }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>교육기간</th>
								<td id="date1" colspan="3">
									<p><%=bean.getStartdate() %>부터&nbsp; <%=bean.getEnddate() %>까지</p>
								</td>
								<td id="date2" colspan="3">
									<input style="height:30px; width:40%;" type="date">&nbsp;부터&nbsp;&nbsp;<input style="height:30px; width:41%;" type="date">&nbsp;까지
								</td>
							</tr>
							<tr style="border:none; ">
								<td colspan="4" style="height: 20px; font-size:10px; padding-top: 10px; ">강좌개설은 매월 1일에 가능합니다.</td>
							</tr>
						</table>
					</div>
					<div class="btnbox">
						<button id="btn1" class="btn1" type="button" >수정</button>
						<button id="btn2" class="btn1" type="submit" >완료</button>
						<button id="btn3" class="btn2" type="submit" >삭제</button>
						<button id="btn4" class="btn2" type="button" onclick="location.href='subCreate.html'">리스트</button>
						<button id="btn5" class="btn2" type="button" >뒤로</button>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
<%@page import="Project_LMS_Model.LMS_Class_Dto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Project_LMS_Model.LMS_Score_Dto"%>
<%@page import="Project_LMS_Model.LMS_AttendInfo_Dto"%>
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
<link rel="stylesheet" href="../../css/lms/teacher.css" />
<style type="text/css">
	.stuMenus>li:nth-child(3){
		font-weight: bold;
		background-color: #304047;
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
Object[] obj=(Object[])request.getAttribute("bean");
if(obj!=null){
Home_Student_Dto bean1=(Home_Student_Dto)obj[0];
LMS_AttendInfo_Dto bean2=(LMS_AttendInfo_Dto)obj[1];
LMS_Score_Dto bean3=(LMS_Score_Dto)obj[2];
LMS_Class_Dto bean4=(LMS_Class_Dto)request.getAttribute("bean4");
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

		$('#btn2').hide();
		$('#btn4').hide();
		$('#btn1').on('click',function(){
			$('#btn2').show();
			$('#btn4').show();
			$('#btn1').hide();
			$('#btn3').hide();
			$('input[type=text]').css('border', '0.5px solid silver');
			$('input[type=text]').removeAttr('readonly');
		});
		
		
		<%if(bean4.getClassname()==null){%>
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
				$.post('${root}LMS/Teacher/checkEnd.html','name=<%=login.getEmpname()%>&start=<%=bean4.getStartdate()%>&end=<%=bean4.getEnddate()%>',function(data){
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
		

		$('#test1').on("focusout", function(){
			var text=$('#test1').val();
			var text=$.trim(text);
			if($('#test1')=="" || text==""){
				$('#test1').val('');
				$('#test1').addClass("error");
				$('#test1').attr('placeholder', '공백은 입력하실 수 없습니다.');
				return false;
			}
		});
		$('#test2').on("focusout", function(){
			var text=$('#test2').val();
			var text=$.trim(text);
			if($('#test2')=="" || text==""){
				$('#test2').val('');
				$('#test2').addClass("error");
				$('#test2').attr('placeholder', '공백은 입력하실 수 없습니다.');
				return false;
			}
		});
		$('#test3').on("focusout", function(){
			var text=$('#test3').val();
			var text=$.trim(text);
			if($('#test3')=="" || text==""){
				$('#test3').val('');
				$('#test3').addClass("error");
				$('#test3').attr('placeholder', '공백은 입력하실 수 없습니다.');
				return false;
			}
		});

		$('#btn2').on('click',function(){
			var test1=$('#test1').val();
			var test2=$('#test2').val();
			var test3=$('#test3').val();
			
			var con=confirm('점수입력을 하시겠습니까?');
			
			var grade=/^[0-9]{1}[0-9]{0,2}$/;
			var grade2=0;
			if(!grade.test(test1) || test1>100 || test1<0){
	            alert('입력 실패');
				$('#test1').val('');
				$('#test1').addClass("error");
				$('#test1').attr('placeholder', '점수 형식이 올바르지 않습니다.');
				return false;
			}
			if(!grade.test(test2) || test2>100 || test2<0){
	            alert('입력 실패');
				$('#test2').val('');
				$('#test2').addClass("error");
				$('#test2').attr('placeholder', '점수 형식이 올바르지 않습니다.');
				return false;
			}
			if(!grade.test(test3) || test3>100 || test3<0){
	            alert('입력 실패');
				$('#test3').val('');
				$('#test3').addClass("error");
				$('#test3').attr('placeholder', '점수 형식이 올바르지 않습니다.');
				return false;
			}
			if(con){
				$.post('${root}LMS/Teacher/gradeAdmin_detail.html','num=<%=bean1.getStunum()%>'+'&first='+$('input[type=text]').eq(0).val()+'&second='+$('input[type=text]').eq(1).val()+'&third='+$('input[type=text]').eq(2).val(),function(data){
					if(data=="ok"){
						alert('점수입력이 완료되었습니다.');
						window.location.reload();
					}else if(data=="fail"){
						alert('점수입력에 실패하셨습니다.');
					}else if(data=='fail1'){
						alert('데이터가 비정상적으로 접근하였습니다.');
						$.post('${root}LMS/logout.html',function(){
							window.location.href="${root}LMS/lmsLogin.html";
						});
					}
				});
			}
		});
	});


</script>
<title>강사팀 | 비트캠프</title>
</head>
<body>
	<div class="lms">
		<div class="conHeader">
				<%if(bean4.getClassname()==null){ %>
				<div class="welcome">※&nbsp;&nbsp;반을 배정받지 않았습니다.&nbsp;/&nbsp;강사팀 <%=login.getEmpname() %>님이 로그인하였습니다.</div>
				<%}else{ %>
				<div class="welcome">※&nbsp;&nbsp;<%=bean4.getClassname() %>&nbsp;/&nbsp;강사팀 <%=login.getEmpname() %>님이 로그인하였습니다.</div>
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
				<li id="check"><a href="${root }LMS/Teacher/examWrite.html?name=<%=login.getEmpname()%>">◎&nbsp;&nbsp;시험 출제</a></li>
				<li id="check"><a style="cursor: default;" href="${root }LMS/Teacher/gradeAdmin.html">◎&nbsp;&nbsp;성적 관리</a></li>
			</ul>
			<ul class="mainbox">
				<li class="title" style="margin-top:50px;">[ 성적 관리 ]</li>
				<li>
					<div id="subup" style="margin-top: 50px;">
						<table class="infor">
							<tr>
								<th style="width:15%">이름</th>
								<td style="background-color: white"><%=bean1.getStuname() %></td>
								<th style="width:15%">출석률</th>
								<td style="background-color: white"><%=bean2.getCheckpct()%>%</td>
							</tr>
							<tr>
								<th style="width:15%">1차</th>
								<td style="background-color: white">
									<input id="test1" style="width:85%; height:30px; border: none; text-align: center;" type="text" value="<%=bean3.getFirst() %>" readonly="readonly"/>
								</td>
								<th style="width:15%">2차</th>
								<td style="background-color: white">
									<input id="test2" style="width:85%; height:30px; border: none; text-align: center;" type="text" value="<%=bean3.getSecond() %>" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<th style="width:15%">3차</th>
								<td colspan="3" style="text-align: left; padding-left: 8px; background-color: white">
									<input id="test3" style="margin-left: 9px; width:35%; height:30px; border: none; text-align: center;" type="text" value="<%=bean3.getThird() %>" readonly="readonly"/>
								</td>
							</tr>
						<%} %>
						</table>
						<div class="btnbox" style="margin-top: 30px">
							<button id="btn1" class="btn1" type="button">점수입력</button>
							<button id="btn2" class="btn1" type="button">입력완료</button>
							<button id="btn3" class="btn2" type="button" onclick="location.href='gradeAdmin.html'">리스트</button>
							<button id="btn4" class="btn2" type="button" onclick="window.location.reload()">뒤로</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
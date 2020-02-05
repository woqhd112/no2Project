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
int classnum=(Integer)request.getAttribute("classnum");
LMS_Class_Dto bean=(LMS_Class_Dto)request.getAttribute("bean4");
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
		
		<%if(bean.getClassname()==null){%>
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
				$.post('${root}LMS/Teacher/checkEnd.html','name=<%=login.getEmpname()%>&start=<%=bean.getStartdate()%>&end=<%=bean.getEnddate()%>',function(data){
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
		
		$('#name').on("focusout", function(){
			var text=$('#name').val();
			var text=$.trim(text);
			if($('#name')=="" || text==""){
				$('#name').val('');
				$('#name').addClass("error");
				$('#name').attr('placeholder', '공백은 입력하실 수 없습니다.');
				return false;
			}
		});
		
		$('.textarea').on("focusout",function(){
			var text=$('.textarea').val();
			var text=$.trim(text);
			if($('.textarea')=="" || text==""){
				$('.textarea').val('');
				$('.textarea').addClass("error");
				$('.textarea').attr('placeholder', '공백은 입력하실 수 없습니다.');
				return false;
			}
		});
		
		$('.btn1').on('click',function(){
			var con=confirm('등록 하시겠습니까?');
			if(con){
				var date=$('#date_1').val();
				var date=$.trim(date);
				if(date==""){
					alert('시작일을 선택해주세요');
					$('#date_1').focus();
					return false;
				}
				var date2=$('#date_2').val();
				var date2=$.trim(date2);
				if(date2==""){
					alert('마감일을 선택해주세요');
					$('#date_2').focus();
					return false;
				};
				
				var arr1 = date.split('-');
				var arr2 = date2.split('-');
				var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
				var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
				var diff = dat2 - dat1;
				var currDay = 24 * 60 * 60 * 1000;
				var finalday=parseInt(diff/currDay);
				console.log(finalday);
				
				if(finalday<0){
					alert('마감일은 시작일보다 빠를 수 없습니다.');
					$('#date_2').focus();
					return false;
				}
				
				var text=$('#name').val();
				var text=$.trim(text);
				if($('#name')=="" || text==""){
					$('#name').val('');
					$('#name').addClass("error");
					$('#name').attr('placeholder', '공백은 입력하실 수 없습니다.');
					return false;
				}
				
				var text=$('.textarea').val();
				var text=$.trim(text);
				if($('.textarea')=="" || text==""){
					$('.textarea').val('');
					$('.textarea').addClass("error");
					$('.textarea').attr('placeholder', '공백은 입력하실 수 없습니다.');
					return false;
				}
				
				var fileCheck = document.getElementById("ex_file").value;
				if(!fileCheck){
			        alert("파일을 첨부해 주세요");
					$('#ex_file').focus();
			        return false;
			    }
				alert('등록이 완료되었습니다.');
			}else{
				return false;
			}
		});
		
		
	});


</script>
<title>강사팀 | 비트캠프</title>
</head>
<body>
	<div class="lms">
		<div class="conHeader">
				<%if(bean.getClassname()==null){ %>
				<div class="welcome">※&nbsp;&nbsp;반을 배정받지 않았습니다.&nbsp;/&nbsp;강사팀 <%=login.getEmpname() %>님이 로그인하였습니다.</div>
				<%}else{ %>
				<div class="welcome">※&nbsp;&nbsp;<%=bean.getClassname() %>&nbsp;/&nbsp;강사팀 <%=login.getEmpname() %>님이 로그인하였습니다.</div>
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
				<li class="title" style="margin-top:50px;">[ 시험 출제 ]</li>
				<li>
				<form method="post" enctype="multipart/form-data">
					<div id="exam_insert">
						<table>
							<thead>
								<tr>
									<th style="width: 15%">제목</th>
									<td class="title" colspan="3" style="text-align: center;">
										<input id="name" type="text" name="sub" style="padding-left:10px; width: 94%; height: 30px" />
										<input type="hidden" name="classnum" value="<%=classnum%>"/>
									</td>
								</tr>
								<tr>
									<th>제출기한</th>
									<td>
										<input id="date_1" name="start" style="width:37%; height: 30px" type="date">&nbsp;부터 &nbsp;&nbsp; <input id="date_2" name="end" style="width:37%; height: 30px" type="date">&nbsp;까지
									</td>
									<th style="width:10%;">차수</th>
									<td style="width:10%;">
										<select name="order" style="height: 30px;">
											<option>1차</option>
											<option>2차</option>
											<option>3차</option>
										</select>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4" >
										<textarea name="content" style="border: 1px solid silver; width:98%;" class="textarea" ></textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3" style="text-align: left;">
										<input type="file" name="ex_file" id="ex_file">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btnbox">
						<button class="btn1" type="submit" onclick="">완료</button>
						<button class="btn2" type="button" onclick="history.back()">뒤로</button>
					</div>
				</form>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
<%@page import="Project_LMS_Model.LMS_Class_Dto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Project_LMS_Model.LMS_Exam_Dto"%>
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
LMS_Exam_Dto bean=(LMS_Exam_Dto)request.getAttribute("bean");
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
		
		$('#ex_file1').hide();
		$('#ex_file2').hide();
		$('input[type=text]').hide();
		$('#btn1').hide();
		$('#btn3').hide();
		$('#btn2').hide();
		$('#btn5').hide();
		$('#btn1').on('click',function(){
			$('.textarea').removeAttr('readonly').focus();
			$('.textarea').css('border','0.5px solid silver');
			$('input[type=text]').show();
			$('p').hide();
			$('#btn1').hide();
			$('#btn2').show();
			$('#btn3').hide();
			$('#btn4').hide();
			$('#btn5').show();
			$('#ex_file1').show();
			$('#ex_file2').show();
		});
		

		<%if(bean.getTeachername().equals(login.getEmpname())){%>
		$('#btn1').show();
		$('#btn3').show();
		<%}%>
		
		$('#btn2').on('click',function(){
			var con=confirm('수정하시면 기존파일을 덮어씌우게 됩니다. 정말 수정 하시겠습니까?');
			if(con){
				var sub=$('input[type=text]').val();
				var content=$('.textarea').val();
				if(sub=="" || content==""){
		            alert('수정 실패');
					return false;
				}
				alert('수정이 완료되었습니다.');
			}
			
		});
		
		
		$('#btn3').on('click',function(){
			var con=confirm('삭제 하시겠습니까?');
			if(con){
				$.post('${root}LMS/Teacher/examWrite_delete.html','num=<%=bean.getExamnum()%>',function(data1){
					if(data1=="ok"){
						alert('삭제가 완료되었습니다.');
						window.location.href="${root}LMS/Teacher/examWrite.html";
					}else if(data1=="fail"){
						alert('삭제에 실패하였습니다.');
					}else if(data1=='fail1'){
						alert('비정상적인 데이터가 접근하였습니다.');
						$.post('${root}LMS/logout.html',function(){
							window.location.href="${root}LMS/lmsLogin.html";
						});
					}
				});
			}
		});
		
		<%if(bean1.getClassname()==null){%>
		$('#headerBtn a').eq(0).hide();
		<%}
		Date today=new Date();
		SimpleDateFormat date1=new SimpleDateFormat("HHmmss");
		int time=Integer.parseInt(date1.format(today));
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
			<div class="welcome">강사팀 [<%=login.getEmpname() %>]님이 로그인하였습니다.</div>
			<div id="headerBtn">
				<a style="font-weight: bold" href="${root }LMS/Teacher/checkEnd.html">출석마감</a>
				<a href="${root }LMS/Teacher/inforup.html?empnum=<%=login.getEmpnum()%>&name=<%=login.getEmpname()%>">정보수정</a>
				<a href="${root }LMS/logout.html">로그아웃</a>
			</div>
		</div>
		<div class="box">
			<ul class="stuMenus">
				<li id="check"><a href="${root }LMS/Teacher/teacherTeam.html">교직원 정보</a></li>
				<li id="check"><a style="cursor: default;" href="${root }LMS/Teacher/examWrite.html?name=<%=login.getEmpname()%>">시험 출제</a></li>
				<li id="check"><a href="${root }LMS/Teacher/gradeAdmin.html">성적 관리</a></li>
			</ul>
			<ul class="mainbox">
				<li class="title" style="margin-top:50px; margin-bottom:20px">시험 확인</li>
				<li>
				<form method="post" enctype="multipart/form-data">
					<div class="examdetail">
					<%
					String[] date=bean.getExamexp().split("부터");
					String start=date[0];
					String[] enddate=date[1].split("까지");
					String end=enddate[0];
					%>
						<table>
							<thead>
								<tr>
									<th style="width: 15%">강좌명</th>
									<td style="text-align: left; font-size: 14px" class="title" colspan="3">
										<p><%=bean.getExamname() %></p>
										<input id="name" type="text" name="sub" style="padding-left:10px; width: 94%; height: 30px" value="<%=bean.getExamname() %>"/>
									</td>
								</tr>
								<tr>
									<th>강사명</th>
									<td id="examname"><%=bean.getTeachername() %></td>
									<th style="width:15%">차수</th>
									<td id="examExp"><%=bean.getExamorder() %></td>
								</tr>
								<tr>
									<th>제출기한</th>
									<td id="examExp"><%=start %>부터<br/><%=end %>까지</td>
									<th>작성일</th>
									<td><%=bean.getExamdate() %></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4" >
										<textarea class="textarea" name="content" readonly="readonly"><%=bean.getExamcontent() %></textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<%if(bean.getExamfile()!=null){ %>
									<td style="text-align: left;" colspan="3"><input type="file" name="newfile" id="ex_file1"><a href="${root }LMS/Sales/regnot_down.html?file=<%=bean.getExamfile()%>&origin=<%=bean.getOrigin()%>"><%=bean.getOrigin() %></a></td>
									<%}else{ %>
									<td colspan="3" style="text-align:left"><input type="file" name="newfile" id="ex_file2">선택된 파일 없음</td>
									<%} %>
									<td><input type="hidden" name="num" value="<%=bean.getExamnum()%>"></td>
									<td><input type="hidden" name="name" value="<%=login.getEmpname()%>"></td>
									<td><input type="hidden" name="origin" value="<%=bean.getOrigin()%>"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btnbox">
						<button id="btn1" class="btn1" type="button" >수정</button>
						<button id="btn2" class="btn1" type="submit" >완료</button>
						<button id="btn3" class="btn2" type="button" >삭제</button>
						<button id="btn4" class="btn2" type="button" onclick="location.href='examWrite.html'">리스트</button>
						<button id="btn5" class="btn2" type="button" onclick="window.location.reload()">뒤로</button>
					</div>
				</form>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
<%@page import="Project_LMS_Model.LMS_Class_Dto"%>
<%@page import="Project_LMS_Model.LMS_Regnot_Dto"%>
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
Object[] obj=(Object[])request.getAttribute("bean");
LMS_Regnot_Dto bean1=(LMS_Regnot_Dto)obj[0];
LMS_Class_Dto bean2=(LMS_Class_Dto)obj[1];
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
		$('#ex_file1').hide();
		$('#ex_file2').hide();
		$('.btn1_1').hide();
		$('.btn4').hide();
		$('.btn1').on('click',function(){
			$('tbody>tr>td>textarea').removeAttr('readonly').focus();
			$('.textarea').on('focusout', function(){
				var text=$('.textarea').val();
				var text=$.trim(text);
				if($('.textarea')=="" || text==""){
					$('.textarea').val('');
					$(".textarea").addClass("error");
					$('.textarea').attr('placeholder', '공백은 입력하실 수 없습니다.');
				}
			});
			$('#ex_file1').show();
			$('#ex_file2').show();
			$('.btn1').hide();
			$('.btn2').hide();
			$('.btn3').hide();
			$('.btn1_1').show();
			$('.btn4').show();
			$('.btn1_1').attr('type','submit').on('click',function(){
				var con=confirm('수정하시면 기존파일을 덮어씌우게 됩니다. 정말 수정 하시겠습니까?');
				var text=$('.textarea').val();
				var text=$.trim(text);
				if($('.textarea')=="" || text==""){
					$('.textarea').val('');
					$(".textarea").addClass("error");
					$('.textarea').attr('placeholder', '공백은 입력하실 수 없습니다.');
		            alert('수정 실패');
					return false;
				}
				if(con){
						$('tbody>tr>td>textarea').attr('readonly','readonly').blur();
						$('.btn2').show();
						alert('수정이 완료되었습니다.');
						$('.btn1_1').hide();
						$('.btn4').hide();
						$('.btn3').show();
						$('.btn1').show();
				}
			});
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
		
		$('.btn2').on('click',function(){
			var con=confirm('삭제 하시겠습니까?');
			if(con){
				$.post('${root}LMS/Sales/regnot_delete.html','num=<%=bean1.getRegnum()%>',function(data1){
					if(data1=="ok"){
						alert('삭제가 완료되었습니다.');
						window.location.href="${root}LMS/Sales/regnot.html";
					}else if(data1=="fail"){
						alert('삭제가 제대로 작동하지않았습니다.');
					}else if(data1=="fail1"){
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
				<li id="check"><a style="cursor: default;" href="${root }LMS/Sales/regnot.html">모집공고 등록</a></li>
				<li id="check"><a href="${root }LMS/Sales/studentSubUp.html">학생 수강등록</a></li>
			</ul>
			<ul class="mainbox">
				<li class="title" style="margin-top:50px; margin-bottom:30px">공고 수정</li>
				<li>
					<form method="post" enctype="multipart/form-data">
					<div id="regnotdetail">
						<table>
							<thead>
								<tr>
									<th>강좌명</th>
									<td class="title" colspan="3"><%=bean2.getClassname() %></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td><%=bean1.getRegauthor() %></td>
									<th>교육기간</th>
									<td><%=bean2.getStartdate() %> 부터<br/> <%=bean2.getEnddate() %> 까지</td>
								</tr>
								<tr>
									<th>작성일</th>
									<td><%=bean1.getRegdate() %></td>
									<th>조회수</th>
									<td><%=bean1.getRegcnt() %></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4" >
										<textarea class="textarea" name="content" readonly="readonly"><%=bean1.getRegcontent() %></textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<%if(bean1.getRegfile()!=null){ %>
									<!-- 현재 등록된 파일 -->
									<td colspan="3"><input type="file" name="newfile" id="ex_file1"><a style="text-align: left;" href="${root }LMS/Sales/regnot_down.html?file=<%=bean1.getRegfile()%>&origin=<%=bean1.getOrigin()%>"><%=bean1.getOrigin() %></a></td>
									<%}else{ %>
									<!-- 등록 안된 파일 -->
									<td colspan="3" style="text-align:left"><input type="file" name="newfile" id="ex_file2">선택된 파일 없음</td>
									<%} %>
									<td><input type="hidden" name="num" value="<%=bean1.getRegnum()%>"></td>
									<td><input type="hidden" name="name" value="<%=bean1.getRegcnt()%>"></td>
									<td><input type="hidden" name="oldfile" value="<%=bean1.getOrigin()%>"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btnbox">
						<button class="btn1" type="button" >수정</button>
						<button class="btn1_1" type="submit" >완료</button>
						<button class="btn2" type="button" >삭제</button>
						<button class="btn3" type="button" onclick="location.href='regnot.html'">리스트</button>
						<button class="btn4" type="button" onclick="window.location.reload()">뒤로</button>
					</div>
					</form>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
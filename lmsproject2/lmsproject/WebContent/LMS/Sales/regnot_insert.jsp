<%@page import="Project_LMS_Model.LMS_Class_Dto"%>
<%@page import="Project_LMS_Model.LMS_Emp_Dto"%>
<%@page import="Project_Home_Model.Home_Student_Dto"%>
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
	input[type="file"]{
		background-color: white;
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
		
	$(document).ready(function(){

<%
LMS_Emp_Dto login=(LMS_Emp_Dto)session.getAttribute("lmslogin");
%>
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
		$('#regnot_insert td[class=title]>select').on('change',function(){
			var sub=$('#regnot_insert td[class=title]>select').val();
			$.post('${root}LMS/Sales/regnot_insert.html','name='+sub,function(data){
				if(data!=null){
					var test=data;
					test=test.split('-');
					start=test[0];
					end=test[1];
					
					$('input[type=text]').eq(0).val(start+'-부터');
					$('input[type=text]').eq(1).val(end+'-까지');
				}
			});
			
		});
		
		$('.textarea').on('focusout', function(){
			var text=$('.textarea').val();
			var text=$.trim(text);
			if($('.textarea')=="" || text==""){
				$('.textarea').val('');
				$(".textarea").addClass("error");
				$('.textarea').attr('placeholder', '공백은 입력하실 수 없습니다.');
			}
		});
		
		$('.btn1').on('click',function(){
			var con=confirm('등록 하시겠습니까?');
			if(con){
				var result=$(":selected").val();
				if(result=='미배정'){
					alert('강좌를 선택해주세요');
					$('.select').focus();
					return false;
				}
				var text=$('.textarea').val();
				var text=$.trim(text);
				if($('.textarea')=="" || text==""){
					$('.textarea').val('');
					$(".textarea").addClass("error");
					$('.textarea').attr('placeholder', '공백은 입력하실 수 없습니다.');
					return false;
				}
				var fileCheck = document.getElementById("ex_file").value;
				if(!fileCheck){
			        alert("파일을 첨부해 주세요");
			        return false;
			    }
				alert('등록이 완료되었습니다.');
			}else{
				return false;
			}
		});
	});
	
</script>
<title>영업팀 | 비트캠프</title>
</head>
<body>
	<div class="lms">
		<div class="conHeader">
			<div class="welcome">&nbsp;※&nbsp;&nbsp;영업팀 <%=login.getEmpname() %>님이 로그인하였습니다.</div>
			<div id="headerBtn">
				<a href="${root }LMS/Sales/inforup.html?empnum=<%=login.getEmpnum()%>">정보수정</a>
				<a href="${root }LMS/logout.html">로그아웃</a>
			</div>
		</div>
		<div class="box">
			<ul class="stuMenus">
				<li id="check"><a href="${root }LMS/Sales/salesTeam.html">◎&nbsp;&nbsp;교직원 정보</a></li>
				<li id="check"><a style="cursor: default;" href="${root }LMS/Sales/regnot.html">◎&nbsp;&nbsp;모집공고 등록</a></li>
				<li id="check"><a href="${root }LMS/Sales/studentSubUp.html">◎&nbsp;&nbsp;학생 수강등록</a></li>
			</ul>
			<ul class="mainbox">
				<li class="title" style="margin-top:50px;">[ 모집공고 등록 ]</li>
				<li>
				<form method="post" enctype="multipart/form-data">
					<div id="regnot_insert">
							<table>
								<thead>
									<tr>
										<th style="width: 15%">강좌명</th>
										<td class="title" colspan="3" style="text-align: center;">
											<select class="select" style="width: 98%; height:30px;">
												<c:forEach items="${alist }" var="bean">
													<option>${bean.classname }</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th>교육기간</th>
										<td colspan="3"><input style="width:40%; height:30px; border: none; text-align: center;" type="text" value="&nbsp;부터" readonly="readonly"> &nbsp;&nbsp; <input style="width:40%; height:30px; border: none; text-align: center;" type="text" value="&nbsp;까지" readonly="readonly"></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4" >
											<textarea style="border: 1px solid silver; width:98%;" class="textarea" name="content" placeholder="내용을 입력해주세요."></textarea>
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
						<button class="btn1" type="submit">완료</button>
						<button class="btn2" type="button" onclick="history.back()">뒤로</button>
					</div>
				</form>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
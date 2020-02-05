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
	.stuMenus>li:nth-child(1){
		font-weight: bold;
		background-color: #304047;
	}
	.stuMenus>li:nth-child(1) a{
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
<c:url value="/" var="root"></c:url>
<script type="text/javascript">
<%
LMS_Emp_Dto login=(LMS_Emp_Dto)session.getAttribute("lmslogin");
LMS_Emp_Dto bean=(LMS_Emp_Dto)request.getAttribute("bean");
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
		$('.stuMenus>li:nth-child(1) a').on("click", function () {
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

		$('.number_2').hide();
		$('.select_2').hide();
		$('.mail_2').hide();
		$('.btn1_1').hide();
		$('.btn3').hide();
		
		$('.btn1').on('click', function(){
			$('.btn1').hide();
			$('.btn2').hide();
			$('.btn4').hide();
			$('.btn1_1').show();
			$('.btn3').show();

			$('.number_2').show();
			$('.select_2').show();
			$('.mail_2').show();
			$('.number_1').hide();
			$('.select_1').hide();
			$('.mail_1').hide();
			
			$('#empemail').on("focusout", function(){
				var empemail=$('#empemail').val();
				var empemail2=$.trim(empemail);
		    	var regex=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
		    	if(regex.test(empemail) && empemail.length>10){
		    		console.log("성공!");
		    	}else{
			    	if(empemail="" || empemail != empemail2){
		    	        $('#empemail').val('');
		    	        $('#empemail').addClass("error");
		    	        $('#empemail').attr('placeholder', '공백은 입력하실 수 없습니다.');
			            return false;
			    	}
	    	        $('#empemail').val('');
	    	        $('#empemail').addClass("error");
	    	        $('#empemail').attr('placeholder', '형식이 맞지 않습니다.');
		            return false;
		    	}
			});
			$('#empphone').on("focusout", function(){
				var empphone=$('#empphone').val();
				var empphone2=$.trim(empphone);
				numLength=empphone2.length;
	    		console.log(numLength);
				if($('#empphone').val() == "" || empphone2 =="" || empphone != empphone2){
	    	        $('#empphone').val('');
	    	        $('#empphone').addClass("error");
	    	        $('#empphone').attr('placeholder', '공백은 입력하실 수 없습니다.');
		            return false;
		        }
		    	if(!/^[0-9]{10,20}$/.test(empphone2) || numLength>11 || numLength<10){
	    	        $('#empphone').val('');
	    	        $('#empphone').addClass("error");
	    	        $('#empphone').attr('placeholder', '10~11자리 숫자로 입력해주세요.');
		            return false;
		        }
			});
			
			
			$('.btn1_1').on('click',function(){
				var con = confirm("수정하시겠습니까?");
				var phone=$('#empphone').val();
				var dept=$('#dept').val();
				var email=$('#empemail').val();

				var phone2=$.trim(phone);
				var email2=$.trim(email);
				if(con){

					if(phone2=="" || email2==""){
		    			alert('수정 실패');
						return false;
					}
					$.post('${root}LMS/Govern/staffAdmin_detail.html', 'empid=<%=bean.getEmpid() %>'+'&empphone='+phone+'&dept='+dept+"&empemail="+email, function(data){
			    		if(data==1){
			    			alert('수정이 완료되었습니다.');
			    			window.location.reload();
			    		}else if(data=='fail1'){
			    			alert('데이터가 비정상적으로 접근하였습니다.');
			    			$.post('${root}LMS/logout.html',function(){
			    				window.location.href="${root}LMS/lmsLogin.html";
			    			});
			    		}
						return false;
					})
				}
			});
		});
		
		$('.btn2').on('click',function(){
			var con=confirm('삭제 하시겠습니까?');
			if(con){
				$.post('${root}LMS/Govern/staffAdmin_delete.html','empid=<%=bean.getEmpid() %>', function(data1){
					if(data1=="ok"){
						alert('삭제가 완료되었습니다.');
						window.location.href="${root}LMS/Govern/staffAdmin.html";
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
<title>행정팀 | 비트캠프</title>
</head>
<body>
	<div class="wow fadeInUp">
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
					<li id="check"><a style="cursor: default;" href="${root }LMS/Account/staffAdmin.html">◎&nbsp;&nbsp;교직원 관리</a></li>
					<li id="check"><a href="${root }LMS/Govern/subCreate.html">◎&nbsp;&nbsp;강좌 개설</a></li>
					<li id="check"><a href="${root }LMS/Govern/studentAdmin.html">◎&nbsp;&nbsp;수강생 관리</a></li>
					<li id="check"><a href="${root }LMS/Govern/notice.html">◎&nbsp;&nbsp;공지사항 관리</a></li>
					<li id="check"><a href="${root }LMS/Govern/faq.html">◎&nbsp;&nbsp;FAQ 관리</a></li>
				</ul>
				<ul class="mainbox">
					<li class="title" style="margin-top:50px;">[ 교직원 정보 ]</li>	
					<li>
						<div id="staff_insert" style="margin-top:30px;">
							<table>
								<tr>
									<th style="width: 15%">아이디</th>
									<td colspan="3"><%=bean.getEmpid() %></td>
								</tr>
								<tr>
									<th>이름</th>
									<td style="width:35%"><%=bean.getEmpname() %></td>
									<th style="width:15%">전화번호</th>
									<td class="number_1">
										<%=bean.getEmpphone() %>
									</td>
									<td class="number_2">
										<input type="text" id="empphone" name="empphone" style="padding-left: 5px; width: 86%; height:30px;" value="<%=bean.getEmpphone() %>">		
									</td>
								</tr>
								<tr>
									<th>입사일</th>
									<td><%=bean.getEmpdate() %></td>
									<th>부서명</th>
									<td class="select_1">
										<%=bean.getDept() %>
									</td>
									<td class="select_2">
										<select name="dept" id="dept" style="width:90%; height: 30px;">
											<option>영업팀</option>
											<option>회계팀</option>
											<option>행정팀</option>
											<option>취업팀</option>
											<option>강사팀</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>메일주소</th>
									<td class="mail_1" colspan="3"><%=bean.getEmpemail() %></td>
									<td class="mail_2" colspan="3">
										<input type="text" name="empemail" id="empemail" style="padding-left: 5px; width: 94%; height:30px;" value="<%=bean.getEmpemail() %>">
									</td>
								</tr>
								<tr>
									<th>자택주소</th>
									<td colspan="3"><%=bean.getEmpaddr() %></td>
								</tr>
							</table>
						</div>
						<div class="btnbox">
							<button class="btn1" type="button">수정</button>
							<button class="btn1_1" type="submit" >완료</button>
							<button class="btn2" type="submit">삭제</button>
							<button class="btn3" type="button" onclick="window.location.reload()">뒤로</button>
							<button class="btn4" type="button" onclick="location.href='staffAdmin.html'">리스트</button>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
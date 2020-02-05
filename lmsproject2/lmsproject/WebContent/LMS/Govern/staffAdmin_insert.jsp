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
		
		$('#id').on("focusout", function(){
			var id=$('#id').val();
			var id1=$.trim(id);
	        if($('#id').val() == "" || id1 == "" || id != id1){
    	        $('#id').val('');
    	        $('#id').addClass("error");
    	        $('#id').attr('placeholder', '공백은 입력하실 수 없습니다.');
	            return false;
	        }
	        $.post('empDuplicate.html','id='+id, function(data){
	        	if(data=='fail'){
	        		alert('중복처리검사 에러');
	        		$.post('${root}LMS/logout.html',function(){
		        		window.location.href="${root}LMS/lmsLogin.html";
	        		});
	        	}else{
	                if(data==0){
	                 	alert('사용 가능한 아이디 입니다.');
	                  	$('#id').attr("readonly",true); 
	                   	$('#id').css("background-color","silver"); 
	                }else if(data==1){
	                 	alert('중복된 아이디입니다.');
	               		$('#id').val('');
	                	$('#id').addClass("error");
	              		$('#id').attr('placeholder', '중복된 아이디입니다.');
	                }
	        	}
            });
		});

		$('#pw').on("focusout", function(){
			var pw=$('#pw').val();
			var pw1=$.trim(pw);
			var pwLength=pw.length;
	      	if($('#pw').val() == "" || pw1=="" || pw != pw1){
				$('#pw').val('');
			    $("#pw").addClass("error");
			    $('#pw').attr('placeholder', '공백은 입력하실 수 없습니다.');
			    return false;
			}
	      	if(pwLength < 4){
				$('#pw').val('');
				$("#pw").addClass("error");
				$('#pw').attr('placeholder', '4자 이상으로 입력해주세요.');
				return false;
			}
		});
		
		$('#name').on("focusout", function(){
			var name=$('#name').val();
			var name2=$.trim(name);
	        if($('#name').val() == "" || name2 == "" || name != name2){
    	        $('#name').val('');
    	        $('#name').addClass("error");
    	        $('#name').attr('placeholder', '공백은 입력하실 수 없습니다.');
	            return false;
	        }
		});
		
		$('#phone').on("focusout", function(){
			var phone=$('#phone').val();
			var phone3=$.trim(phone);
			numLength=phone3.length;
			if($('#phone').val() == "" || phone =="" || phone != phone3){
    	        $('#phone').val('');
    	        $('#phone').addClass("error");
    	        $('#phone').attr('placeholder', '공백은 입력하실 수 없습니다.');
	            return false;
	        }
	    	if(!/^[0-9]{10,20}$/.test(phone3) || numLength>11 || numLength<10){
    	        $('#phone').val('');
    	        $('#phone').addClass("error");
    	        $('#phone').attr('placeholder', '10~11자리 숫자로 입력해주세요.');
	            return false;
	        }
		});

		$('#mail').on("focusout", function(){
			var mail=$('#mail').val();
			var mail2=$.trim(mail);
	    	var regex=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
	    	if(regex.test(mail2) && mail2.length>10){
	    		console.log("성공!");
	    	}else{
		    	if(mail2="" || mail != mail2){
	    	        $('#mail').val('');
	    	        $('#mail').addClass("error");
	    	        $('#mail').attr('placeholder', '공백은 입력하실 수 없습니다.');
		            return false;
		    	}
    	        $('#mail').val('');
    	        $('#mail').addClass("error");
    	        $('#mail').attr('placeholder', '형식이 맞지 않습니다.');
	            return false;
	    	}
		});
		
		$('#addr').on("focusout", function(){
			var addr=$('#addr').val();
			var addr4=$.trim(addr);
	        if($('#addr').val() == "" || addr4 == ""){
    	        $('#addr').val('');
    	        $('#addr').addClass("error");
    	        $('#addr').attr('placeholder', '공백은 입력하실 수 없습니다.');
	            return false;
	        }
		});
		
	    $('.btn1').on('click', function(){
			var con = confirm("등록하시겠습니까?");
	    	var id=$('#id').val();
	    	var pw=$('#pw').val();
	    	var name=$('#name').val();
	    	var phone=$('#phone').val();
	    	var mail=$('#mail').val();
	    	var job=$('#job').val();
	    	var addr=$('#addr').val();
	    	
			if(con){
				if(id=="" || pw=="" || name=="" || phone=="" || mail=="" || addr==""){
	    	        alert('등록 실패');
	    	        window.location.reload();
		            return false;
		        }
		    	$.post('staffAdmin_insert.html','id='+id+'&pw='+pw+'&name='+name+'&phone='+phone+'&mail='+mail+'&job='+job+'&addr='+addr, function(data){
		    		if(data==1){
		    			alert('등록이 완료되었습니다.');
		    			window.location.href="${root}LMS/Govern/staffAdmin.html";
		    		}else if(data=='fail'){
		    			alert('데이터가 비정상적으로 접근하였습니다.');
		    			$.post('${root}LMS/logout.html',function(){
		    				window.location.href="${root}LMS/lmsLogin.html";
		    			});
		    		}else{
		    			alert('다시 작성해 주십시오.');
		    		}
		    	})
		    	return false;
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
					<li id="check"><a style="cursor: default;" href="${root }LMS/Govern/staffAdmin.html">◎&nbsp;&nbsp;교직원 관리</a></li>
					<li id="check"><a href="${root }LMS/Govern/subCreate.html">◎&nbsp;&nbsp;강좌 개설</a></li>
					<li id="check"><a href="${root }LMS/Govern/studentAdmin.html">◎&nbsp;&nbsp;수강생 관리</a></li>
					<li id="check"><a href="${root }LMS/Govern/notice.html">◎&nbsp;&nbsp;공지사항 관리</a></li>
					<li id="check"><a href="${root }LMS/Govern/faq.html">◎&nbsp;&nbsp;FAQ 관리</a></li>
				</ul>
				<ul class="mainbox">
					<li class="title" style="margin-top:50px;">[ 교직원 등록 ]</li>	
					<li>
						<form action="staffAdmin_insert.html" method="post">
							<div id="staff_insert" style="margin-top:50px;">
								<table>
									<tr>
										<th style="width: 15%">아이디</th>
										<td style="width: 35%"><input type="text" id="id" name="id" style="padding-left: 5px; height: 30px; width: 88%" required></td>
										<th style="width: 15%">비밀번호</th>
										<td style="width: 35%"><input type="password" id="pw" name="pw" style="padding-left: 5px; height: 30px; width: 88%"></td>
									</tr>
									<tr>
										<th>이름</th>
										<td><input type="text" id="name" name="name" style="padding-left: 5px; height: 30px; width: 88%"></td>
										<th>전화번호</th>
										<td><input type="text" id="phone" name="phone" style="padding-left: 5px; height: 30px; width: 88%"></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td><input type="text" id="mail" name="mail" style="padding-left: 5px; height: 30px; width: 88%"></td>
										<th>부서명</th>
										<td>
											<select name="job" id="job" style="width:90%; height: 35px;">
												<option>영업팀</option>
												<option>회계팀</option>
												<option>행정팀</option>
												<option>취업팀</option>
												<option>강사팀</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>자택주소</th>
										<td colspan="3"><input type="text" id="addr" name="addr" style="padding-left: 5px; height: 30px; width: 95%"></td>
									</tr>
								</table>
							</div>
							<div class="btnbox">
								<button class="btn1" type="submit" >등록</button>
								<button class="btn2" type="button" onclick="history.back()">뒤로</button>
							</div>
						</form>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
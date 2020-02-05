<%@ page import="Project_LMS_Model.LMS_Emp_Dto"%>
<%@ page import="Project_Home_Model.Home_Student_Dto"%>
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
		$('#headerBtn a:first-child').on("click", function () {
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
		

		$('#edit1').val('');
	      //수정
	    $('#edit1').on("focusout", function(){
			var edit=$('#edit1').val();
			var edit1=$.trim(edit);
			var ed1Length=edit1.length;
	        if($('#edit1').val() == "" || edit1=="" || edit != edit1){
	            $('#edit1').val('');
	               $("#edit1").addClass("error");
	               $('#edit1').attr('placeholder', '공백은 입력하실 수 없습니다.');
	               return false;
	        }
	        if(ed1Length < 4){
	            $('#edit1').val('');
	               $("#edit1").addClass("error");
	               $('#edit1').attr('placeholder', '4자 이상으로 입력해주세요.');
	               return false;
	        }
	        if(edit1=='<%=login.getEmppw() %>'){
	            $('#edit1').val('');
	               $("#edit1").addClass("error");
	               $('#edit1').attr('placeholder', '같은 비밀번호는 사용할 수 없습니다.');
	               return false;
	        }
		});
		
		$('#edit2').on("focusout", function(){
			var edit=$('#edit2').val();
			var edit2=$.trim(edit);
	    	var regex=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
	    	if(regex.test(edit2) && edit2.length>10){
	    		console.log("성공!");
	    	}else{
		    	if(edit2="" || edit != edit2){
	    	        $('#edit2').val('');
	    	        $('#edit2').addClass("error");
	    	        $('#edit2').attr('placeholder', '공백은 입력하실 수 없습니다.');
		            return false;
		    	}
    	        $('#edit2').val('');
    	        $('#edit2').addClass("error");
    	        $('#edit2').attr('placeholder', '형식이 맞지 않습니다.');
	            return false;
	    	}
		});
		
		$('#edit3').on("focusout", function(){
			var edit=$('#edit3').val();
			var edit3=$.trim(edit);
			numLength=edit3.length;
    		console.log(numLength);
			if($('#edit3').val() == "" || edit3 =="" || edit != edit3){
    	        $('#edit3').val('');
    	        $('#edit3').addClass("error");
    	        $('#edit3').attr('placeholder', '공백은 입력하실 수 없습니다.');
	            return false;
	        }
	    	if(!/^[0-9]{10,20}$/.test(edit3) || numLength>11 || numLength<10){
    	        $('#edit3').val('');
    	        $('#edit3').addClass("error");
    	        $('#edit3').attr('placeholder', '10~11자리 숫자로 입력해주세요.');
	            return false;
	        }
		});
		
		$('#edit4').on("focusout", function(){
			var edit=$('#edit4').val();
			var edit4=$.trim(edit);
	        if($('#edit4').val() == "" || edit4 == ""){
    	        $('#edit4').val('');
    	        $('#edit4').addClass("error");
    	        $('#edit4').attr('placeholder', '공백은 입력하실 수 없습니다.');
	            return false;
	        }
		});
		
		$('.btn').click(function(){
		  	 var con = confirm("수정하시겠습니까?");
	         var edit=$('#edit1').val();
	         var edit1=$.trim(edit);
	         var edit=$('#edit2').val();
	         var edit2=$.trim(edit);
	         var edit=$('#edit3').val();
	         var edit3=$.trim(edit);
	         var edit=$('#edit4').val();
	         var edit4=$.trim(edit);
			 if(con){
		         if(edit1=="" || edit2=="" || edit3=="" || edit4==""){
			        alert('수정 실패');
		            return false;
		         }
				 $.post('${root }LMS/Account/inforup.html','empnum='+<%=login.getEmpnum()%>+'&emppw='+$('#edit1').val()+'&empemail='+$('#edit2').val()+'&empphone='+$('#edit3').val()+'&empaddr='+$('#edit4').val(),function(data){
					 if(data==1){
			    		 alert('수정이 완료되었습니다. 새로운 정보로 로그인해주세요.');
						 $.post('${root}LMS/logout.html',function(){
								window.location.href="${root}LMS/lmsLogin.html";
						 });
			    	 }else if(data=='fail1'){
			    		 alert('비정상적인 데이터가 접근하였습니다.');
			    		 $.post('${root}LMS/logout.html',function(){
			    			 window.location.href="${root}LMS/lmsLogin.html";
			    		 });
			    	 }
					 return false;
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
			<div class="welcome">&nbsp;※&nbsp;&nbsp;행정팀 <%=login.getEmpname() %>님이 로그인하였습니다.</div>
			<div id="headerBtn">
				<a style="cursor: default; font-weight: bold;" href="${root }LMS/Govern/inforup.html?empnum=<%=login.getEmpnum()%>">정보수정</a>
				<a href="${root }LMS/logout.html">로그아웃</a>
			</div>
		</div>
		<div class="box">
			<ul class="stuMenus">
				<li id="check"><a href="${root }LMS/Govern/staffAdmin.html">◎&nbsp;&nbsp;교직원 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/subCreate.html">◎&nbsp;&nbsp;강좌 개설</a></li>
				<li id="check"><a href="${root }LMS/Govern/studentAdmin.html">◎&nbsp;&nbsp;수강생 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/notice.html">◎&nbsp;&nbsp;공지사항 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/faq.html">◎&nbsp;&nbsp;FAQ 관리</a></li>
			</ul>
			<ul class="mainbox">
				<li class="title" style="margin-top:50px;">[ 정보 수정 ]</li>
				<li>
              		<table class="infor">
              		<%
              		LMS_Emp_Dto bean=(LMS_Emp_Dto)request.getAttribute("bean");
              		%>
              			<tr>
                   			<th>아이디</th>
                   			<td><%=bean.getEmpid() %></td>
               			</tr>
               			<tr>
                   			<th>이름</th>
                   			<td><%=bean.getEmpname() %></td>
               			</tr>
               			<tr>
                   			<th>비밀번호</th>
                   			<td><input class="editbox" id="edit1" type="password" placeholder="새로운 비밀번호를 입력해주세요." value="<%=bean.getEmppw() %>" /></td>
               			</tr>
               			<tr>
                   			<th>이메일</th>
                   			<td><input class="editbox" id="edit2" type="text" value="<%=bean.getEmpemail()%>"/></td>
               			</tr>
               			<tr>
                   			<th>전화번호</th>
                   			<td><input class="editbox" id="edit3" type="text" value="<%=bean.getEmpphone()%>"/></td>
               			</tr>
               			<tr>
                   			<th>주소</th>
                   			<td><input class="editbox" id="edit4" type="text" value="<%=bean.getEmpaddr()%>"/></td>
               			</tr>
            		</table>
					<div class="edit">
						<button class="btn" type="submit">수정하기</button>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
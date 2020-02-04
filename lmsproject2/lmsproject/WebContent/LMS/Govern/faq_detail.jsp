<%@ page import="Project_LMS_Model.LMS_GovernTeam_Dao"%>
<%@ page import="Project_Utils.Paging"%>
<%@ page import="Project_LMS_Model.LMS_Emp_Dto"%>
<%@ page import="Project_LMS_Model.LMS_FAQ_Dto" %>
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
	.stuMenus>li:nth-child(5){
		font-weight: bold;
		background-color: gray;
	}
	.stuMenus>li:nth-child(5) a{
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
LMS_Emp_Dto login = (LMS_Emp_Dto)session.getAttribute("lmslogin");
LMS_FAQ_Dto bean = (LMS_FAQ_Dto)request.getAttribute("bean");
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
		$('.stuMenus>li:nth-child(5) a').on("click", function () {
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
		
		$('#title_2').hide();
		$('#content_2').hide();
		$('.btn1_1').hide();
		$('.btn3').hide();
		
		$('.btn1').on('click', function(){
			$('.btn1').hide();
			$('.btn2').hide();
			$('.btn4').hide();
			$('.btn1_1').show();
			$('.btn3').show();

			$('#title_1').hide();
			$('#content_1').hide();
			
			$('#title_2').show();
			$('#content_2').show();
			
		});
		
		$('#newTitle').on('focusout', function(){
			var text=$('#newTitle').val();
			var text=$.trim(text);
			if($('#newTitle')=="" || text==""){
				$('#newTitle').val('');
				$('#newTitle').addClass("error");
				$('#newTitle').attr('placeholder', '공백은 입력하실 수 없습니다.');
				return false;
			}
		});
		$('#textarea2').on('focusout', function(){
			var text=$('#textarea2').val();
			var text=$.trim(text);
			if($('#textarea2')=="" || text==""){
				$('#textarea2').val('');
				$('#textarea2').addClass("error");
				$('#textarea2').attr('placeholder', '공백은 입력하실 수 없습니다.');
				return false;
			}
		});
		
		
		//수정
		$('.btn1_1').on("click",function(){
			var modify = confirm("수정하시겠습니까?");
			var text=$('#newTitle').val();
			var text=$.trim(text);
			var text2=$('#textarea2').val();
			var text2=$.trim(text2);
			if(text=="" || text2==""){
              	alert('수정 실패');
				return false;
			}
			if(modify){
				$.post('${root}LMS/Govern/faq_detail.html','faqtitle='+$('#newTitle').val()+'&faqcontent='+$('#textarea2').val()+'&faqnum=<%=bean.getFaqnum() %>',function(data){
					if(data=='ok'){
		            	alert('수정이 완료되었습니다');
		    			window.location.reload();
		            }else if(data=='fail'){
		              	alert('수정 실패');
						return false;
		            }else if(data=='fail1'){
		            	alert('데이터가 비정상적으로 접근하였습니다.');
		            	$.post('${root}LMS/logout.html',function(){
		            		window.location.href="${root}LMS/lmsLogin.html";
		            	});
		            }
          		});
         	}
		
         });
		
		//삭제
      	$('.btn2').on("click",function(){
      		var del = confirm('삭제하시겠습니까?');
			if(del){
			$.post('${root}LMS/Govern/faq_delete.html','faqnum=<%=bean.getFaqnum() %>',function(data){
			if(data=='ok'){
				alert('삭제가 완료되었습니다.');
				window.location.href='${root}LMS/Govern/faq.html';
			}else if(data=='fail'){
				alert('삭제실패');
			}else if(data=='fail1'){
				alert('데이터가 비정상적으로 접근하였습니다.');
				$.post('${root}LMS/logout.html',function(){
					window.location.href="${root}LMS/lmsLogin.html";
				});
			}
			});
			}
		})
		
		//뒤로
		$('.btn3').on("click",function(){
			window.location.reload();
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
				<li id="check"><a href="${root }LMS/Govern/subCreate.html">강좌 개설</a></li>
				<li id="check"><a href="${root }LMS/Govern/studentAdmin.html">수강생 관리</a></li>
				<li id="check"><a href="${root }LMS/Govern/notice.html">공지사항 관리</a></li>
				<li id="check"><a style="cursor: default;" href="${root }LMS/Govern/faq.html">FAQ 관리</a></li>
			</ul>
			<ul class="mainbox">
				<li class="title" style="margin-top:50px; margin-bottom:50px; text-align: center;">FAQ 관리</li>	
				<li>
					<div id="noticedetail">
						<table>
							<thead>
								<tr>
									<th style="width:20%">질문</th>
									<td id="title_1" class="title" colspan="3" style="text-align: center;">
										<%=bean.getFaqtitle() %>
									</td>
									<td id="title_2" class="title" colspan="3" style="text-align: center;">
										<input id="newTitle" type="text" value="<%=bean.getFaqtitle() %>" style="height: 30px; padding-left:5px; width: 97%"/>
									</td>
								</tr>
								<tr>
									<th style="width:20%">작성일</th>
									<td style="width:80% text-align: center;"><%=bean.getFaqdate() %></td>
								</tr>
								<tr>
									<th colspan="4" style="width:100%; text-align: center;">답변</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td id="content_1" colspan="4" >
										<textarea id="textarea1" class="textarea" readonly="readonly" style="height:160px; width:98%"><%=bean.getFaqcontent() %></textarea>
									</td>
									<td id="content_2" colspan="4" >
										<textarea id="textarea2" class="textarea" style="height:160px; width: 98%; border:0.5px solid silver; border-top: none;"><%=bean.getFaqcontent() %></textarea>
									</td>		
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btnbox">
						<button class="btn1" type="button" onclick="">수정</button>
						<button class="btn1_1" type="submit" onclick="">완료</button>
						<button class="btn2" type="submit" onclick="">삭제</button>
						<button class="btn3" type="button" onclick="">뒤로</button>
						<button class="btn4" type="button" onclick="location.href='faq.html'">리스트</button>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
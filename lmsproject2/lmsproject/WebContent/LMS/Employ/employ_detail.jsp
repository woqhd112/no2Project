<%@ page import="Project_Utils.Paging"%>
<%@ page import="Project_LMS_Model.LMS_Emp_Dto"%>
<%@ page import="Project_LMS_Model.LMS_HireInfo_Dto" %>
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
<link rel="stylesheet" href="../../css/lms/employ.css" />
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
</style>
<script type="text/javascript" src="../../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../js/jquery.bxslider.js"></script>
<script type="text/javascript" src="../../js/wow.js"></script>
<script type="text/javascript">
<c:url value="/" var="root"></c:url>
<%
LMS_Emp_Dto login=(LMS_Emp_Dto)session.getAttribute("lmslogin");
LMS_HireInfo_Dto bean = (LMS_HireInfo_Dto)request.getAttribute("bean");
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
         };
         return false;
      });
      $('.link').on("click",function(){
         var link='<%=bean.getCmplink() %>';
         window.open(link, '_blank');
      });
      
      //삭제
      $('.btn1').eq(0).on("click",function(){
    	  var del = confirm('삭제하시겠습니까?');
          if(del){
             $.post('${root}LMS/Employ/employ_delete.html','infonum=<%=bean.getInfonum() %>',function(data){
	             if(data=='ok'){
					alert('삭제가 완료되었습니다.');
	                window.location.href='${root}LMS/Employ/employ.html';
	             }else if(data=='fail'){
	                alert('삭제실패');
	             }else if(data=='fail1'){
	            	 alert('비정상적인 데이터가 접근하였습니다.');
	            	 $.post('${root}LMS/logout.html',function(){
	            		 window.location.href="${root}LMS/lmsLogin.html";
	            	 });
	             }
             });
			}
		})
      
   });
   
</script>
<title>취업팀 | 비트캠프</title>
</head>
<body>
   <div class="wow fadeInUp">
      <div class="lms">
         <div class="conHeader">
			<div class="welcome">&nbsp;※&nbsp;&nbsp;취업팀 <%=login.getEmpname() %>님이 로그인하였습니다.</div>
            <div id="headerBtn">
               <a href="${root }LMS/Employ/inforup.html?empnum=<%=login.getEmpnum()%>">정보수정</a>
               <a href="${root }LMS/logout.html">로그아웃</a>
            </div>
         </div>
         <div class="box">
            <ul class="stuMenus">
               <li id="check"><a href="${root }LMS/Employ/employTeam.html">◎&nbsp;&nbsp;교직원 정보</a></li>
               <li id="check"><a style="cursor: default;" href="${root }LMS/Employ/employ.html">◎&nbsp;&nbsp;채용정보 등록</a></li>
               <li id="check"><a href="${root }LMS/Employ/gradeOpen.html">◎&nbsp;&nbsp;학생 성적조회</a></li>
            </ul>
            <ul class="mainbox">
               <li class="title" style="margin-top:50px;">[ 채용정보 등록 ]</li>
               <li>
                  <div id="employ_detail">
                     <table>
                        <tr>
                           <th>제목</th>
                           <td colspan="3"><%=bean.getInfotitle() %></td>
                        </tr>
                        <tr>
                           <th>회사명</th>
                           <td colspan="3"><%=bean.getCmpname() %></td>
                        </tr>
                        <tr>
                           <th>공고 링크</th>
                           <td colspan="3"><a class="link" href="#"><%=bean.getCmplink() %></a></td>
                        </tr>
                        <tr>
                           <th style="width: 15%">등록일</th>
                           <td><%=bean.getInfodate() %></td>
                           <th style="width: 15%">접수마감일</th>
                           <td><%=bean.getCmpexp() %></td>
                        </tr>
                        <tr>
                           <th style="width: 15%">작성자</th>
                           <td><%=bean.getInfoauthor() %></td>
                           <th style="width: 15%">조회수</th>
                           <td><%=bean.getInfocnt() %></td>
                        </tr>
                     </table>
                  </div>
                  <div class="btnbox">
                     <button class="btn1" type="button">삭제</button>
                     <button class="btn2" type="button" onclick="location.href='employ.html'">리스트</button>
                  </div>
               </li>
            </ul>
         </div>
      </div>
   </div>
</body>
</html>
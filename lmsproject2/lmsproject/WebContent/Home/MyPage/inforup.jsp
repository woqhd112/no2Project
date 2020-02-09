<%@page import="Project_Home_Model.Home_Student_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/animate.css" />
<link rel="shortcut icon" href="../../imgs/favicon.ico">
<link rel="stylesheet" href="../../css/reset.css" />
<link rel="stylesheet" href="../../css/index.css" />
<style type="text/css">
   .img{
      width: 100%;
      height: 200px;
      position: relative;
       background-image: url(../../imgs/submenu/login.jpg);                                                               
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
Home_Student_Dto login=(Home_Student_Dto)session.getAttribute("login");
Home_Student_Dto bean=(Home_Student_Dto)request.getAttribute("bean");
%>
   $(document).ready(function(){
      
      $(".focus")[0].scrollIntoView(); 
      
//      new WOW().init(); 
      
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
      $('.conHeader #headerBtn a:first-child').on("click", function () {
         return false;
      });

      $('#edit1').val('');
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
          if(!/^[a-zA-Z0-9]{8,21}$/.test(edit)){
               $('#edit1').val('');
               $("#edit1").addClass("error");
               $('#edit1').attr('placeholder', '숫자와 영문자 조합으로 8~13자리를 사용해야 합니다.');
               return false;
           }
          if(edit1=='<%=bean.getStupw() %>'){
            $('#edit1').val('');
               $("#edit1").addClass("error");
               $('#edit1').attr('placeholder', '같은 비밀번호는 사용할 수 없습니다.');
          }
          var chk_num = edit1.search(/[0-9]/g);
          var chk_eng = edit1.search(/[a-z]/ig);
           
           if(chk_num < 0 || chk_eng < 0){
               $('#edit1').val('');
               $("#edit1").addClass("error");
               $('#edit1').attr('placeholder', '숫자와 영문자를 혼용하여아 합니다.');
               return false;
           }
      });
      
      $('#edit2').on("focusout", function(){
         var edit=$('#edit2').val();
         var edit2=$.trim(edit);
         numLength=edit2.length;
          console.log(numLength);
         if($('#edit2').val() == "" || edit3 =="" || edit != edit2){
               $('#edit2').val('');
               $('#edit2').addClass("error");
               $('#edit2').attr('placeholder', '공백은 입력하실 수 없습니다.');
               return false;
           }
          if(!/^[0-9]{10,11}$/.test(edit2) || numLength>11 || numLength<10){
               $('#edit2').val('');
               $('#edit2').addClass("error");
               $('#edit2').attr('placeholder', '10~11자리 숫자로 입력해주세요.');
               return false;
           }
      });
      
      $('#edit3').on("focusout", function(){
         var edit=$('#edit3').val();
         var edit3=$.trim(edit);
           if($('#edit3').val() == "" || edit3 == ""){
               $('#edit3').val('');
               $('#edit3').addClass("error");
               $('#edit3').attr('placeholder', '공백은 입력하실 수 없습니다.');
               return false;
           }
      });
      
      $('.edit').click(function(){
         var con=confirm("정말 수정 하시겠습니까?");
         var edit=$('#edit1').val();
         var edit1=$.trim(edit);
         var edit=$('#edit2').val();
         var edit2=$.trim(edit);
         var edit=$('#edit3').val();
         var edit3=$.trim(edit);
         if(con){
        	 if(edit1=="" || edit2=="" || edit3==""){
		         alert('수정 실패');
	             $('#edit1').addClass("error");
		         return false;
        	 }
             $.post('inforup.html','stunum='+<%=login.getStunum()%>+'&stupw='+$('#edit1').val()+'&stuphone='+$('#edit2').val()+'&stuaddr='+$('#edit3').val(),function(data){
	             if(data=='fail'){
	            	 alert('수정에 실패하였습니다.');
	            	 $.post('${root}Home/logout.html',function(){
	            		 window.location.href="${root}LMS/login.html";
	            	 });
	             }else{
		             if(data==1){
		                 alert('수정이 완료되었습니다. 새로운 정보로 로그인해주세요.');
		               	 $.post('${root}Home/logout.html',function(){
		               		window.location.href="${root}Home/login.html";
		                 });
		             }
	             }
					return false;
	            });
	         }
	      });
      
      $('#headerBtn a').eq(1).on("click",function(){
         var logout=confirm('로그아웃 하시겠습니까?');
         if(logout){
            $.post('${root}Home/logout.html',function(){
				alert('로그아웃이 완료되었습니다.');
               	window.location.href="${root}Home/login.html";
            });
         }
         return false;
      });
   });
   
</script>
<title>정보 수정 | 비트캠프</title>
</head>
<body>

   <div id="top">
      <ul>
         <li>구리센터</li>
         <li><a href="http://sch.bitcamp.co.kr/index.php?main_page=home">서초본원</a></li>
         <li><a href="http://gn.bitcamp.co.kr/index.php?main_page=home">강남센터</a></li>
         <li><a href="http://sc.bitcamp.co.kr/index.php?main_page=home">신촌센터</a></li>
         <li><a href="http://jn.bitcamp.co.kr/index.php?main_page=home">종로센터</a></li>
      </ul>
   </div>
   <div id="blank">
      <ul>
         <li></li>
      </ul>
   </div>
   <div id="header">
      <ul>
         <li><a href="${root }index.html"><img src="../../imgs/logo/widelogo.jpg"/></a></li>
      </ul>
   </div>
   <div id="menu">
      <a class="first after" href="${root }Home/intro.html">학원소개</a>
      <a class="first after" href="${root }Home/regnot.html">취업교육과정</a>
      <a style="cursor: default;" class="first after" href="#">고객센터</a>
      <%if(login==null){ %>
      <a class="first after" href="${root }Home/login.html">로그인</a>
      <%}else{ %>
      <a style="cursor: default;" class="first after" href="${root }Home/MyPage/check.html">마이페이지</a>
      <%} %>
   </div>
   <div id="submenu">
      <ul>
         <li><a href="${root }Home/notice.html">공지사항</a></li>
         <li><a href="${rot }Home/faq.html">FAQ</a></li>
      </ul>
   </div>
   <div class="img">
      <div class="content">
         <h1>든든 학습 파트너, 비트캠프 학습지원센터</h1>
         <h2>IT계열 취업, 진짜 준비는 지금부터입니다!</h2>
         <h3>비트캠프에서는 교육과정에 입학하시는 모든 교육생분들의 역량을 <br/> 
         향상시킬 수 있도록 체계적이고 효율적인 관리와 밀착지원을 약속드립니다.</h3>
      </div>
   </div>
   <div class="focus"></div>
   <div class="wow fadeInUp">
      <div class="default">
         <div class="conHeader">
				<div class="welcome">&nbsp;※&nbsp;&nbsp;<%=login.getStuname() %>&nbsp;님이 로그인하였습니다.</div>
            <div id="headerBtn">
               <a style="cursor: default; font-weight: bold;" href="${root }Home/MyPage/inforup.html">정보수정</a>
               <a href="${root }Home/logout.html">로그아웃</a>
            </div>
         </div>
         <div class="box">
            <ul class="stuMenus">
               <li id="check"><a href="${root }Home/MyPage/check.html">◎&nbsp;&nbsp;출석체크</a></li>
               <li id="subinfor"><a href="${root }Home/MyPage/subInfor.html">◎&nbsp;&nbsp;수강정보</a></li>
               <li id="examview"><a href="${root }Home/MyPage/examView.html">◎&nbsp;&nbsp;시험조회</a></li>
               <li id="gradeoepn"><a href="${root }Home/MyPage/gradeOpen.html">◎&nbsp;&nbsp;성적열람</a></li>
               <li id="employ"><a href="${root }Home/MyPage/employ.html">◎&nbsp;&nbsp;채용정보</a></li>
            </ul>
            <ul class="mainbox">
               <li class="title" style="margin-top:50px; margin-bottom: 50px">[ 정보 수정 ]</li>
               <li>
                       <table class="infor">
                          <tr>
                               <th>아이디(이메일)</th>
                               <td><%=bean.getStuid() %></td>
                           </tr>
                           <tr>
                               <th>이름</th>
                               <td><%=bean.getStuname() %></td>
                           </tr>
                           <tr>
                               <th>비밀번호</th>
                               <td><input id="edit1" type="password" placeholder="새로운 비밀번호를 입력해주세요" value="<%=bean.getStupw() %>" /></td>
                           </tr>
                           <tr>
                               <th>전화번호</th>
                               <td><input id="edit2" type="text" value="<%=bean.getStuphone() %>"/></td>
                           </tr>
                           <tr>
                               <th>주소</th>
                               <td><input id="edit3" type="text" value="<%=bean.getStuaddr() %>"/></td>
                           </tr>
                     </table>
                  <div class="edit">
                     <button class="btn" type="submit">수정하기</button>
                  </div>
               </li>
            </ul>
         </div>
      </div>
   </div>
   <div id="footer">
      <ul>
         <li>
            <div class="logo">
               <img src="../../imgs/logo/logo.png" />   
            </div>
         </li>
         <li>
            <div class="addr">
               비트캠프 서울시 서초구 강남대로 459 (서초동, 백암빌딩) | 대표이사 : 조현정<br/>
               Copyright © 비트캠프 All rights reserved.<br/>
               <button id="loginButton" type="button" onclick="window.open('${root}LMS/lmsLogin.html', 'LMS 관리자시스템 | 비트캠프', 'width=1200, height=750, top=0, left=100, location=no, status=no, directories=no, scrollbars=yes');">관리자 로그인</button>
            </div>
         </li>
      </ul>
   </div>
</body>
</html>
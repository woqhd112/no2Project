<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>LMS 관리자시스템 | 비트캠프</title>
<link rel="stylesheet" href="../css/animate.css" />
<link rel="shortcut icon" href="../imgs/favicon.ico">
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/lms.css" />
<c:url value="/" var="root"></c:url>
<style type="text/css">

</style>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="../js/wow.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		new WOW().init(); 
		
	});
</script>

</head>
<body>
	<div id="effect" class="wow fadeInUp">
		<div class="content">
			<form action="${root }LMS/lmsLogin.html" method="post">
				<div class="loginForm">
					<img class="logoimg" src="../imgs/logo/colorlogo.png"/><br>
					<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
		           	<br/>
		           	<input type="password" id="password" name="pw" placeholder="비밀번호를 입력해주세요">
		           	<br/>
					<div class="btns">
						<button class="btn" id="loginBtn" type="submit">LOGIN</button>
					</div>
		           	<div class="search">
						<a href="${root }LMS/idcheck.html">아이디 찾기</a><span style="cursor: default">&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;</span>
						<a href="${root }LMS/pwcheck.html">비밀번호 찾기</a>
		   			</div>
	   			</div>
	   		</form>
		</div>
	</div>
</body>
</html>
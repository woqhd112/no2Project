<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 찾기 | 비트캠프</title>
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
		
		$('.btn').on("click", function(){
			var search=confirm('정보를 맞게 입력하셨습니까?');
			if(search){
				var result=$(":selected").val();
				if(result=='부서를 선택해주세요.'){
					alert('부서를 선택해주세요.');
					$('#select').focus();
					return false;
				}
				var name=$('#name').val();
				var name2=$.trim(name);
				console.log(name);
				var num=$('#num').val();
				var num2=$.trim(num);
				console.log(num);
				if(name2==""){
					alert('공백은 입력할 수 없습니다.')
					$('#name').addClass("error");
					$('#name').attr('placeholder', '공백은 불가능합니다.');
					$('#name').focus();
					return false;
				}
				if(num2==""){
					alert('공백은 입력할 수 없습니다.')
					$('#num').addClass("error");
					$('#num').attr('placeholder', '공백은 불가능합니다.');
					$('#num').focus();
					return false;
				}
				$.post('pwcheck.html','id='+name+'&num='+num+'&job='+result, function(data){
					console.log(data);
					if(data!="wow"){
						alert('당신의 패스워드는 ['+data+'] 입니다.');
						location.href = 'lmsLogin.html';
					}else{
						$('#name').val("");
						$('#num').val("");
						$('select').find('option:first').attr('selected', 'selected');
						alert('등록된 정보가 없습니다.');
						return false;
					}
				});
			}else{
				alert('등록된 정보가 없습니다.');
				return false;
			}
		});
		
	});
</script>

</head>
<body>
	<div id="effect" class="wow fadeInUp">	
		<div class="content">
			<div class="loginForm" style="margin-top: 100px;">
				<img class="logoimg" src="../imgs/logo/colorlogo.png"/><br>
				<input type="text" id="name" name="id" placeholder="아이디를 입력해주세요.">
	           	<br/>
	           	<select id="job" name="job">
	           		<option>부서를 선택해주세요.</option>
	           		<option>영업팀</option>
	           		<option>행정팀</option>
	           		<option>회계팀</option>
	           		<option>취업팀</option>
	           		<option>강사팀</option>
	           	</select>
	           	<input type="text" id="num" name="num" placeholder="전화번호를 입력해주세요.">
	           	<br/>
				<div class="btns">
					<button class="btn" id="loginBtn" type="submit">비밀번호 찾기</button>
				</div>
	           	<div class="search">
					<a href="${root }LMS/lmsLogin.html">로그인 하기</a><span style="cursor: default">&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;</span>
					<a href="${root }LMS/idcheck.html">아이디 찾기</a>
	   			</div>
   			</div>
		</div>
	</div>
</body>
</html>
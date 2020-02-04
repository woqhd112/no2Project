<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/animate.css" />
<link rel="shortcut icon" href="../imgs/favicon.ico">
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/index.css" />
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
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="../js/jquery.bxslider.js"></script>
<script type="text/javascript" src="../js/wow.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
      
		$(".join")[0].scrollIntoView(); 
      
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
		$('#menu a:nth-child(3)').click(function () {
			return false;
		});
		$('.checkPw').click(function () {
			return false;
		});
      
		$('#content2').hide();
		$('#pschk').hide();
		$('#content1').show();;
		$('.btn3').prop("disabled", true);
		$('.btn3').css({
			'background-color': '#ffffff', 'color': 'gray', 'cursor': 'default'
		});
		$('.btn2').on("click", function(){
			window.location.reload();
		});
		$('#agreeButton').on("click", function(){
			$(".focus")[0].scrollIntoView(); 
			$('#content1').hide();
			$('#content2').show();
			$('.agree').css({ 
				'backgroundColor': 'white', 'color': 'gray'
				});
			$('.writeInfo').css({
				'backgroundColor': '#044879','color': 'white'
				});
			$('#id').css("background-color","white").css("color","black"); 
			$('#id').val('');
		});
       
		$('.checkId').on("click",function(){
			var id=$('#id').val();
			var id=$.trim(id);
			var regex=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
			if(regex.test(id) && id.length>10){
				 $.post('memberduplicate.html','id='+id, function(data){
            	if(data=='fail'){
            		alert('중복 처리 에러 다시 접속하시길 바랍니다.');
           		}else{
	                if(data==0){
	                   alert('사용 가능한 아이디 입니다.');
	                   $('.checkId').prop("disabled", true).css("cursor", "default");
	                   $('#id').attr("readonly",true); 
	                   $('#id').css("background-color","silver"); 
	                   
	                   var pw=document.getElementById('pw').value;
	                   var pw2=document.getElementById('pw2').value;
	                   if(pw == pw2 && pw !="" && pw2 !=""){
	                      $('.btn3').prop("disabled", false);
	                      $('.btn3').css({
	                         'background-color': '#313436', 'color': 'white', 'cursor': 'pointer'
	                            });
	                      }
	                   }else if(data==1){
	                      $('#id').val('');
	                      $('#id').addClass("error");
	                      $('#id').attr('placeholder', '중복된 아이디입니다.');
	                   }
	                }
           			 
           		 });
				}else{
					$('#id').val('');
					$('#id').addClass("error");
					$('#id').attr('placeholder', '형식이 맞지 않습니다.');
				}
			});
       
		$('#name').on("focusout",function(){
			var name=document.getElementById('name').value;
			var name=$.trim(name);
			if($('#name').val() == "" || name==""){
				$('#name').val('');
				$('#name').addClass("error");
				$('#name').attr('placeholder', '공백은 불가능합니다.');
				return false;
			}
		});
      
		$('#pw').on("focusout", function(){
			var pw=document.getElementById('pw').value;
			var pw=$.trim(pw);
			if($('#pw').val()=="" || pw==""){
				$('#pw').val('');
				$('#pw').addClass("error");
				$('#pw').attr('placeholder', '공백은 입력하실 수 없습니다.');
			}
			
			var pw=document.getElementById('pw').value;
			var pw=$.trim(pw);
			var pw2=document.getElementById('pw2').value;
			var pw2=$.trim(pw2);

			if(pw2!=""){
				var pw=document.getElementById('pw').value;
				var pw=$.trim(pw);
				var pw2=document.getElementById('pw2').value;
				var pw2=$.trim(pw2);
				if(pw!=pw2 || pw==""){
					$('#pw').val('');
					$('#pw').addClass("error");
					$('#pw').attr('placeholder', '비밀번호가 서로 일치하지 않습니다.');
					$('#pw2').val('');
					$('#pw2').attr("readonly",false); 
					$('#pw2').removeClass("error");
					$('#pw2').css({ 
						'backgroundColor': 'white', 'color': 'gray'
							});
					$('#pschk').hide();
					$('.btn3').prop("disabled", true);
					$('.btn3').css({ 
						'backgroundColor': 'white', 'color': 'gray'
							});
				}
			}
		});

		$('#pw2').on("focusout", function(){
			var pw=document.getElementById('pw').value;
			var pw=$.trim(pw);
			var pw2=document.getElementById('pw2').value;
			var pw2=$.trim(pw);
			var id=$('#id').val();
			console.log(pw);
			console.log(pw2);
			if($('#pw2').val()=="" || pw2==""){
				$('#pw2').val('');
				$('#pw2').addClass("error");
				$('#pw2').attr('placeholder', '공백은 입력하실 수 없습니다.');
			}
			if(pw != pw2){
				$('#pw').val('');
				$('#pw2').val('');
				$('#pw').addClass("error");
				$('#pw').attr('placeholder', '비밀번호가 서로 일치하지 않습니다.');
				return false;
			}else{
				if(!/^[a-zA-Z0-9]{8,21}$/.test(pw)){ 
					$('#pw').val('');
					$('#pw2').val('');
					$('#pw').addClass("error");
					$('#pw').attr('placeholder', '8~13자리로 입력해주세요.');
					return false;
				}
				var chk_num = pw.search(/[0-9]/g);
				var chk_eng = pw.search(/[a-z]/ig);
				if(chk_num < 0 || chk_eng < 0){
					$('#pw').val('');
					$('#pw2').val('');
					$('#pw').addClass("error");
					$('#pw').attr('placeholder', '숫자와 영문을 혼용해야합니다.');
					return false;
				}
				$('#pschk').show();
				$('#pw2').attr('readonly', 'readonly').css('background-color', 'silver');
				var Readonlyvalue = $(".checkId").attr("disabled");
				if(typeof Readonlyvalue != "undefined"){
					$('.btn3').prop("disabled", false);
					$('.btn3').css({
						'background-color': '#313436', 'color': 'white', 'cursor': 'pointer'
							});
					}
				return false;
			}
		});

      
		$('#contact').on("focusout", function(){
			var contact=$('#contact').val();
			var numLength=contact.length;
         
			if($('#contact').val() == ""){
				$('#contact').val('');
				$('#contact').addClass("error");
				$('#contact').attr('placeholder', '공백은 불가능합니다.');
				return false;
			}
			if(!/^[0-9]{10,11}$/.test(contact) || numLength>11 || numLength<10){ 
				console.log(numLength);
				$('#contact').val('');
				$('#contact').addClass("error");
				$('#contact').attr('placeholder', '10~11자리 숫자로 입력해주세요.');
				return false;
			}
		});
		
		$('#address').on("focusout", function(){
			var address=$('#address').val();
			var address=$.trim(address);
			if($('#address').val() == "" || address== ""){
				$('#address').val('');
				$('#address').addClass("error");
				$('#address').attr('placeholder', '공백은 불가능합니다.');
				return false;
			}
		});
       
		$('.btn3').click(function(){
			var id=$('#id').val();
			var pw=$('#pw').val();
			var pw2=$('#pw2').val();
			var name=$('#name').val();
			var contact=$('#contact').val();
			var address=$('#address').val();
          
			var numLength=contact.length;
			console.log(numLength);

			if(!/^[0-9]{10,20}$/.test(contact)){ 
				$('#contact').val('');
				$('#contact').addClass("error");
				$('#contact').attr('placeholder', '10~11자리 숫자로 입력해주세요.');
				return false;
			}
			if($('#name').val() == ""){
				$('#name').val('');
				$('#name').addClass("error");
				$('#name').attr('placeholder', '공백은 불가능합니다.');
				return false;
			}
			if($('#address').val() == ""){
				$('#address').val('');
				$('#address').addClass("error");
				$('#address').attr('placeholder', '공백은 불가능합니다.');
				return false;
			}
			if($('#contact').val() == ""){
				$('#contact').val('');
				$('#contact').addClass("error");
				$('#contact').attr('placeholder', '공백은 불가능합니다.');
				return false;
			}
			var chk_num = pw.search(/[0-9]/g);
			var chk_eng = pw.search(/[a-z]/ig);
			var num=$('#contact').val();
			console.log(num);

			var pw=document.getElementById('pw').value;
			var pw2=document.getElementById('pw2').value;
          
			if(pw==pw2){
				$.post('member.html','id='+id+'&pw='+pw+'&name='+name+'&contact='+contact+'&address='+address, function(data){
					  $.post('member.html','id='+id+'&pw='+pw+'&name='+name+'&contact='+contact+'&address='+address, function(data){
            	 if(data=='fail'){
            		 alert('회원가입이 정상적으로 작동하지 않았습니다.');
                     $.post('${root}Home/login.html',function(){
            			 window.location.href="${root}Home/login.html";
            		 });
           		 }else{
	                if(data==1){
	                   alert('회원가입이 완료되셨습니다!');
	                   window.history.back();
	                }
	             }
           	});
				return false;
			}else{
				$('#pw').val('');
				$('#pw2').val('');
				$('#pw').addClass("error");
				$('#pw2').attr("readonly",false); 
				$('#pw2').css({ 
					'backgroundColor': 'white', 'color': 'gray'
						});
				$('#pw').attr('placeholder', '비밀번호가 일치하지 않습니다.');
				$('#pschk').hide();
				$('.btn3').prop("disabled", true);
				$('.btn3').css({ 
					'backgroundColor': 'white', 'color': 'gray'
						});
				return false;
			}
		});
	});
   
</script>
<title>회원가입 | 비트캠프</title>
</head>
<body>
<c:url value="/" var="root"></c:url>
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
			<li><a href="${root }index.html"><img src="../imgs/logo/widelogo.jpg"/></a></li>
		</ul>
	</div>
	<div id="menu">
		<a class="first after" href="${root }Home/intro.html">학원소개</a>
		<a class="first after" href="${root }Home/regnot.html">취업교육과정</a>
		<a class="first after" href="#">고객센터</a>
		<a class="first after" href="${root }Home/login.html">로그인</a>
	</div>
	<div id="submenu">
		<ul>
			<li><a href="${root }Home/notice.html">공지사항</a></li>
			<li><a href="${root }Home/faq.html">FAQ</a></li>
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
	<div class="join">
		<div class="wow fadeInUp">
			<div class="signForm" id="content1">
				<div class="step">
					<button class="agree" disabled="disabled" style="cursor:default; border:none; margin-right: 10px">Step.1 - 약관동의</button>
					<button class="writeInfo" disabled="disabled" style="cursor:default;">Step.2 - 정보입력</button>
				</div>
				<div class="joinbox">
					<p class="bold">이용약관</p>
					<textarea class="textarea" rows="10" readonly="readonly">
제1조 (목적)
이 약관은 비트캠프 구리점이 운영하는 사이트(이하 "비트캠프"라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.    
                  
제2조 (정의)
①. 비트캠프라 함은 비트캠프가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.  
②. 이용자라 함은 "비트캠프"에 접속하여 이 약관에 따라 "비트캠프"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③. 회원이라 함은 "비트캠프"에 개인정보를 제공하여 회원등록을 한 자로서, "비트캠프"의 정보를 지속적으로 제공받으며, "비트캠프"가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
④. 비회원이라 함은 회원에 가입하지 않고 "비트캠프"가 제공하는 서비스를 이용하는 자를 말합니다.
      
제3조 (약관의 명시와 개정)
①. 비트캠프는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 비트캠프 사이버몰의 초기 서비스화면(전면)에 게시합니다.  
②. 비트캠프는 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진 등에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.  
③. 비트캠프가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.  
④. 비트캠프가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지 기간 내에 '몰"에 송신하여 "비트캠프"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.  
⑤. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다. 
                  
제4조 (서비스의 제공 및 변경)
①. 비트캠프는 다음과 같은 업무를 수행합니다.
가. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
나. 구매계약이 체결된 재화 또는 용역의 배송
다. 기타 "비트캠프"가 정하는 업무
②. 비트캠프는 재화의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화·용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화·용역의 내용 및 제공일자를 명시하여 현재의 재화·용역의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다.  
③. 비트캠프가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 "비트캠프"는 이로 인하여 이용자가 입은 손해를 배상합니다. 단, "비트캠프"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다. 다만 도서정보의 품절 및 절판의 기준을 '비트캠프'에 도서를 공급하는 유통업체, 출판사 등의 절판 및 품절이라고 명확하게 규정합니다.

제5조 (서비스의 중단)   
                  
①. 비트캠프는 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
②. 제1항에 의한 서비스 중단의 경우에는 "비트캠프"는 제8조에 정한 방법으로 이용자에게 통지합니다.
③. 비트캠프는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단 "비트캠프"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다. 
   
제6조 (회원가입)   

①. 이용자는 "비트캠프"가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.  
②. 비트캠프는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다. 
가. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "비트캠프"의 회원 재가입 승낙을 얻은 경우에는 예외로 한다.
나. 등록 내용에 허위, 기재누락, 오기가 있는 경우 
다. 기타 회원으로 등록하는 것이 "비트캠프"의 기술상 현저히 지장이 있다고 판단되는 경우
라. 만 14세 미만인 경우  
③. 회원가입계약의 성립시기는 "비트캠프"의 승낙이 회원에게 도달한 시점으로 합니다.  
④. 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "비트캠프"에 대하여 그 변경사항을 알려야 합니다.

제7조 (회원 탈퇴 및 자격 상실 등)    

①. 회원은 "비트캠프"에 언제든지 탈퇴를 요청할 수 있으며 "비트캠프"는 즉시 회원탈퇴를 처리합니다.  
②. 회원이 다음 각 호의 사유에 해당하는 경우, "비트캠프"는 회원자격을 제한 및 정지시킬 수 있습니다. 
ii. 가입 신청 시에 허위 내용을 등록한 경우 
ii. 비트캠프를 이용하여 구입한 재화·용역 등의 대금, 기타 "비트캠프" 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우 
iv. 다른 사람의 "비트캠프" 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우 
v. 비트캠프를 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우  
③. 비트캠프가 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "비트캠프"는 회원자격을 상실 시킬 수 있습니다.
④. 비트캠프가 회원자격을 상실 시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다. 

제8조 (회원에 대한 통지)   

①. 비트캠프가 회원에 대한 통지를 하는 경우, 회원이 "비트캠프"에 제출한 전자우편 주소로 할 수 있습니다. 
②. 비트캠프는 불특정다수 회원에 대한 통지의 경우 1주일이상 "비트캠프" 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 

제10조 (계약의 성립)   

①. 비트캠프는 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하지 않는 한 승낙합니다. 
가. 신청 내용에 허위, 기재누락, 오기가 있는 경우 
나. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우 
다. 기타 구매신청에 승낙하는 것이 "비트캠프" 기술상 현저히 지장이 있다고 판단하는 경우  
②. 비트캠프의 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.

제11조 (지급방법)   

비트캠프에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 하나로 할 수 있습니다. 
가. 계좌이체
나. 신용카드결제 
다. 온라인무통장입금
라. 전자화폐에 의한 결제 등

제12조 (수신확인통지·구매신청 변경 및 취소)   

①. 비트캠프는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다. 
②. 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있습니다.  
③. 비트캠프는 배송 전 이용자의 구매신청 변경 및 취소 요청이 있는 때에는 지체 없이 그 요청에 따라 처리합니다. 
                  
(부칙)
본 약관은 2020년 3월 1일부터 시행됩니다. 
               </textarea>
				<p class="bold">개인정보 수집 및 이용</p>
				<textarea class="textarea" rows="10" readonly="readonly">
[개인정보 수집 및 이용목적]
      
개인정보는 생존하는 개인에 관한 정보로서 실명, 주민등록번호 등의 사항으로 당사 회원 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다. 당사가 수집한 개인정보는 다음의 목적을 위해 활용합니다.
① 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
콘텐츠 제공, 물품배송 또는 청구서 등 발송, 금융거래 본인 인증 및 금융 서비스, 구매 및 요금 결제, 요금추심
② 회원 관리
회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인 정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달
③ 마케팅 및 광고에 활용
신규 서비스(제품) 개발 및 특화, 인구통계학적 특성에 따른 서비스 제공 및 광고게재, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계, 이벤트 등 광고성 정보 전달
(회원님의 개인정보는 광고를 의뢰한 개인이나 단체에는 제공되지 않습니다.) 

[수집하는 항목 및 수집방법]
① 최초 회원가입시 회원식별 및 최적화된 서비스 제공을 위해 아래와 같은 정보를 수집합니다.
- 필수항목: 이름, 주민등록번호, 아이디, 비밀번호, 직업, 이메일주소, 주소, 전화번호, 만14세미만인 경우 법정대리인 정보
- 선택사항: 별명, 생년월일, 결혼기념일, 관심정보설정, 휴대전화번호

② 서비스 이용과정이나 사업 처리과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.
- 서비스 이용기록, 접속로그, 쿠키, 접속IP 정보, 결제기록, 불량이용 기록

[수집방법]

당사는 다음과 같은 방법으로 개인정보를 수집합니다.
① 홈페이지를 통한 회원가입, 상담 게시판, 경품 행사응모, 배송 요청
② 제휴사로부터의 제공
③ 생성정보 수집 툴을 통한 수집

[수집한 개인정보의 보유 및 이용기간]
원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.
단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간동안 보존합니다.

① 회원탈퇴시 보존 개인정보
- 보존항목: 회원님께서 제공한 이름, 주민등록번호, 아이디, 이메일주소, 주소, 전화번호
- 보존근거: 불량 이용자의 재가입 방지, 명예훼손 등 권리침해 분쟁 및 수사협조
- 보존기간: 회원탈퇴 후 1년

② 상거래 관련 보존 개인정보의 보유 및 이용기간
- 보존항목: 상거래이력
- 보존근거: 상법, 전자상거래등에서의 소비자보호에 관한 법률
- 보존기간: 계약 또는 청약철회 등에 관한 기록 : 5년
대금결제 및 재화등의 공급에 관한 기록 : 5년
소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
	               </textarea>
					<div class="btns">
						<button class="btn1" id="agreeButton" type="button" style="margin-top:30px;">동의하기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="signForm" id="content2">
			<div class="step">
				<button class="agree" disabled="disabled" style="cursor:default; margin-right: 10px">Step.1 - 약관동의</button>
				<button class="writeInfo" disabled="disabled" style="cursor:default; border:none;">Step.2 - 정보입력</button>
			</div>
			<div class="focus"></div>
			<form action="member.html" method="post">
				<div style="text-align: center;">
					<p class="bold2">기본 정보</p>
					<div id="lineBold"></div>
					<table>
						<tbody>
							<tr>
								<th>아이디(이메일)</th>
								<td><input type="text" id="id" name="id" placeholder="아이디를 입력해주세요." value=""></td>
								<td style="width:1px;"><button class="checkId" type="button">중복체크</button></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" id="name" name="name" placeholder="이름을 입력해주세요." value="">
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" id="pw" name="pw"  placeholder="비밀번호를 입력해주세요." value="">
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" id="pw2"  placeholder="비밀번호를 한번 더 입력해주세요" value="">
								<td id="pschk"><button class="checkPw" type="button">확인 완료</button></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" id="contact" name="contact" placeholder="연락처를 입력해주세요." value="">
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" id="address" name="address"  placeholder="주소를 입력해주세요." value="">
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btns">
					<button class="btn2" type="button">뒤로가기</button>
					<button class="btn3" type="submit">가입하기</button>
				</div>
			</form>
		</div>
	</div>
	<div id="footer">
		<ul>
			<li>
				<div class="logo">
					<img src="../imgs/logo/logo.png" />   
				</div>
			</li>
			<li>
				<div class="addr">
					비트캠프 서울시 서초구 강남대로 459 (서초동, 백암빌딩) | 대표이사 : 조현정<br/>
					Copyright © 비트캠프 All rights reserved.<br/>
					<button id="loginButton" type="button" onclick="window.open('${root}LMS/lmsLogin.html', 'LMS 관리자시스템 | 비트캠프', 'width=1200, height=700, top=20, left=100, location=no, status=no, directories=no, scrollbars=yes');">관리자 로그인</button>
				</div>
			</li>
		</ul>
	</div>
</body>
</html>
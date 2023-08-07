<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>login.jsp</title>
	<script src="/js/jquery-3.7.0.min.js"></script>
	<link href="/css/login/style.css" rel="stylesheet" type="text/css">
</head>
<body>

<%@ include file="../header.jsp" %>



        <!-- 배너 -->
        <section>
            <img src="/images/Rectangle 1 (1).png" alt="이미지1">
        </section>
        <!-- 배너 끝 -->

        <!-- 로그인 폼 -->
 
            <!-- section1 -->
    <section class="section1">
      <div class="section_frame">
        <div class="section_box">
          <h2>로그인</h2>
          <form action="loginProc.do" method="post" class="login_form">
          <input type="text" placeholder="아이디를 입력해주세요." name="userid" id="userid" />
          <input type="password" placeholder="비밀번호를 입력해주세요."  name="upw" id="upw"/>
          <div class="id_box">
            <input type="checkbox"  id="remember_ID" name="remember_ID" value="save"><span>아이디 저장</span>
            <a href="findID.do">아이디 찾기</a>
            <a href="findPW.do">비밀번호 찾기</a>
          </div>
          <button type="submit" id="login" name="login" class="account" onclick="return logincheck()">로그인</button>
          </form>
          <a href="agreement.do"><button id="sign-up" name="sign-up" class="account">회원가입</button></a>
        </div>
      </div>
    </section>
    <!-- //section1 -->
        
<c:if test="${alert}">
    <script>
        alert("${error}");
    </script>
</c:if>
    
 <%@ include file="../footer.jsp" %>
 
<script>
$(".nav > ul > li ").mouseover(function(){
	$(" .nav > ul > li > .submenu").stop().fadeIn();
	$("header").css('background','white'); 
});
$(".nav > ul > li ").mouseleave(function(){
	$(" .nav > ul > li > .submenu").stop().fadeOut();
	//$("header").css('background','');
	$("header").animate({
		background: ''
	}, 400
	);
});

function logincheck() {	
	  let userid = document.getElementById("userid").value.trim();
	  if (userid === "") {
	    alert("아이디를 입력해주세요");
	    document.getElementById("userid").focus();
	    return false;
	  }
	  
	  let upw = document.getElementById("upw").value.trim();
	  if (upw === "") {
	    alert("비밀번호를 입력해주세요");
	    document.getElementById("upw").focus();
	    return false;
	  }

	  // 아이디 저장 체크박스가 체크되어 있는지 확인합니다.
	  let rememberID = document.getElementById("remember_ID").checked;

	  if (rememberID) {
	    // ID를 localStorage에 저장합니다.
	    localStorage.setItem("rememberedID", userid);
	  } else {
	    // 체크박스가 체크되어 있지 않으면 localStorage에서 저장된 ID를 제거합니다.
	    localStorage.removeItem("rememberedID");
	  }
	}
window.addEventListener("load", function () {
	  let rememberedID = localStorage.getItem("rememberedID");
	  if (rememberedID) {
	    document.getElementById("userid").value = rememberedID;
	    document.getElementById("remember_ID").checked = true;
	  }
	});

</script>
</body>
</html>
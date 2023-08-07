<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>signup.jsp</title>
    <script src="/js/jquery-3.7.0.min.js"></script>
    <link href="/css/signup/style.css" rel="stylesheet" type="text/css">
  </head>
  <body>
  
  <%@ include file="../header.jsp" %>

    <!-- section 시작 -->
    <form name='frm' method='POST' action="welcome.do" onsubmit="return signupCheck()">
    <section class="bg_body">
      <section class="frame">
        <div class="member">
          <div class="greenbar"></div>
          <div class="form_frame">
            <h2>회원가입</h2>
            <div class="form_box">
              <div class="flexbox">
                <p><span>●</span>아이디</p>
                <p><span>●</span>필수입력</p>
              </div>
              <div class="inputflexbox">
                <input type="text" name="userid" id="userid"  placeholder="아이디를 입력해주세요." />
                <button type="button" onclick="return idCheck()">중복확인</button>
                <p id="message"></p>
              </div>
            </div>
            <div class="form_box">
              <p><span>●</span>비밀번호</p>
              <input type="password" name="upw" id="upw" placeholder="비밀번호를 입력해주세요." />
            </div>
            <div class="form_box">
              <p><span>●</span>비밀번호 확인</p>
              <input type="password" name="upwcf" id="upwcf" placeholder="비밀번호를 입력해주세요." />
            </div>
            <div class="form_box">
              <p><span>●</span>이메일</p>
              <input type="email" name="uemail" id="uemail" placeholder="이메일을 입력해주세요." />
            </div>
            <div class="form_box">
              <p><span>●</span>이름</p>
              <input type="text" name="uname" id="uname" placeholder="이름을 입력해주세요." />
            </div>
            <div class="form_box">
              <p><span>●</span>전화번호</p>
              <div class="flexbox numberbox">
                <input type="number" value="010"  name="uphone1" id="uphone1" />
                <input type="number" name="uphone2" id="uphone2" />
                <input type="number" name="uphone3" id="uphone3" />
              </div>
            </div>
            <div class="form_box">
              <p><span>●</span>주민번호</p>
              <div class="flexbox idnumber">
                <input type="number" name="ujumin1" id="ujumin1" />
                <input type="number" name="ujumin2" id="ujumin2" />
              </div>
            </div>
            <div class="form_box">
              <p>성별</p>
              <div class="flexbox radiocheck">
                <input type="radio" name="ugender"  id="ugender"  value="0"/><span>남</span>
                <input type="radio" name="ugender" id="ugender"  value="1"/><span>여</span>
              </div>
            </div>
            <div class="form_box">
              <p><span>●</span>주소</p>
              <div class="inputflexbox">
                <input type="text"  name="uzcode" id="uzcode"  readonly/>
                <button type="button" onclick="execPostCode()">우편번호찾기</button>
              </div>
              <input type="text" name="uaddr1" id="uaddr1" placeholder="주소를 입력해주세요."  readonly/>
              <input type="text" name="uaddr2" id="uaddr2" placeholder="상세주소를 입력해주세요." />
            </div>
            <button type="submit">회원가입</button>
          </div>
        </div>
      </section>
    </section>
	<div id="message">
	    <c:if test="${isError}">
	        <script>
	            document.getElementById("message").innerText = "${message}";
	        </script>
	    </c:if>
	</div>
  </form>
    <!-- //section 끝 -->
    
 <%@ include file="../footer.jsp" %>
 

 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
    
    function idCheck() {
        const id = $("#userid").val();
        $.ajax({
            type: "post",
            url: "idcheck.do",
            data: {'id': id},
            success: function (data) {
                if (data === 0) {
                    $("#message").text("ID가 사용 가능합니다.");
                    $("#message").css("color", "green"); // 스타일 변경
                } else {
                    $("#message").text("입력한 ID가 이미 사용 중입니다.");
                    $("#message").css("color", "red"); // 스타일 변경
                    $("#message").css("padding-top", "15px"); // 스타일 변경
                    return false;
                }
            }
        });
    }

    function signupCheck() {
        
        let userid = document.getElementById("userid").value.trim();
        
        if (userid.length < 2){
          alert("아이디 2글자 이상 입력해주세요");
          document.getElementById("userid").focus();
          return false;
        }
        
     // 정규식을 사용하여 입력된 문자열이 한글인지 확인
        if (/^[가-힣ㄱ-ㅎㅏ-ㅣ]*$/.test(userid)) {
            alert("한글은 입력할 수 없습니다.");
            document.getElementById("userid").focus();
            return false;
        }

     
        
		// 쿠폰 발급
		let couponCode = "selad_001"; // 발급할 쿠폰 코드
		let userId = document.getElementById("userid").value.trim();
		
		$.ajax({
		    type: "post",
		    url: "/coupon/create", // 수정: 쿠폰 발급 URL 경로를 정확하게 지정해야 합니다.
		    data: { 'selad_001': selad_001, 'userId': userId },
		    success: function (data) {
		        if (data === "success") {
		            alert("쿠폰이 발급되었습니다.");
		        } else {
		            alert("쿠폰 발급에 실패했습니다.");
		        }
		    }
		});

      
        let upw = document.getElementById("upw").value.trim();
        if (upw.length < 4){
          alert("비밀번호 4글자 이상 입력해주세요");
          document.getElementById("upw").focus();
          return false;
        }

        let upwcf = document.getElementById("upwcf").value.trim();
        if (upwcf !== upw){
          alert("비밀번호가 동일하지 않습니다");
          document.getElementById("upwcf").focus();
          return false;
        }

        let uemail = document.getElementById("uemail").value.trim();
        if (uemail === ""){
          alert("이메일을 입력해주세요");
          document.getElementById("uemail").focus();
          return false;
        }

        let uname = document.getElementById("uname").value.trim();
        if (uname === ""){
          alert("이름을 입력해주세요");
          document.getElementById("uname").focus();
          return false;
        }

        let uphone1 = document.getElementById("uphone1").value.trim();
        let uphone2 = document.getElementById("uphone2").value.trim();
        let uphone3 = document.getElementById("uphone3").value.trim();
        if (uphone1 === "" || uphone2 === "" || uphone3 === ""){
          alert("전화번호를 입력해주세요");
          if (uphone1 === ""){
            document.getElementById("uphone1").focus();
          } else if (uphone2 === ""){
            document.getElementById("uphone2").focus();
          } else {
            document.getElementById("uphone3").focus();
          }
          return false;
        }

        let ujumin1 = document.getElementById("ujumin1").value.trim();
        let ujumin2 = document.getElementById("ujumin2").value.trim();
        if (ujumin1 === "" || ujumin2 === "" || ujumin1.length !==6 || ujumin2.length !==7){
          alert("주민번호를 확인해주세요.");
          if (ujumin1 === ""){
            document.getElementById("ujumin1").focus();
          } else {
            document.getElementById("ujumin2").focus();
          }
          return false;

        }

        let ugender = document.querySelector('input[name="ugender"]:checked');
        if (!ugender){
          alert("성별을 선택해주세요");
          return false;
        }

        let uzcode = document.getElementById("uzcode").value.trim();
        if (uzcode === ""){
          alert("우편번호를 입력해주세요");
          document.getElementById("uzcode").focus();
          return false;
        }

        let uaddr1 = document.getElementById("uaddr1").value.trim();
        if (uaddr1 === ""){
          alert("주소를 입력해주세요");
          document.getElementById("uaddr1").focus();
          return false;
        }

        let uaddr2 = document.getElementById("uaddr2").value.trim();
        if (uaddr2 === ""){
          alert("상세주소를 입력해주세요");
          document.getElementById("uaddr2").focus();
          return false;
        }
        
        let idChecked = false; // 중복확인 버튼을 눌렀는지 확인하기 위한 변수

        // 중복확인 버튼을 눌렀는지 확인
        if ($("#message").text() === "ID가 사용 가능합니다.") {
            idChecked = true;
        }

        // 중복확인 버튼을 누르지 않았을 때 회원가입 막기
        if (!idChecked) {
            alert("아이디 중복확인을 해주세요.");
            return false;
        }
        
        return true;
      }

    function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               $("[name=uzcode]").val(data.zonecode);
               $("[name=uaddr1]").val(fullRoadAddr);
               

           }
        }).open();
    }

    

	
     </script>
  </body>
</html>
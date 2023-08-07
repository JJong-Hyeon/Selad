<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <title>결제</title>
  	<link href="/css/pay/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/pay.js"></script>
    
</head>
<body>
   <%@ include file="../header.jsp" %>   
     <!-- banner -->
    <section class="banner">
      <p>셀레드</p>
      <h2>주문하기</h2>
      <img src="/images/주문하기.png" alt="banner" />
    </section>
    <!-- //banner 끝 -->
    <section class="section1">
      <div class="section_frame">
        <h2>배달하기</h2>
        <p>온라인 주문 후 원하는 매장에서 픽업하기/식사하기</p>
        <div class="text-left">
          <img src="/images/주문하기vactor3.png" alt="orderstep" />
          <h3>STEP 3</h3>
          <h3>주문확인</h3>
        </div>
        <div class="order_box">
          <div class="green_bar"></div>
          <div class="form_box">
            <h2>배달정보</h2>
            <form name="frm" method="POST" action="">
              <div class="single_line">
                <h3>주소</h3>
                <div class="inputflexbox">
                  <input type="text" name="uzcode" id="uzcode" />
                  <button onclick="execPostCode()">주소검색</button>
                </div>
                <input
                  type="text"
                  name="uaddr1"
                  id="uaddr1"
                  placeholder="상세주소를 입력해주세요."
                />
              </div>
              <div class="single_line">
                <h3>전화번호</h3>
                <div class="flexbox numberbox">
                  <input type="text" name="uphone1" id="uphone1"  value="010"/>
                  <input type="text" name="uphone2" id="uphone2" />
                  <input type="text" name="uphone3" id="uphone3" />
                </div>
              </div>
              <div class="single_line">
                <h3>요청사항</h3>
                <input
                  type="password"
                  name=""
                  id="upw"
                  placeholder="요청사항를 입력해주세요."
                />
              </div>
              <div class="single_line">
                <h3>쿠폰사용</h3>

                <div class="inputflexbox">
                  <select name="" id="">
                    <option value="" disabled selected>쿠폰선택하기</option>
                  </select>
                  <button>쿠폰사용</button>
                </div>
              </div>
              <div class="single_line">
                <h3>결제선택</h3>
                <select name="" id="" required>
                  <option value="">직접결제</option>
                  <option value="">카드결제</option>
                </select>
              </div>
              <div class="single_line">
                <h3>주문내역</h3>
                <div class="order_list">
                  <p>메뉴이름</p>
                  <span>메뉴내용</span>
                </div>
              </div>
              <div class="single_line">
                <h3>총결제금액</h3>
                <div class="order_list">
                  <p2>총 주문금액</p2>
                  <p3>쿠폰사용</p3>
                  <p3>배달비</p3>
                </div>
              </div>
              <div class="single_line">
                <div class="order_list">
                  <div class="inputflexbox" style="justify-content: left">
                    <input type="radio" />
                    <div class="order_notice">
                      <p>구매조건 및 결제진행 동의</p>
                      <h4>
                        주문할 메뉴와 가격, 매장정보를 명확히 확인하였으며 결제
                        진행에 동의합니다.
                      </h4>
                      <h4>제조시간은 매장상황에 따라 상이할 수 있습니다.</h4>
                      <h4>
                        주문자 정보가 서비스 제공을 위해 주문 매장에 제공되며
                      </h4>
                      <h4>홈썹 이용의 경우 라이더에게 제공됨에 동의합니다.</h4>
                      <h5>
                        주문 후 제조가 시작되면 주문을 취소할 수 없습니다.
                      </h5>
                    </div>
                  </div>
                </div>
              </div>

              <button onclick="requestPay()">결제하기</button>
            </form>
          </div>
        </div>
      </div>
    </section>

    <%@ include file="../footer.jsp" %>       
        
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="js/jquery-3.7.0.min.js"></script>
    <script>
        $(".nav > ul > li > a").mouseover(function(){
            $(" .nav > ul > li > .submenu").stop().fadeIn();
            $("header").css('background','white');
        });
        $(".nav > ul > li > a").mouseleave(function(){
            $(" .nav > ul > li > .submenu").stop().fadeOut();
            $("header").css('background','');
        });
        
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
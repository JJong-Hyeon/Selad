<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>mypage.jsp</title>
    <script src="/js/jquery-3.7.0.min.js"></script>
	<link href="/css/mypage/style.css" rel="stylesheet" type="text/css">
  </head>
  <body>
   
   <%@ include file="../header.jsp" %>
   
    <!-- section 시작 -->
    <section class="bg_body">
      <section class="frame">
        <div class="member">
          <div class="greenbar"></div>
          <div class="mypage_frame">
            <p><span><%= session.getAttribute("s_id") %></span>님 반갑습니다.</p>
            <div class="greenbox">
              <h2>회원정보</h2>
              <div class="customer_box">
                <div class="singleline">
                  <h2>이메일</h2>
                  <h3><%= session.getAttribute("s_email") %></h3>
                </div>
                <div class="singleline">
                  <h2>비밀번호</h2>
                  <h3 id="s_passwd"><%= session.getAttribute("s_passwd") %></h3>
                </div>
                <div class="singleline">
                  <h2>주소</h2>
				  <h3><%= session.getAttribute("s_zcode") %></h3>
				</div>
				<div class="singleline2">
				  <h3><%= session.getAttribute("s_addr1") %></h3>
				  <h3><%= session.getAttribute("s_addr2") %></h3>
				  </div>
                <div class="singleline">
                  <a href="#" onclick="openPasswordPopup()">회원정보수정</a>
                </div>
              </div>
            </div>

			
            <div class="greenbox">
              <h2>주문내역</h2>
              <div class="customer_box">
              <c:forEach items="${ list}" var="row">
                <div class="order_box">
            
                  <img src="/storage/${row.mpic }" />
                 
                  <div class="odr_text_box">
                    <div class="ord_singleline">
                   
					<div class="veg1">
                      <h4>메뉴 : ${row.mname } </h4>
                     <h6>${row.totpname }</h6>
                    </div>
                    
                    <div class="flex_box">
                      
                      <h7>${row.totprice }원</h7>
                      <a href="/bbsnew/reviewlist">리뷰쓰기</a>
                    </div>
                

                      
                    
                  </div>
                </div>
                
             
              </div>
              </c:forEach>
            </div>
            <!-- coupon -->
            <div class="greenbox">
              <h2>쿠폰내역</h2>
              <div class="customer_box_type2">
                <table>
                  <thead>
                    <tr>
                      <td>쿠폰명</td>
                      <td>발급기준</td>
                      <td>사용가능기간</td>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:if test="${empty couponList}">
                  	 <tr>
                  	 	<td colspan="3" style="text-align: center;">보유한 쿠폰이 없습니다</td>
                  	 	</tr>
                  	 </c:if> 
						<c:forEach items="${couponList}" var="row">
								<tr>
									<td>${row.cname}</td>
									<td>${row.csd}</td>
									<td>${row.cstr} ~ ${row.cend}</td>
								</tr>					
						</c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- //coupon end -->
            <!-- coupon -->
            <div class="greenbox">
              <h2>문의내역</h2>
              <div class="customer_box_type2">
                <table>
                  <thead>
                    <tr>
                      <td>제목</td>
                      <td>작성일</td>
                    </tr>
                  </thead>
                  <tbody>
					<c:if test="${empty qnaList}">
					  <tr>
					    <td colspan="2" style="text-align: center;">문의한 내역이 없습니다.</td>
					  </tr>
					</c:if>
					<c:forEach items="${qnaList}" var="row">
					  <tr>
					    <td>${row.qsub}</td>
					    <td>${row.qdate}</td>
					  </tr>
					</c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="btn_box">
            <a href="/bbsq/qnalist" class="goqna">문의하기</a>
            <!-- //coupon end -->
            <a href="#" onclick="openpopup()">회원탈퇴</a>
            </div>
          </div>
        </div>
        </div>
      </section>
    </section>
    
    

    <!-- //section 끝 -->
    
       <%@ include file="../footer.jsp" %>
       

       
         <script>
      $(".nav > ul > li ").mouseover(function () {
        $(" .nav > ul > li > .submenu").stop().fadeIn();
        $("header").css("background", "white");
      });
      $(".nav > ul > li ").mouseleave(function () {
        $(" .nav > ul > li > .submenu").stop().fadeOut();
        //$("header").css('background','');
        $("header").animate(
          {
            background: "",
          },
          400
        );
      });
      
      
      // 비밀번호 숨김 처리
      var password = "<%= session.getAttribute("s_passwd") %>";  // 서버에서 받아온 비밀번호
      var hiddenPassword = password.replace(/./g, "*");  // *로 숨김 처리

      // 숨김 처리한 비밀번호를 화면에 출력
      document.getElementById("s_passwd").innerText = hiddenPassword;
  
      
      // 비밀번호 입력 팝업 열기
      function openPasswordPopup() {
        var passwordInput = prompt("비밀번호를 입력하세요.");

        if (passwordInput === "<%= session.getAttribute("s_passwd") %>") {
          // 비밀번호가 일치하면 update.do 페이지로 이동
          window.location.href = "update.do";
        } else {
          alert("비밀번호가 일치하지 않습니다.");
        }
      }	
      
  
      // 비밀번호 입력 팝업 열기
      function openpopup() {
        var passwordInput = prompt("비밀번호를 입력하세요.");

        if (passwordInput === "<%= session.getAttribute("s_passwd") %>") {
          // 비밀번호가 일치하면 delete 페이지로 이동
          window.location.href = "delete";
        } else {
          alert("비밀번호가 일치하지 않습니다.");
        }
      }


  
      </script>
  </body>
</html>

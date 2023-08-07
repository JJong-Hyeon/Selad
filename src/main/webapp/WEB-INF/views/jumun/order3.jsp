<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문3</title>
    <script src="js\jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/css/jumun/order3.css">
</head>
<body>

    <!-- header 시작 -->
  <%@include file="../header.jsp" %>
    <!-- //header 끝 -->
        <!-- banner -->
    <section class="banner">
        <p>셀레드</p>
        <h2>주문하기</h2>
        <img src="/images/주문하기.png" alt="banner" />
      </section>
      <!-- //banner -->

    <section class="section1">
      <div class="section_frame">
            <p>온라인 주문 후 원하는 매장에서 픽업하기/식사하기</p>
            <img src="images/주문하기vactor2.png" alt="orderstep">
            <h3>STEP 2</h3>
            <h3>매뉴선택</h3>
      </div>
      <div class="section2">
         <div class="section_frame">
                <div class="order_box">
                    <div class="green_bar"></div>

                    

               <form id="orderfrm" name="orderfrm" action="/order4" method="post">
                  <input type="hidden" name="pcode" id="pcodes" value="${pcode}">
            <input type="hidden" name="price" value="${price}">
                          <div class="tab_cont">
                                <h2>메뉴선택</h2>
                                <!-- salad -->
                                <div id="salad">
                                    <div class="teb_content">
                                    <h2>채소선택</h2>
                                    <div class="tab_contentbox">
                                        <c:forEach items="${pd_list3 }" var="row" varStatus="vs">
                                            <div class="content">
                                                <input type="checkbox" id="pcode" name="pcode" value="${row.pcode }">
                                                <img src="storage/${row.pic }" alt="">
                                                <h2>${row.pname }</h2>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <h2>과일선택</h2>
                                    <div class="tab_contentbox">
                                        <c:forEach items="${pd_list4 }" var="row" varStatus="vs">
                                            <div class="content">
                                                <input type="checkbox" id="pcode" name="pcode" value="${row.pcode }">
                                                <img src="storage/${row.pic }" alt="" />
                                                <h2>${row.pname }</h2>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <h2>고기</h2>
                                    <div class="tab_contentbox">
                                        <c:forEach items="${pd_list5 }" var="row" varStatus="vs">
                                            <div class="content">
                                                <input type="checkbox" id="pcode" name="pcode" value="${row.pcode }">
                                                <img src="storage/${row.pic }" alt="" />
                                                <h2>${row.pname }</h2>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <h2>기타</h2>
                                    <div class="tab_contentbox">
                                        <c:forEach items="${pd_list6 }" var="row" varStatus="vs">
                                            <div class="content">
                                                <input type="checkbox" id="pcode" name="pcode" value="${row.pcode }">
                                                <img src="storage/${row.pic }" alt="" />
                                                <h2>${row.pname }</h2>
                                            </div>
                                        </c:forEach>
                                    </div>
                                  </div>
                                </div>
                            </div>
                            <!-- //salad -->

                         
                            <div class="btn_line">
                              <a href="/order2"><p>이전으로</p></a>
                              <input type="submit" value="다음으로">      
                            </div>         
                          </div>
         

               </form>
             </div>
            </div>
        </div>
   </section>
    
        
 <%@include file="../footer.jsp" %>
    
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
        
        // menu click check
        $(document).ready(function() {
      $('.content').click(function() {
        // 체크박스 선택
        var checkbox = $(this).find('input[type="checkbox"]');
        checkbox.prop('checked', !checkbox.prop('checked'));

        // 배경색 및 글자색 변경
        if (checkbox.prop('checked')) {
          $(this).css('background-color', '#29b648');
          $(this).css('color', '#fff');
        } else {
          $(this).css('background-color', '');
          $(this).css('color', '');
        }
      });
    });
        

    </script>
</body>
</html>
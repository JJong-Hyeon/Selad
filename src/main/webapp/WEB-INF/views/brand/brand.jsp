<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>brand.jsp</title>
    <script src="/js/jquery-3.7.0.min.js"></script>
    <link href="/css/brand/style.css" rel="stylesheet" type="text/css">
  </head>
  <style>
</style>
  <body>

	 <%@ include file="../header.jsp" %>
 	 
    <!-- banner -->
    <section class="banner">
      <h2>유기농 셀레드</h2>
      <img src="/images/배너이미지.png" alt="배너" />
    </section>
    <!-- //banner end -->

    <!-- section1 -->
    <section class="section1">
      <div class="section_frame">
        <h2>셀레드란?</h2>
        <div class="img_frame">
          <div class="img_l">
            <span>Select</span>
            <img src="/images/selectimg.png" alt="select" />
          </div>
          <div class="img_m">
            <h2>+</h2>
          </div>
          <div class="img_r">
            <span>Salad</span>
            <img src="/images/saladimg.png" alt="select" />
          </div>
        </div>
        <p>
          원하는 상품을 담을 수 있는
          <span class="select">셀렉트(select)</span>와
          <span class="salad">샐러드(salad)</span>에 합성어로
        </p>
        <p>sel + ad로 가게명인 셀레드가 되었습니다.</p>
      </div>
    </section>
    <!-- //section1 end -->

    <!-- section2 -->
    <section class="section2">
      <div class="section_frame2">
        <p>유기농으로 재배한 <span>신선한 재료</span></p>
        <div class="img_box">
          <img src="/images/farm1.png" alt="farm1" />
        </div>
        <div class="section2_text">
          <p>직접 기른 유기농 채소들을 통해 조금 더 영양있게 즐길 수 있도록</p>
          <p>
            커스텀 셀러드라는 다양성을 추구하는 저희 셀레드에서 다양한 채소를
            즐길 수 있도록 넓은 광야에서 전문적으로 직접 재배합니다.
          </p>
        </div>
      </div>
    </section>
    <!-- //section2 end -->

    <!-- section3 -->
    <section class="section3">
      <div class="farmimg_box">
        <h2>셀레드</h2>
        <div class="ask_box">
          <h2>하우스 방문 문의하기</h2>
          <a href="#">문의하기</a>
        </div>
      </div>
    </section>

    <!-- section4 -->
    <section class="section4">
      <div class="section_frame">
        <h2>셀레드의 약속</h2>
        <div class="probox">
          <div class="probox_l">
            <img class="l_icon" src="/images/pro_l_icon.png" alt="l_icon" />
            <h2>무농약</h2>
          </div>
          <div class="probox_m">
            <img class="m_icon" src="/images/pro_m_icon.png" alt="l_icon" />
            <h2>신선함</h2>
          </div>
          <div class="probox_r">
            <img class="r_icon" src="/images/pro_r_icon.png" alt="l_icon" />
            <h2>친환경</h2>
          </div>
        </div>
        <p>무농약 재배로 신선함과 건강함을 함께 챙겨드립니다.</p>
        <p>
          고객의 건강과 함께 조금 더 나은 지구를 위해 셀레드는 친환경에 더욱 더
          노력합니다
        </p>
      </div>
    </section>
    <!-- //section4 end -->
	
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
    </script>
  </body>
</html>

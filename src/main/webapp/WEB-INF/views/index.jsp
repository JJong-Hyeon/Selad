<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>index.jsp</title>
	<script src="js/jquery-3.7.0.min.js"></script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<link href="/css/index/style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>
<body>
 	 
<%@ include file="header.jsp" %>
    
        <!-- section1 (바디 시작) -->
        <section>
            <div class="section1">
                <div class="slide">
                    <span>Selad</span>
                    <img src="/images/Rectangle 1.png" alt="이미지1">
                </div>
            </div>
        <!-- section1 end -->

        <!-- section2 -->
            <div class="section2">
                <div class="section_frame">
                    <h2 data-aos="fade-up" data-aos-duration="1500">Selad</h2>
                    <div class="section_button">
                        <div class="sec_btn1" data-aos="fade-up" data-aos-duration="1500">
                            <a href="/places" class="btn_text">주문하기</a>
                            <img src="/images/button1.png" alt="buttin1">
                        </div>
                        <div class="sec_btn2" data-aos="fade-up" data-aos-duration="1700">
                            <a href="/how.do" class="btn_text">이용방법</a>
                            <img src="/images/button2.png" alt="buttin2">
                        </div>
                        <div class="sec_btn3" data-aos="fade-up" data-aos-duration="1900">
                            <a href="/menu.do" class="btn_text">메뉴소개</a>
                            <img src="/images/button3.png" alt="buttin3">
                        </div>
                        <div class="sec_btn4" data-aos="fade-up" data-aos-duration="2100">
                            <a href="/brand.do" class="btn_text">회사소개</a>
                            <img src="/images/button4.png" alt="buttin4">
                        </div>
                    </div>
                </div>
            </div>
    
        <!-- //section2 end -->
    
        <!-- section3 -->
            <div class="section3">
                <div class="section_frame">
                    <p style="text-align:center; font-weight:bold" data-aos="fade-in" data-aos-duration="1000">Selad&nbsp;<span>Style</span></p>
                    <div class="cont_box">
                        <div class="cont_l" data-aos="fade-right" data-aos-duration="2000">
                            <img src="/images/cont_l.png" alt="컨탠츠이미지1">
                        </div>
                        <div class="cont_r" >
                            <h2 data-aos="fade-left" data-aos-duration="2000">더 맛있는&nbsp;<span>다이어트</span></h2>
                            <p data-aos="fade-left" data-aos-duration="2200">정형적인 샐러드가 아닌</p>
                            <p data-aos="fade-left" data-aos-duration="2200">내가 원하는 스타일의 샐러드</p>
                            <p data-aos="fade-left" data-aos-duration="2100">나만의 입맛을 맞춰서 맛있게 먹는 샐러드</p>
                            <a href="/menu.do" data-aos="fade-left" data-aos-duration="2400">알아보기</a>
                        </div>
                    </div>
                    <div class="cont_box">
                        <div class="cont_r">  
                            <h2 data-aos="fade-right" data-aos-duration="2000">다양한 조합을&nbsp;<span>내 마음대로</span></h2>
                            <p data-aos="fade-right" data-aos-duration="2200">여러가지 조합을 통해서</p>
                            <p data-aos="fade-right" data-aos-duration="2200">나만의 샐러드를 만들어보세요!</p>
                            <p data-aos="fade-right" data-aos-duration="2200">항상 새롭게 더욱 더 건강하게</p>
                            <p data-aos="fade-right" data-aos-duration="2200">부족한 영양을 나만의 선택으로</p>
                            <a href="/places" data-aos="fade-right" data-aos-duration="2400">주문하기</a>
                        </div>
                        <div class="cont_l" data-aos="fade-left" data-aos-duration="3000">
                            <img src="/images/cont_r.png" alt="컨탠츠이미지2">
                        </div>
                    </div>
                </div>
            </div>
        <!-- //section3 end -->

        <!-- section4-->
            <div class="section4">
                <div class="section_frame"  style="text-align:center; font-weight: bold;">
                    <p data-aos="fade-in" data-aos-duration="2400" data-aos="fade-in" data-aos-duration="2400">Selad&nbsp;<span>Shop</span></p>
                    <div class="shop_box" data-aos="fade-up" data-aos-duration="2200">
                        <div class="cont_l">
                            <div class="shop_img_l">
                                <span>친환경적 가게</span>
                                <img src="/images/shop_l.png" alt="shop1">
                            </div>
                        </div>
                        <div class="cont_r">
                            <div class="shop_img_r">
                                <span>편안한 실내</span>
                                <img src="/images/shop_r.png" alt="shop2">
                            </div>
                        </div>
                    </div>
                    <a href="#" data-aos="fade-in" data-aos-duration="2200">가게 위치 보기</a>
                </div>
            </div>
        <!-- section4 end -->
        </section>
        <!-- //section (바디 끝)  -->
        <img src="" alt="">
    
 <%@ include file="footer.jsp" %>
 
        <script>
        AOS.init();
        
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
        
        /* mouse hover effect*/
        $(".sec_btn1").stop().mouseover(function() {
          $(this).children("a").animate({
            padding: "91px 60px",
            borderTopLeftRadius: "15px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "15px",
          }, 300);
        });
        $(".sec_btn1").stop().mouseleave(function() {
          $(this).children("a").animate({
            padding: "15px 40px",
            borderTopLeftRadius: "0px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "0px",
          }, 300);
        });

        $(".sec_btn2").stop().mouseover(function() {
          $(this).children("a").animate({
            padding: "91px 60px",
            borderTopLeftRadius: "15px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "15px",
          }, 300);
        });
        $(".sec_btn2").stop().mouseleave(function() {
          $(this).children("a").animate({
            padding: "15px 40px",
            borderTopLeftRadius: "0px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "0px",
          }, 300);
        });

        $(".sec_btn3").stop().mouseover(function() {
          $(this).children("a").animate({
            padding: "91px 60px",
            borderTopLeftRadius: "15px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "15px",
          }, 300);
        });
        $(".sec_btn3").stop().mouseleave(function() {
          $(this).children("a").animate({
            padding: "15px 40px",
            borderTopLeftRadius: "0px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "0px",
          }, 300);
        });

        $(".sec_btn4").stop().mouseover(function() {
          $(this).children("a").animate({
            padding: "91px 60px",
            borderTopLeftRadius: "15px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "15px",
          }, 300);
        });

        $(".sec_btn4").stop().mouseleave(function() {
          $(this).children("a").animate({
            padding: "15px 40px",
            borderTopLeftRadius: "0px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "0px",
          }, 300);
        });
        /* //mouse hover effect*/

        </script>


    </body>
    </html>

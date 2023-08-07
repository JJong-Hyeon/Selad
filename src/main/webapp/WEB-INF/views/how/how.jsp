<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head> 
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>how.html</title>
   <script src="/js/jquery-3.7.0.min.js"></script>
   	<link href="/css/how/style.css" rel="stylesheet" type="text/css">
  </head>
  <body>
  
 <%@ include file="../header.jsp" %>

    <!-- banner -->
    <section class="banner">
      <p>셀레드</p>
      <h2>이용방법</h2>
      <img src="images/howtobanner.png" alt="banner" />
    </section>
    <!-- //banner 끝 -->

    <!-- section1 -->
    <section class="section1">
      <div class="section_frame">
        <h2>셀레드 이용방법</h2>
        <div class="step_box_frame">
          <div class="step_box">
            <div class="step1">
              <h2>STEP.1</h2>
              <img src="images/step1img.png" alt="step1img" />
              <p>소, 중, 대</p>
              <p>원하는 사이즈</p>
              <p>그릇을 선택합니다.</p>
            </div>
            <div class="step2">
              <h2>STEP.2</h2>
              <img src="images/step2img.png" alt="step2img" />
              <p>그릇사이즈에 맞게</p>
              <p>원하는 야채와</p>
              <p>여러 토핑을 담습니다.</p>
            </div>
            <div class="step3">
              <h2>STEP.3</h2>
              <img src="images/step3img.png" alt="step3img" />
              <p>완성된 커스텀 샐러드를</p>
              <p>계산합니다.</p>
            </div>
          </div>
          <p>*그릇은 사이즈별로 기본 가격이 측정됩니다.</p>
        </div>
      </div>
      <img src="images/greenbg.png" alt="bg" />
    </section>
    <!-- //section1 end -->

    <!-- section2 -->
    <section class="section2">
      <div class="section_frame">
        <h2>샐러드 재료</h2>
        <div class="slide_box">
          <div class="slide_animate">
            <div class="content">
              <img src="images/양상추.png" alt="양상추" />
              <div class="hiddenbox">
                <p>양상추</p>
                <p>40g</p>
                <p>5.92Kcal</p>
              </div>
            </div>
            <div class="content">
              <img src="images/양배추.png" alt="양배추" />
              <div class="hiddenbox">
                <p>양배추</p>
                <p>40g</p>
                <p>13.2Kcal</p>
              </div>
            </div>
            <div class="content">
              <img src="images/양파.png" alt="양파" />
              <div class="hiddenbox">
                <p>양파</p>
                <p>30g</p>
                <p>8Kcal</p>
              </div>
            </div>
            <div class="content">
              <img src="images/피망.png" alt="피망" />
              <div class="hiddenbox">
                <p>피망</p>
                <p>40g</p>
                <p>8.04Kcal</p>
              </div>
            </div>
            <div class="content">
              <img src="images/피망.png" alt="피망" />
              <div class="hiddenbox">
                <p>피망</p>
                <p>40g</p>
                <p>8.04Kcal</p>
              </div>
            </div>
            <div class="content">
              <img src="images/피망.png" alt="피망" />
              <div class="hiddenbox">
                <p>피망</p>
                <p>40g</p>
                <p>8.04Kcal</p>
              </div>
            </div>
            <div class="content">
              <img src="images/피망.png" alt="피망" />
              <div class="hiddenbox">
                <p>피망</p>
                <p>40g</p>
                <p>8.04Kcal</p>
              </div>
            </div>
          </div>
          <button class="prev_btn"><</button>
          <button class="next_btn">></button>
        </div>
      </div>
    </section>
    <!-- //section2 end -->

    <!-- section3 -->
    <div class="section3">
      <div class="section_frame">
        <h2>셀레드 이용 Tip</h2>
        <div class="usetipbox">
          <div class="use_l">
            <img src="images/tip_l.png" alt="tip_l" />
            <h3>가게 추천 조합</h3>
            <p>가게에서 인기많은</p>
            <p>조합을 알려드려요!</p>
            <button>바로가기</button>
          </div>
          <div class="use_m">
            <img src="images/tip_m.png" alt="tip_m" />
            <h3>손님 추천 조합</h3>
            <p>좋아요를 가장 많이 받은</p>
            <p>조합을 알려드려요!</p>
            <button>바로가기</button>
          </div>
          <div class="use_r">
            <img src="images/tip_r.png" alt="tip_r" />
            <h3>랩 포케</h3>
            <p>완제품으로 만나는</p>
            <p>포만감과 즐거움</p>
            <button>바로가기</button>
          </div>
        </div>
      </div>
    </div>
    <!-- //section3 end -->

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
      

      $(".slide_animate .content").hover(
        function () {
          $(this).find(".hiddenbox").stop().fadeIn();
        },
        function () {
          $(this).find(".hiddenbox").stop().fadeOut();
        }
      );

      /*
      $(document).ready(function () {
        var slideWidth = $(".content").outerWidth(); // .content 요소의 너비

        // 슬라이드 이동 함수
        function moveSlide() {
          $(".slide_animate").animate(
            { marginLeft: -slideWidth - 62 },
            500,
            function () {
              // 슬라이드 이동 후, 첫 번째 .content를 맨 뒤로 이동
              $(this).append($(".content:first-child"));
              $(this).css("margin-left", 0);
            }
          );
        }

        // 슬라이드 자동 이동 설정
        var autoSlide = setInterval(moveSlide, 2000);

        // 마우스가 슬라이드 박스에 진입하면 자동 슬라이드 멈춤
        $(".slide_box").on("mouseenter", function () {
          clearInterval(autoSlide);
        });

        // 마우스가 슬라이드 박스를 벗어나면 자동 슬라이드 다시 시작
        $(".slide_box").on("mouseleave", function () {
          autoSlide = setInterval(moveSlide, 2000);
        });
      });
      */
      $(document).ready(function () {
        var slideWidth = $(".content").outerWidth(); // .content 요소의 너비
        var slideAnimate = $(".slide_animate"); // 슬라이드 애니메이션을 감싸는 요소
        var slideCount = $(".content").length; // 슬라이드 개수
        var currentIndex = 0; // 현재 슬라이드 인덱스

        // 슬라이드 이동 함수
        function moveSlide() {
          slideAnimate.animate(
            { marginLeft: -slideWidth - 62 },
            500,
            function () {
              // 슬라이드 이동 후, 첫 번째 .content를 맨 뒤로 이동
              slideAnimate.append($(".content:first-child"));
              slideAnimate.css("margin-left", 0);
              currentIndex = (currentIndex + 1) % slideCount; // 현재 슬라이드 인덱스 업데이트
            }
          );
        }

        // 슬라이드 자동 이동 설정
        var autoSlide = setInterval(moveSlide, 2000);

        // 마우스가 슬라이드 박스에 진입하면 자동 슬라이드 멈춤
        $(".slide_box").on("mouseenter", function () {
          clearInterval(autoSlide);
        });

        // 마우스가 슬라이드 박스를 벗어나면 자동 슬라이드 다시 시작
        $(".slide_box").on("mouseleave", function () {
          autoSlide = setInterval(moveSlide, 2000);
        });

        // 이전 버튼 클릭 시 이전 슬라이드로 이동
        $(".prev_btn").on("click", function () {
          slideAnimate.animate({ marginLeft: 0 }, 500, function () {
            // 맨 뒤에 있는 .content를 첫 번째로 이동
            slideAnimate.prepend($(".content:last-child"));
            slideAnimate.css("margin-left", -slideWidth - 62);
            currentIndex = (currentIndex - 1 + slideCount) % slideCount; // 현재 슬라이드 인덱스 업데이트
          });
        });

        // 다음 버튼 클릭 시 다음 슬라이드로 이동
        $(".next_btn").on("click", function () {
          moveSlide();
        });
      });
    </script>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매장정보</title>
   	<link href="/css/infor/style.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery-3.7.0.min.js"></script>
</head>
<body>

     <%@ include file="../header.jsp" %>

      <!-- banner -->
      <section class="banner">
        <img src="images/brandinfobanner.png" alt="banner" />
      </section>
      <!-- //banner 끝 -->

      <section class="section1">
        <div class="section_frame">
            <h2>매장정보</h2>
            <div class="imgbox">
                <img src="images/brandinfoimg.png" alt="infoimg">
                <div class="textbox">
                    <h2>쉼 휴식 리프레쉬</h2>
                    <p>자연속 휴식, 쉼터처럼 안정과 휴식을 제공합니다.</p>
                    <p>안정감과 리프래쉬 차분함을 제공하기 위해 여유로운 공간과 인테리어, 건강을 생각하는 셀레드에 식사를 즐기세요.</p>
                </div>
            </div>
            <div class="imgbox2">
                <div class="img_flex">
                    <img src="images/book.png" alt="book">
                    <img src="images/lounge.png" alt="lounge">
                </div>
                <div class="textbox">
                    <h2>여유로움</h2>
                    <p>조금 더 휴식을 즐기기 위해 간단한 식당이 아닌 여유를 즐기기 위한 커피와 음료, 독서와 라운지를 제공합니다.</p>
                </div>
            </div>
            <div class="imgbox">
                <h2>매장위치</h2>
                <img src="images/map.png" alt="infoimg">
            </div>
        </div>
      </section>

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
        </script>
</body>
</html>
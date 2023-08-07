<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>menu.jsp</title>
    <script src="/js/jquery-3.7.0.min.js"></script>
	<link href="/css/menu/style.css" rel="stylesheet" type="text/css">
  </head>
  <body>
   
   <%@ include file="../header.jsp" %>

    <!-- banner -->
    <section class="banner">
      <p>셀레드</p>
      <h2>메뉴소개</h2>
      <img src="images/menubanner.png" alt="banner" />
    </section>
    <!-- //banner 끝 -->

    <!-- section1 -->
    <section class="section1">
      <div class="section_frame">
        <h2>기본 메뉴</h2>
        <div class="step_box_frame">
          <div class="step_box">
            <div class="step1">
              <img src="images/sselad.png" alt="step1img" />
              <p>소소 셀레드</p>
            </div>
            <div class="step2">
              <img src="images/mselad.png" alt="step2img" />
              <p>중중 셀레드</p>
            </div>
            <div class="step3">
              <img src="images/lselad.png" alt="step3img" />
              <p>대대 셀레드</p>
            </div>
          </div>
        </div>
      </div>
      <img src="images/basicbanner.png" alt="bg" />
    </section>
    <!-- //section1 end -->

    <!-- section2 -->
    <section class="section2">
      <div class="section_frame">
        <h2>기본조합</h2>
        <div class="combination_box">
          <div class="combox">
            <h2>아보카도 치킨 샐러드</h2>
            <p>양파, 어린잎채소, 토마토</p>
            <p>아보카도, 올리브, 치킨</p>
            <p>올리브오일, 레드와인 식초</p>
            <img src="images/basic_combination_r.png" alt="basic_menu_l" />
          </div>
          <div class="combox">
            <h2>토마토 치즈 샐러드</h2>
            <p>루꼴라, 바질, 양상추</p>
            <p>토마토,아메리칸 치즈</p>
            <p>발사믹 드레싱</p>
            <img src="images/basic_combination_l.png" alt="basic_menu_r" />
          </div>
        </div>
      </div>
    </section>
    <!-- //section2 end -->

    <!-- section3 -->
    <section class="section3">
      <div class="section_frame">
        <div class="tab_menu">
          <ul>
            <li class="active"><a href="#">토핑</a></li>
            <li class=""><a href="#">랩/포케</a></li>
            <li class=""><a href="#">음료</a></li>
          </ul>
        </div>

        <!-- tab content -->
        <div class="tab_cont">
          <!-- topping -->
          <div id="topping">
            <div class="teb_content">
              <h2>채소</h2>
              <div class="tab_contentbox">
                <div class="content">
                  <img src="images/양상추.png" alt="양상추" />
                  <h2>양상추</h2>
                </div>
                <div class="content">
                  <img src="images/양배추.png" alt="양배추" />
                  <h2>양배추</h2>
                </div>
                <div class="content">
                  <img src="images/양파.png" alt="양파" />
                  <h2>양파</h2>
                </div>
                <div class="content">
                  <img src="images/피망.png" alt="피망" />
                  <h2>피망</h2>
                </div>
                <div class="content">
                  <img src="images/바질.png" alt="바질" />
                  <h2>바질</h2>
                </div>
                <div class="content">
                  <img src="images/적근대.png" alt="적근대" />
                  <h2>적근대</h2>
                </div>
                <div class="content">
                  <img src="images/케일.png" alt="케일" />
                  <h2>케일</h2>
                </div>
                <div class="content">
                  <img src="images/피클.png" alt="피클" />
                  <h2>피클</h2>
                </div>
                <div class="content">
                  <img src="images/오이.png" alt="오이" />
                  <h2>오이</h2>
                </div>
                <div class="content">
                  <img src="images/어린잎채소.png" alt="어린잎채소" />
                  <h2>어린잎채소</h2>
                </div>
                <div class="content">
                  <img src="images/루꼴라.png" alt="루꼴라" />
                  <h2>루꼴라</h2>
                </div>
                <div class="content">
                  <img src="images/파슬리.png" alt="파슬리" />
                  <h2>파슬리</h2>
                </div>
                <div class="content">
                  <img src="images/토마토.png" alt="토마토" />
                  <h2>토마토</h2>
                </div>
              </div>
            </div>
            <div class="teb_content">
              <h2>과일</h2>
              <div class="tab_contentbox">
                <div class="content">
                  <img src="images/키위.png" alt="키위" />
                  <h2>키위</h2>
                </div>
                <div class="content">
                  <img src="images/아보카도.png" alt="아보카도" />
                  <h2>아보카도</h2>
                </div>
                <div class="content">
                  <img src="images/바나나.png" alt="바나나" />
                  <h2>바나나</h2>
                </div>
                <div class="content">
                  <img src="images/블루베리.png" alt="블루베리" />
                  <h2>블루베리</h2>
                </div>
                <div class="content">
                  <img src="images/딸기.png" alt="딸기" />
                  <h2>딸기</h2>
                </div>
                <div class="content">
                  <img src="images/사과.png" alt="사과" />
                  <h2>사과</h2>
                </div>
                <div class="content">
                  <img
                    src="images/올리브.jpg"
                    alt="올리브"
                    style="width: 140px"
                  />
                  <h2>올리브</h2>
                </div>
              </div>
            </div>
            <div class="teb_content">
              <div class="teb_content">
                <h2>고기류</h2>
                <div class="tab_contentbox">
                  <div class="content">
                    <img src="images/연어.png" alt="연어" />
                    <h2>연어</h2>
                  </div>
                  <div class="content">
                    <img src="images/햄.png" alt="햄" />
                    <h2>햄</h2>
                  </div>
                  <div class="content">
                    <img src="images/베이컨.png" alt="베이컨" />
                    <h2>베이컨</h2>
                  </div>
                  <div class="content">
                    <img src="images/로스트치킨.png" alt="로스트치킨" />
                    <h2>로스트치킨</h2>
                  </div>
                  <div class="content">
                    <img src="images/참치.png" alt="참치" />
                    <h2>참치</h2>
                  </div>
                  <div class="content">
                    <img src="images/데리야끼치킨.png" alt="데리야끼치킨" />
                    <h2>데리야끼치킨</h2>
                  </div>
                </div>
              </div>
            </div>
            <div class="teb_content">
              <div class="teb_content">
                <h2>기타</h2>
                <div class="tab_contentbox">
                  <div class="content">
                    <img src="images/달걀.png" alt="달걀" />
                    <h2>달걀</h2>
                  </div>
                  <div class="content">
                    <img src="images/양송이버섯.png" alt="양송이버섯" />
                    <h2>양송이버섯</h2>
                  </div>
                  <div class="content">
                    <img src="images/표고버섯.png" alt="표고버섯" />
                    <h2>표고버섯</h2>
                  </div>
                </div>
              </div>
            </div>
            <div class="teb_content">
              <div class="teb_content">
                <h2>드레싱</h2>
                <div class="tab_contentbox">
                  <div class="content">
                    <img src="images/트러플마요.png" alt="트러플마요" />
                    <h2>트러플마요</h2>
                  </div>
                  <div class="content">
                    <img src="images/렌치.png" alt="렌치" />
                    <h2>렌치</h2>
                  </div>
                  <div class="content">
                    <img src="images/시저.png" alt="시저" />
                    <h2>시저</h2>
                  </div>
                  <div class="content">
                    <img src="images/요거트.png" alt="요거트" />
                    <h2>요거트</h2>
                  </div>
                  <div class="content">
                    <img src="images/허니머스타드.png" alt="허니머스타드" />
                    <h2>허니머스타드</h2>
                  </div>
                  <div class="content">
                    <img
                      src="images/홀그레인머스타드.png"
                      alt="홀그레인머스타드"
                    />
                    <h2>홀그레인머스타드</h2>
                  </div>
                  <div class="content">
                    <img src="images/올리브오일.png" alt="올리브오일" />
                    <h2>올리브오일</h2>
                  </div>
                  <div class="content">
                    <img src="images/스윗칠리.png" alt="스윗칠리" />
                    <h2>스윗칠리</h2>
                  </div>
                  <div class="content">
                    <img src="images/레드와인식초.png" alt="레드와인식초" />
                    <h2>레드와인식초</h2>
                  </div>
                  <div class="content">
                    <img src="images/오리엔탈.png" alt="오리엔탈" />
                    <h2>오리엔탈</h2>
                  </div>
                  <div class="content">
                    <img src="images/발사믹.png" alt="발사믹" />
                    <h2>발사믹</h2>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- //toppine end -->

          <!-- rap/poke -->
          <div id="rap">
            <div class="teb_content">
              <h2>랩</h2>
              <div class="tab_contentbox">
                <div class="content">
                  <img src="images/랩1.png" alt="랩1" style="width: 150px" />
                  <h2>랩1</h2>
                </div>
                <div class="content">
                  <img src="images/랩2.png" alt="랩2" style="width: 150px" />
                  <h2>랩2</h2>
                </div>
                <div class="content">
                  <img src="images/랩3.png" alt="랩3" style="width: 150px" />
                  <h2>랩3</h2>
                </div>
              </div>
            </div>
            <div class="teb_content">
              <h2>포케</h2>
              <div class="tab_contentbox">
                <div class="content">
                  <img
                    src="images/포케1.png"
                    alt="포케1"
                    style="width: 150px; height: 100px; object-fit: contain"
                  />
                  <h2>포케1</h2>
                </div>
                <div class="content">
                  <img
                    src="images/포케2.png"
                    alt="포케2"
                    style="width: 150px; height: 100px; object-fit: contain"
                  />
                  <h2>포케2</h2>
                </div>
                <div class="content">
                  <img
                    src="images/포케3.png"
                    alt="포케3"
                    style="width: 150px; height: 100px; object-fit: contain"
                  />
                  <h2>포케3</h2>
                </div>
              </div>
            </div>
          </div>
          <!-- //rap/poke -->

          <!-- drink -->
          <div id="drink">
            <div class="teb_content">
              <h2>음료</h2>
              <div class="tab_contentbox">
                <div class="content">
                  <img src="images/탄산음료.png" alt="탄산음료" />
                  <h2>탄산음료</h2>
                </div>
                <div class="content">
                  <img src="images/생과일주스.png" alt="생과일주스" />
                  <h2>생과일주스</h2>
                </div>
                <div class="content">
                  <img src="images/커피.png" alt="커피" />
                  <h2>커피</h2>
                </div>
              </div>
            </div>
          </div>
          <!-- //drink -->
        </div>
        <!-- //tab content -->
      </div>
    </section>
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

      // tab-menu
      $(document).ready(function () {
        var tabBtn = $(".tab_menu > ul > li");
        var tabCont = $(".tab_cont > div");

        tabCont.hide().eq(0).show();

        tabBtn.click(function (e) {
          e.preventDefault();
          var target = $(this);
          var index = target.index();
          tabBtn.removeClass("active");
          target.addClass("active");
          tabCont.css("display", "none");
          tabCont.eq(index).css("display", "block");
        });
      });
    </script>
  </body>
</html>

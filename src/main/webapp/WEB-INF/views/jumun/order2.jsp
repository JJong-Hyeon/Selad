<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문2</title>
	<script src="js\jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/css/jumun/order2.css">
</head>
<body>
	<!-- header 시작 -->
	<%@include file="../header.jsp"%>
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
            <img src="../images/주문하기vactor1.png" alt="orderstep">
            <h3>STEP 2</h3>
            <h3>매뉴선택</h3>
      </div>
      <div class="section2">
         <div class="section_frame">
                <div class="order_box">
                    <div class="green_bar"></div>

                    

               <form id="orderfrm" name="orderfrm" action="/order3" method="post">
                  <input type="hidden" name="price" value="${row.price}">

                        <div class="tab_menu">
                            <ul>
                              <li class="active"><a href="#">샐러드</a></li>
                              <li class=""><a href="#">랩/포케</a></li>
                              <li class=""><a href="#">음료</a></li>
                            </ul>
                          </div>
                          
                          <div class="tab_cont">
                            <h2>메뉴선택</h2>
                            <!-- salad -->
                            <div id="salad">
                                <div class="teb_content">
                                <h2>커스텀샐러드</h2>
                                <div class="tab_contentbox">
                                    <c:forEach items="${pd_list1 }" var="row" varStatus="vs">
                                        <div class="content">
                                            <input type="radio" id="pcode" name="pcode" value="${row.pcode }">
                                            <img src="storage/${row.pic }" alt="" />
                                            <h2>${row.pname }</h2>
                                        </div>
                                    </c:forEach>
                                </div>
                                <h2>기본샐러드</h2>
                                <div class="tab_contentbox">
                                    <c:forEach items="${pd_list2 }" var="row" varStatus="vs">
                                        <div class="content">
                                            <input type="radio" id="pcode" name="pcode" value="${row.pcode }">
                                            <img src="storage/${row.pic }" alt="" />
                                            <h2>${row.pname }</h2>
                                        </div>
                                    </c:forEach>
                                </div>
                                </div>
                            </div>
                            <!-- //salad -->

                            <!-- rap/poke -->
                            <div id="rap">
                                <div class="teb_content">
                                <h2>랩</h2>
                                <div class="tab_contentbox">
                                    <c:forEach items="${pd_list11 }" var="row" varStatus="vs">
                                        <div class="content">
                                            <input type="radio" id="pcode" name="pcode" value="${row.pcode }">
                                            <img src="storage/${row.pic }" alt="" />
                                            <h2>${row.pname }</h2>
                                        </div>
                                    </c:forEach>
                                </div>
                                <h2>포케</h2>
                                <div class="tab_contentbox">
                                    <c:forEach items="${pd_list12 }" var="row" varStatus="vs">
                                        <div class="content">
                                            <input type="radio" id="pcode" name="pcode" value="${row.pcode }">
                                            <img src="storage/${row.pic }" alt="" />
                                            <h2>${row.pname }</h2>
                                        </div>
                                    </c:forEach>
                                </div>
                                </div>
                            </div>
                            <!-- //rap/poke -->
                            
                            <!-- drink -->
                            <div id="drink">
                                <div class="teb_content">
                                <h2>드링크</h2>
                                <div class="tab_contentbox">
                                    <c:forEach items="${pd_list13 }" var="row" varStatus="vs">
                                        <div class="content">
                                            <input type="radio" id="pcode" name="pcode" value="${row.pcode }">
                                            <img src="storage/${row.pic }" alt="" />
                                            <h2>${row.pname }</h2>
                                        </div>
                                    </c:forEach>
                                </div>
                        
                                </div>
                            </div>
                            <!-- //drink -->
                          </div>
                          <div class="btn_line">
                            <a href="/order1"><p>이전으로</p></a>
                            <input type="submit" value="다음으로">      
                          </div>                  
                            <div class="create_btn">
                            <% if (session.getAttribute("s_grade") != null && session.getAttribute("s_grade").equals("0")) { %>
                                <a href="/create"><input type="button" value="상품등록"></a>
                                <% } %>
                            </div>

               </form>
             </div>
            </div>
        </div>
   </section>




	<%@include file="../footer.jsp"%>

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
	    //   //tab-menu end
	    // menu click check
	    $(document).ready(function() {
	  $('.content').click(function() {
	    // 라디오 버튼 선택
	    $(this).find('input[type="radio"]').prop('checked', true);

	    // 배경색 및 글자색 변경
	    $('.content').css('background-color', '');
	    $('.content').css('color', '');
	    $(this).css('background-color', '#29b648');
	    $(this).css('color', '#fff');
	  });
	});
	//menu click check end
	</script>
</body>
</html>
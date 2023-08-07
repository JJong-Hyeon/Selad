<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<script src="js\jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/css/cart/style.css">
<link rel="stylesheet" href="/css/agreement/style.css">
</head>
<body>

	

	<%@include file="../header.jsp"%>

	<section class="banner">
		<p>셀레드</p>
		<h2>장바구니</h2>
		<img src="/images/주문하기.png" alt="banner" />
	</section>
	`
	<div class="section1">
		<div class="section_frame">
			<div class="cart_box" style="margin-bottom:150px;">
				<div class="tab_menu">
					<ul>
						<li class="active"><a href="#">배달주문</a></li>
						<li class=""><a href="#">픽업주문</a></li>
					</ul>
				</div>
				<div class="tab_cont" >
					<div class="delivery">
						<div class="singleline_box">
							<div class="radio_box">
								<input type="radio" name="check-all" id="check-all"  value="" onclick="toggleAllCheck()">
								<p>전체선택</p>
							</div>
							<button type="button">선택삭제</button>
						</div>
						<div class="order_list_box">
							<h2>주문내용</h2>
							<!-- 주문내용을 출력하는 부분 이후에 다음 코드를 추가합니다. -->
							<c:set var="totalPrice" value="0" />

							<c:forEach items="${ list}" var="row">
							<c:set var="totalPrice" value="${totalPrice + row.totprice}" />
								<div class="order_cont">
									<input type="radio" value="${row.pno }" checked>
									<div class="order_cont_box">
										<div class="singleline_item_box">
											<img src="/storage/${row.mpic}" alt="">
											<div class="order_item_info">
												<h3>메뉴 : ${row.mname }</h3>
												<p>${row.totpname }</p>
												<div class="price_kcal">
													<h4>${row.totprice }원</h4>
													<h5>${row.totkcal }Kcal</h5>
												</div>
											<div >											
											</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<div class="order_list_btn">
								<!-- 최종 결제 금액 부분에 totalPrice 값을 출력합니다. -->
							<p>
								최종 결제 금액 : <span>${totalPrice}원</span>
							</p>


								<div class="btn">
									<a href="#">메뉴추가하기</a> <a href="/jumun/payment.do">결제하기</a>
								</div>

							</div>
						</div>

					</div>
					<div class="pickup">
						<div class="singleline_box">
							<div class="radio_box">
								<input type="radio" name="pno" id="pno" value="">
								<p>전체선택</p>
							</div>
							<button>선택삭제</button>
						</div>
						<div class="order_list_box">
							<h2>주문내용</h2>
							<c:set var="totalPrice" value="0" />

							<c:forEach items="${ list}" var="row">
							<c:set var="totalPrice" value="${totalPrice + row.totprice}" />
								<div class="order_cont">
									<input type="radio" value="${row.pno }">
									<div class="order_cont_box">
										<div class="singleline_item_box">
											<img src="/storage/${row.mpic}" alt="">
											<div class="order_item_info">
												<h3>메뉴 : ${row.mname }</h3>
												<p>${row.totpname }</p>
												<div class="price_kcal">
													<h4>${row.totprice }원</h4>
													<h5>${row.totkcal }Kcal</h5>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<div class="order_list_btn">
								<p>
									최종 결제 금액 :
										<span>${totalPrice}원</span>
								</p>
						
								<div class="btn">
									<a href="#">메뉴추가하기</a> <a href="jumun/payment.do">결제하기</a>
								</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>



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
		
		
		function toggleAllCheck() {
		    var checkAll = document.getElementById('check-all');
		    var checkboxes = document.querySelectorAll('input[type="radio"]:not(#check-all)');

		    checkboxes.forEach(function(radio) {
		        radio.checked = checkAll.checked;
		        radio.classList.remove('selected'); // 선택 클래스 제거
		    });
		}

		$(document).ready(function() {
		    // 라디오 버튼 클릭 이벤트 핸들러
		    $('input[type="radio"]').click(function() {
		        // 선택한 라디오 버튼
		        var radio = $(this);

		        // 라디오 버튼이 이미 선택되어 있는 경우
		        if (radio.hasClass('selected')) {
		            // 선택 해제
		            radio.prop('checked', false);
		            radio.removeClass('selected');
		        } else {
		            // 다른 라디오 버튼 선택 해제
		            $('input[type="radio"]').removeClass('selected');

		            // 선택
		            radio.addClass('selected');
		        }
		    });

		    // 전체 선택 버튼 클릭 이벤트 핸들러
		    $('#check-all').click(function() {
		        var checkAll = $(this);
		        var checkboxes = $('input[type="radio"]:not(#check-all)');

		        checkboxes.prop('checked', checkAll.prop('checked'));
		        checkboxes.removeClass('selected');

		        if (checkAll.prop('checked')) {
		            checkboxes.addClass('selected');
		        }
		    });
		});
		   

		$(document).ready(function() {
			var tabBtn = $(".tab_menu > ul > li");
			var tabCont = $(".tab_cont > div");

			tabCont.hide().eq(0).show();

			tabBtn.click(function(e) {
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<script src="js\jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/css/cart/cart.css">
</head>
<body>
 

	<!-- header 시작 -->
	<%@include file="../header.jsp"%>
	<!-- //header 끝 -->
	<section>
		<div class="section1">
			<div class="slide">
				<span1>셀레드</span1>
				<span2>장바구니</span2>
				<img src="images\주문하기.png" alt="이미지1">
			</div>
		</div>
		<div class="section2">
			<div class="section_frame">
				<div class="mapframe" style="width: 854px; margin: 0 auto;">
					<div class="section_txt">
						<div class="section_txt1">
							<p style="margin-bottom: 50px;">장바구니</p>
						</div>

					</div>
				</div>
			</div>
		</div>


		<div class="section_frame">
			<div class="frame">
				<div class="order">
					<div
						style="border: 2px solid #BBBBBB; background-color: #29B648; color: white; width: 425px; padding-top: 30px;">배달주문</div>
					<div
						style="border: 2px solid #BBBBBB; width: 425px; padding-top: 30px;">픽업주문</div>
				</div>
				<div class="section3">
					<div
						style="font-size: 25px; font-weight: bold; margin-top: 50px; display: flex; margin-left: 0;">
						<div style="display: flex;">
						
						
							<input type="radio" name="pno" id="pno" value=""
								style="width: 30px; height: 30px; margin-top: 10px;">
							<p style="margin-top: 15px; margin-left: 20px;">전체체선택</p>
						</div>
						<div
							style="border: 1px solid #FF5C00; color: #FF5C00; border-radius: 5px; width: 200px; height: 50px; margin-left: 380px;">
							<p style="margin-top: 10px;">선택삭제</p>
						</div>
					</div>

					<div
						style="text-align: left; font-weight: bold; margin-top: 100px;">
						<p style="margin-left: 55px; font-size: 25px;">주문내용</p>
					</div>
						<c:forEach items="${ list}" var="row">
					<div class="veg1"
						style="margin-top: 25px; margin-left: 20px; display: flex; height: 150px;">
						<div style="display: flex; margin-left: 30px;">
							<input type="radio" name="" id="" value="${row.pno }"
								style="width: 40px; height: 30px; margin-top: 50px;"> <img
								src="/storage/${row.mpic}" alt="" >
						</div>
						
						<div style="margin-left: 10px;">
							<p style="width: 200px; font-size: 20px; font-weight: bold;">
							메뉴	: ${row.mname }</p>
							<br>
							
							<br>
							<p style="width: 400px;">${row.totpname }</p>
							<br>
							<br>
							<!-- <p
								style="color: #FF5C00; font-weight: bold; font-size: 25px; text-align: left; margin-left: 10px;">가격(원)</p> -->

						</div>
						<div style="margin: 100px auto; color: #29B648;">${row.totkcal }Kcal
						</div>

					</div>

					<div class="order_bottom">
						
						<div style="width: 800px;">
							<p style="text-align: right; color: #FF5C00;"> 주문 금액 : ${row.totprice }원</p>
						</div>
					</div>
							

				
					<div class="section4">
						<div>
							<h3
								style="color: #111111; width: 400px; text-align: left; padding-top: 10px;">
								최종 결제 금액 : 
								<p style="color: #FF5C00; display: inline;">${row.totprice }원</p>
								
								</c:forEach>
							</h3>
							<a href="#"><p
									style="background-color: #29B648; padding-top: 10px">메뉴추가하기</p></a>
							<a href="#"><p
									style="background-color: #FF5C00; padding-top: 10px">결제하기</p></a>
						</div>
					</div>
				</div>



		<div class="section_frame">
			<div class="frame">
				<div class="order">
					<div
						style="border: 2px solid #BBBBBB; width: 425px; padding-top: 30px;">배달주문</div>
					<div
						style="border: 2px solid #BBBBBB; background-color: #29B648; color: white; width: 425px; padding-top: 30px;">픽업주문</div>
				</div>
				<div class="section3">
					<div
						style="font-size: 25px; font-weight: bold; margin-top: 50px; display: flex; margin-left: 0;">
						<div style="display: flex;">
							<input type="radio"
								style="width: 30px; height: 30px; margin-top: 10px;">
							<p style="margin-top: 15px; margin-left: 20px;">전체체선택</p>
						</div>
						<div
							style="border: 1px solid #FF5C00; color: #FF5C00; border-radius: 5px; width: 200px; height: 50px; margin-left: 380px;">
							<p style="margin-top: 10px;">선택삭제</p>
						</div>
					</div>

					<div
						style="text-align: left; font-weight: bold; margin-top: 100px;">
						<p style="margin-left: 55px; font-size: 25px;">주문내용</p>
					</div>

					<div class="veg1"
						style="margin-top: 25px; margin-left: 20px; display: flex; height: 150px;">
						<div style="display: flex; margin-left: 30px;">
							<input type="radio" name="" id=""
								style="width: 40px; height: 30px; margin-top: 50px;"> <img
								src="images\소소.png" alt="" value="p001">
						</div>
						<div style="margin-left: 10px;">
							<p style="width: 200px; font-size: 20px; font-weight: bold;">메뉴
								: {p001} 셀레드</p>
							<br>
							<br>
							<p style="width: 400px;">p_code, p_code, p_code, p_code,
								p_code, p_code</p>
							<br>
							<br>
							<p
								style="color: #FF5C00; font-weight: bold; font-size: 25px; text-align: left; margin-left: 10px;">가격(원)</p>

						</div>
						<div style="margin: 100px auto; color: #29B648;">(칼로리합)Kcal
						</div>

					</div>

					<div class="order_bottom">
						<div>
							<p>수량</p>
						</div>
						<div style="width: 615px;">
							<p style="text-align: right; color: #FF5C00;">총 주문 금액 : (가격)원</p>
						</div>
					</div>



					<div class="section4">
						<div>
							<h3
								style="color: #111111; width: 400px; text-align: left; padding-top: 10px;">
								최종 결제 금액 :
								<p style="color: #FF5C00; display: inline;">00,000원</p>
							</h3>
							<a href="/order2"><p style="background-color: #29B648; padding-top: 10px">메뉴추가하기</p></a>
							<a href="#"><p style="background-color: #FF5C00; padding-top: 10px">결제하기</p></a>
						</div>
					</div>
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
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커스텀상품등록.jsp</title>
<link href="/css/menu/style.css" rel="stylesheet" type="text/css">
<script src="/js/jquery-3.7.0.min.js"></script>
</head>
<body>
	<!-- header 시작 -->
	<%@include file="../header.jsp" %>
	<!-- //header 끝 -->

	<section>
		<div class="section1">
			<div class="slide">
				<img src="images/notice_1.png" alt="">
			</div>
		</div>
		<div class="section2">
			<div class="section_frame">
				<div class="section_txt">
					<a href="/noticelist"><p>
						<a href="/list">상품목록</a>
					</p></a> <%-- 수정: p 태그 내에 a 태그를 추가하고, a 태그 안에 p 태그를 이동하여 올바른 HTML 구조를 갖춤 --%>
				</div>
				<div class="section_table">
					<form name="bbsfrm" id="bbsfrm" method="post" action="/insert" enctype="multipart/form-data" onsubmit="return bbsCkeck()">
						<div style="margin: 0 300px;">
							<table class="table">
								<tr>
									<c:forEach items="${list}" var="row" varStatus="vs">
										<td>
											상품코드 : ${row.pcode}
											<br>
											<c:choose>
												<c:when test="${row.pic != '-'}">
													<img src="/storage/${row.pic}" width="100px">
												</c:when>
												<c:otherwise>
													등록된 사진 없음!!<br>
												</c:otherwise>
											</c:choose>
											<br>
											상품명 : <a href="detail/${row.pcode}">${row.pname}</a>
										</td>
										<!-- 테이블 한줄에 5칸씩 -->
										<c:if test="${vs.count mod 5 == 0}">
											</tr>
											<tr>
										</c:if>
									</c:forEach>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<div style="text-align: center; margin: 20px auto;">
		<input type="button" value="상품등록" onclick="location.href='/create'">
	</div>

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
	</script>
</body>
</html>

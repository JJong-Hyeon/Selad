<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<script src="/js/jquery-3.7.0.min.js"></script>

<link href="/css/review/style.css" rel="stylesheet" type="text/css">
<script>
	    function goToPage(pageNum) {
	        var url = 'reviewlist?page=' + pageNum;
	        window.location.href = url;
	    }
	    
	    function jumunHistory() {
	        var sessionId = '<%=session.getAttribute("s_id")%>';
	        if (sessionId === "null"){
	        	alert("로그인이 필요합니다! 로그인 후 이용해주세요.");
	        	return location.href="/member/login.do"
	        }
	        // Ajax 요청을 통해 주문 기록을 확인
	        $.ajax({
	            url: "/bbsnew/jumunHistory", // 컨트롤러 메서드의 매핑 주소 수정
	            type: "POST",
	            data: {userid: sessionId}, // 객체 속성 할당 수정
	            success: function(response) {
	                // 주문 기록이 없을 경우 메시지 출력
	                if (response === false) {
	                    alert("주문하신 내역이 없습니다!");
	                } else {
	                    // 주문 기록이 있을 경우 리뷰쓰기 페이지로 이동
	                    location.href = "reviewwrite";
	                }
	            }
	        });
	    }
	    
    </script>
<style>
.starRating span {
	display: inline-block;
	width: 30px;
	height: 30px;
	margin-bottom: 20px;
	background-image: url('/images/star-empty.png'); /* 비어있는 별 이미지 경로 */
	background-size: contain;
	background-repeat: no-repeat;
}

.starRating span.filled {
	margin-bottom: 20px;
	background-image: url('/images/star-filled.png'); /* 채워진 별 이미지 경로 */
	background-repeat: no-repeat;
}
</style>
</head>
<body>

	<%@ include file="../../header.jsp"%>


	<!-- banner -->
	<section class="banner">
		<img src="/images/noticebanner.png" alt="banner" />
	</section>
	<!-- //banner 끝 -->

	<!-- section1 -->
	<section class="section1">
		<div class="section_frame">
			<h2>리뷰모음</h2>
			<div class="review_frame">
				<div class="review_flex">

					<c:forEach items="${list}" var="row">
						<div class="reviewcont">
							<h2>
								<img src="/storage/${row.rfile}" width="200px" height="200px">
							</h2>
							<h2>
								<a href="/bbsnew/reviewdetail/${row.rno}">${row.rsub}</a>
							</h2>
							
							<div class="starRating">
								<c:set var="rating" value="${row.rstar}" />
								<c:forEach begin="1" end="5" varStatus="loop">
									<c:choose>
										<c:when test="${loop.index <= rating}">
											<span class="filled"></span>
										</c:when>
										<c:otherwise>
											<span></span>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<div class="text_single_line">
								<span>${row.userid}</span> <span>${row.rdate}</span>
							</div>
						</div>
					</c:forEach>
				</div><!-- review_flex end -->
			</div><!-- review_frame end -->
			<div class="pagination">
          <c:set var="currentPage" value="${page}" />
          <c:set var="startPage" value="${currentPage - 4}" />
          <c:if test="${startPage lt 1}">
            <c:set var="startPage" value="1" />
          </c:if>
          <c:set var="endPage" value="${currentPage + 4}" />
          <c:if test="${endPage gt totalPage}">
            <c:set var="endPage" value="${totalPage}" />
          </c:if>

          <a href="#" onclick="goToPage(1)"><<</a>
          <c:if test="${currentPage gt 1}">
            <a href="#" onclick="goToPage(${currentPage - 1})"><</a>
          </c:if>
          <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
            <c:choose>
              <c:when test="${pageNum eq currentPage}">
                <a href="#" class="active">${pageNum}</a>
              </c:when>
              <c:otherwise>
                <a href="#" onclick="goToPage(${pageNum})">${pageNum}</a>
              </c:otherwise>
            </c:choose>
          </c:forEach>
          <c:if test="${currentPage lt totalPage}">
            <a href="#" onclick="goToPage(${currentPage + 1})">></a>
          </c:if>
          <a href="#" onclick="goToPage(${totalPage})">>></a>
        </div>

	<form class="search_box" action="reviewsearch">
		<span>제목: </span><input type="text" name="rsub" value="${rsub}"> <input
			type="submit" value="검색">
	</form>
	<div class="button_align">
		<button type="button" onclick="jumunHistory()">리뷰쓰기</button>
	</div>
		</div><!-- section_frame end -->
	</section>

	

	<%@ include file="../../footer.jsp"%>
	
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
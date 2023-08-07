   	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
  	 <!-- header 시작 -->   
        <header>
            <div class="logo">
                <a href="/home.do"><img src="/images/logo.png" ></a>
            </div>
            <div class="nav">
                <ul class="menu_list">
                    <li><a href="/brand.do">브랜드</a>
                        <ul class="submenu">
                            <li><a href="/infor.do">매장정보</a></li>
                        </ul>
					</li>
                    <li><a href="/menu.do">메뉴소개</a></li>
                    <li><a href="https://salady.com/pdf/230503_nutrition.png" target='_blank'>영양정보</a></li>
                    <li><a href="/how.do">이용방법</a></li>
                    <li><a href="#">새소식</a>
                        <ul class="submenu">
                            <li><a href="/bbsnew/noticelist">공지사항</a></li>
                            <li><a href="/bbsnew/reviewlist">상품후기</a></li>
                        </ul>
                    </li>
                    <li><a href="/places">온라인주문</a>
                    </li>
                    <li><a href="#">고객센터</a>
                        <ul class="submenu">
                            <li><a href="/bbsq/qnalist">문의하기</a></li>
                            <li><a href="/bbsq/faqlist">FAQ</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="login">
        <c:choose>
            <c:when test="${empty sessionScope.s_id}">
                <span><a href="/member/login.do"><img src="/images/vector.png" alt=""></a></span>
                <span><a href="/member/login.do">로그인</a></span>
            </c:when>
            <c:otherwise>
            	<span><a href="/cart"><img src="/images/cart.png" style="width:20px";></a></span>
				<span><a href="/member/mypage.do"><img src="/images/vector.png" alt=""></a></span>
				<span><a href="/member/logout.do">로그아웃</a></span>
            </c:otherwise>
        </c:choose>
            </div>
        </header>
        <div class="menu_position"></div>
        <!-- //header 끝 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>list.jsp</title>
	<script src="/js/jquery-3.7.0.min.js"></script>
	<link href="/css/qna/style.css" rel="stylesheet" type="text/css">
    <script>
	    function goToPage(pageNum) {
	        var url = 'qnalist?page=' + pageNum;
	        window.location.href = url;
	    }
	    
	 // 로그인 여부 체크
		
	    function logincheck() {
	        alert("로그인이 필요합니다! 로그인 후 이용해주세요.");
	        return location.href="/member/login.do"
	      }
    </script>
</head>
<body>

	<%@ include file="../../header.jsp" %>

       <!-- banner -->
    <section class="banner">
      <img src="/images/inquirybanner.png" alt="" />
    </section>
    <!-- //banner -->

    <!-- section1 -->
    <section class="section1">
      <div class="section_frame">
        <h2>문의하기</h2>
        <table>
          <thead>
            <tr>
              <td>글번호</td>
              <td>작성자</td>
              <td>제목</td>
              <td>날짜</td>
              <td>조회수</td>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${list}" var="row">
              <tr>
                <td>${row.qno}</td>
                <td>${row.userid}</td>
                <td><a href="/bbsq/qnadetail/${row.qno}">${row.qsub}</a></td>
                <td>${row.qdate}</td>
                <td>${row.qcnt}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>

        <div class="pagination">
          <c:set var="currentPage" value="${page}" />
          <c:set var="startPage" value="${currentPage - 5}" />
          <c:if test="${startPage lt 1}">
            <c:set var="startPage" value="1" />
          </c:if>
          <c:set var="endPage" value="${currentPage + 5}" />
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

        <form class="search_box" action="qnasearch">
          <span>제목: </span><input type="text" name="qsub" value="${qsub}" />
          <input type="submit" value="검색" />
        </form>
        <div class="button_align">
          <% if (session.getAttribute("s_id") != null && !session.getAttribute("s_id").equals("null")) { %>
		  <button type="button" onclick="location.href='qnawrite'">글쓰기</button>
		  <% } else { %>
		  <button type="button" onclick="logincheck()">글쓰기</button>
		  <% } %>
          

        </div>
      </div>
    </section>
    <!-- //section1 end -->
    
    <%@ include file="../../footer.jsp" %>
    
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
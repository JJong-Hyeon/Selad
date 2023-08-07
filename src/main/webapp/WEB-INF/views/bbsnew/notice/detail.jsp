<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>detail.jsp</title>
	    <script src="/js/jquery-3.7.0.min.js"></script>
	<link href="/css/notice/detail.css" rel="stylesheet" type="text/css">
	<script>
	<!--
		function detail_update() {
			document.qnadetailfrm.action="/bbsq/qnaupdate";
			document.qnadetailfrm.submit();
		}//detail_update() end
		-->
		
		function detail_delete() {
		    
		        if (confirm("문의글을 삭제하시겠습니까?")) {
		            document.noticedetailfrm.action = "/bbsnew/noticedelete";
		            document.noticedetailfrm.submit();
		        }
		    }
		
		
	</script>
</head>
<body>

	<%@ include file="../../header.jsp" %>

	  <!-- banner -->
    <section class="banner">
      <img src="images/noticebanner.png" alt="" />
    </section>
    <!-- //banner -->

    <!-- section1 -->
    <section class="section1">
      <div class="section_frame">
        <h2>공지내용</h2>
        <form name="noticedetailfrm" id="noticedetailfrm" method="post" enctype="multipart/form-data">
          <table>
            <thead>
              <tr>
                <td>작성자</td>
                <td>${detail.userid}</td>
              </tr>
              <tr>
                <td>작성일시</td>
                <td>${detail.ndate}</td>
            </tr>
            </thead>
            <tbody>
                <tr>
                  <td>제목</td>
                  <td>${detail.nsub}</td>
                </tr>
                <tr>
                  <td>내용</td>
                  <td>
                    <c:choose>
                      <c:when test="${detail.nfile != '-'}">
                        <img src="/storage/${detail.nfile}">
                        
                      </c:when>
                      <c:otherwise>
                                  등록된 사진 없음!!<br>
                      </c:otherwise>
                    </c:choose>
                    <pre>${detail.ncon}</pre>
                  </td>
                </tr>
                <tr>
                  <td></td>
                  <td>
                  </td>
              </tr>
            </tbody>
          </table>  
          <div class="button_align">
          <input type="hidden" name="nno" value="${detail.nno}">
          <% if (session.getAttribute("s_grade") != null && session.getAttribute("s_grade").equals("0")) { %>
          <input type="button" value="글삭제" onclick="detail_delete()">
          <% } %>
          <input type="button" value="글목록" onclick="location.href='../noticelist'"> 
        </div>
      </form>
      </div>
    </section>
	
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
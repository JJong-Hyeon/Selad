<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>list.jsp</title>
    <script src="/js/jquery-3.7.0.min.js"></script>
    <link href="/css/faq/style.css" rel="stylesheet" type="text/css" />
    <script>
      function goToPage(pageNum) {
        var url = "faqlist?page=" + pageNum;
        window.location.href = url;
      }

      // div 아코디언
      document.addEventListener("DOMContentLoaded", function () {
        var accordionItems = document.querySelectorAll(".accordion-item");

        Array.from(accordionItems).forEach(function (item) {
          var head = item.querySelector(".accordion-head");
          var body = item.querySelector(".accordion-body");
          var toggleIcons = item.querySelector(".toggle-icons");

          head.addEventListener("click", function () {
            item.classList.toggle("active");
            body.style.maxHeight = item.classList.contains("active")
              ? body.scrollHeight + "px"
              : "0";
            toggleIcons.classList.toggle("rotate");
          });
        });
      });
      // div 아코디언 end
      
      
      function deleteFAQ(fno) {
        if (confirm("글을 삭제하시겠습니까?")) {
          location.href = '/bbsq/faqdelete/' + fno;
        }
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
        <h2>자주하는 질문</h2>

        <div class="accordion">
          <c:forEach items="${list}" var="row">
		  <div class="accordion-item">
		    <div class="accordion-head">
		      <span>Q.</span>
		      <span>${row.fsub}</span>
		      <span class="toggle-icons">
		        <img class="inactive-icon" src="/images/Group 116.png" alt="" />
		        <img class="active-icon" src="/images/Group 115.png" alt="" />
		      </span>
		    </div>
		    <div class="accordion-body">
		      <span>A.</span>
		      <span><pre>${row.fcon}</pre></span>
		      <div class="btn_position">
		      		<% if (session.getAttribute("s_grade") != null && session.getAttribute("s_grade").equals("0")) { %>
		      		<input type="button" value="글삭제" onclick="deleteFAQ(${row.fno})">
		    		<% } %>
		    	</div>
		    </div>
		    
		  </div>
		</c:forEach>
        </div>
        <div class="btn_position">
	        <% if (session.getAttribute("s_grade") != null && session.getAttribute("s_grade").equals("0")) { %>
		    <button type="button" onclick="location.href='faqwrite'">글쓰기</button>
		    <% } %>
	    </div>
      </div>
    </section>
    <!-- //section1 end-->
    
    
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
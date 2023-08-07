<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>write.jsp</title>
    <script src="/js/jquery-3.7.0.min.js"></script>
	<link href="/css/notice/write.css" rel="stylesheet" type="text/css">
	<script>
	    function write_formcheck() {
	        var nsub = document.forms["noticewritefrm"]["nsub"].value;
	        var ncon = document.forms["noticewritefrm"]["ncon"].value;
	        

	        if (nsub.length < 5) {
	            alert("제목은 최소 5글자 이상이어야 합니다.");
	            return false;
	        }
	        
	        if (ncon.length < 10) {
	            alert("내용은 최소 10글자 이상이어야 합니다.");
	            return false;
	        }

	        return true;
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
        <h2>공지사항</h2>

        <form
          name="noticewritefrm"
          id="noticewritefrm"
          method="post"
          action="noticeinsert"
          enctype="multipart/form-data"
          onsubmit="return write_formcheck()"
        >
          <table>
            <thead>
              <tr>
                <td>작성자</td>
                <td>
                  <input type="text" name="userid" value="<%=
                  session.getAttribute("s_id")%>" readonly>
                </td>
              </tr>
              <tr>
                <td>제목</td>
                <td><input type="text" name="nsub" /></td>
              </tr>
              <tr>
                <td>내용</td>
                <td>
                  <textarea name="ncon"></textarea>
                </td>
              </tr>
              <tr>
                <td>첨부파일</td>
                <td>
                  <input type="file" name="img" />
                </td>
              </tr>
            </thead>
          </table>
          <div class="button_align">
            <input type="submit" value="글등록" />
            <button type="button" onclick="location.href='noticelist'">
              취소
            </button>
          </div>
        </form>
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
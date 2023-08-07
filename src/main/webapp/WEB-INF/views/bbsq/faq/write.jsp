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
	<link href="/css/faq/write.css" rel="stylesheet" type="text/css">
	<script>
	    function write_formcheck() {
	        var fsub = document.forms["faqwritefrm"]["fsub"].value;
	        var fcon = document.forms["faqwritefrm"]["fcon"].value;
	        var fpw = document.forms["faqwritefrm"]["fpw"].value;
	        
	        if (fsub.length < 5) {
	            alert("제목은 최소 5글자 이상이어야 합니다.");
	            return false;
	        }
	        
	        if (fcon.length < 10) {
	            alert("내용은 최소 10글자 이상이어야 합니다.");
	            return false;
	        }
	        
	        if (fpw.length !== 4) {
	            alert("비밀번호는 정확히 4글자여야 합니다.");
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
      <img src="images/inquirybanner.png" alt="" />
    </section>
    <!-- //banner -->

    <!-- section1 -->
    <section class="section1">
      <div class="section_frame">
        <h2>FAQ작성하기</h2>
        <form
        name="faqwritefrm" id="faqwritefrm" method="post" action="faqinsert" enctype="multipart/form-data" onsubmit="return write_formcheck()"
        >
          <table>
            <thead>
              <tr>
                <td>작성자</td>
                <td>
                  <input type="text" name="userid" value="<%= session.getAttribute("s_id")%>" readonly>
                </td>
              </tr>
              <tr>
                <td>제목</td>
                <td><input type="text" name="fsub"></td>
              </tr>
              <tr>
                <td>내용</td>
                <td>
                  <textarea
                    cols="154%"
                    rows="15"
                    name="fcon"
                  ></textarea>
                </td>
              </tr>
              <tr>
                <td>비밀번호</td>
                <td><input type="number" name="fpw"></td>
              </tr>
            </thead>
            <!-- <tbody>
                        <tr>
                            <td colspan="2"><textarea name="" id="" cols="154%" rows="15"></textarea></td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td><input type="password"></td>
                        </tr>
                    </tbody> -->
          </table>
          <div class="button_align">
            <button>목록</button>
            <div class="butten_right_box">
              <button type="button" onclick="location.href='faqlist'">
                취소
              </button>
              <input type="submit" value="글쓰기" />
            </div>
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
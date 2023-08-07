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
	<link href="/css/qna/qcomm.css" rel="stylesheet" type="text/css">
	<script>
	    function qcwrite_formcheck() {
	        var userid = document.getElementById("userid").value;
	        var qccon = document.getElementById("qccon").value;
	        
	        if (userid.length < 2) {
	            alert("작성자 이름은 최소 2글자 이상이어야 합니다.");
	            return false;
	        }
	        
	        if (qccon.length < 10) {
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
      <img src="images/inquirybanner.png" alt="" />
    </section>
    <!-- //banner -->

    <!-- section1 -->
    <section class="section1">
      <div class="section_frame">
        <h2>문의하기</h2>
        <form
          name="qcwritefrm"
          id="qcwritefrm"
          method="post"
          action="qcinsert"
          enctype="multipart/form-data"
          onsubmit="return qcwrite_formcheck()"
        >
          <table>
            <thead>
              <tr>
                <td>문의번호</td>
                <td>
                  <input type="text" name="qno"
                  value="<%=request.getParameter("qno")%>" readonly>
                </td>
              </tr>
              <tr>
                <td>작성자</td>
                <td>
                  <input type="text" name="userid"
                  value="<%=session.getAttribute("s_id")%>" readonly>
                </td>
              </tr>
              <tr>
                <td>내용</td>
                <td>
                  <textarea cols="154%" rows="15" name="qcon"></textarea>
                </td>
              </tr>

            </thead>
          </table>
          <div class="button_align">
            <button>목록</button>
            <div class="butten_right_box">
              <button type="button" onclick="location.href='/bbsq/qnadetail/<%=request.getParameter("qno")%>'">
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
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
    <script src="/js/jquery-3.7.0.min.js"></script>script>
	<link href="/css/faq/style.css" rel="stylesheet" type="text/css">
	<script>
	    function fcwrite_formcheck() {
	        var fccon = document.getElementById("fccon").value;
	        

	        if (fccon.length < 10) {
	            alert("내용은 최소 10글자 이상이어야 합니다.");
	            return false;
	        }
	           
	        return true;
	    }
	</script>
</head>
<body>

	<%@ include file="../../header.jsp" %>

	<h3>자주하는 질문</h3>
	
	
	<form name="fcwritefrm" id="fcwritefrm" method="post" action="fcinsert" enctype="multipart/form-data" onsubmit="return fcwrite_formcheck()">
	    <table border="1">
	    <tr>
            <td>faq번호</td>
            <td>
            <input type="text" name="fno" value="<%=request.getParameter("fno")%>" readonly>
            </td>
        </tr>
	    <tr>
	        <td>작성자</td>
	        <td> <input type="text" name="userid" value="<%= session.getAttribute("s_id")%>" readonly> </td>
	    </tr>
	    <tr>
	        <td>내용</td>
	        <td> 
	            <textarea rows="10" cols="500" name="fcon"></textarea>     
	         </td>
	    </tr>
	    <tr>
	        <td colspan="2">
	            <input type="submit" value="글등록">
	            <button type="button" onclick="location.href='/bbsq/faqdetail/<%=request.getParameter("fno")%>'">취소</button> 
	        </td>  
	    </tr> 
	    </table>
	</form>
	
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
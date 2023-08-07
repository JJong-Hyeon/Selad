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
	<link href="/css/faq/style.css" rel="stylesheet" type="text/css">
	<script>
	<!--
		function detail_update() {
			document.qnadetailfrm.action="/bbsq/qnaupdate";
			document.qnadetailfrm.submit();
		}//detail_update() end
		-->
		
		function detail_delete() {
		    var fpwcheck = document.getElementById("faqdetailfrm").fpwcheck.value;
		    var fpw = "${detail.fpw}";
		    if(fpwcheck.length !== 4){
		        alert("비밀번호는 4자리 숫자입니다");
		        document.getElementById("faqdetailfrm").fpwcheck.focus();
		        return false;
		    }
		    if (fpwcheck == fpw) {
		        if (confirm("문의글을 삭제하시겠습니까?")) {
		            document.faqdetailfrm.action = "/bbsq/faqdelete";
		            document.faqdetailfrm.submit();
		        }
		    } else {
		        alert("비밀번호를 다시 확인해주세요.");
		    }
		}
		
		function fcomm_delete(fcno) {
		    if (confirm("답변을 삭제하시겠습니까?")) {
		        document.fcommfrm.action = "/bbsq/fcdelete?fcno=" + fcno;
		        document.fcommfrm.submit();
		    }
		}
		
	</script>
</head>
<body>

	<%@ include file="../../header.jsp" %>

	<h3>자주하는 질문</h3>
	
	<form name="faqdetailfrm" id="faqdetailfrm" method="post" enctype="multipart/form-data">
	    <table>
	    <tr>
	        <td>제목</td>
	        <td>${detail.fsub}</td>
	    </tr>
	    <tr>
	        <td>작성자</td>
	        <td>${detail.userid}</td>
	    </tr>
	    <tr>
	        <td>작성날짜</td>
	        <td>${detail.fdate}</td>
	    </tr>
	    <tr>
	         <td>내용</td>
	         <td>${detail.fcon}</td>
	    </tr>
	   
	    <tr>
	        <td>
	            <input type="hidden" name="fno" value="${detail.fno}">
	            <!--<input type="button" value="글수정" onclick="detail_update()"> --> 
	            비밀번호확인<input type="password" name="fpwcheck">
	            <input type="button" value="글삭제" onclick="detail_delete()">
	            <input type="button" value="글목록" onclick="location.href='../faqlist'"> 
	        </td>
	    </tr>    
	    </table>  
	</form>
	<hr>
	
	<!-- 문의답변 -->
	<form name="fcommfrm" id="fcommfrm" method="post">
		<c:if test="${!empty fclist}">
		    <c:forEach items="${fclist}" var="fc" varStatus="vs">
		        <c:if test="${fc.fno == detail.fno}">
		            <tr>
		                <td>답변자: ${fc.userid}</td><br>
		                <td>답변일시: ${fc.fcdate}</td><br>
		                <td>${fc.fccon}</td>
		                <% if (session.getAttribute("s_grade") != null && session.getAttribute("s_grade").equals("0")) { %>
		                <input type="button" value="답변삭제" onclick="fcomm_delete(${fc.fcno})">
		                <% } %>
		                <hr>
		            </tr>
		        </c:if>
		    </c:forEach>
		</c:if>
		<% if (session.getAttribute("s_grade") != null && session.getAttribute("s_grade").equals("0")) { %>
		<button type="button" onclick="location.href='../fcomm?fno=${detail.fno}'">답변쓰기</button>
		<% } %>
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
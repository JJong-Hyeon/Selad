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
   <link href="/css/qna/detail.css" rel="stylesheet" type="text/css">
   <script>
   <!--
      function detail_update() {
         document.qnadetailfrm.action="/bbsq/qnaupdate";
         document.qnadetailfrm.submit();
      }//detail_update() end
      -->
      
      function detail_delete() {
         var s_id = "${detail.userid}"
          var qpwcheck = document.getElementById("qnadetailfrm").qpwcheck.value;
          var qpw = "${detail.qpw}";
          
          if (s_id !== '<%= session.getAttribute("s_id") %>') {
             alert("글 삭제는 작성자만 가능합니다")
             return false;
          }
          
          if(qpwcheck.length !== 4){
              alert("비밀번호는 4자리 숫자입니다");
              document.getElementById("qnadetailfrm").qpwcheck.focus();
              return false;
          }
          
          if (qpwcheck == qpw) {
              if (confirm("문의글을 삭제하시겠습니까?")) {
                  document.qnadetailfrm.action = "/bbsq/qnadelete";
                  document.qnadetailfrm.submit();
              }
          } else {
              alert("비밀번호를 다시 확인해주세요.");
          }
          
      }
      
      function qcomm_delete(qcno) {
          if (confirm("답변을 삭제하시겠습니까?")) {
              document.qcommfrm.action = "/bbsq/qcdelete?qcno=" + qcno;
              document.qcommfrm.submit();
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
        <h2>문의내용</h2>
        <form 
        class="inquiry_form"
          name="qnadetailfrm"
          id="qnadetailfrm"
          method="post"
          enctype="multipart/form-data"
        >
          <table>
            <thead>
              <tr>
                <td>제목</td>
                <td>${detail.qsub}</td>
              </tr>
              <tr>
                <td>작성자</td>
                <td>${detail.userid}</td>
              </tr>
              <tr>
                <td>문의날짜</td>
                <td>${detail.qdate}</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td></td>
                <td><pre>${detail.qcon}</pre></td>
              </tr>
            </tbody>
          </table>
          <div class="button_align">
            <input type="hidden" name="qno" value="${detail.qno}" />
            <!--<input type="button" value="글수정" onclick="detail_update()"> -->
            <div class="flex_box_frame">
              <div class="flex_box">
              <span>비밀번호확인</span><input type="password" name="qpwcheck" />
            </div>
            <div class="flex_box">
              
              <input type="button" value="글삭제" onclick="detail_delete()" />
              
              <input
                type="button"
                value="글목록"
                onclick="location.href='../qnalist'"
              />
              </div>
          </div>
          </div>
        </form>
        <!-- 문의답변 -->
        <form class="inquiry_ansform" name="qcommfrm" id="qcommfrm" method="post">
          <table>
            <thead>
              <c:if test="${!empty qclist}">
                <c:forEach items="${qclist}" var="qc" varStatus="vs">
                    <c:if test="${qc.qno == detail.qno}">
                        <tr>
                            <td>답변자: </td>
                            <td>${qc.userid}</td>
                        </tr>
                        <tr>
                          <td>답변일시: </td>
                            <td>${qc.qcdate}</td>
                        </tr>
                        <tr>
                          <td></td>
                          <td><pre>${qc.qccon}</pre></td>
                        </tr>
  						<div class="btn_right">
                        <% if (session.getAttribute("s_grade") != null && session.getAttribute("s_grade").equals("0")) { %>
                      <input class="delete_btn" type="button" value="답변삭제" onclick="qcomm_delete(${qc.qcno})" />
                  <% } %>
                  </div>
                     </c:if>
                </c:forEach>
            </c:if>
              </thead>
              

          </table>

          <div class="heightbox"></div>
          <% if (session.getAttribute("s_grade") != null && session.getAttribute("s_grade").equals("0")) { %>
          <div class="button_align" id="remove_btn">
         <button type="button" onclick="location.href='../qcomm?qno=${detail.qno}'">답변쓰기</button>
        </div>
        <% } %>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail.jsp</title>
<script src="/js/jquery-3.7.0.min.js"></script>
<script>
// 작성자만 글 삭제하게 하기
function detail_delete() {
	var s_id = "${detail.userid}"
	
		if (s_id !== '<%= session.getAttribute("s_id") %>') {
	    	alert("글 삭제는 작성자만 가능합니다")
	    	return false;
	    }
	
    if (confirm("문의글을 삭제하시겠습니까?")) {
        document.reviewdetailfrm.action = "/bbsnew/reviewdelete";
        document.reviewdetailfrm.submit();
    }
}



//댓글추천 한번만 하게 하기
function rcrecommend(rcno, rno, rcid) {
    var rcidList = rcid.split(",");
    var sessionId = '<%= session.getAttribute("s_id") %>';

    for (var i = 0; i < rcidList.length; i++) {
        if (rcidList[i] === sessionId) {
            alert("추천은 아이디당 한 번만 가능합니다");
            return false;
        }
    }

    // 중복 체크 이후의 Ajax 요청 부분을 밖으로 이동
    $.ajax({
        url: "/bbsnew/rcrecupdate",
        type: "POST",
        data: {
            rcno: rcno,
            rno: rno,
            rcid: sessionId
        },
        success: function() {
            location.reload(); // 페이지 새로고침
        }
    })
}

//리뷰추천 한번만 하게 하기
function recommend(rno, rid) {
    var ridList = rid.split(",");
    var sessionId = '<%= session.getAttribute("s_id") %>';

    for (var i = 0; i < ridList.length; i++) {
        if (ridList[i] === sessionId) {
            alert("추천은 아이디당 한 번만 가능합니다");
            return false;
        }
    }

    // 중복 체크 이후의 Ajax 요청 부분을 밖으로 이동
    $.ajax({
        url: "/bbsnew/rrecupdate",
        type: "POST",
        data: {
            rno: rno,
            rid: sessionId
        },
        success: function() {
            location.reload(); // 페이지 새로고침
            
        }
    })
}



// 로그인 여부 체크
	
function logincheck() {
    alert("로그인이 필요합니다! 로그인 후 이용해주세요.");
  }
	
	
</script>
<link href="/css/review/detail.css" rel="stylesheet" type="text/css">
<style>
.starRating span {
	display: inline-block;
	width: 30px;
	height: 30px;
	margin-bottom: 20px;
	background-image: url('/images/star-empty.png'); /* 비어있는 별 이미지 경로 */
	background-size: contain;
	background-repeat: no-repeat;
}

.starRating span.filled {
	margin-bottom: 20px;
	background-image: url('/images/star-filled.png'); /* 채워진 별 이미지 경로 */
	background-repeat: no-repeat;
}
</style>


</head>
<body>

	<%@ include file="../../header.jsp"%>

	    
    <!-- banner -->
    <section class="banner">
      <img src="/images/noticebanner.png" alt="banner" />
    </section>
    <!-- //banner -->

    <section class="section1">
      <div class="section_frame">
        <h2>상품후기</h2>
        <div class="top_box">
         <form name="reviewdetailfrm" id="reviewdetailfrm" method="post"
         enctype="multipart/form-data">
         <table>
            <tr>
              <td>${detail.rsub}</td>
              <td>
               <div class="starRating">
                  <c:set var="rating" value="${detail.rstar}" />
                  <c:forEach begin="1" end="5" varStatus="loop">
                     <c:choose>
                       <c:when test="${loop.index <= rating}">
                         <span class="filled"></span>
                       </c:when>
                       <c:otherwise>
                         <span></span>
                       </c:otherwise>
                     </c:choose>
                  </c:forEach>
                </div>
              </td>
            </tr>
            <tr>
              <td colspan="2">${detail.rcombo}</td>
            </tr>
            <tr>
              <td colspan="2">
               <c:choose>
                  <c:when test="${detail.rfile != '-'}">
                     <img src="/storage/${detail.rfile}" >
                  </c:when>
                  <c:otherwise>
                  </c:otherwise>
                </c:choose>
               ${detail.rcon}
            </td>
            </tr>
            <tr>
              <td colspan="2">${detail.rrec}
               <div class="like_btn">
               <% if (session.getAttribute("s_id") != null && !session.getAttribute("s_id").equals("null")) { %>
                  <button type="button" onclick="recommend('${detail.rno}', '${detail.rid}')">
                     <img src="/images/chochun.png" alt="Heart" >
                  </button>
               <% } else { %>
                  <button type="button" onclick="logincheck()">
                     <img src="/images/chochun.png" alt="Heart" >
                  </button>
               <% } %>
            </div>
              </td>
            </tr>
          <tr>
              <td>작성자</td>
              <td>${detail.userid}</td>
            </tr>
            <tr>
            <td>문의날짜</td>
            <td>${detail.rdate}</td>
          </tr>
            <tr>
            <td>조회수</td>
            <td>${detail.rcnt}</td>
          </tr>
            <tr>
              <td colspan="2">
               <div class="btn_line">
               <input type="hidden" name="rno" value="${detail.rno}">
               <input type="button" value="글목록"
               onclick="location.href='../reviewlist'">
                <input type="button" value="글삭제" onclick="detail_delete()">
               </div>
               </td>
            </tr>
         </table>
       </form>
      </div>
     
       <!-- 댓글 시작 -->
         <!-- 댓글 -->
      <h2>댓글</h2>
      <div class="top_box">
       <div>
         <form name="rcinsertfrm" id="rcinsertfrm" method="post" action="/bbsnew/rcinsert">
            <div>
              <!-- 부모글번호 -->
              <input type="hidden" name="rno" id="rno" value="${detail.rno}">
              <input type="hidden" name="userid" id="userid" value="<%=session.getAttribute("s_id")%>"> 
              <h3>댓글작성</h3>
              <input type="text" name="rccon" id="rccon" placeholder="내용을 입력해 주세요">
              <div style="text-align:right;">
                <% if (session.getAttribute("s_id") != null && !session.getAttribute("s_id").equals("null")) { %>
                <button type="submit" name="submit" id="rcinsert">등록</button>
                <% } else { %>
                <button type="button" name="submit" onclick="logincheck()">등록</button>
                <% } %>
                </div>
            </div>
         </form>
       </div>
       
       <!-- 댓글목록 -->
       <form name="rcommfrm" id="rcommfrm" method="post">
          <c:if test="${!empty rclist}">
             <c:forEach items="${rclist}" var="rc" varStatus="vs">
                <c:if test="${rc.rno == detail.rno}">
                  <div class="mentbox">
                     <p>${rc.userid}</p>
                     <h3>${rc.rccon}</h3>
                     <div class="flex_box">
                     <h4>${rc.rcdate}</h4>
                     <div class="flex_btn">
                        <span><% if (session.getAttribute("s_id") != null && !session.getAttribute("s_id").equals("null")) { %>
                           <button type="button" onclick="rcrecommend('${rc.rcno}', '${rc.rno}', '${rc.rcid}')">
                              <img src="/images/choochun.png" alt="Heart" width=20px>
                           </button>
                         <% } else { %>
                           <button type="button" onclick="logincheck()">
                              <img src="/images/choochun.png" alt="Heart" width=20px>
                           </button>
                         
                         <% } %>
                           </span>
                           <span><h5 class="recommendCount">${rc.rcrec}</h5></span>
                     </div>   
                     </div>
                  </div>
                </c:if>
             </c:forEach>
          </c:if>
       </form>
      </div>



      </div>
    </section>
		


	<%@ include file="../../footer.jsp"%>
	
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
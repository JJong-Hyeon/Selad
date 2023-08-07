<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findID</title>
    <script src="/js/jquery-3.7.0.min.js"></script>
    <link href="/css/find/style.css" rel="stylesheet" type="text/css">
</head>
<body>

  <%@ include file="../header.jsp" %>
<section class="bg_body">
      <section class="frame">
        <div class="member">
          <div class="greenbar"></div>
          <div class="form_frame">
            <h2>아이디찾기</h2>
            <form class="form" action="findIDProc.do" method="post">
            <div class="form_box">
              <div class="flexbox">
                <p><span>●</span>이름</p>
              </div>
              <div class="inputflexbox">
                <input type="text" name="uname" id="uname" placeholder="이름을 입력해주세요." />
              </div>
            </div>
            <div class="form_box">
              <p><span>●</span>주민번호</p>
              <div class="flexbox idnumber">
                <input type="text" name="ujumin1" id="ujumin1" />
                <input type="text" name="ujumin2" id="ujumin2" />
              </div>
            </div>
            <button type="submit">아이디찾기</button>
            <button type="button" onclick="javascript:history.back()">취소</button>
            </form>
          </div>
        </div>
      </section>
    </section>
        
<%@ include file="../footer.jsp" %>
        
<c:if test="${isError}">
    <script>
        alert("${message}");
    </script>
</c:if>



</body>
</html>

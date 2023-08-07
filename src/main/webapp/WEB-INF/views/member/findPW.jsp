<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findPW</title>
        <script src="/js/jquery-3.7.0.min.js"></script>
    <link href="/css/find/style.css" rel="stylesheet" type="text/css">
</head>
<body>

  <%@ include file="../header.jsp" %>
  <!-- section 시작 -->
    <section class="bg_body">
      <section class="frame">
        <div class="member">
          <div class="greenbar"></div>
          <div class="form_frame">
            <h2>비밀번호찾기</h2>
            <form class="form" action="findPWProc.do" method="post">
            <div class="form_box">
              <div class="flexbox">
                <p><span>●</span>아이디</p>
              </div>
              <div class="inputflexbox">
                <input type="text" name="userid" id="userid" placeholder="아이디 입력해주세요." />
              </div>
            </div>
            <div class="form_box">
              <p><span>●</span>이메일</p>
              <input type="text" name="uemail" id="uemail" placeholder="이메일을 입력해주세요." />
            </div>
            <button type="submit">비밀번호 찾기</button>
            <button type="button" onclick="javascript:history.back()">취소</button>
            </form>
          </div>
        </div>
      </section>
    </section>
    <!-- //section 끝 -->
        
        <%@ include file="../footer.jsp" %>
        
<c:if test="${isError}">
    <script>
        alert("${message}");
    </script>
</c:if>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>아이디 조회 결과</title>
    <script src="/js/jquery-3.7.0.min.js"></script>
    <link href="/css/findresult/style.css" rel="stylesheet" type="text/css">
</head>
<body>
 <section class="bg_body">
      <section class="frame">
        <div class="member">
          <div class="greenbar"></div>
          <div class="form_frame">
            <div class="result_box">
              <h3>아이디는 "${userid}" 입니다.</h3>
            </div>
    <button onclick="location.href='login.do'">로그인하기</button>
    <button type="button" onclick="location.href='findPW.do'">비밀번호 찾기</button>
          </div>
        </div>
      </section>
    </section>
    

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>
<script src="/js/jquery-3.7.0.min.js"></script>
<link href="/css/review/write.css" rel="stylesheet" type="text/css">
<style>
    #starRating span {
        display: inline-block;
		width: 30px;
		height: 30px;
		margin-bottom: 20px;
		background-image: url('/images/star-empty.png'); /* 비어있는 별 이미지 경로 */
		background-size: contain;
		background-repeat: no-repeat;
    }

    #starRating span.hover,
    #starRating span.selected {
        margin-bottom: 20px;
		background-image: url('/images/star-filled.png'); /* 채워진 별 이미지 경로 */
		background-repeat: no-repeat;
    }
    

</style>
<script>
    function write_formcheck() {
        var nsub = document.forms["reviewwritefrm"]["rsub"].value;
        var ncon = document.forms["reviewwritefrm"]["rcon"].value;

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

    $(document).ready(function() {
        $('#starRating span').hover(
            function() {
                $(this).prevAll('span').addBack().addClass('hover');
                $(this).nextAll('span').removeClass('hover');
            },
            function() {
                $('#starRating span').removeClass('hover');
            }
        );

        $('#starRating span').click(function() {
            $(this).prevAll('span').addBack().addClass('selected');
            $(this).nextAll('span').removeClass('selected');

            var rating = $(this).index() + 1;
            $('input[name="rstar"]').val(rating);
        });
    });
</script>
</head>
<body>
<%@ include file="../../header.jsp"%>

    <!-- banner -->
    <section class="banner">
      <img src="/images/noticebanner.png" alt="banner" />
    </section>
    <!-- //banner 끝 -->



     <!-- section1 -->
    <section class="section1">
      <div class="section_frame">
        <h2>리뷰작성</h2>
        <form
          name="reviewwritefrm"
          id="reviewwritefrm"
          method="post"
          action="reviewinsert"
          enctype="multipart/form-data"
          onsubmit="return write_formcheck()"
        >
          <table>
            <thead>
              <c:if test="${not empty jumunlist}">
                <tr>
                  <td>주문번호</td>
                  <td>
                    <select name="ono">
                      <c:forEach items="${jumunlist}" var="jl" varStatus="vs">
                        <option value="${jl.ono}">${jl.ono}</option>
                      </c:forEach>
                    </select>
                  </td>
                </tr>
              </c:if>
              <tr>
                <td>상품별점</td>
                <td>
                  <div id="starRating">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                  </div>
                  <input type="hidden" name="rstar" value="0" />
                </td>
              </tr>
              <tr>
                <td>조합작성</td>
                <td>
                  <input
                    type="text"
                    name="rcombo"
                    placeholder="조합을 입력해주세요"
                  />
                </td>
              </tr>
              <tr style="border: none">
                <td colspan="2">리뷰이미지추가</td>
              </tr>
              <tr>
                <td colspan="2">
                  <input type="file" name="img" id="file" />
                </td>
              </tr>
              <tr style="border: none">
                <td colspan="2">리뷰제목</td>
              </tr>
              <tr>
                <td colspan="2">
                  <input
                    type="text"
                    name="rsub"
                    placeholder="제목을 입력해주세요"
                  />
                </td>
              </tr>
              <tr style="border: none">
                <td colspan="2">리뷰내용</td>
              </tr>
              <tr>
                <td colspan="2">
                  <textarea
                    rows="10"
                    cols="100"
                    name="rcon"
                    placeholder="내용을 입력해주세요"
                  ></textarea>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <input type="text" name="userid" value="<%=
                  session.getAttribute("s_id")%>" readonly>
                </td>
              </tr>
            </thead>
          </table>
          <div class="btn_line">
            <button type="button" onclick="location.href='reviewlist'">
              취소
            </button>
            <input type="submit" value="글등록" />
          </div>
        </form>
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
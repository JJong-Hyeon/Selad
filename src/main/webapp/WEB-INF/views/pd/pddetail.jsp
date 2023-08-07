<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커스텀상품등록.jsp</title>
<link href="/css/menu/style.css" rel="stylesheet" type="text/css">
<script src="/js\jquery-3.7.0.min.js"></script>


<script >
	function pd_update() {
		document.pdfrm.action="/update";
		document.pdfrm.submit();
	}//product_update() end
	
	function pd_delete() {
		if(confirm("첨부된 파일은 영구히 삭제됩니다.\n 진행할까요?")){
			//document.productfrm.action="/proudct/delete";
			document.pdfrm.action="/delete";
			document.pdfrm.submit();
		}//if end
	}//product_delete() end
	
	
	</script>

</head>
<body>
	<!-- header 시작 -->
	<%@include file="../header.jsp" %>
	<!-- //header 끝 -->

	<section>
		<div class="section1">
			<div class="slide">
				<img src="/images/notice_1.png" alt="">
			</div>
		</div>
		<div class="section2">
			<div class="section_frame">
				<div class="section_txt">
					<a href="/pdlist"><p>
							<a href="/list">상품목록</a>
						</p>
				</div>
				<div class="section_table">
					<!-- myscript.js에 함수 작성 -->
					<form name="pdfrm" id="pdfrm" method="post" 
						enctype="multipart/form-data" >
						<div style="margin: 0 300px;">
							<table>
								
								<tr>
									<th class="success">카테고리</th>
									<td>
									  <select name="cate" id="cate">
									    <option value="0">--상품카테고리--</option>
									    <option value="B" <c:if test="${pcode.cate eq 'B'}">selected</c:if>>그릇</option>
									    <option value="V" <c:if test="${pcode.cate eq 'V'}">selected</c:if>>채소류</option>
									    <option value="F" <c:if test="${pcode.cate eq 'F'}">selected</c:if>>과일류</option>
									    <option value="G" <c:if test="${pcode.cate eq 'G'}">selected</c:if>>고기류</option>
									    <option value="M" <c:if test="${pcode.cate eq 'M'}">selected</c:if>>생선류</option>
									    <option value="C" <c:if test="${pcode.cate eq 'C'}">selected</c:if>>치즈류</option>
									    <option value="E" <c:if test="${pcode.cate eq 'E'}">selected</c:if>>기타류</option>
									    <option value="S" <c:if test="${pcode.cate eq 'S'}">selected</c:if>>소스류</option>
									    <option value="R" <c:if test="${pcode.cate eq 'R'}">selected</c:if>>랩류</option>
									    <option value="P" <c:if test="${pcode.cate eq 'P'}">selected</c:if>>포케류</option>
									    <option value="D" <c:if test="${pcode.cate eq 'D'}">selected</c:if>>음료</option>
									     <option value="X" <c:if test="${pcode.cate eq 'D'}">selected</c:if>>추천샐러드</option>
									  </select>
									</td>


								</tr>
								<tr>
									<th class="success">상품이름</th>
									<td><input type="text" name="pname" id="pname"
										class="form-control" maxlength="100" required value="${pcode.pname }"></td>
								</tr>
								<tr>
									<th class="success">상품가격</th>
									<td><input type="text" name="price" id="price"
										class="form-control" maxlength="100" required value="${pcode.price}" ></td>
								</tr>
								<tr>
									<td>상품 이미지</td>
									<td>
									<c:if test="${pcode.pic != '-' }">
        							<img src="/storage/${pcode.pic }" width="100PX">
       								 </c:if>
       								 <br>
        							<input type="file" name="img" > 
								</td>
							
								<tr>
									<th class="success">1회 제공 중량</th>
									<td><input type="text" name="wei" id="wei"
										class="form-control" maxlength="100" required value="${pcode.wei}"></td>
								</tr>
								<tr>
									<th class="success">칼로리(kcal)</th>
									<td><input type="text" name="kcal" id="kcal"
										class="form-control" maxlength="100" required value="${pcode.kcal}"></td>
								</tr>
								
								<tr>
									<td colspan="2" align="center">
									<input type="hidden" name="pcode" value="${pcode.pcode }" >
									<input type="button" value="상품수정" onclick="pd_update()" >
									<input type="button" value="상품삭제" onclick="pd_delete()" >
								</td>
							</table>
						</div>
					</form>
	</section>

	<%@include file="../footer.jsp" %>
	
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
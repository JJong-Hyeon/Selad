<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커스텀상품등록.jsp</title>
<link href="/css/menu/style.css" rel="stylesheet" type="text/css">
<script src="js\jquery-3.7.0.min.js"></script>

</head>
<body>
	<!-- header 시작 -->
<%@include file="../header.jsp" %>
	<!-- //header 끝 -->

	<section>
		<div class="section1">
			<div class="slide">
				<img src="images/notice_1.png" alt="">
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
					<form name="bbsfrm" id="bbsfrm" method="post" action="pdinsert"
						enctype="multipart/form-data" >
						<div style="margin: 0 300px;">
							<table>
								
								<tr>
									<th class="success">카테고리</th>
									<td><select name="cate" id="cate" >
										<option value="0">--상품카테고리--</option>
                                        <option value="B">그릇</option>
                                        <option value="V">채소류</option>
                                        <option value="F">과일류</option>
                                        <option value="G">고기류</option>
                                        <option value="M">생선류</option>
                                        <option value="C">치즈류</option>
                                        <option value="E">기타류</option>
                                        <option value="S">소스류</option>
                                        <option value="R">랩류</option>
                                        <option value="P">포케류</option>
                                        <option value="D">음료</option>
                                        <option value="X">추천샐러드</option>
                                    </select>
								
									</td>
								</tr>
								<tr>
									<th class="success">상품이름</th>
									<td><input type="text" name="pname" id="pname"
										class="form-control" maxlength="100" required></td>
								</tr>
								<tr>
									<th class="success">상품가격</th>
									<td><input type="text" name="price" id="price"
										class="form-control" maxlength="100" required></td>
								</tr>
								<tr>
									<td>상품 이미지</td>
									<td><input type="file" name="img"></td>
							
								<tr>
									<th class="success">1회 제공 중량</th>
									<td><input type="text" name="wei" id="wei"
										class="form-control" maxlength="100" required></td>
								</tr>
								<tr>
									<th class="success">칼로리(kcal)</th>
									<td><input type="text" name="kcal" id="kcal"
										class="form-control" maxlength="100" required></td>
								</tr>
								
								<tr>
									<td colspan="2" align="center"><input type="submit"
										value="상품등록" class="btn btn-success"> <input
										type="reset" value="리셋" class="btn btn-danger"></td>
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
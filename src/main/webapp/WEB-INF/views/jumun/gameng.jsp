<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가맹점</title>
    <script src="js\jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="css/jumun/order1.css">
    <link rel="stylesheet" href="/css/agreement/style.css">
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=fc8381a8e078184c69d4c4085d49468f&libraries=services"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    
</head>
<body>
 <%@ include file="../header.jsp" %>
    

    <!-- banner -->
    <section class="banner">
        <p>셀레드</p>
        <h2>주문하기</h2>
        <img src="/images/주문하기.png" alt="banner" />
      </section>
      <!-- //banner -->

      <section class="section1">
		<div class="section_frame">
            <p>온라인 주문 후 원하는 매장에서 픽업하기/식사하기</p>
            <div class="text-left">
            <img src="../images/주문하기vactor1.png" alt="orderstep">
            <h3>STEP 1</h3>
            <h3>매장선택</h3>
        </div>
        <div class="order_box">
            <div class="green_bar"></div>
            <div class="map_wrap">
                <div class="map" id="map"></div>
                <div id="menu_wrap" >
                    <div class="option">
                        <div>
                            <form onsubmit="searchPlaces(); return false;">
                                <h2>매장찾기</h2>
                                <div class="por">
                                <input type="text" id="keyword"  placeholder="매장명을 입력해주세요" > 
                                <button type="submit" class="btn1" ><img src="images/icone-loupe-orange.png" class="btn_img1"></button>
                                <ul class="list_box" id="placesList">
						    	<script type="text/javascript" src="/js/gameng.js"></script>  
				   				</ul> 
                                </div>
                            </form>
                        </div>
                    </div>
       			<script>
			      
				    var placesList = [];
				    <c:forEach var="place" items="${placesList}">
				        placesList.push({
				            gacode: '${place.gacode}',
				            gname: '${place.gname}',
				            gapno: "0" + '${place.gapno}',
				            gaaddr: '${place.gaaddr}',
				            lat: ${place.lat},
				            lng: ${place.lng}
				        });
				    </c:forEach>
				  	
			   
			    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			        mapOption = { 
			            center: new kakao.maps.LatLng(placesList[0].lat, placesList[0].lng), // 지도의 중심좌표
			            level: 6 // 지도의 확대 레벨
			        };
			
			    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			    for (var i = 0; i < placesList.length; i++) {
			        (function(i) {
			            var place = placesList[i];

			            // 마커가 표시될 위치입니다 
			            var markerPosition  = new kakao.maps.LatLng(place.lat, place.lng); 

			            // 마커 이미지의 이미지 크기 입니다
			            var imageSize = new kakao.maps.Size(64, 46); 

			            // 마커 이미지를 생성합니다    
			            var markerImage = new kakao.maps.MarkerImage('https://i.ibb.co/GCFcqhp/image.png', imageSize); 

			            // 마커를 생성합니다
			            var marker = new kakao.maps.Marker({
			                position: markerPosition,
			                image: markerImage // 마커 이미지 
			            });

			            // 마커가 지도 위에 표시되도록 설정합니다
			            marker.setMap(map);

			            var infowindow = new kakao.maps.InfoWindow({
			                content: '<div style="padding:5px;">' + place.gname + '</div>'
			            });

			            // 마커에 마우스오버 이벤트와 마우스아웃 이벤트를 등록합니다
			            kakao.maps.event.addListener(marker, 'mouseover', function() {
			                // 마우스오버 되었을 때 인포윈도우를 엽니다
			                infowindow.open(map, marker);
			            });
			            kakao.maps.event.addListener(marker, 'mouseout', function() {
			                // 마우스아웃 되었을 때 인포윈도우를 닫습니다
			                infowindow.close();
			            });
			            // 클릭한 장소로 지도를 이동시키는 이벤트를 등록합니다
			            kakao.maps.event.addListener(marker, 'click', function() {
			                // 지도의 중심을 이동시킵니다
			                adjustMapPostion(places.lat, place.lng, place.gname);
			            });
			        })(i);
			    }
			    
			    var selectedStore = null;
			    
			    function adjustMapPosition(lat, lng, gname) {
			        var markerPosition = new kakao.maps.LatLng(lat, lng);
			        map.setCenter(markerPosition);

			        if (currentInfowindow) {
			            currentInfowindow.close();
			        }

			        var infowindowContent = '<div style="padding:5px;">' + gname + '</div>';
			        var infowindow = new kakao.maps.InfoWindow({
			            content: infowindowContent,
			            position: markerPosition
			        });

			        infowindow.open(map);
			        currentInfowindow = infowindow;
			        
			        selectedStore = { lat: lat, lng: lng, gname: gname };
			    }
			    
			    function submitOrderForm() {
			        if (!selectedStore) {
			            alert("가맹점을 선택해주세요.");
			            return;
			        }

			        var selectedStoreInput = document.getElementById('selectedStore');
			        selectedStoreInput.value = JSON.stringify(selectedStore);

			        var orderForm = document.getElementById('orderForm');
			        orderForm.submit();
			    }
			    
			    
			    function redirectToNextPage() {
			    	  window.location.href = "/order2"; // 여기에 다음 페이지의 URL을 입력
			    	}
			</script>

        	</div>
        	</div>
      
		</div>
  <button onclick="redirectToNextPage()" class="next_btn">주문하기</button>
        </section>
      
        
            

<%@ include file="../footer.jsp" %>
   
    <script>
    
    $(".nav > ul > li ").mouseover(function () {
      $(" .nav > ul > li > .submenu").stop().fadeIn();
      $("header").css("background", "white");
    });
    $(".nav > ul > li ").mouseleave(function () {
      $(" .nav > ul > li > .submenu").stop().fadeOut();
      //$("header").css('background','');
      $("header").animate(
        {
          background: "",
        },
        400
      );
    });
    
    
        $(".nav > ul > li > a").mouseover(function(){
            $(" .nav > ul > li > .submenu").stop().fadeIn();
            $("header").css('background','white');
        });
        $(".nav > ul > li > a").mouseleave(function(){
            $(" .nav > ul > li > .submenu").stop().fadeOut();
            $("header").css('background','');
        });
        /* mouse hover effect*/
        $(".sec_btn1").stop().mouseover(function() {
          $(this).children("a").animate({
            padding: "91px 60px",
            borderTopLeftRadius: "15px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "15px",
          }, 300);
        });
        
        
        $(".sec_btn1").stop().mouseleave(function() {
          $(this).children("a").animate({
            padding: "15px 40px",
            borderTopLeftRadius: "0px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "0px",
          }, 300);
        });

        $(".sec_btn2").stop().mouseover(function() {
          $(this).children("a").animate({
            padding: "91px 60px",
            borderTopLeftRadius: "15px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "15px",
          }, 300);
        });
        $(".sec_btn2").stop().mouseleave(function() {
          $(this).children("a").animate({
            padding: "15px 40px",
            borderTopLeftRadius: "0px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "0px",
          }, 300);
        });

        $(".sec_btn3").stop().mouseover(function() {
          $(this).children("a").animate({
            padding: "91px 60px",
            borderTopLeftRadius: "15px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "15px",
          }, 300);
        });
        $(".sec_btn3").stop().mouseleave(function() {
          $(this).children("a").animate({
            padding: "15px 40px",
            borderTopLeftRadius: "0px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "0px",
          }, 300);
        });

        $(".sec_btn4").stop().mouseover(function() {
          $(this).children("a").animate({
            padding: "91px 60px",
            borderTopLeftRadius: "15px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "15px",
          }, 300);
        });

        $(".sec_btn4").stop().mouseleave(function() {
          $(this).children("a").animate({
            padding: "15px 40px",
            borderTopLeftRadius: "0px",
            borderTopRightRadius: "15px",
            borderBottomLeftRadius: "15px",
            borderBottomRightRadius: "0px",
          }, 300);
        });
        /* //mouse hover effect*/
        
    </script>
</body>
</html>

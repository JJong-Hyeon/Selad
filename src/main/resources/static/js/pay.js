 
        var IMP = window.IMP;
        IMP.init("imp77608186"); // 예: imp00000000
        
        function requestPay() {
        // IMP.request_pay(param, callback) 결제창 호출
        
        
         // 장바구니에서 상품 정보와 사용자 정보 가져오기
	    var cartItems = getCartItems(); // 장바구니의 아이템들
	    var userInfo = getUserInfo(); // 사용자 정보
	
	    // 상품 이름들을 연결
	    var name = cartItems.map(function(item) {
	        return item.name;
	    }).join(', ');
	
	    // 주문 총액 계산
	    var amount = cartItems.reduce(function(sum, item) {
	        return sum + item.price * item.quantity;
        
         }, 0);
        
        
        
        
        
        IMP.request_pay({ // param
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: "ORD20180131-0000011",
            name: "name",
            amount: amount,
            buyer_email: " userInfo.email",
            buyer_name: "userInfo.name",
            buyer_tel: "userInfo.tel",
            buyer_addr: "userInfo.addr",
            buyer_postcode: "userInfo.postcode"
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
        }
   
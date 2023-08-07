package kr.co.selad.pay;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/jumun")
public class PayCont {

	public PayCont() {
        System.out.println("-----PayCont()객체생성됨");
    }//end
    
    
    @Autowired
    PayDAO payDao;
    
    
   
    
    @RequestMapping("/payment.do")
	public ModelAndView payment() {		
        ModelAndView mav=new ModelAndView();
        //redirect : 등록한 명령어를 호출하 수 있다
        mav.setViewName("/jumun/payment");
        return mav;
	}//home() end
    
    
    @RequestMapping("/insert")
    public ModelAndView orderInsert(@ModelAttribute PayDTO dto ) {
    	
    	ModelAndView mav=new ModelAndView();
    	
    	//1) 주문서번호 생성 하기
        //  예) 최초주문 202305231717231
        //      있으면  202305231717232 
    	
    	//오늘날짜 및 현재시각을 문자열 "년월일시분초"로 구성해서 반환하기
    	SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
    	String date = sd.format(new Date());
    	
    	String ono=payDao.ono(date); 
    	if(ono.equals("1")) {
    		ono = date + "1";
    	}else {
    		int n=Integer.parseInt(ono.substring(14))+1;
    		ono = date + n;
    	}//if end
    	
    	//System.out.println(ono);
    	
    	String userid="test"; //임시 세션 아이디
    	
    	//2) 총결제금액 구하기
    	int tot=payDao.tot(userid);
    	
    	
    	//3)dto에 주문서번호, 총결제금액 추가로 담기
    	dto.setOno(ono);
    	dto.setTot(tot);
    	
    	
    	int cnt=payDao.jumunlistInsert(dto); 
    	//System.out.println("orderlist테이블에 행 추가 결과 : " + cnt);
    	if(cnt==1) {
    		
    		//5)cart테이블에 있는 주문상품을  jumundetail테이블 옮겨 담기
    		HashMap<String, String> map=new HashMap<>();
    		map.put("ono", ono); 
    		map.put("userid", userid);
    		
    		int result=payDao.jumundetailInsert(map);
    		System.out.println("jumundetail 테이블에 행 추가 결과 : " + result);
    		
    		if(result!=0) {
    		
    		//6)cart테이블 비우기
    			payDao.cartDelete(userid);
    			
    		}//if end
    		
			//7)주문내역서 메일 보내기
    		
    		
    		mav.addObject("jumun", "<p>주문이 완료되었습니다</p>");
    		mav.setViewName("/jumun/jumunView"); // /WEB-INF/views/jumun/jumunView.jsp
    		
    	}//if end
    	
    	return mav;
    	
    }


}

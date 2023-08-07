package kr.co.selad.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.selad.pd.PdDAO;

@Controller
public class CartCont {

	public CartCont() {
		System.out.println("---CartCont() 생성");
	}

	@Autowired
	CartDAO cartdao;

	@Autowired
	PdDAO pddao;

	@RequestMapping("/cartinsert")
	public String insert(@ModelAttribute CartDTO cDto, HttpServletRequest req, HttpSession session) {

		String[] pcode = req.getParameterValues("pcode"); // int[] price
		// =Integer.parseInt(req.getParameterValues("price"));


		String pcode_str = "";
		for(int i = 0 ; i<pcode.length;i++) {
	    	if(i == pcode.length -1) {
				 pcode_str += pcode[i]; 
			  }else {
				  pcode_str += pcode[i]+",";	  
			  }
		}

		String[] tokens = pcode_str.split(",");
		String pic = pddao.pic(tokens[0]); //
		String pname = pddao.pname(tokens[0]); // 파일명 mav.addObject("totpcode",
		
		String pnames = ""; // pnames를 저장할 List 생성
	    for (int i = 0; i < tokens.length; i++) {
	        String pnameToken = pddao.pname(tokens[i]);
	        pnames += (pnameToken)+","; // pnames 리스트에 pname 추가
	    }
	    
	    
	    
	    
	    
	    List<String> kcal = new ArrayList<>(); // kcal을 저장할 List 생성
	    for (int i = 0; i < tokens.length; i++) {
	        String kcalToken = pddao.kcal(tokens[i]);
	        kcal.add(kcalToken); // kcal 리스트에 kcalToken 추가
	    }
	    double totalkcal = 0.0; // 합계를 저장할 변수 초기화

	    for (String kcalToken : kcal) {
	        if (kcalToken != null) {
	            double tokenkcal = Double.parseDouble(kcalToken); // String을 double로 변환
	            totalkcal += tokenkcal; // 합계에 더하기
	        }
	    }
  

	    List<String> price = new ArrayList<>(); // pnames를 저장할 List 생성
	    for (int i = 0; i < tokens.length; i++) {
	        String priceToken = pddao.price(tokens[i]);
	        price.add(priceToken); // pnames 리스트에 pname 추가
	    }
	    int totalPrice = 0; // 합계를 저장할 변수 초기화

	    for (String priceToken : price) {
	        if (priceToken != null) {
	            int tokenPrice = Integer.parseInt(priceToken); // String을 int로 변환
	            totalPrice += tokenPrice; // 합계에 더하기
	        }
	    }

	    // totalPrice 변수에는 price 리스트에 저장된 값들의 합이 저장됩니다.
	    
	    String s_id=(String)session.getAttribute("s_id");
	    //cDto.setUserid(s_id);
	    cDto.setUserid(s_id);
		cDto.setTotpcode(pcode_str);
		cDto.setMname(pname);
		cDto.setMpic(pic);
		cDto.setTotkcal(totalkcal);
		
		cDto.setTotpname(pnames);
		cDto.setTotprice(totalPrice);
		cartdao.insert(cDto);
		System.out.println();
		//?pcode_str=" + pcode_str
		return "redirect:/cart";
	}// list() end

	@RequestMapping("/cart")
	public ModelAndView list(@ModelAttribute CartDTO cDto, HttpServletRequest req) {
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cartlist", cartdao.list("s_id"));
		mav.addObject("list", cartdao.list("s_id"));
		
		mav.setViewName("/jumun/cart");
		return mav;
	}// list() end


	
}// class end

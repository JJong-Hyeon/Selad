package kr.co.selad.jumun;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.selad.pd.PdDAO;



@Controller
public class JumunCont {

		public JumunCont() {
			System.out.println("--JumunCont() 생성");
		}
		
		@Autowired
		JumunDAO jumundao;
		@Autowired
		PdDAO pddao;
		
		
		@RequestMapping("/order2")
		public ModelAndView list1() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("jumun/order2");
			mav.addObject("pd_list1", jumundao.list1()); //where cate='B'
			mav.addObject("pd_list2", jumundao.list2()); //where cate='X'
			mav.addObject("pd_list11", jumundao.list11()); //where cate='B'
			mav.addObject("pd_list12", jumundao.list12());
			mav.addObject("pd_list13", jumundao.list13()); //where cate='B'
		
			return mav;
		}//list() end
		
		
		@RequestMapping("/order3")
		public ModelAndView list2(HttpServletRequest req) {
			ModelAndView mav = new ModelAndView();
		  
			String pcode=req.getParameter("pcode");//order22.jsp 방금전 선택한 그릇크기
			
			//pcode와 일치하는 행을 조회해서 price값 가져오기 
			//int price = Integer.parseInt(req.getParameter("price"));
			int price=jumundao.price1(pcode);
				
			mav.setViewName("jumun/order3"); //order3.jsp
			mav.addObject("pd_list3", jumundao.list3()); //where cate='V'
			mav.addObject("pd_list4", jumundao.list4()); //where cate='F'
			mav.addObject("pd_list5", jumundao.list5()); //where cate='G'
			mav.addObject("pd_list6", jumundao.list6()); //where cate='E'
			mav.addObject("pcode", pcode);
			mav.addObject("price", price);
			//System.out.println(mav);
			return mav;
		}//list() end
		
		
		
		@RequestMapping("/order4")
		public ModelAndView list3(HttpServletRequest req) {
		    String [] pcode = req.getParameterValues("pcode");
		    //int[] price =Integer.parseInt(req.getParameterValues("price"));
		    String pcode_str = "";
		    for(int i = 0 ; i<pcode.length;i++) {
		    	if(i == pcode.length -1) {
					 pcode_str += pcode[i]; 
				  }else {
					  pcode_str += pcode[i]+",";	  
				  }
		    	
		    }
		   
		    //int price = jumundao.price2(pcode); // 수정된 부분
		    
		    ModelAndView mav = new ModelAndView();
		    mav.setViewName("jumun/order4");
		    mav.addObject("pd_list7", jumundao.list7()); // where cate='S'
		    mav.addObject("pd_list8", jumundao.list8()); // where cate='C'
		    mav.addObject("pd_list9", jumundao.list9()); // where cate='D'
		    mav.addObject("pcode_str", pcode_str);
		   // mav.addObject("price", price);
		    return mav;
		}

		
		
		
	
}//class end

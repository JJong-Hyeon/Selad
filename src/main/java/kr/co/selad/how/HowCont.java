package kr.co.selad.how;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HowCont {
	
		public HowCont() {
			System.out.println("-----HowCont() 객체 생성됨");
		}
		
		@RequestMapping("/how.do")
		public ModelAndView how() {
			ModelAndView mav=new ModelAndView();
			mav.setViewName("how/how");
			return mav;
		}
	}
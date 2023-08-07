package kr.co.selad.brand;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BrandCont {
	
		public BrandCont() {
			System.out.println("-----brandCont() 객체 생성됨");
		}
		
		@RequestMapping("/brand.do")
		public ModelAndView brand() {
			ModelAndView mav=new ModelAndView();
			mav.setViewName("brand/brand");
			return mav;
		}
		
		@RequestMapping("/infor.do")
		public ModelAndView infor() {
			ModelAndView mav=new ModelAndView();
			mav.setViewName("brand/infor");
			return mav;
		}
	}


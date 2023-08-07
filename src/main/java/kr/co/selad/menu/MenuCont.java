package kr.co.selad.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuCont {
	public MenuCont() {
		System.out.println("-----menuCont() 객체 생성됨");
	}
	
	@RequestMapping("/menu.do")
	public ModelAndView menu() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("menu/menu");
		return mav;
	}
}

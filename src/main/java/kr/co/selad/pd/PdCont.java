package kr.co.selad.pd;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PdCont {

	public PdCont() {
		System.out.println("---PdCont() 생성");
	}

	@Autowired
	PdDAO pddao;

	@RequestMapping("/create")
	public String create() {
		return "pd/create";
	}

	@RequestMapping("/pdinsert")
	public String insert(@ModelAttribute PdDTO pDto, @RequestParam MultipartFile img,
			HttpServletRequest req) {
		String pic = "-";
		
		if (img != null && !img.isEmpty()) { // 파일이 존재한다면
			pic = img.getOriginalFilename();
			
			try {

				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage"); // 실제 물리적인 경로
				img.transferTo(new File(path + "\\" + pic));// 파일 저장

			} catch (Exception e) {
				e.printStackTrace(); // System.out.println(e);
			} // try end
		} // if end

		pDto.setPic(pic);
		
		pddao.insert(pDto);
		return "redirect:/list";
	}// insert() end

	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pd/pdlist");
		mav.addObject("list", pddao.list());
		return mav;
	}//list() end
	
	@RequestMapping("detail/{pcode}")
	public ModelAndView detail(@PathVariable String pcode) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pd/pddetail");
		mav.addObject("pcode", pddao.detail(pcode));
		//System.out.println("=====" + productDAO.detail(product_code));
		return mav;
	}//detail() end
	
	
	@RequestMapping("/delete")
	public String delete(String pcode, HttpServletRequest req) {
		
		//명령어 호출되는 확인하겠습니다
		//System.out.println("!!!!!!!!!!");
		
		//삭제하고자 하는 파일명 가져오기
		String pic=pddao.pic(pcode);
		if(pic != null && !pic.equals("-")) { //파일이 존재한다면
			ServletContext application=req.getSession().getServletContext();
			String path=application.getRealPath("/storage"); //실제 물리적인 경로
			File file=new File(path + "\\" + pic);
			if(file.exists()) {
				file.delete();				
			}//if end
		}//if end
		
		pddao.delete(pcode); //테이블 행 삭제
		
		return "redirect:/list";	
		
	}//delete() end
	
	

	@RequestMapping("/update")
		public String update(@RequestParam Map<String, Object> map
							, @RequestParam MultipartFile img
							, HttpServletRequest req) {
		
		//System.out.println(map);
		//System.out.println(map.get("product_name"));
		//System.out.println(map.get("price"));
		//System.out.println(map.get("description"));
		
		//주의사항 : 파일업로드할 때 리네임 되지 않음
		//업로드된 파일은 /storage 폴더에 저장
		
		String pic="-";
		
		if(img!=null && !img.isEmpty()) { //파일이 존재한다면
			pic=img.getOriginalFilename();
			
			try {
				
				ServletContext application=req.getSession().getServletContext();
				String path=application.getRealPath("/storage"); //실제 물리적인 경로
				img.transferTo(new File(path + "\\" + pic));// 파일 저장	
				
				
			}catch (Exception e) {
				e.printStackTrace(); // System.out.println(e);
			}//try end
		}else {
			String pcode=(map.get("pcode").toString());
			Map<String, Object> pd=pddao.detail(pcode);
			pic=pd.get("pic").toString();
				
		}//if end
		
		map.put("pic", pic);
		
		//System.out.println(map);
		
		pddao.update(map);
		return "redirect:/list";		
	}//update() end
	
	
}// class end

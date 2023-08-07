package kr.co.selad.bbsq;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/bbsq")
public class BbsqCont {

	public BbsqCont() {
        System.out.println("-----BbsqCont()객체 생성됨");
    }
    
	@Autowired
	BbsqDAO bbsqDao;
	
    @RequestMapping("/qnalist")
    public ModelAndView qnalist(@RequestParam(defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("bbsq/qna/list");

        int totalCount = bbsqDao.qnacount();
        int pageSize = 10;
        int totalPage = (int) Math.ceil((double) totalCount / pageSize);

        int start = (page - 1) * pageSize;
        int end = start + pageSize - 1;

        List<Map<String, Object>> list = bbsqDao.qnalistPaging(start, end);

        mav.addObject("list", list);
        mav.addObject("totalPage", totalPage);
        mav.addObject("currentPage", page);

        return mav;
    }
	
	//예)http://localhost:9095/bbsq/qna/detail/5
	@RequestMapping("/qnadetail/{qno}")
	public ModelAndView qnadetail(@PathVariable int qno) {
		ModelAndView mav=new ModelAndView();
		
		bbsqDao.qcntupdate(qno);
		
        mav.setViewName("bbsq/qna/detail");
        mav.addObject("detail", bbsqDao.qnadetail(qno));
        List<Map<String, Object>> qclist = bbsqDao.qclist();
        mav.addObject("qclist", qclist);
        return mav;
	}//detail() end
	
	@RequestMapping("/qnadelete")
	public String qnadelete(int qno, HttpServletRequest req) {
		bbsqDao.qnadelete(qno); //테이블 행 삭제		
		return "redirect:/bbsq/qnalist";
	}//delete() end
	
//	@RequestMapping("/qnaupdate")
//    public String qnaupdate(@RequestParam Map<String, Object> map) {
//        bbsqDao.qnaupdate(map); 
//       return "redirect:/bbsq/qnalist";
//    }//update() end

	@RequestMapping("/qnawrite")
    public String qnawrite() {
        return "bbsq/qna/write";
    }//write() end
	
	@RequestMapping("/qnainsert")
    public String qnainsert(@RequestParam Map<String, Object> map) {
		bbsqDao.qnainsert(map);
    	return "redirect:/bbsq/qnalist";
    }//insert() end
	
	@RequestMapping("/qnasearch")
    public ModelAndView qnasearch(@RequestParam(defaultValue = "") String qsub) {
    	ModelAndView mav=new ModelAndView();
        mav.setViewName("bbsq/qna/list");
        mav.addObject("list", bbsqDao.qnasearch(qsub)); 
        mav.addObject("qsub",qsub);//검색어
        return mav;
    }//search() end
    
	@RequestMapping("/qcinsert")
    public String qcinsert(@RequestParam Map<String, Object> map) {
		int qno = Integer.parseInt(map.get("qno").toString());
		bbsqDao.qcinsert(map);
    	return "redirect:/bbsq/qnadetail/" + qno;
    }//insert() end
	
	@RequestMapping("/qcdelete")
	public String qcdelete(@RequestParam("qcno") int qcno, HttpServletRequest req) {
	    bbsqDao.qcdelete(qcno); // 테이블 행 삭제
	    return "redirect:/bbsq/qnalist";
	}
	
	@RequestMapping("/qcomm")
    public String qcomm() {
        return "bbsq/qna/qcomm";
    }//write() end
	
	
//		faq & f_comm 시작
	
	@RequestMapping("/faqlist")
    public ModelAndView faqlist(@RequestParam(defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("bbsq/faq/list");

        int totalCount = bbsqDao.faqcount();
        int pageSize = 10;
        int totalPage = (int) Math.ceil((double) totalCount / pageSize);

        int start = (page - 1) * pageSize;
        int end = start + pageSize - 1;

        List<Map<String, Object>> list = bbsqDao.faqlistPaging(start, end);

        mav.addObject("list", list);
        mav.addObject("totalPage", totalPage);
        mav.addObject("currentPage", page);

        return mav;
    }
	
	@RequestMapping("/faqdetail/{fno}")
	public ModelAndView faqdetail(@PathVariable int fno) {
		ModelAndView mav=new ModelAndView();
		
		bbsqDao.fcntupdate(fno);
		
        mav.setViewName("bbsq/faq/detail");
        mav.addObject("detail", bbsqDao.faqdetail(fno));
        List<Map<String, Object>> fclist = bbsqDao.fclist();
        mav.addObject("fclist", fclist);
        return mav;
	}//detail() end
	
	@RequestMapping("/faqdelete/{fno}")
	public String faqdelete(@PathVariable("fno") int fno, HttpServletRequest req) {
	    bbsqDao.faqdelete(fno); // 테이블 행 삭제
	    return "redirect:/bbsq/faqlist";
	}
	
//	@RequestMapping("/qnaupdate")
//    public String qnaupdate(@RequestParam Map<String, Object> map) {
//        bbsqDao.qnaupdate(map); 
//       return "redirect:/bbsq/qnalist";
//    }//update() end

	@RequestMapping("/faqwrite")
    public String faqwrite() {
        return "bbsq/faq/write";
    }//write() end
	
	@RequestMapping("/faqinsert")
    public String faqinsert(@RequestParam Map<String, Object> map) {
		bbsqDao.faqinsert(map);
    	return "redirect:/bbsq/faqlist";
    }//insert() end
	
	@RequestMapping("/faqsearch")
    public ModelAndView faqsearch(@RequestParam(defaultValue = "") String fsub) {
    	ModelAndView mav=new ModelAndView();
        mav.setViewName("bbsq/faq/list");
        mav.addObject("list", bbsqDao.faqsearch(fsub)); 
        mav.addObject("fsub",fsub);//검색어
        return mav;
    }//search() end
    
	@RequestMapping("/fcinsert")
    public String fcinsert(@RequestParam Map<String, Object> map) {
		int fno = Integer.parseInt(map.get("fno").toString());
		bbsqDao.fcinsert(map);
    	return "redirect:/bbsq/faqdetail/" + fno;
    }//insert() end
	
	@RequestMapping("/fcdelete")
	public String fcdelete(@RequestParam("fcno") int fcno, HttpServletRequest req) {
	    bbsqDao.fcdelete(fcno); // 테이블 행 삭제
	    return "redirect:/bbsq/faqlist";
	}
	
	@RequestMapping("/fcomm")
    public String fcomm() {
        return "bbsq/faq/fcomm";
    }//write() end
	
	
}//class end
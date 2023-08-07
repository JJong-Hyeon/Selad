package kr.co.selad.bbsnew;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/bbsnew")
public class BbsnewCont {

	public BbsnewCont() {
        System.out.println("-----BbsqCont()객체 생성됨");
    }
    
	@Autowired
	BbsnewDAO bbsnewDao;
	
    @RequestMapping("/noticelist")
    public ModelAndView noticelist(@RequestParam(defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("bbsnew/notice/list");

        int totalCount = bbsnewDao.noticecount();
        int pageSize = 10;
        int totalPage = (int) Math.ceil((double) totalCount / pageSize);

        int start = (page - 1) * pageSize;
        int end = start + pageSize - 1;

        List<Map<String, Object>> list = bbsnewDao.noticelistPaging(start, end);

        mav.addObject("list", list);
        mav.addObject("totalPage", totalPage);
        mav.addObject("currentPage", page);

        return mav;
    }
	
	@RequestMapping("/noticedetail/{nno}")
	public ModelAndView noticedetail(@PathVariable int nno) {
		ModelAndView mav=new ModelAndView();
		
		bbsnewDao.ncntupdate(nno);
		
        mav.setViewName("bbsnew/notice/detail");
        mav.addObject("detail", bbsnewDao.noticedetail(nno));
        return mav;
	}//detail() end
	
	@RequestMapping("/noticedelete")
	public String noticedelete(int nno, HttpServletRequest req) {
		bbsnewDao.noticedelete(nno); //테이블 행 삭제		
		return "redirect:/bbsnew/noticelist";
	}//delete() end
	
	@RequestMapping("/noticewrite")
    public String noticewrite() {
        return "bbsnew/notice/write";
    }//write() end
	
    @RequestMapping("/noticeinsert")
    public String noticeinsert(@RequestParam Map<String, Object> map
    		          ,@RequestParam MultipartFile img
    		          ,HttpServletRequest req) {
    	
		String nfile="-";
		
    	if(img != null && !img.isEmpty()) { //파일이 존재한다면
    		nfile=img.getOriginalFilename();
    	
    		try {
    			
    			ServletContext application=req.getSession().getServletContext();
    			String path=application.getRealPath("/storage");  //실제 물리적인 경로
    			img.transferTo(new File(path + "\\" + nfile)); //파일저장
    			
    		}catch (Exception e) {
    			e.printStackTrace(); //System.out.println(e);
			}//try end    		
    	}//if end
    	
    	map.put("nfile", nfile);
		
		bbsnewDao.noticeinsert(map);
    	return "redirect:/bbsnew/noticelist";
    }//insert() end
	
	@RequestMapping("/noticesearch")
    public ModelAndView noticesearch(@RequestParam(defaultValue = "") String nsub) {
    	ModelAndView mav=new ModelAndView();
        mav.setViewName("bbsnew/notice/list");
        mav.addObject("list", bbsnewDao.noticesearch(nsub)); 
        mav.addObject("nsub",nsub);//검색어
        return mav;
    }//search() end

	
//			review 시작 


	@RequestMapping("/reviewlist")
    public ModelAndView reviewlist(@RequestParam(defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("bbsnew/review/list");

        int totalCount = bbsnewDao.reviewcount();
        int pageSize = 8;
        int totalPage = (int) Math.ceil((double) totalCount / pageSize);

        int start = (page - 1) * pageSize;
        int end = start + pageSize - 1;

        List<Map<String, Object>> list = bbsnewDao.reviewlistPaging(start, end);

        mav.addObject("list", list);
        mav.addObject("totalPage", totalPage);
        mav.addObject("currentPage", page);

        return mav;
    }
	
	@RequestMapping("/reviewdetail/{rno}")
	public ModelAndView reviewdetail(@PathVariable int rno) {
	    ModelAndView mav = new ModelAndView();
	    
	    bbsnewDao.rcntupdate(rno);

	    mav.setViewName("bbsnew/review/detail");
	    mav.addObject("detail", bbsnewDao.reviewdetail(rno));
	    List<Map<String, Object>> rclist = bbsnewDao.rclist();
        mav.addObject("rclist", rclist);

	    return mav;
	}
	
	@RequestMapping("/reviewdelete")
	public String reviewdelete(int rno, HttpServletRequest req) {
		bbsnewDao.reviewdelete(rno); //테이블 행 삭제		
		return "redirect:/bbsnew/reviewlist";
	}//delete() end
	
	@RequestMapping("/reviewwrite")
	public ModelAndView reviewwrite(HttpServletRequest request) {
	    ModelAndView mav = new ModelAndView();

	    String s_id = (String) request.getSession().getAttribute("s_id");
	    List<Map<String, Object>> jumunlist = bbsnewDao.jumunlist(s_id);
	    mav.addObject("jumunlist", jumunlist);
	    mav.setViewName("bbsnew/review/write");
	    return mav;
	}
    @RequestMapping("/reviewinsert")
    public String reviewinsert(@RequestParam Map<String, Object> map
    		          ,@RequestParam MultipartFile img
    		          ,HttpServletRequest req) {
    	
		String rfile="-";
		
    	if(img != null && !img.isEmpty()) { //파일이 존재한다면
    		rfile=img.getOriginalFilename();
    	
    		try {
    			
    			ServletContext application=req.getSession().getServletContext();
    			String path=application.getRealPath("/storage");  //실제 물리적인 경로
    			img.transferTo(new File(path + "\\" + rfile)); //파일저장
    			
    		}catch (Exception e) {
    			e.printStackTrace(); //System.out.println(e);
			}//try end    		
    	}//if end
    	
    	map.put("rfile", rfile);
		
		bbsnewDao.reviewinsert(map);
    	return "redirect:/bbsnew/reviewlist";
    }//insert() end
	
	@RequestMapping("/reviewsearch")
    public ModelAndView reviewsearch(@RequestParam(defaultValue = "") String rsub) {
    	ModelAndView mav=new ModelAndView();
        mav.setViewName("bbsnew/review/list");
        mav.addObject("list", bbsnewDao.reviewsearch(rsub)); 
        mav.addObject("rsub",rsub);//검색어
        return mav;
    }//search() end
	
	@RequestMapping("/rcinsert")
	public String rcinsert(@RequestParam("rno") int rno, @RequestParam Map<String, Object> map) {
	    map.put("rno", rno);
	    bbsnewDao.rcinsert(rno, map);
	    return "redirect:/bbsnew/reviewdetail/" + rno;
	}//insert() end

	@RequestMapping("/rcrecupdate")
	public String rcrecupdate(@RequestParam("rcno") int rcno, @RequestParam("rno") int rno, @RequestParam("rcid") String rcid) {
	    bbsnewDao.rcrecupdate(rcno, rcid);

	    return "redirect:/bbsnew/reviewdetail/" + rno;
	}
	
	@RequestMapping("/jumunHistory")
	@ResponseBody
	public boolean jumunHistory(@RequestParam("userid") String userid) {
	    int count = bbsnewDao.jumunHistory(userid);
	    return count > 0;
	}
	
	@RequestMapping("/rrecupdate")
	public String rrecupdate(@RequestParam("rno") int rno, @RequestParam("rid") String rid) {
	    bbsnewDao.rrecupdate(rno, rid);
	    return "redirect:/bbsnew/reviewdetail/" + rno;
	}
	
}//class end
package kr.co.selad.member;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.selad.bbsq.BbsqDAO;
import kr.co.selad.cart.CartDAO;
import kr.co.selad.coupon.CouponDAO;
import kr.co.selad.coupon.CouponDTO;
import kr.co.selad.pd.PdDTO;

@Controller
@RequestMapping("/member")
public class MemberCont {
	
	@Autowired
	MemberDAO dao ;
	
	@Autowired
	CouponDAO couponDao;
	
	
	@Autowired
	CartDAO cartdao;
	
	@Autowired
	BbsqDAO bbsqDao;
	
	public MemberCont() {
		System.out.println("-----MemberCont()객체 생성됨");
	}

	// 로그인 페이지 이동
	@RequestMapping("/login.do")
	public ModelAndView login() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}

	// 로그인 처리
	@PostMapping("/loginProc.do")
	public String loginProc(MemberDTO dto, HttpSession session, HttpServletRequest req, HttpServletResponse response)throws IOException{
		
	    // 회원 정보 조회
	    MemberDTO member = dao.login(dto);
	    
	    // 로그인 성공 여부 확인
	    if(member != null) {
	        // 세션에 정보를 저장
	        session.setAttribute("s_id", member.getUserid());
	        session.setAttribute("s_passwd", member.getUpw());
	        session.setAttribute("s_email", member.getUemail());
	        session.setAttribute("s_name", member.getUname());
	        session.setAttribute("s_phone1", member.getUphone1());
	        session.setAttribute("s_phone2", member.getUphone2());
	        session.setAttribute("s_phone3", member.getUphone3());
	        session.setAttribute("s_jumin1", member.getUjumin1());
	        session.setAttribute("s_jumin2", member.getUjumin2());
	        session.setAttribute("s_gender", member.getUgender());
	        session.setAttribute("s_zcode", member.getUzcode());
	        session.setAttribute("s_addr1", member.getUaddr1());
	        session.setAttribute("s_addr2", member.getUaddr2());
	        session.setAttribute("s_grade", member.getUgrade());
	        
	        req.removeAttribute("alert"); // 성공 시 설정된 속성 제거
    	    String script = "<script>alert('로그인에 성공했습니다'); location.href='/home.do';</script>";
    	    response.setContentType("text/html; charset=UTF-8");
    	    PrintWriter out = response.getWriter();
    	    out.println(script);
    	    out.flush();
	    } else {
	        req.setAttribute("error", "아이디와 비밀번호를 확인해주세요");
	        req.setAttribute("alert", true);
	        return "member/login";
	    }
		return null;
	}

	
	// 로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    // 현재 세션을 무효화하여 모든 세션 정보를 삭제
	    HttpSession session = request.getSession();
	    session.invalidate();
	  
	    // 로그아웃 메시지를 JavaScript로 전송하여 알림창 표시
	    String script = "<script>alert('로그아웃 되었습니다.'); location.href='login.do';</script>";
	    response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    out.println(script);
	    out.flush();
      
        // 로그인 페이지로 리다이렉트
        return null;
    }

    
    // 아이디 찾기 페이지 이동
    @RequestMapping("/findID.do")
    public ModelAndView findId() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("member/findID"); // findId.jsp의 경로와 파일명
        return mav;
    }


    // 아이디 찾기 처리 메서드
    @RequestMapping("/findIDProc.do")
    public ModelAndView findIDProc(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();

        String uname = request.getParameter("uname");
        String ujumin1 = request.getParameter("ujumin1");
        String ujumin2 = request.getParameter("ujumin2");

        // 이름과 이메일로 회원 정보 조회
        MemberDTO dto = new MemberDTO();
        dto.setUname(uname);
        dto.setUjumin1(ujumin1);
        dto.setUjumin2(ujumin2);

        MemberDTO member = dao.findID(dto); 

        if (member != null) {
            // 회원 정보가 일치하는 경우 아이디를 변수에 저장
            String userid = member.getUserid();

            // 아이디를 ModelAndView에 추가하여 뷰로 전달
            mav.addObject("userid", userid);
            mav.setViewName("member/findIDResult");
        } else {
            // 회원 정보가 일치하지 않는 경우
        	mav.addObject("isError", true); // 실패 여부를 전달하는 변수 추가
        	mav.addObject("message", "입력한 정보와 일치하는 회원이 없습니다.");
            mav.setViewName("member/findID");
        }
        return mav;
    }


    
    // 비밀번호 찾기 페이지 이동
    @RequestMapping("/findPW.do")
    public ModelAndView findPW() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("member/findPW"); // findPW.jsp의 경로와 파일명
        return mav;
    }
    
 // 비밀번호 찾기 처리 메서드
    @RequestMapping("/findPWProc.do")
    public ModelAndView findPWProc(HttpServletRequest req) {
        ModelAndView mav = new ModelAndView();

        String userid = req.getParameter("userid");
        String uemail = req.getParameter("uemail");

        // 이름과 이메일로 회원 정보 조회
        MemberDTO dto = new MemberDTO();
        dto.setUserid(userid);
        dto.setUemail(uemail);

        MemberDTO member = dao.findPW(dto); // 수정된 부분

        if (member != null) {
            // 회원 정보가 일치하는 경우 비밀번호를 변수에 저장
            String upw = member.getUpw();

            // 비밀번호를 ModelAndView에 추가하여 뷰로 전달
            mav.addObject("upw", upw);
            mav.setViewName("member/findPWResult");
        } else {
            // 회원 정보가 일치하지 않는 경우
        	mav.addObject("isError", true); // 실패 여부를 전달하는 변수 추가
        	mav.addObject("message", "입력한 정보와 일치하는 회원이 없습니다.");
            mav.setViewName("member/findPW");
        }
        return mav;
    }

    
    // 약관동의 페이지 이동
	@RequestMapping("/agreement.do")
	public ModelAndView agreement() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/agreement");
		return mav;
	}
	
	
	// 회원가입 페이지 이동
	@RequestMapping("/signup.do")
	public ModelAndView signup() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/signup");
		return mav;
	}
	
	
	// 아이디 중복 확인
	@PostMapping("/idcheck.do")
	@ResponseBody
	public int idcheck(@RequestParam String id) {
	  int count = dao.idcheck(id);
	  return count;
	}
	
	
	// 회원가입 성공 시 로그인 페이지 이동
	@RequestMapping("/welcome.do")
	public ModelAndView welcome(MemberDTO mDTO, HttpServletResponse response) throws IOException {
	    dao.insert(mDTO);
	    
	    String script = "<script>alert('회원가입에 성공하였습니다.'); location.href='login.do';</script>";
	    response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    out.println(script);
	    out.flush();

	    return null;
	}
	


	// 마이페이지 이동, 쿠폰, 문의내역 출력
	@RequestMapping("/mypage.do")
	public ModelAndView mypage(HttpSession session) {
		String s_id=(String)session.getAttribute("s_id");
		
		List<CouponDTO> couponList=couponDao.mycoupon(s_id);
		
		List<Map<String, Object>>qnaList=bbsqDao.myqna(s_id);
		
		List<PdDTO>list=cartdao.list(s_id);
		 
		
		ModelAndView mav=new ModelAndView();		
		mav.setViewName("member/mypage");
		mav.addObject("couponList", couponList);
		mav.addObject("list",list);
		mav.addObject("qnaList", qnaList);
		return mav;
	}
	
	
	// 회원정보수정 페이지 이동
	@RequestMapping("/update.do")
	public ModelAndView update() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/update");
		return mav;
	}
	
	
	// 회원정보 수정 매서드
	@RequestMapping("/updateProc.do")
	public ModelAndView updateProc(@ModelAttribute MemberDTO dto, HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView();

	    try {
	        // 세션에서 현재 로그인된 사용자의 정보 가져오기
	        HttpSession session = request.getSession();
	        String userId = (String) session.getAttribute("s_id");

	        dto.getUpw();
	        dto.getUemail();
	        dto.getUname();
	        dto.getUphone1();
	        dto.getUphone2();
	        dto.getUphone3();
	        dto.getUjumin1();
	        dto.getUjumin2();
	        dto.getUgender();
	        dto.getUzcode();
	        dto.getUaddr1();
	        dto.getUaddr2();

	        // MemberDTO 객체를 생성하여 수정된 회원정보를 설정
	        dto.setUserid(userId);

	        // DAO를 통해 회원정보 수정 처리
	        int result = dao.update(dto);

	        if (result > 0) {
	            // 회원정보 수정 성공
	    	    String script = "<script>alert('수정에 성공했습니다. 다시 로그인 해주세요'); location.href='login.do';</script>";
	    	    response.setContentType("text/html; charset=UTF-8");
	    	    PrintWriter out = response.getWriter();
	    	    out.println(script);
	    	    out.flush();
	        } else {
	            // 회원정보 수정 실패
	            mav.addObject("success", false); // 성공 여부를 추가
	            mav.addObject("message", "회원정보 수정에 실패했습니다.");
	            mav.setViewName("/member/update"); // 오류 페이지로 포워드
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        mav.addObject("message", "회원정보 수정 중 오류가 발생했습니다.");
	        mav.setViewName("errorPage"); // 오류 페이지로 포워드
	    }

	    return null;
	}


    // 회원탈퇴
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request, MemberDTO dto, HttpSession session, HttpServletResponse response) throws IOException {
        String s_id = (String) session.getAttribute("s_id");
        dto.setUserid(s_id);

        dao.delete(s_id);

        // 세션에서 정보 삭제
        session = request.getSession();
        session.invalidate(); // 세션 무효화
        
	    String script = "<script>alert('회원이 정상적으로 탈퇴되었습니다'); location.href='/home.do';</script>";
	    response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    out.println(script);
	    out.flush();

        return null;
    }


}

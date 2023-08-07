package kr.co.selad.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/coupon")
public class CouponCont {

    @Autowired
    private CouponDAO dao;

    // create 페이지 이동
    @GetMapping("/create")
    public String createCoupon(Model model) {
        model.addAttribute("coupon", new CouponDTO()); // "coupon"라는 이름으로 CouponDTO의 새로운 인스턴스를 모델에 추가합니다.
        return "coupon/create"; // "coupon/create" 뷰를 반환합니다.
    }

    // 쿠폰 생성
    @PostMapping("/create")
    public String createCoupon(Model model, CouponDTO dto) {
        dao.insertCoupon(dto); // couponDTO 객체를 couponDAO를 통해 데이터베이스에 삽입합니다.
        return "redirect:/coupon/create"; // "coupon/create" 경로로 리다이렉트합니다.
    }




}
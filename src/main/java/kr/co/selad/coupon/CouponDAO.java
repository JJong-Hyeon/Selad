package kr.co.selad.coupon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAO {

    @Autowired
    private SqlSession sqlSession;

 // 쿠폰 생성
    public void insertCoupon(CouponDTO dto) {
        sqlSession.insert("coupon.insert", dto);
    }

    // 마이페이지 쿠폰 출력
    public List<CouponDTO>mycoupon(String s_id){
    	return sqlSession.selectList("coupon.coupon", s_id);
    }

}
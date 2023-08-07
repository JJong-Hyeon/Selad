package kr.co.selad.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.selad.pd.PdDTO;

@Repository
public class CartDAO {

	
	public CartDAO() {
		System.out.println("--CartDAO() 생성");
	}
	
	@Autowired
	SqlSession sqlSession;
	

	
	public void insert(CartDTO cDto) {
		sqlSession.insert("cart.insert", cDto);
	}//insert() end
	
	public List<PdDTO> list(String s_id) {
        return sqlSession.selectList("cart.cartlist", s_id);
    }

	
}//class end

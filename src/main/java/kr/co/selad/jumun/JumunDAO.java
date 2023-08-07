package kr.co.selad.jumun;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.selad.pd.PdDTO;

@Repository
public class JumunDAO {

	public JumunDAO() {
		System.out.println("--JumunDAO() 생성");
	}
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	public List<PdDTO> list1() {
        return sqlSession.selectList("jumun.list1");
    }
	
	public List<PdDTO> list2() {
        return sqlSession.selectList("jumun.list2");
    }
	
	public List<PdDTO> list3() {
        return sqlSession.selectList("jumun.list3");
    }
	
	public List<PdDTO> list4() {
        return sqlSession.selectList("jumun.list4");
    }
	
	public List<PdDTO> list5() {
        return sqlSession.selectList("jumun.list5");
    }
	
	public List<PdDTO> list6() {
        return sqlSession.selectList("jumun.list6");
    }
	
	public List<PdDTO> list7() {
        return sqlSession.selectList("jumun.list7");
    }
	
	public List<PdDTO> list8() {
        return sqlSession.selectList("jumun.list8");
    }
	
	public List<PdDTO> list9() {
        return sqlSession.selectList("jumun.list9");
   
    }
	
	
	public List<PdDTO> list11() {
        return sqlSession.selectList("jumun.list11");
    }
	
	public List<PdDTO> list12() {
        return sqlSession.selectList("jumun.list12");
    }
	
	public List<PdDTO> list13() {
        return sqlSession.selectList("jumun.list13");
    }
	
	public List<PdDTO> cart() {
        return sqlSession.selectList("jumun.cart");
    }
	
	public int price1(String pcode) {
		
		return sqlSession.selectOne("jumun.price1", pcode);
		
		//return sqlSession.selectOne("jumun.price");
        
    }
	
	
	public int price2(String[] pcode) {
	    Map<String, Object> parameter = new HashMap<>();
	    parameter.put("array", pcode);
	    return sqlSession.selectOne("jumun.price2", parameter);
	}


	
	
	
}//class end

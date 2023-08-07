package kr.co.selad.pay;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAO {
	
    public PayDAO() {
        System.out.println("-----PayDAO()객체생성됨");
    }//end
    
    @Autowired
    SqlSession sqlSession;
    
    
    public String ono(String date) {
    	return sqlSession.selectOne("pay.ono", date);
    }
    
    
    public int tot(String userid) {
    	return sqlSession.selectOne("pay.tot", userid);
    }

    
    public int jumunlistInsert(PayDTO dto) {
    	return sqlSession.insert("pay.jumunlistInsert", dto);
    }//orderlistInsert() end

    
    public int jumundetailInsert(HashMap<String, String> map) {
    	return sqlSession.insert("pay.jumundetailInsert", map);
    }//orderdetailInsert() end
    
    

    public int cartDelete(String userid) {
    	return sqlSession.delete("pay.cartDelete", userid);
    }//cartDelete() end
    
    
    
    
    
}//class end

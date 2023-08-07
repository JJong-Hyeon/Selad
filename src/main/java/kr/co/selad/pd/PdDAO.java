package kr.co.selad.pd;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;





@Repository
public class PdDAO {
	
	public PdDAO() {
		System.out.println("--PdDAO() 생성");
	}
	
	@Autowired
	SqlSession sqlSession;
	
	public void insert(PdDTO pDto) {
		sqlSession.insert("pd.insert", pDto);
	}//insert() end
	
	public List<PdDTO> list() {
        return sqlSession.selectList("pd.list");
    }
	
	
	public Map<String, Object> detail(String pcode){
		//System.out.println("------");
		//System.out.println(sqlSession.selectList("product.detail", product_code));
		return sqlSession.selectOne("pd.detail", pcode);				
	}//detail() end
	
	public String pic(String pcode) {
		return sqlSession.selectOne("pd.pic", pcode);
	}//filename() end
	
	public void delete(String pcode) {
		sqlSession.delete("pd.delete", pcode);
	}//delete() end
	
	public void update(Map<String, Object> map) {
		//System.out.println(map);
		sqlSession.update("pd.update", map);
	}//insert() end
	
	public String pname(String pcode) {
		return sqlSession.selectOne("pd.pname", pcode);
	}//filename() end
	
	public String kcal(String pcode) {
		return sqlSession.selectOne("pd.kcal", pcode);
	}//filename() end
	
	public String price(String pcode) {
		return sqlSession.selectOne("pd.price", pcode);
	}//filename() end

	
	
}//class end

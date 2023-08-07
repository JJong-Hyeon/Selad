package kr.co.selad.bbsnew;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BbsnewDAO {

	public BbsnewDAO() {
        System.out.println("-----BbsnewDAO() 객체 생성됨");
    }//end
	
	//스프링 빈으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;
    
    public List<Map<String, Object>> noticelist(){
    	return sqlSession.selectList("notice.nocitelist");
    }//list() end

    public Map<String, Object> noticedetail(int nno){
        return sqlSession.selectOne("notice.noticedetail", nno);
    }//detail() end
    
    public void noticedelete(int nno) {
        sqlSession.delete("notice.noticedelete", nno);
    }//delete() end
     
    public void noticeinsert(Map<String, Object> map) {
    	sqlSession.insert("notice.noticeinsert", map);
    }//insert() end
    
    public List<Map<String, Object>> noticesearch(String nsub){    	
    	return sqlSession.selectList("notice.noticesearch", "%" + nsub + "%");    	
    }//search() end
    
    public void ncntupdate(int nno) {
        sqlSession.update("notice.ncntupdate", nno);
    }//delete() end
    
    public List<Map<String, Object>> noticelistPaging(int start, int end) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("end", end);
        return sqlSession.selectList("notice.noticelistPaging", params);
    }

    public int noticecount() {
        return sqlSession.selectOne("notice.noticecount");
    }

    
//		review 시작
    
    public List<Map<String, Object>> reviewlist(){
    	return sqlSession.selectList("review.reviewlist");
    }//list() end

    public Map<String, Object> reviewdetail(int rno){
        return sqlSession.selectOne("review.reviewdetail", rno);
    }//detail() end
    
    public void reviewdelete(int rno) {
        sqlSession.delete("review.reviewdelete", rno);
    }//delete() end
     
    public void reviewinsert(Map<String, Object> map) {
    	sqlSession.insert("review.reviewinsert", map);
    }//insert() end
    
    public List<Map<String, Object>> reviewsearch(String rsub){    	
    	return sqlSession.selectList("review.reviewsearch", "%" + rsub + "%");    	
    }//search() end
    
    public void rcntupdate(int rno) {
        sqlSession.update("review.rcntupdate", rno);
    }//update() end
    
    public List<Map<String, Object>> reviewlistPaging(int start, int end) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("end", end);
        return sqlSession.selectList("review.reviewlistPaging", params);
    }//listPaging() end

    public int reviewcount() {
        return sqlSession.selectOne("review.reviewcount");
    }//count() end
    
    public List<Map<String, Object>> jumunlist(String s_id){
    	return sqlSession.selectList("review.jumunlist", s_id);
    }//list() end
    
    public void rcinsert(int rno, Map<String, Object> map) {
    	map.put("rno", rno); 
        sqlSession.insert("rc.rcinsert", map);
    }//insert() end
    
    public List<Map<String, Object>> rclist(){
    	return sqlSession.selectList("rc.rclist");
    }//list() end
    
    public void rcrecupdate(int rcno, String rcid) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("rcno", rcno);
        paramMap.put("rcid", rcid);
        sqlSession.update("rc.rcrecupdate", paramMap);
    }

    public int jumunHistory(String userid) {
        return sqlSession.selectOne("review.jumunHistory", userid);
    }

    public void rrecupdate(int rno, String rid) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("rno", rno);
        paramMap.put("rid", rid);
        sqlSession.update("review.rrecupdate", paramMap);
    }
}//class end
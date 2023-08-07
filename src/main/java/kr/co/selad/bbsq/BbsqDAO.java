package kr.co.selad.bbsq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BbsqDAO {

	public BbsqDAO() {
        System.out.println("-----BbsqDAO() 객체 생성됨");
    }//end
	
	//스프링 빈으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;
    
    public List<Map<String, Object>> qnalist(){
    	return sqlSession.selectList("qna.qnalist");
    }//list() end

    public Map<String, Object> qnadetail(int qno){
        return sqlSession.selectOne("qna.qnadetail", qno);
    }//detail() end
    
    public void qnadelete(int qno) {
        sqlSession.delete("qna.qnadelete", qno);
    }//delete() end
    
//    public void qnaupdate(Map<String, Object> map) {
//        sqlSession.update("qna.qnaupdate", map);
//    }//update() end
    
    public void qnainsert(Map<String, Object> map) {
    	sqlSession.insert("qna.qnainsert", map);
    }//insert() end
    
    public List<Map<String, Object>> qnasearch(String qsub){
    	
        //영문자일 경우 대소문자 구분없이
        //return sqlSession.selectList("product.search", "%" + product_name.toUpperCase() + "%");
    	
    	return sqlSession.selectList("qna.qnasearch", "%" + qsub + "%");
    	
    }//search() end
    
    public void qcntupdate(int qno) {
        sqlSession.update("qna.qcntupdate", qno);
    }//delete() end
    
    public List<Map<String, Object>> qclist(){
    	return sqlSession.selectList("qc.qclist");
    }//list() end
    
    public void qcinsert(Map<String, Object> map) {
    	sqlSession.insert("qc.qcinsert", map);
    }//insert() end
    
    public void qcdelete(int qcno) {
        Map<String, Object> params = new HashMap<>();
        params.put("qcno", qcno);
        sqlSession.delete("qc.qcdelete", params);
    }
    
    public List<Map<String, Object>> qnalistPaging(int start, int end) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("end", end);
        return sqlSession.selectList("qna.qnalistPaging", params);
    }

    public int qnacount() {
        return sqlSession.selectOne("qna.qnacount");
    }
    
    
    // 마이페이지 출력
    public List<Map<String, Object>>myqna(String s_id){
    	return sqlSession.selectList("qna.myqna", s_id);
    }
    
    
//    faq & f_comm 시작
    
    
    public List<Map<String, Object>> faqlist(){
    	return sqlSession.selectList("faq.faqlist");
    }//list() end

    public Map<String, Object> faqdetail(int fno){
        return sqlSession.selectOne("faq.faqdetail", fno);
    }//detail() end
    
    public void faqdelete(int fno) {
        sqlSession.delete("faq.faqdelete", fno);
    }//delete() end
    
//    public void qnaupdate(Map<String, Object> map) {
//        sqlSession.update("qna.qnaupdate", map);
//    }//update() end
    
    public void faqinsert(Map<String, Object> map) {
    	sqlSession.insert("faq.faqinsert", map);
    }//insert() end
    
    public List<Map<String, Object>> faqsearch(String fsub){
    	
        //영문자일 경우 대소문자 구분없이
        //return sqlSession.selectList("product.search", "%" + product_name.toUpperCase() + "%");
    	
    	return sqlSession.selectList("faq.faqsearch", "%" + fsub + "%");
    	
    }//search() end
    
    public void fcntupdate(int fno) {
        sqlSession.update("faq.fcntupdate", fno);
    }//delete() end
    
    public List<Map<String, Object>> fclist(){
    	return sqlSession.selectList("fc.fclist");
    }//list() end
    
    public void fcinsert(Map<String, Object> map) {
    	sqlSession.insert("fc.fcinsert", map);
    }//insert() end
    
    public void fcdelete(int fcno) {
        Map<String, Object> params = new HashMap<>();
        params.put("fcno", fcno);
        sqlSession.delete("fc.fcdelete", params);
    }
    
    public List<Map<String, Object>> faqlistPaging(int start, int end) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("end", end);
        return sqlSession.selectList("faq.faqlistPaging", params);
    }

    public int faqcount() {
        return sqlSession.selectOne("faq.faqcount");
    }

    

}//class end

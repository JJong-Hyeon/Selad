package kr.co.selad.member;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
    SqlSession sqlSession;

    public MemberDAO() {
    	System.out.println("-----MemberDAO() 객체 생성");
    }
	
    // 회원가입
    public int insert(MemberDTO mDTO) {
    	return sqlSession.insert("member.insert", mDTO);
    }//insert() end
  

    //로그인
    public MemberDTO login(MemberDTO dto) {//아이디와 비번
        return sqlSession.selectOne("member.login", dto);
    }
    
    // 아이디 찾기
    public MemberDTO findID(MemberDTO dto) {
    	return sqlSession.selectOne("member.findID", dto);
    }
    
    // 비밀번호 찾기
    public MemberDTO findPW(MemberDTO dto) {
    	return sqlSession.selectOne("member.findPW", dto);
    }
    
    // 아이디 중복 확인
    public int idcheck(String userid) {
        return sqlSession.selectOne("member.idcheck", userid);
      }
    
    // 회원정보수정
    public int update(MemberDTO dto) {
        return sqlSession.update("member.update", dto);
    }
    
    
    // 회원탈퇴
    public int delete(String s_id) {
        return sqlSession.delete("member.delete",s_id);
    }

    
}
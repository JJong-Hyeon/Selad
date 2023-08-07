package kr.co.selad.gameng;

import java.util.List;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GamengDAOImpl implements GamengDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public String getGamengList() {
        List<GamengDTO> list = sqlSession.selectList("gameng.getGamengList");

        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        try {
            json = mapper.writeValueAsString(list);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return json;
        
    }
    @Override
    public String searchGameng(String keyword) {
        List<GamengDTO> list = sqlSession.selectList("gameng.searchGameng", keyword);

        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        try {
            json = mapper.writeValueAsString(list);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return json;
    }
}

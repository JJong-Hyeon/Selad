package kr.co.selad.gameng;


import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class GamengCont {
	 public GamengCont() {
	        System.out.println("-----GamengController()객체 생성됨");
	    }
	    
	    private GamengDAO gamengDAO;

	    @Autowired
	    public void setGamengDAO(GamengDAO gamengDAO) {
	        this.gamengDAO = gamengDAO;
	    }

	    @RequestMapping("/places")
	    public String getPlaces(Model model) {
	        String json = gamengDAO.getGamengList();

	        ObjectMapper mapper = new ObjectMapper();
	        List<GamengDTO> gamengList = null;
	        try {
	            gamengList = mapper.readValue(json, new TypeReference<List<GamengDTO>>() {});
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        model.addAttribute("placesList", gamengList);
	        return "jumun/gameng";
	    }
	    
	    
	    
	    
	    @GetMapping("/search")
	    public String searchPlaces(@RequestParam String keyword, Model model) {
	        String json = gamengDAO.searchGameng(keyword);

	        ObjectMapper mapper = new ObjectMapper();
	        List<GamengDTO> gamengList = null;
	        try {
	            gamengList = mapper.readValue(json, new TypeReference<List<GamengDTO>>() {});
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        model.addAttribute("placesList", gamengList);
	        return "gameng";
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
}

package pulu.com.main;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String test(Locale locale, ModelAndView mv) {
		return "main_tiles";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String test2(Locale locale, ModelAndView mv) {
		
		return "join";
	}
	
	@RequestMapping(value = "/goodslist", method = RequestMethod.GET)
	public String test3(Locale locale, ModelAndView mv) {
		
		return "goodslist";
	}
	
	// 선민: 관리자페이지로 이동
	@RequestMapping(value = "/adminMain")
	public String adminMain(ModelAndView mv, HttpSession session) throws Exception {
		
		mv.addObject("loginGrade", (String)session.getAttribute("loginGrade"));  
		return "admin_Main";
	}
	
	
	//선아: 매장지도 띄우기
	@RequestMapping(value = "/burialMap")
	public ModelAndView burialMap() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("burialMap");
		return mv;
	}
	
	//선아: 영양정보 띄우기
		@RequestMapping(value = "/nutritionFacts")
		public ModelAndView nutritionFacts() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("nutritionFacts");
			return mv;
		}
	
	
	
} 

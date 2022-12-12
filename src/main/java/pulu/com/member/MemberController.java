package pulu.com.member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import pulu.com.common.CommandMap;

@Controller
@Log4j
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	/* ---------------------- (1) 회원가입 ---------------------- */
	
	// 선민: 회원가입 창으로 이동
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(HttpSession session) throws Exception {
		String loginStatus = (String)session.getAttribute("loginStatus");
		log.info("로그인 상태: " + loginStatus);
		
		if(loginStatus != null) { // 로그인된 상태라면 접근 못하게 하기
			return "redirect:/main.pulu";
		} else {
			return "join";
		}
	}

	// 선민: 아이디 중복확인 
	@RequestMapping(value = "/idCheckForm") 
	public String confirmId(HttpServletRequest request) throws Exception {
		String INPUTID = request.getParameter("INPUTID");
		log.info(INPUTID);
		
		String idCheckResult = memberService.confirmId(INPUTID);
		log.info("중복확인 결과 : " + idCheckResult);
		request.setAttribute("idCheckResult", idCheckResult);
		request.setAttribute("inputId", INPUTID);
		return "/member/idCheckForm";
	}
	
	// 선민: 회원가입 (DB에 회원 정보를 insert)
	@RequestMapping(value = "/joinForm", method = RequestMethod.POST)
	public String insertMember(CommandMap commandMap) throws Exception {
		
		log.info(commandMap.getMap().get("ID")); 
		memberService.insertMember(commandMap.getMap());
		return "redirect:/joinOK.pulu";
	}

	// 선민: 가입완료 창으로 이동
	@RequestMapping(value = "/joinOK")
	public String joinOK(HttpServletRequest request) throws Exception {
		return "joinOK";
	}
	
	/* ---------------------- (2) 로그인 ---------------------- */
	
	// 선민: 로그인 폼으로 이동
	@RequestMapping(value = "/loginForm")
	public String login(HttpSession session) throws Exception {
		return "loginForm";
	}
	
	// 선민: 로그인
	@SuppressWarnings("unused")
	@RequestMapping(value = "/login")
	public ModelAndView login(CommandMap commandMap, HttpSession session) throws Exception
	{
		// 해당 아이디로 DB 조회하기
		Map<String, Object> loginCheck = memberService.selectId(commandMap.getMap());
		ModelAndView mv = new ModelAndView();
		if(loginCheck == null) // 조회한 결과가 없으면
		{
			mv.addObject("message", "해당 아이디가 존재하지 않습니다."); 
			mv.setViewName("loginForm");
			log.info("아이디 없음");
			return mv;
		}
		else // 조회한 결과가 있으면 비밀번호 일치여부 검증
		{
			log.info(loginCheck.get("ID") + "의 정보를 DB로부터 가져왔습니다.");
			
		    if(loginCheck.get("PASSWORD").toString().equals(commandMap.get("PASSWORD").toString()))
		    {
		    	// 비밀번호가 일치하면 로그인 세션 생성 (아이디, 회원 이름, 회원번호, 등급)
		    	session.setAttribute("loginStatus", "ON"); // 로그인 한 상태를 표현하는 변수 (ON/OFF)
		    	session.setAttribute("loginId", loginCheck.get("ID"));
		    	session.setAttribute("loginName", loginCheck.get("NAME"));
		    	session.setAttribute("loginNum", loginCheck.get("NUM"));
		    	session.setAttribute("loginGrade", loginCheck.get("GRADE"));
		    	session.setAttribute("loginPw", loginCheck.get("PASSWORD"));
		    	
		    	String loginGrade = (String)session.getAttribute("loginGrade");
		    	
		    	// 로그인된 아이디의 등급을 확인하여 서로 다른 페이지로 이동
		    	if(loginGrade.equals("Admin")) { // 선민: 등급이 Admin일 경우 관리자페이지 
					mv.setViewName("redirect:/adminMain.pulu");
					return mv;
		    	}
		    	else { // Admin이 아닐 경우 메인페이지 
		    		log.info("로그인 성공");
		    		mv.setViewName("redirect:/main.pulu");
		    		return mv;
		    	}
		    } else {	    		
		    	log.info("비번 다름"); 
		    	mv.addObject("message", "비밀번호가 일치하지 않습니다."); // 아직XXXXXXXX
				mv.setViewName("loginForm");
				return mv;
	    	}    
		}
	}
	
	// 선민: 로그아웃
	@RequestMapping(value = "/logout")
	public String logout(Model model, HttpServletRequest request, HttpSession session, CommandMap commandMap) throws Exception {
		session = request.getSession(false); // getSession(false) : 현재 세션이 존재하면 기존 세션 리턴, 없으면 null값 리턴
		
		if (session != null) { // 현재 세션이 존재하면
			log.info("세션 소멸"); 
			session.invalidate(); // 세션 소멸
		}
		return "redirect:/main.pulu";
	}
	
	
	
	
	
	
	// 선아: 아이디 찾기
	@RequestMapping(value = "/findIdForm")
	public ModelAndView findIdForm(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findIdForm");
		return mav;
	}

	// 선아: 아이디 찾기 완료
	@RequestMapping(value = "/findIdForm2", method = RequestMethod.POST)
	public ModelAndView findIdForm2(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> memberMap = new HashMap<String, Object>();
		memberMap = commandMap.getMap();

		Map<String, Object> chk = memberService.findFail0(memberMap);
		if (chk == null) { // 아이디 값이 없으면
			mav.setViewName("findIdForm");
			mav.addObject("message", "조회된 정보가 없습니다. 다시 입력해주세요.");
			return mav;
		} else {

			Map<String, Object> findId = memberService.findId(memberMap);
			log.info("memberMap" + memberMap);
			System.out.println("findID>>" + findId);

			mav.addObject("findId", findId);
			mav.setViewName("findIdForm2");
			return mav;
		}
	}

	// 선아: 비밀번호 찾기
	@RequestMapping(value = "/findPwForm")
	public ModelAndView findPwForm(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findPwForm");
		return mav;
	}

	// 선아: 비밀번호 찾기 완료
	@RequestMapping(value = "/findPwForm2", method = RequestMethod.POST)
	public ModelAndView findPwForm2(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> memberMap = new HashMap<String, Object>();
		memberMap = commandMap.getMap();

		Map<String, Object> chk = memberService.findFail(memberMap);
		if (chk == null) { // 아이디 값이 없으면
			mav.setViewName("findPwForm");
			mav.addObject("message", "조회된 정보가 없습니다. 다시 입력해주세요.");
			return mav;
		} else {
			Map<String, Object> findPw = memberService.findPw(memberMap);
			mav.addObject("findPw", findPw);
			mav.setViewName("findPwForm2");
			return mav;
		}

	}
	
	/* ---------------------- (3) 마이페이지 ---------------------- */
    
	//선아: 마이페이지 가기
	@RequestMapping(value = "/myPage")
	public ModelAndView myPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage");
		return mav;
	}
	
	//선아: 마이페이지 정보수정 가기
	@RequestMapping(value = "/myInfoModify")
	public ModelAndView myInfoModify(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("myInfoModify");
		
		Map<String, Object> map = memberService.selectId(commandMap.getMap());
		
		mav.addObject("map", map);
		mav.addObject("ID", commandMap.get("ID"));
		mav.addObject("PASSWORD", commandMap.get("PASSWORD"));
		mav.addObject("PHONE", commandMap.get("PHONE"));
		mav.addObject("EMAIL", commandMap.get("EMAIL"));
		mav.addObject("ZIPCODE", commandMap.get("ZIPCODE"));
		
		System.out.println(map);
		
		mav.setViewName("myInfoModify");
		return mav;
	}
	
	
	//선아: 탈퇴로 가기
	@RequestMapping(value = "/deleteForm")
	public ModelAndView deleteForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deleteForm");
		return mav;
	}
	
	//선아: 회원 탈퇴
	@RequestMapping(value = "/deleteForm", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView deleteMember(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/deleteForm.pulu");

		log.info("str_Num = " + commandMap.getMap().get("str_Num"));
		log.info("str_Pw  = " + commandMap.getMap().get("str_Pw"));

		memberService.memberDelete(commandMap.getMap());
		log.info("ModelAndView 데이터를 가지고 deleteForm.jsp로 리다이렉트");
		
		return mv;
	}
	
	 
	
	
	
	
		
	/* ---------------------- (4) ArgumentResolver Test ---------------------- */
		
	// 요청이 컨트롤러에 도착하기 전, 파라미터를 받아 CommandMap객체에 넣는 ArgumentResolver 테스트
	@RequestMapping(value = "testMapArgumentResolver.pulu")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("");

		if (commandMap.isEmpty() == false) {
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		return mv;
	}
		
}

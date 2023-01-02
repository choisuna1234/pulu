package pulu.com.member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import pulu.com.common.CommandMap;
import pulu.com.common.Paging;

@Controller
@Log4j
public class MemberController {

	@Resource(name = "memberService")
	private MemberService memberService;

	// 페이징 변수
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 5;
	private int blockPage = 5;
	private int startPage;
	private int endPage;
	private String pagingHtml;
	private Paging page;

	/* ---------------------- (1) 회원가입 ---------------------- */

	// 선민: 회원가입 창으로 이동
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(HttpSession session) throws Exception {
		String loginStatus = (String) session.getAttribute("loginStatus");
		//log.info("로그인 상태: " + loginStatus);

		if (loginStatus != null) { // 로그인된 상태라면 접근 못하게 하기
			return "redirect:/main.pulu";
		} else {
			return "join";
		}
	}

	// 선민: 아이디 중복확인
	@RequestMapping(value = "/idCheckForm")
	public String confirmId(HttpServletRequest request) throws Exception {
		String INPUTID = request.getParameter("INPUTID");
		//log.info(INPUTID);

		String idCheckResult = memberService.confirmId(INPUTID);
		//log.info("중복확인 결과 : " + idCheckResult);
		request.setAttribute("idCheckResult", idCheckResult);
		request.setAttribute("inputId", INPUTID);
		return "/member/idCheckForm";
	}

	// 선민: 회원가입 (DB에 회원 정보를 insert)
	@RequestMapping(value = "/joinForm", method = RequestMethod.POST)
	public String insertMember(CommandMap commandMap) throws Exception {

		//log.info(commandMap.getMap().get("ID")); //
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
	public ModelAndView login(CommandMap commandMap, HttpSession session) throws Exception {
		// 해당 아이디로 DB 조회하기
		Map<String, Object> loginCheck = memberService.selectId(commandMap.getMap());
		ModelAndView mv = new ModelAndView();
		if (loginCheck == null) // 조회한 결과가 없으면
		{
			mv.addObject("message", "해당 아이디가 존재하지 않습니다.");
			mv.setViewName("loginForm");
			//log.info("아이디 없음");
			return mv;
		} else // 조회한 결과가 있으면 비밀번호 일치여부 검증
		{
			//log.info(loginCheck.get("ID") + "의 정보를 DB로부터 가져왔습니다.");

			if (loginCheck.get("PASSWORD").toString().equals(commandMap.get("PASSWORD").toString())) {
				// 비밀번호가 일치하면 로그인 세션 생성 (아이디, 회원 이름, 회원번호, 등급)
				session.setAttribute("loginStatus", "ON"); // 로그인 한 상태를 표현하는 변수 (ON/OFF)
				session.setAttribute("loginId", loginCheck.get("ID"));
				session.setAttribute("loginName", loginCheck.get("NAME"));
				session.setAttribute("loginNum", loginCheck.get("NUM"));
				session.setAttribute("loginGrade", loginCheck.get("GRADE"));
				session.setAttribute("loginPw", loginCheck.get("PASSWORD"));

				String loginGrade = (String) session.getAttribute("loginGrade");

				// 로그인된 아이디의 등급을 확인하여 서로 다른 페이지로 이동
				if (loginGrade.equals("Admin")) { // 선민: 등급이 Admin일 경우 관리자페이지
					mv.setViewName("redirect:/adminMain.pulu");
					return mv;
				} else { // Admin이 아닐 경우 메인페이지
					//log.info("로그인 성공");
					mv.setViewName("redirect:/main.pulu");
					return mv;
				}
			} else {
				//log.info("비번 다름");
				mv.addObject("message", "비밀번호가 일치하지 않습니다.");
				mv.setViewName("loginForm");
				return mv;
			}
		}
	}

	// 선민: 로그아웃
	@RequestMapping(value = "/logout")
	public String logout(Model model, HttpServletRequest request, HttpSession session, CommandMap commandMap)
			throws Exception {
		session = request.getSession(false); // getSession(false) : 현재 세션이 존재하면 기존 세션 리턴, 없으면 null값 리턴

		if (session != null) { // 현재 세션이 존재하면
			//log.info("세션 소멸");
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

		Map<String, Object> findId = memberService.findId(memberMap);

		if (findId == null) { // 아이디 값이 없으면
			mav.setViewName("findIdForm");
			mav.addObject("message", "조회된 정보가 없습니다. 다시 입력해주세요.");

			return mav;
		} else if (findId.get("BLOCK").equals("Y")) { // 탈퇴 회원 구분 알러창

			mav.setViewName("findIdForm");
			mav.addObject("message", "이미 탈퇴한 아이디입니다. ");

			return mav;
		} else {
			//log.info("MemberController>>memberMap>>" + memberMap);
			//log.info("MemberController>>findID>>" + findId + findId.get("BLOCK"));

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

	// 선아: 비밀번호 찾기 완료 및 비밀번호 변경
	@RequestMapping(value = "/findPwForm2", method = RequestMethod.POST)
	public ModelAndView findPwForm2(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> memberMap = new HashMap<String, Object>();
		memberMap = commandMap.getMap();

		Map<String, Object> chk = memberService.findFail(memberMap);

		if (chk == null) { // 비밀번호 값이 없으면
			mav.setViewName("findPwForm");
			mav.addObject("message", "조회된 정보가 없습니다. 다시 입력해주세요.");
			return mav;
		}

		else if (chk.get("BLOCK").equals("Y")) { // 탈퇴 회원 구분 알러창
			mav.setViewName("findPwForm");
			mav.addObject("message", "이미 탈퇴한 비밀번호입니다. ");
			return mav;
		} else {
			Map<String, Object> findPw = memberService.findPw(memberMap);
			mav.addObject("findPw", findPw);
			mav.setViewName("findPwForm2");
			return mav;
		}
	}

	// 선아: 새 비밀번호 변경 완료
	@RequestMapping(value = "/newPasswordResult", method = RequestMethod.POST)
	public ModelAndView newPasswordResult(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("newPasswordResult");
		memberService.newPassword(commandMap.getMap());
		return mav;
	}

	/* ---------------------- (3) 마이페이지 ---------------------- */

	// 선아: 마이페이지
	@RequestMapping(value = "/myPage")
	public ModelAndView myPage() {
		ModelAndView mav = new ModelAndView("redirect:/myInfoOrder.pulu");
		return mav;
	}

	// 선아: 회원 정보 데이터 불러오기
	@RequestMapping(value = "/myInfoModify")
	@ResponseBody
	public ModelAndView myInfoModify(CommandMap commandMap, HttpSession session, HttpServletRequest request)
			throws Exception {

		ModelAndView mav = new ModelAndView("redirect:/myPage.pulu");
		Map<String, Object> loginId = new HashMap<String, Object>();
		loginId.put("loginId", session.getAttribute("loginId"));
		//log.info("MemberController >> loginID" + loginId);

		Map<String, Object> myInfo = memberService.memberInfo(loginId);
		mav.setViewName("myInfoModify");
		mav.addObject("myInfo", myInfo);
		return mav;

	}

	// 선아: 수정하기
	@RequestMapping(value = "/myInfoModify", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView myInfoModify(CommandMap commandMap) throws Exception {

		ModelAndView mav = new ModelAndView("redirect:/myInfoModify.pulu");

		//log.info("ID = " + commandMap.getMap().get("ID"));
		memberService.memberUpdate(commandMap.getMap());

		return mav;

	}

	// 선아: 회원탈퇴(1)
	// 회원 탈퇴 값 가져와서 삭제form으로 전달
	@RequestMapping(value = "/deleteForm")
	@ResponseBody
	public ModelAndView deleteForm(CommandMap commandMap) throws Exception {

		ModelAndView mav = new ModelAndView("deleteForm");

		//log.info("str_Num = " + commandMap.getMap().get("str_Num"));
		//log.info("str_Pw  = " + commandMap.getMap().get("str_Pw"));

		return mav;
	}

	// 선아: 회원탈퇴(2)
	// 회원 block y로 update후 탈퇴 완료 창으로 이동
	@RequestMapping(value = "/deleteForm", method = RequestMethod.POST)
	public ModelAndView deleteForm2(CommandMap commandMap, HttpSession session, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deleteForm2");
		memberService.memberDelete(commandMap.getMap());

		session = request.getSession(false); // getSession(false) : 현재 세션이 존재하면 기존 세션 리턴, 없으면 null값 리턴

		if (session != null) { // 현재 세션이 존재하면
			//log.info("세션 소멸");
			session.invalidate(); // 세션 소멸
		}
		return mav;
	}

	// 병찬: 내가 쓴 후기 리스트
	@RequestMapping(value = "/myReview")
	public ModelAndView myReview(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("myinfo_review");

		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("loginId"); // 회원 ID 값 불러오기

		commandMap.getMap().put("ID", ID);

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
			// 받아오는 현재페이지가 없으면 페이지 1부터시작
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 받아오는 현제페이지가 있으면 인트값으로해서 현재페이지 값설정
		}
		// System.out.println(commandMap.getMap());
		List<Map<String, Object>> myReview = memberService.myReview(commandMap.getMap());
		
		totalCount = myReview.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "myReview.pulu");
		pagingHtml = page.getPagingHtml().toString();
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;
		
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		myReview = myReview.subList(page.getStartCount(), lastCount);

		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("myReview", myReview);
	
		return mv;
	}

	// SELECT ORDER_NUM FROM ORDER_DELI WHERE ORDER_MEMBER_ID = 'AISU'
	// SELECT * FROM ORDER_DELI WHERE ORDER_NUM = '99'
	// SELECT COUNT(*) FROM ORDER_GOODS WHERE ORDER_NUM = '99'
	
	// 선민: 마이페이지 주문 리스트
	@RequestMapping(value = "/myInfoOrder")
	public ModelAndView myInfoOrder(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("myinfo_order");

		String ID = (String) session.getAttribute("loginId");
		commandMap.getMap().put("ID", ID);
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
			// 받아오는 현재페이지가 없으면 페이지 1부터시작
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 받아오는 현제페이지가 있으면 인트값으로해서 현재페이지 값설정
		}

		List<Map<String, Object>> list = memberService.myInfoOrder(commandMap.getMap());
		
		totalCount = list.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "myInfoOrder.pulu");
		pagingHtml = page.getPagingHtml().toString();
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;
		
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("myInfoOrder", list);
		return mv;
	}

	// 병찬: 마이페이지 주문 상세보기
	@RequestMapping(value = "/myInfoOrderDetail")
	public ModelAndView myInfoOrderDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("myinfo_order_detail");
		
		HttpSession session = request.getSession();

		commandMap.getMap().put("ORDER_NUM", commandMap.getMap().get("ORDER_NUM")); // 주문 번호
		commandMap.getMap().put("ID", session.getAttribute("loginId")); // 회원 ID

		// System.out.println(commandMap.getMap());
		List<Map<String, Object>> list = memberService.myInfoOrderDetail(commandMap.getMap());
		Map<String, Object> mapp = memberService.myInfoOrderDetail2(commandMap.getMap());
		
		mv.addObject("myInfoOrderDetail", list);
		mv.addObject("myInfoOrderDetail2", mapp);
		// System.out.println(myInfoOrderDetail);
		return mv;
	}

	// 병찬: 마이페이지 주문 수정
	@RequestMapping(value = "/myInfoOrderUpdate")
	public ModelAndView myInfoOrderUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/myInfoOrder.pulu");
		
		System.out.println(commandMap.get("ORDER_NUM"));
		memberService.myInfoOrderUpdate(commandMap.getMap(), request);

		return mv;
	}

	// 병찬: 마이페이지 주문 수정폼
	@RequestMapping(value = "/myInfoOrderUpdateForm")
	public ModelAndView myInfoOrderUpdateForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("myinfo_order_update_form");
		
		HttpSession session = request.getSession();
		
		commandMap.getMap().put("ID", session.getAttribute("loginId")); // 회원 ID

		Map<String, Object> map = memberService.myInfoOrderDetail2(commandMap.getMap());

		mv.addObject("map", map);
		return mv;
	}

	// 병찬: 마이페이지 주문 취소
	@RequestMapping(value = "/myInfoOrderDelete")
	public ModelAndView myInfoOrderDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/myInfoOrder.pulu");

		memberService.myInfoOrderDelete(commandMap.getMap());

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
				//log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		return mv;
	}

}

package pulu.com.adminMember;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import pulu.com.common.CommandMap;
import pulu.com.common.Paging;

@Controller
@Log4j
public class AdminMemberController {

	@Resource(name = "adminService")
	private AdminMemberService adminService;

	// 페이징 변수
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private int startPage;
	private int endPage;
	private String pagingHtml;
	private Paging page;

	/* ---------------------- (1) 관리자-회원 ---------------------- */

	// 선민: 전체 회원리스트 가져오기
	@RequestMapping(value = "/adminMemberList")
	public ModelAndView selectMemberList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("admin_member_list");

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
			// 받아오는 현재페이지가 없으면 페이지 1부터시작
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 받아오는 현재페이지가 있으면 인트값으로해서 현재페이지 값설정
		}
		
		List<Map<String, Object>> list = adminService.selectMemberList(commandMap.getMap());
		
		totalCount = list.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminMemberList.pulu");
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
		mv.addObject("adminMemberList", list);

		return mv;
	}

	// 선민: 단일 회원정보 가져오기, 상세보기 창으로 이동
	@RequestMapping(value = "/adminMemberDetail")
	public ModelAndView adminMemberDetail(HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/adminMember/adminMemberDetail");

		String id = request.getParameter("ID");
		Map<String, Object> map = adminService.selectMemberInfo(id);
		mv.addObject("adminMemberDetail", map);

		return mv;
	}

	// 선민: 회원정보 수정 창으로 이동
	@RequestMapping(value = "/adminMemberUpdateForm", method = RequestMethod.POST)
	public ModelAndView adminMemberUpdateForm(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/adminMember/adminMemberUpdate");

		String id = (String) commandMap.get("ID");
		Map<String, Object> map = adminService.selectMemberInfo(id);
		mv.addObject("adminMemberUpdate", map);

		return mv;
	}

	// 선민: 회원정보 수정(DB에 update), 상세정보 창으로 이동
	@RequestMapping(value = "/adminMemberUpdate", method = RequestMethod.POST)
	public ModelAndView adminMemberUpdate(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/adminMember/adminMemberDetail");

		String id = (String) commandMap.get("ID");
		adminService.updateMemberInfo(commandMap.getMap());
		Map<String, Object> map = adminService.selectMemberInfo(id);
		mv.addObject("adminMemberDetail", map);

		return mv;
	}

	// 선민: 회원정보 삭제(DB에 delete)
	@RequestMapping(value = "/adminMemberDelete", method = RequestMethod.POST)
	public String adminMemberDelete(HttpServletRequest request, CommandMap commandMap) throws Exception {

		String ID = (String) commandMap.getMap().get("ID");
		log.info(ID + "의 정보를 삭제합니다.");
		adminService.deleteMemberInfo(ID);

		return "redirect:/adminMemberDelete.pulu";
	}

	// 선민: 삭제완료 창으로 이동
	@RequestMapping(value = "/adminMemberDelete", method = RequestMethod.GET)
	public String adminMemberDelete() throws Exception {

		return "/adminMember/adminMemberDelete";
	}
	
	
	// 선민: 회원목록 검색
	@RequestMapping(value = "/adminMemberSearch", method = RequestMethod.POST)
	public ModelAndView adminMemberSearch(HttpServletRequest request, CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("admin_member_list");
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
			// 받아오는 현재페이지가 없으면 페이지 1부터시작
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 받아오는 현재페이지가 있으면 인트값으로해서 현재페이지 값설정
		}
		
		int searchOption = Integer.parseInt(request.getParameter("SEARCH_OPTION"));
		String keyword = request.getParameter("SEARCH_KEYWORD");
		log.info("01. 서치옵션 == " + searchOption);
		log.info("02. 서치키워드 == " + keyword);
		
		List<Map<String, Object>> list = adminService.searchMemberInfo(request, commandMap.getMap());
		
		totalCount = list.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminMemberList.pulu");
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
		mv.addObject("adminMemberList", list);
		return mv;
	}
	

}

package pulu.com.adminBoard;
//소영 : FAQ 관리자 페이지 

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pulu.com.common.Paging;
import pulu.com.common.CommandMap;

@Controller // 웹 클라이언트에서 들어온 요청을 해당 비지니스 로직 호출, 수행결과와 함께 응답해주는 Dispatcher
public class AdminFaqController {
	Logger log = Logger.getLogger(this.getClass());

	// 검색 넘버, 값을 받아오는 변수
	private int searchNum;
	private String isSearch;

	// 페이징 관련 변수
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 10;
	private int startPage;
	private int endPage;
	private String pagingHtml;
	private Paging page;

	@Resource(name = "AdminFaqService") // Service 영억 접근을 위한 선언(adminFaqServiceImpl의 이름과 통일)
	private AdminFaqService adminFaqService; // 빈 수동 등록

	// 관리자 메인페이지로 이동
//	@RequestMapping(value = "/adminMain")
//	public String list() {
//		return "adminMain";
//	}

	// 관리자 FAQ 리스트
	@RequestMapping(value = "/adminFaqList") // 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView adminFaqList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("admin_faq_list"); // jsp 경로 설정

		// 받아오는 현제페이지가 없으면 페이지 1부터시작
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) { // currentPage가 null 이거나 공백 이거나 0 일때.
			currentPage = 1;
			// 받아오는 현제페이지가 있으면 인트값으로해서 현제페이지 값설정
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<Map<String, Object>> faqList = adminFaqService.adminFaqList(commandMap.getMap()); // service단의 adminFaqList
																								// 로직 호출
		isSearch = request.getParameter("isSearch");

		if (isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			commandMap.put("searchNum", searchNum);
			commandMap.put("isSearch", isSearch);

			if (searchNum == 0) { // 제목
				faqList = adminFaqService.faqSearch0(commandMap.getMap());
			} else if (searchNum == 1) { // 내용
				faqList = adminFaqService.faqSearch1(commandMap.getMap());
			}

			totalCount = faqList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminFaqList.pulu", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
			startPage = ((currentPage - 1) / blockPage) * blockPage + 1;
			endPage = startPage + blockPage - 1;

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			faqList = faqList.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount); // 서비스 로직 결과를 mv에 담아 jsp에서 사용
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("faqList", faqList);

			return mv;

		} else {

			totalCount = faqList.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminFaqList.pulu");
			pagingHtml = page.getPagingHtml().toString();
			startPage = ((currentPage - 1) / blockPage) * blockPage + 1;
			endPage = startPage + blockPage - 1;

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			faqList = faqList.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("faqList", faqList);

			return mv;
		}
	}

	
	// 관리자 FAQ 등록폼
	@RequestMapping(value = "/adminFaqInsertForm", method = RequestMethod.POST) // 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView adminFaqInsertForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin_faq_insert_form"); // jsp 경로 설정

		return mv;
	}

	
	// 관리자 FAQ 등록
	@RequestMapping(value = "/adminFaqInsert", method = RequestMethod.POST) // 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView adminFaqInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminFaqList.pulu"); // 등록 후 리스트로 돌아갈 수 있도록 리다이렉트를 통한 jsp 경로 설정

		adminFaqService.adminFaqInsert(commandMap.getMap(), request); // service단의 adminFaqInsert 로직 호출
		
		// 줄바꿈 시 <br/> 넣기
//		String content1 = commentModel.getContent().replaceAll("\r\n", "<br/>");
//		boardModel.setContent(content);
		String content = request.getParameter("FAQ_CONTENT").replaceAll("\r\n", "<br/>");
		mv.addObject("FAQ_CONTENT", content);
//		mv.addObject("FAQ_CONTENT", commandMap.get(content));
	
		return mv;
	}

	
	// 관리자 FAQ 상세보기
	@RequestMapping(value = "/adminFaqDetail")
	public ModelAndView adminFaqDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin_faq_detail");

		Map<String, Object> map = adminFaqService.adminFaqDetail(commandMap.getMap());

		mv.addObject("map", map);
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		mv.addObject("currentPage", currentPage);

		return mv;
	}

	
	// 관리자 FAQ 수정폼 이동
	@RequestMapping(value = "/adminFaqUpdateForm", method = RequestMethod.POST)
	public ModelAndView adminFaqUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin_faq_update_form");

		Map<String, Object> map = adminFaqService.adminFaqDetail(commandMap.getMap());// 상세보기 정보를 맵에서 받아옴
		// 상세보기에 들어있는 정보를 꺼내서 mv에 다시저장

		mv.addObject("map", map);
		mv.addObject("FAQ_NUM", commandMap.get("FAQ_NUM"));
		mv.addObject("currentPage", currentPage);
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		
		System.out.println(map);
		System.out.println("수정완료");
		return mv;
	}

	
	// 관리자 FAQ 수정
	@RequestMapping(value = "/adminFaqUpdate", method = RequestMethod.POST)
	public ModelAndView adminFaqUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminFaqDetail.pulu");

		adminFaqService.adminfaqUpdate(commandMap.getMap(), request);

		mv.addObject("FAQ_NUM", commandMap.get("FAQ_NUM"));

		return mv;
	}

	
	// 관리자 FAQ 삭제하기
	@RequestMapping(value = "/adminFaqDelete")
	public ModelAndView adminFaqDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminFaqList.pulu");

		adminFaqService.adminFaqDelete(commandMap.getMap());

		return mv;
	}
}

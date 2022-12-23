package pulu.com.board;
//소영 : FAQ 관리자 페이지 

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pulu.com.common.Paging;
import pulu.com.common.CommandMap;

@Controller // 웹 클라이언트에서 들어온 요청을 해당 비지니스 로직 호출, 수행결과와 함께 응답해주는 Dispatcher
public class FaqController {
	Logger log = Logger.getLogger(this.getClass());

	// 검색 넘보, 값을 받아오는 변수
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

	@Resource(name = "FaqService") // Service 영억 접근을 위한 선언(faqServiceImpl의 이름과 통일)
	private FaqService faqService; // 빈 수동 등록

	// 메인페이지로 이동
	@RequestMapping(value = "/main")
	public String list() {
		return "Main";
	}

	// FAQ 리스트
	@RequestMapping(value = "/faqList") // 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView faqList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("faq_list"); // jsp 경로 설정

		// 받아오는 현제페이지가 없으면 페이지 1부터시작
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) { // currentPage가 null 이거나 공백 이거나 0 일때.
			currentPage = 1;
			// 받아오는 현제페이지가 있으면 인트값으로해서 현제페이지 값설정
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<Map<String, Object>> faqList = faqService.faqList(commandMap.getMap()); // service단의 faqList
																								// 로직 호출
		isSearch = request.getParameter("isSearch");

		if (isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			commandMap.put("searchNum", searchNum);
			commandMap.put("isSearch", isSearch);

			if (searchNum == 0) { // 제목
				faqList = faqService.faqSearch0(commandMap.getMap());
			} else if (searchNum == 1) { // 내용
				faqList = faqService.faqSearch1(commandMap.getMap());
			}

			totalCount = faqList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "faqList.pulu", searchNum, isSearch);
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

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "faqList.pulu");
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

	
	// FAQ 상세보기
	@RequestMapping(value = "/faqDetail")
	public ModelAndView faqDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("faq_detail");

		Map<String, Object> map = faqService.faqDetail(commandMap.getMap());

		mv.addObject("map", map);
		mv.addObject("currentPage", currentPage);
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
//		mv.addObject("map", map.get("map"));
//		mv.addObject("list", map.get("list"));

		return mv;
	}

	

}

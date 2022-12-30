package pulu.com.adminCS;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import pulu.com.common.Paging;
import pulu.com.common.CommandMap;

@Controller // 웹 클라이언트에서 들어온 요청을 해당 비지니스 로직 호출, 수행결과와 함께 응답해주는 Dispatcher
public class AdminQnaController {
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

	@Resource(name = "AdminQnaService") // Service 영억 접근을 위한 선언(qnaServiceImpl의 이름과 통일)
	private AdminQnaService adminQnaService; // 빈 수동 등록

	// 메인페이지로 이동
/*	@RequestMapping(value = "/main")
	public String list() {
		return "main";
	}*/

	// QNA 리스트
	@RequestMapping(value = "/adminQnaList") // 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView adminQnaList(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("/goods/detail"); 
		ModelAndView mv = new ModelAndView("admin_qna_list"); // jsp 경로 설정

		// 받아오는 현제페이지가 없으면 페이지 1부터시작
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) { // currentPage가 null 이거나 공백 이거나 0 일때.
			currentPage = 1;
			// 받아오는 현제페이지가 있으면 인트값으로해서 현제페이지 값설정
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//리스트
		List<Map<String, Object>> qnaList = adminQnaService.adminQnaList(commandMap.getMap()); // service단의 qnaList

		isSearch = request.getParameter("isSearch");

		if (isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			commandMap.put("searchNum", searchNum);
			commandMap.put("isSearch", isSearch);

			if (searchNum == 0) { // 상품번호
				qnaList = adminQnaService.adminQnaSearch0(commandMap.getMap());
			} else if (searchNum == 1) { // 제목
				qnaList = adminQnaService.adminQnaSearch1(commandMap.getMap());
			} else if (searchNum == 2) { // 작성자
				qnaList = adminQnaService.adminQnaSearch2(commandMap.getMap());
			} else if (searchNum == 3) { // 답변상태
				qnaList = adminQnaService.adminQnaSearch3(commandMap.getMap());
			}

			totalCount = qnaList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminQnaList.pulu", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
			startPage = ((currentPage - 1) / blockPage) * blockPage + 1;
			endPage = startPage + blockPage - 1;

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			qnaList = qnaList.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount); // 서비스 로직 결과를 mv에 담아 jsp에서 사용
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("qnaList", qnaList);

			mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
			mv.addObject("QNA_GOODS_NUM", commandMap.get("QNA_GOODS_NUM"));
			
			return mv;

		} else {

			totalCount = qnaList.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminQnaList.pulu");
			pagingHtml = page.getPagingHtml().toString();
			startPage = ((currentPage - 1) / blockPage) * blockPage + 1;
			endPage = startPage + blockPage - 1;

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			qnaList = qnaList.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("qnaList", qnaList);
			
			mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
			mv.addObject("QNA_GOODS_NUM", commandMap.get("QNA_GOODS_NUM"));

			return mv;
		}
	}

	
	
	// QNA 상세보기
	@RequestMapping(value = "/adminQnaDetail")
	public ModelAndView adminQnaDetail(CommandMap commandMap) throws Exception { 
		ModelAndView mv = new ModelAndView("/adminQnaDetail");

		Map<String, Object> map = adminQnaService.adminQnaDetail(commandMap.getMap());

		mv.addObject("map", map); 
		
		return mv;
	}

	// QNA 삭제하기
	@RequestMapping(value = "/adminQnaDelete")
	public ModelAndView adminQnaDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminQnaList.pulu");

		adminQnaService.adminQnaDelete(commandMap.getMap(), request);
		Map<String, Object> map = adminQnaService.adminQnaDetail(commandMap.getMap());

		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		mv.addObject("currentPage", currentPage);
		
		return mv;
	}

	// 관리자 QNA 수정폼 이동
	@RequestMapping(value = "/adminQnaUpdateForm", method = RequestMethod.POST)
	public ModelAndView adminQnaUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin_qna_list");

		Map<String, Object> map = adminQnaService.adminQnaDetail(commandMap.getMap());// 상세보기 정보를 맵에서 받아옴
		// 상세보기에 들어있는 정보를 꺼내서 mv에 다시저장

		mv.addObject("map", map);
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		mv.addObject("currentPage", currentPage);
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);

		System.out.println(map);
		System.out.println("수정완료");
		return mv;
	}

	// 관리자 QNA 수정
	@RequestMapping(value = "/adminQnaUpdate", method = RequestMethod.POST)
	public ModelAndView adminQnaUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminQnaList.pulu");
		
		// 줄바꿈 시 <br/> 넣기
		String QNA_COMMENT = (String)commandMap.get("QNA_COMMENT");
		QNA_COMMENT = QNA_COMMENT.replace("\r\n", "<br/>");
		commandMap.getMap().put("QNA_COMMENT", QNA_COMMENT);		
		
		adminQnaService.adminQnaUpdate(commandMap.getMap(), request);
		Map<String, Object> map = adminQnaService.adminQnaDetail(commandMap.getMap());

		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		mv.addObject("map", map);
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		mv.addObject("currentPage", currentPage);

		return mv;
	}

	// QNA 코멘트 작성 - (수정)
	@RequestMapping(value = "/adminQnaComInsert", method = RequestMethod.POST)
	public ModelAndView adminQnaComInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminQnaList.pulu");

		// 줄바꿈 시 <br/> 넣기
		String QNA_COMMENT = (String)commandMap.get("QNA_COMMENT");
		QNA_COMMENT = QNA_COMMENT.replace("\r\n", "<br/>");
		commandMap.getMap().put("QNA_COMMENT", QNA_COMMENT);		
		
		adminQnaService.adminQnaComInsert(commandMap.getMap(), request);
		adminQnaService.adminQnaComStatus(commandMap.getMap(), request);
		Map<String, Object> map = adminQnaService.adminQnaDetail(commandMap.getMap());

		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		mv.addObject("QNA_GOODS_NUM", commandMap.get("QNA_GOODS_NUM"));
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		mv.addObject("currentPage", currentPage);
		
		return mv;
	}

	// QNA 코멘트 수정
	@RequestMapping(value = "/adminQnaComUpdate")
	public ModelAndView adminQnaComUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminQnaList.pulu");

		// 줄바꿈 시 <br/> 넣기
		String QNA_COMMENT = (String)commandMap.get("QNA_COMMENT");
		QNA_COMMENT = QNA_COMMENT.replace("\r\n", "<br/>");
		commandMap.getMap().put("QNA_COMMENT", QNA_COMMENT);		
		
		adminQnaService.adminQnaComUpdate(commandMap.getMap(), request);
		Map<String, Object> map = adminQnaService.adminQnaDetail(commandMap.getMap());

		mv.addObject("map", map);
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		mv.addObject("QNA_GOODS_NUM", commandMap.get("QNA_GOODS_NUM"));
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		mv.addObject("currentPage", currentPage);

		return mv;
	}

	// QNA 코멘트 삭제
	@RequestMapping(value = "/adminQnaComDelete")
	public ModelAndView adminQnaComDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminQnaList.pulu");
				
		adminQnaService.adminQnaComDelete(commandMap.getMap(), request);
		Map<String, Object> map = adminQnaService.adminQnaDetail(commandMap.getMap());
		
		mv.addObject("map", map);
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		mv.addObject("QNA_GOODS_NUM", commandMap.get("QNA_GOODS_NUM"));
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		mv.addObject("currentPage", currentPage);

		return mv;
	}
	 
	
}
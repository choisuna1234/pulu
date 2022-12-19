package pulu.com.qna;
//소영 : QNA 페이지 

import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import pulu.com.common.Paging;
import pulu.com.common.CommandMap;

@Controller // 웹 클라이언트에서 들어온 요청을 해당 비지니스 로직 호출, 수행결과와 함께 응답해주는 Dispatcher
public class QnaController {
	Logger log = Logger.getLogger(this.getClass());

	// 검색 넘보, 값을 받아오는 변수
	private int searchNum;
	private String isSearch;

	// 페이징 관련 변수
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 5;
	private int blockPage = 5;
	private int startPage;
	private int endPage;
	private String pagingHtml;
	private Paging page;

	@Resource(name = "QnaService") // Service 영억 접근을 위한 선언(qnaServiceImpl의 이름과 통일)
	private QnaService qnaService; // 빈 수동 등록

	// QNA 리스트
	@RequestMapping(value = "/qnaList") // 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView qnaList(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("/goods/detail");
		ModelAndView mv = new ModelAndView("/board/qnaList"); // jsp 경로 설정

		// 받아오는 현제페이지가 없으면 페이지 1부터시작
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) { // currentPage가 null 이거나 공백 이거나 0 일때.
			currentPage = 1;
			// 받아오는 현제페이지가 있으면 인트값으로해서 현제페이지 값설정
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<Map<String, Object>> qnaList = qnaService.qnaList(commandMap.getMap()); // service단의 qnaList
		Map<String, Object> map = qnaService.qnaDetail(commandMap.getMap());
																
		// 로직 호출
		isSearch = request.getParameter("isSearch");

		if (isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			commandMap.put("searchNum", searchNum);
			commandMap.put("isSearch", isSearch);

			if (searchNum == 0) { // 제목
				qnaList = qnaService.qnaSearch0(commandMap.getMap());
			} else if (searchNum == 1) { //작성자
				qnaList = qnaService.qnaSearch1(commandMap.getMap());
			}

			totalCount = qnaList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "qnaList.pulu", searchNum, isSearch);
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
			mv.addObject("map", map);

			return mv;

		} else {

			totalCount = qnaList.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "qnaList.pulu");
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
			mv.addObject("map", map);
			
			return mv;
		}
	}

	
	// QNA 등록폼
	@RequestMapping(value = "/qnaInsertForm") // 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView qnaInsertForm(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("/goods/detail");
		ModelAndView mv = new ModelAndView("/board/qnaList"); // jsp 경로 설정

		return mv;
	}

	
	//  QNA 등록
	@RequestMapping(value = "/qnaInsert", method = RequestMethod.POST) // 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView qnaInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/Detail.pulu?GOODS_NUM="+commandMap.get("GOODS_NUM")+"#here3"); // 등록 후 리스트로 돌아갈 수 있도록 리다이렉트를 통한 jsp 경로 설정

		HttpSession session = request.getSession();
		String QNA_ID = (String) session.getAttribute("loginId");
		commandMap.getMap().put("QNA_ID", QNA_ID);
		
		System.out.println(commandMap.get("GOODS_NUM"));
		qnaService.qnaInsert(commandMap.getMap(), request); // service단의 qnaInsert 로직 호출
		Map<String, Object> map = qnaService.qnaDetail(commandMap.getMap());
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("map", map);
		
		return mv;
	}

	
	// QNA 상세보기
	@RequestMapping(value = "/qnaDetail")
	public ModelAndView qnaDetail(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("/goods/detail");
		ModelAndView mv = new ModelAndView("/board/qnaDetail");

		Map<String, Object> map = qnaService.qnaDetail(commandMap.getMap());

		mv.addObject("map", map);
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);

		return mv;
	}

	
	// QNA 수정폼 이동
	@RequestMapping(value = "/qnaUpdateForm")
	public ModelAndView qnaUpdateForm(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("/goods/detail");
		ModelAndView mv = new ModelAndView("/goods/comment/qnaUpdateForm");
		
		Map<String, Object> map = qnaService.qnaDetail(commandMap.getMap());// 상세보기 정보를 맵에서 받아옴
		// 상세보기에 들어있는 정보를 꺼내서 mv에 다시저장

		mv.addObject("map", map);
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		
		System.out.println(map);
		System.out.println("수정완료");
		return mv;
	}

	
	// QNA 수정
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public ModelAndView qnaUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/qnaList.pulu");

		
		 
		qnaService.qnaUpdate(commandMap.getMap(), request);
		Map<String, Object> map = qnaService.qnaDetail(commandMap.getMap());// 상세보기 정보를 맵에서 받아옴
		// 상세보기에 들어있는 정보를 꺼내서 mv에 다시저장

		mv.addObject("map", map);
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		mv.addObject("QNA_GOODS_NUM",commandMap.get("QNA_GOODS_NUM"));
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		
		System.out.println(commandMap.get("QNA_NUM"));
		System.out.println(commandMap.get("QNA_GOODS_NUM"));
		System.out.println(commandMap.get("QNA_CONTENTS"));
		
		return mv;
	}

	
	// QNA 삭제하기
	@RequestMapping(value = "/qnaDelete")
	public ModelAndView qnaDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/Detail.pulu?GOODS_NUM="+commandMap.get("GOODS_NUM")+"#here3");

		qnaService.qnaDelete(commandMap.getMap(), request);
		Map<String, Object> map = qnaService.qnaDetail(commandMap.getMap());// 상세보기 정보를 맵에서 받아옴
		// 상세보기에 들어있는 정보를 꺼내서 mv에 다시저장

		mv.addObject("map", map);

		return mv;
	}
}

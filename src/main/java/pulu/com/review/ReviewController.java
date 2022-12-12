package pulu.com.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pulu.com.common.CommandMap;
import pulu.com.common.Paging;

@Controller
public class ReviewController {

	@Resource(name="ReviewService")
	private ReviewService reviewService;
	
	// 검색 변수
	private int searchNum;
	private String isSearch;
	// 페이징 변수	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private int startPage;
	private int endPage;
	private String pagingHtml;
	private Paging page;
	
	// 후기 등록
	@RequestMapping(value="/reviewInsert")
	public ModelAndView reviewInsert(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		String ORDER_MEMBER_ID = (String) session.getAttribute("ORDER_MEMBER_ID");
		mv.addObject("ORDER_MEMBER_ID", ORDER_MEMBER_ID);
		mv.addObject("ORDER_GOODS_NUM", commandMap.get("ORDER_GOODS_NUM"));
		
		Map<String, Object> reviewInsertCheck = reviewService.reviewInsertCheck(commandMap.getMap());
		
		if(reviewInsertCheck==null) {
		mv.addObject("message", "상품을 구매하지 않았거나, 상품이 배송완료된 상태가 아닙니다.");
		mv.setViewName("redirect:/goodsList");
			
		List<Map<String, Object>> reviewList = reviewService.reviewList(commandMap.getMap());
		mv.addObject("reviewList", reviewList);	
		return mv;
		}
		
		mv.addObject("reivew", reviewInsertCheck);
		mv.setViewName("redirect:/goodsDetail");
		return mv;
	}
	
	// 후기 등록폼
	@RequestMapping(value="/reviewInsertForm")
	public ModelAndView reviewInsertForm(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		reviewService.reviewInsert(commandMap.getMap());
		List<Map<String, Object>> reviewList = reviewService.reviewList(commandMap.getMap());
		
		mv.addObject("reivewList", reviewList);
		mv.setViewName("reviewInsert");
		return mv;
	}
	
	// 후기 목록
	@RequestMapping(value="reviewList")
	public ModelAndView reviewList(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/board/reviewList");
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
			//받아오는 현제페이지가 없으면 페이지 1부터시작
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//받아오는 현제페이지가 있으면 인트값으로해서 현제페이지 값설정
		}
		
		//mv.addObject("goods", commandMap.getMap()); // 상품 정보 가져오기
		List<Map<String, Object>> reviewList = reviewService.reviewList(commandMap.getMap());
        isSearch = request.getParameter("isSearch");
		
		if(isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			commandMap.put("searchNum", searchNum);
			commandMap.put("isSearch", isSearch);
			
			if(searchNum == 0) { // 내용
				reviewList = reviewService.reviewSearch0(commandMap.getMap());
			}
		
		
		totalCount = reviewList.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "reviewList.pulu", searchNum, isSearch);
		pagingHtml = page.getPagingHtml().toString();
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;
				
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		reviewList = reviewList.subList(page.getStartCount(), lastCount);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("reviewList", reviewList);
		
		return mv;
		
		}else{
		System.out.println(reviewList);
		mv.addObject("reviewList", reviewList);
		mv.setViewName("/board/reviewList");
		
		totalCount = reviewList.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "reviewList.pulu");
		pagingHtml = page.getPagingHtml().toString();
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;
				
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		reviewList = reviewList.subList(page.getStartCount(), lastCount);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("reviewList", reviewList);
		
		
		return mv;
	}
	}
	
	// 후기 수정
	@RequestMapping(value="/reviewUpdate")
	public ModelAndView reviewUpdate(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		// 상품 정보 가져오기
	
		mv.setViewName("/board/reviewUpdate");
		return mv;
	}
	
	// 후기 수정폼
	@RequestMapping(value="/reviewUpdateForm")
	public ModelAndView reviewUpdateForm(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("redirect:/board/reviewUpdate.pulu");
		return mv;
	}
	
	
	// 후기 삭제
	@RequestMapping(value="/reviewDelete")
	public ModelAndView reviewDelete(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		reviewService.reviewDelete(commandMap.getMap());
		
		mv.addObject("REVIEW_GOODS_NUM", commandMap.get("REVIEW_GOODS_NUM"));
		mv.setViewName("redirect:/goodsDetail");
		return mv;
	}	
}

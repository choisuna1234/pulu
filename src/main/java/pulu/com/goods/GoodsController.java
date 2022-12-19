package pulu.com.goods;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import pulu.com.common.CommandMap;
import pulu.com.common.Paging;
import pulu.com.qna.QnaService;

@Controller
@Log4j
public class GoodsController {
	
	// 검색 값을 받아오는 변수
	private String goodsSearch;
	
	// 페이징 관련 변수
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 12;
	private int blockPage = 5;
	private int startPage;
	private int endPage;
	private String pagingHtml;
	private Paging page;
	private int categoryNo;
	
	// 옵션 검색 변수
    private String searchOption;
    private int optionNum;
    
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	private QnaService qnaService;

	@RequestMapping(value="/List")
	public ModelAndView List(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("goods_list");
		log.info("검색전=============");
		
		// 받아오는 현제페이지가 없으면 페이지 1부터시작
				if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
						|| request.getParameter("currentPage").equals("0")) { // currentPage가 null 이거나 공백 이거나 0 일때.
					currentPage = 1;
					// 받아오는 현제페이지가 있으면 인트값으로해서 현제페이지 값설정
				} else {				
					currentPage = Integer.parseInt(request.getParameter("currentPage"));				
				}

				List<Map<String, Object>> list = goodsService.goodsList(Integer.parseInt(request.getParameter("categoryNo")));
			   
				categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
				goodsSearch = request.getParameter("goodsSearch");
				
				
				//옵션별 검색
//				searchOption = request.getParameter("searchOption");
//                
//				if (searchOption !=  null) {
//				    optionNum = Integer.parseInt(request.getParameter("optionNum"));				
//				    commandMap.put("searchOption",searchOption);
//				    commandMap.put("optionNum",optionNum);
//					
//					if(optionNum == 0) { // 낮은가격
//						list = goodsService.searchOption0(commandMap.getMap(),Integer.parseInt(request.getParameter("categoryNo")));
//					} else if(optionNum == 1) { // 높은가격
//						list = goodsService.searchOption1(commandMap.getMap(),Integer.parseInt(request.getParameter("categoryNo")));
//					} else if(optionNum == 2) { // 추천상품
//						list = goodsService.searchOption2(commandMap.getMap(),Integer.parseInt(request.getParameter("categoryNo")));
//					}  
//						
//						mv.addObject("list", list);
//						mv.addObject("categoryNo", categoryNo);
//						mv.addObject("optionNum", optionNum);
//						mv.addObject("goodsList",list);
//						return mv;
//	             }
					
								
				if (goodsSearch != null) {
					
				    
					commandMap.put("goodsSearch", goodsSearch);
					commandMap.put("categoryNo", categoryNo);
	  
					list = goodsService.goodsSearch(commandMap.getMap(),Integer.parseInt(request.getParameter("categoryNo")));
					log.info("검색 후 =========================" + list);
					
					totalCount = list.size();
					page = new Paging( currentPage, totalCount, blockCount, blockPage, "List.pulu", goodsSearch, categoryNo,request);
					pagingHtml = page.getPagingHtml().toString();
					startPage = ((currentPage - 1) / blockPage) * blockPage + 1;
					endPage = startPage + blockPage - 1;

					int lastCount = totalCount;

					if (page.getEndCount() < totalCount)
						
						lastCount = page.getEndCount() + 1;
					
					list = list.subList(page.getStartCount(), lastCount);

					mv.addObject("totalCount", totalCount); // 서비스 로직 결과를 mv에 담아 jsp에서 사용
					mv.addObject("pagingHtml", pagingHtml);
					mv.addObject("currentPage", currentPage);
					mv.addObject("goodsSearch", goodsSearch);
					mv.addObject("startPage", startPage);
					mv.addObject("endPage", endPage);
					mv.addObject("list", list);
					mv.addObject("categoryNo", categoryNo);
					mv.addObject("goodsList",list);
					return mv;

				} else {

					totalCount = list.size();
					
					
					page = new Paging( currentPage , totalCount, blockCount, blockPage, "List.pulu",categoryNo, request);
					pagingHtml = page.getPagingHtml().toString();
					startPage = ((currentPage - 1) / blockPage) * blockPage + 1;
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
					mv.addObject("list", list);
					mv.addObject("categoryNo", categoryNo);

	  mv.addObject("goodsList",list);
	  
	  return mv; 
	  }
	}
	 
	

	@RequestMapping(value="/Detail")
	public ModelAndView Detail(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("goods_detail");
		System.out.println(commandMap.getMap());
		Map<String,Object> map = goodsService.goodsDetail(commandMap.getMap());
		
		List<Map<String, Object>> reviewList = goodsService.reviewList(commandMap.getMap());
			
		//List<Map<String, Object>> qnaList = qnaService.qnaList(commandMap.getMap());
		
		mv.addObject("reviewList", reviewList);
		//mv.addObject("qnaList", qnaList);

		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		return mv;
	}
	
	// 후기 등록
		@RequestMapping(value="/Detail", method=RequestMethod.POST)
		public ModelAndView reviewInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("goods_detail");
				
			HttpSession session = request.getSession();
			String REVIEW_ID = (String) session.getAttribute("loginId");
			commandMap.getMap().put("REVIEW_ID", REVIEW_ID);
			String ORDER_MEMBER_ID = (String) session.getAttribute("loginId");
			commandMap.getMap().put("ORDER_MEMBER_ID", ORDER_MEMBER_ID);
			commandMap.getMap().put("ORDER_GOODS_NUM", commandMap.get("GOODS_NUM"));

		    Map<String, Object> reviewInsertCheck0 = goodsService.reviewInsertCheck0(commandMap.getMap());
		    Map<String, Object> reviewInsertCheck1 = goodsService.reviewInsertCheck1(commandMap.getMap());
			
			if(reviewInsertCheck0 == null ^ reviewInsertCheck1 != null) {

		    mv.setViewName("goods_detail");
		    	  
		    Map<String,Object> map = goodsService.goodsDetail(commandMap.getMap());
		    	  
	        List<Map<String, Object>> reviewList = goodsService.reviewList(commandMap.getMap());
			
			//List<Map<String, Object>> qnaList = qnaService.qnaList(commandMap.getMap());
		
			mv.addObject("reviewList", reviewList);
			//mv.addObject("qnaList", qnaList);
			mv.addObject("map", map.get("map"));
			mv.addObject("list", map.get("list"));
		    return mv;
			}
			
			goodsService.reviewInsert(commandMap.getMap(), request);
				
			Map<String,Object> map = goodsService.goodsDetail(commandMap.getMap());
			
			List<Map<String, Object>> reviewList = goodsService.reviewList(commandMap.getMap());
			
			//List<Map<String, Object>> qnaList = qnaService.qnaList(commandMap.getMap());
		
			mv.addObject("reviewInsertCheck0", reviewInsertCheck0);
			mv.addObject("reviewInsertCheck1", reviewInsertCheck1);
			mv.addObject("reviewList", reviewList);
			//mv.addObject("qnaList", qnaList);
			mv.addObject("map", map.get("map"));
			mv.addObject("list", map.get("list"));
			return mv;
			
		}
		
		// 후기 수정
		@RequestMapping(value="/reviewUpdate")
		public ModelAndView reviewUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView();
				
			HttpSession session = request.getSession();
			String REVIEW_ID = (String) session.getAttribute("loginId");
			commandMap.getMap().put("REVIEW_ID", REVIEW_ID);
			
			goodsService.reviewUpdate(commandMap.getMap());
				
			return mv;
		}
			
			
		// 후기 삭제
		@RequestMapping(value="/reviewDelete")
		public ModelAndView reviewDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("goods_detail");
			
			goodsService.reviewDelete(commandMap.getMap());
					
			Map<String,Object> map = goodsService.goodsDetail(commandMap.getMap());
	   	  
		    List<Map<String, Object>> reviewList = goodsService.reviewList(commandMap.getMap());
				
		    //List<Map<String, Object>> qnaList = qnaService.qnaList(commandMap.getMap());
			
			mv.addObject("reviewList", reviewList);
			//mv.addObject("qnaList", qnaList);
			mv.addObject("map", map.get("map"));
			mv.addObject("list", map.get("list"));
			
			return mv;
		}	


}

package pulu.com.goods;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import pulu.com.common.CommandMap;
import pulu.com.common.Paging;
import pulu.com.common.qnaPaging;
import pulu.com.qna.QnaService;
import pulu.com.review.ReviewService;

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

	// 페이징 관련 변수
	private int currentPage1 = 1;
	private int totalCount1;
	private int blockCount1 = 10;
	private int blockPage1 = 10;
	private int startPage1;
	private int endPage1;
	private String pagingHtml1;
	private qnaPaging page1;

	// 옵션 검색 변수
	private String searchOption;
	private int optionNum;

	@Resource(name = "goodsService")
	private GoodsService goodsService;

	@Resource(name = "ReviewService")
	private ReviewService reviewService;

	@Resource(name = "QnaService")
	private QnaService qnaService;

	@RequestMapping(value = "/List")
	public ModelAndView List(CommandMap commandMap, HttpServletRequest request) throws Exception {
	 blockCount = 12;
	 blockPage = 5;
		
		ModelAndView mv = new ModelAndView("goods_list");
		//log.info("검색전=============");

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
		
		searchOption = request.getParameter("searchOption");

		//옵션별 정렬
		
		  if (searchOption != null) { 
			  
			  optionNum = Integer.parseInt(request.getParameter("optionNum"));
		      
			  commandMap.put("optionNum", optionNum); 
			  commandMap.put("searchOption", searchOption);
			  commandMap.put("categoryNo", categoryNo);
		
		  if(optionNum == 1) { // 제목 list =
		  
		  list = goodsService.searchOption0(commandMap.getMap(),Integer.parseInt(request.getParameter("categoryNo"))); 
		   
		  } 
		  else if(optionNum == 2) { // 내용 
		  list = goodsService.searchOption1(commandMap.getMap(),Integer.parseInt(request.getParameter("categoryNo"))); 
		    
		  } 
		  else if(optionNum == 3) { // 내용 
		  list = goodsService.searchOption2(commandMap.getMap(),Integer.parseInt(request.getParameter("categoryNo"))); 
		  } 
		   
		  log.info("optionNum========" + optionNum);
		  log.info("searchOption========" + searchOption);
		  totalCount = list.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "List.pulu", optionNum,searchOption, categoryNo, request);
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
			mv.addObject("searchOption", searchOption); 
		    mv.addObject("optionNum", optionNum);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("goodsList", list);
			mv.addObject("categoryNo", categoryNo);
			
			return mv;
		 
		  
		  }

		if (goodsSearch != null) {

			commandMap.put("goodsSearch", goodsSearch);
			commandMap.put("categoryNo", categoryNo);

			list = goodsService.goodsSearch(commandMap.getMap(), Integer.parseInt(request.getParameter("categoryNo")));
			log.info("검색 후 =========================" + list);

			totalCount = list.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "List.pulu", goodsSearch, categoryNo,
					request);
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
			mv.addObject("goodsList", list);
			return mv;

		} else {

			totalCount = list.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "List.pulu", categoryNo, request);
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

			mv.addObject("goodsList", list);

			return mv;
		}
	}
	
	@RequestMapping(value = "/Detail")
	public ModelAndView Detail(CommandMap commandMap, HttpServletRequest request) throws Exception {

		blockCount = 5;

		ModelAndView mv = new ModelAndView("goods_detail");
		Map<String, Object> map = goodsService.goodsDetail(commandMap.getMap());

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
			// 받아오는 현재페이지가 없으면 페이지 1부터시작
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 받아오는 현제페이지가 있으면 인트값으로해서 현재페이지 값설정
		}


			List<Map<String, Object>> reviewList = reviewService.reviewList(commandMap.getMap());

			totalCount = reviewList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage,
					"Detail.pulu?GOODS_NUM=" + commandMap.get("GOODS_NUM"), request);
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
			
			
			// QNA 페이징
			if (request.getParameter("currentPage1") == null || request.getParameter("currentPage1").trim().isEmpty()
					|| request.getParameter("currentPage1").equals("0")) {
				currentPage1 = 1;
				// 받아오는 현재페이지가 없으면 페이지 1부터시작
			} else {
				currentPage1 = Integer.parseInt(request.getParameter("currentPage1"));
				// 받아오는 현제페이지가 있으면 인트값으로해서 현재페이지 값설정
			}	
			
			List<Map<String, Object>> qnaList = qnaService.qnaList(commandMap.getMap());
			
			totalCount1 = qnaList.size();
			page1 = new qnaPaging(currentPage1, totalCount1, blockCount1, blockPage1,
					"Detail.pulu?GOODS_NUM=" + commandMap.get("GOODS_NUM"));
			pagingHtml1 = page1.getPagingHtml1().toString();
			System.out.println(pagingHtml1);
			startPage1 = ((currentPage1 - 1) / blockPage1) * blockPage1 + 1;
			endPage1 = startPage1 + blockPage1 - 1;
			
			int lastCount1 = totalCount1;
			
			if (page1.getEndCount1() < totalCount1)
				lastCount1 = page1.getEndCount1() + 1;
			
			qnaList = qnaList.subList(page1.getStartCount1(), lastCount1);
			

			
			mv.addObject("totalCount1", totalCount1);
			mv.addObject("pagingHtml1", pagingHtml1);
			mv.addObject("currentPage1", currentPage1);
			mv.addObject("startPage1", startPage1);
			mv.addObject("endPage1", endPage1);
			mv.addObject("qnaList", qnaList);
			
			mv.addObject("map", map.get("map"));
			mv.addObject("list", map.get("list"));

			return mv;
		}
	

	  @RequestMapping(value = "/allList")
      public ModelAndView allList(CommandMap commandMap, HttpServletRequest request) throws Exception {
     	 blockCount = 12;
     	 blockPage = 5;
     	 
     	 ModelAndView mv = new ModelAndView("goods_list");
     	 
     	// 받아오는 현제페이지가 없으면 페이지 1부터시작
  		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
  				|| request.getParameter("currentPage").equals("0")) { // currentPage가 null 이거나 공백 이거나 0 일때.
  			currentPage = 1;
  			// 받아오는 현제페이지가 있으면 인트값으로해서 현제페이지 값설정
  		} else {
  			currentPage = Integer.parseInt(request.getParameter("currentPage"));
  		}
     	 
     	 List<Map<String, Object>> list = goodsService.allGoodsList(commandMap.getMap());
     	 
				 goodsSearch = request.getParameter("goodsSearch"); 
  		
				
			     searchOption = request.getParameter("searchOption");
				  
				  //옵션별 정렬
				  
				  if (searchOption != null) {
				  
				  optionNum = Integer.parseInt(request.getParameter("optionNum"));
				  
				  commandMap.put("optionNum", optionNum); 
				  commandMap.put("searchOption", searchOption);
				  
				  commandMap.put("categoryNo", categoryNo);
				  
				  if(optionNum == 1) { //낮은 가격	 
				  
				  list = goodsService.searchAllOption0(commandMap.getMap());
				  
				  } else if(optionNum == 2) { //높은 가격
				   list = goodsService.searchAllOption1(commandMap.getMap());
				  }			  
		
				  totalCount = list.size(); 
				  page = new Paging(currentPage, totalCount, blockCount, blockPage, "allList.pulu", optionNum, searchOption, categoryNo);
				  pagingHtml = page.getPagingHtml().toString(); 
				  startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1; 
				  endPage = startPage + blockPage - 1;
				  
				  int lastCount = totalCount;
				  
				  if (page.getEndCount() < totalCount) lastCount = page.getEndCount() + 1;
				  
				  list = list.subList(page.getStartCount(), lastCount);
				  
				  mv.addObject("totalCount", totalCount); 
				  mv.addObject("pagingHtml", pagingHtml); 
				  mv.addObject("currentPage", currentPage);
				  mv.addObject("searchOption", searchOption); 
				  mv.addObject("optionNum", optionNum); 
				  mv.addObject("startPage", startPage); 
				  mv.addObject("endPage", endPage); 
				  mv.addObject("goodsList", list);
				  
				  
				  mv.addObject("categoryNo", categoryNo);
				  
				  return mv;
				  
				  
				  }
				 

  		if (goodsSearch != null) {

  			commandMap.put("goodsSearch", goodsSearch);
  			

  			list = goodsService.goodsAllSearch(commandMap.getMap());
  			
  			totalCount = list.size();
  			page = new Paging(currentPage, totalCount, blockCount, blockPage, "allList.pulu", goodsSearch );
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
  			mv.addObject("goodsList", list);
  			return mv;

  		} else {

  			totalCount = list.size();

  			page = new Paging(currentPage, totalCount, blockCount, blockPage, "allList.pulu");
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
  			mv.addObject("goodsList", list);

  			return mv;
  		}
      }
    }
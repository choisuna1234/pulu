package pulu.com.adminOrder;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pulu.com.common.CommandMap;
import pulu.com.common.Paging;

@Controller
public class AdminOrderController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "AdminOrderService")
	private AdminOrderService adminOrderService;
	
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

	/* --- 관리자 주문 관리 : 리스트 --- */ 
	@RequestMapping(value = "/adminOrderList")	// 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView adminOrderList(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("admin_order_list"); // jsp 경로 설정
		
		// 페이징 : 받아오는 현제페이지가 없으면 페이지 1부터시작
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) { //currentPage가 null 이거나 공백 이거나 0 일때.
			currentPage = 1;
		// 받아오는 현제페이지가 있으면 인트값으로해서 현제페이지 값설정
		} else { //currentPage에 담겨오는 값이 있다면 담겨오는 값으로 설정.
			currentPage = Integer.parseInt(request.getParameter("currentPage")); 
		}
		
		List<Map<String,Object>>orderList = adminOrderService.adminOrderList(commandMap.getMap());	// service단의 adminFaqList 로직 호출		
		Map<String,Object> map = new HashMap<String,Object>();
		
		// 검색 & 카테고리 값이 있을 경우
		if(request.getParameter("searchNum") != null){
			isSearch = request.getParameter("isSearch");//검색어
			System.out.println(isSearch);
			map.put("isSearch",isSearch);
			searchNum = Integer.parseInt(request.getParameter("searchNum").toString()); //검색 구분 번호
		
			if(searchNum == 0){ //주문 검색(주문상태) - 상단 카테고리
				orderList = adminOrderService.orderSearch0(map);
			}
			else if(searchNum == 1){//주문 검색(주문자) 
				orderList = adminOrderService.orderSearch1(map);
			}
			else if(searchNum == 2){//주문 검색(주문번호)
				orderList = adminOrderService.orderSearch2(map);
			}
			
			totalCount = orderList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminOrderList.pulu",searchNum,isSearch);
			pagingHtml = page.getPagingHtml().toString();
			startPage = ((currentPage - 1) / blockPage) * blockPage + 1;
			endPage = startPage + blockPage - 1;

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			orderList = orderList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("totalCount", totalCount); // 서비스 로직 결과를 mv에 담아 jsp에서 사용
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("orderList", orderList);
			mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));
			
			
			return mv;
			
			
		// 검색 & 카테고리 값이 없을 경우 
		} else {
		totalCount = orderList.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminOrderList.pulu");
		pagingHtml = page.getPagingHtml().toString();
		startPage = ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		orderList = orderList.subList(page.getStartCount(), lastCount);
		
		mv.addObject("orderList",orderList);
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));
		
		return mv;
		}
	}
	
	
	// 관리자 주문관리 상세보기
	@RequestMapping(value = "/adminOrderDetail")
	public ModelAndView adminOrderDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/adminBoard/adminOrderDetail");

//		int ORDER_NUM = (Integer)commandMap.get("ORDER_NUM");
		List<Map<String, Object>> list = adminOrderService.adminOrderDetail2(commandMap.getMap());
		Map<String, Object> map = adminOrderService.adminOrderDetail(commandMap.getMap());
		
		mv.addObject("list", list);
		mv.addObject("map", map);
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		mv.addObject("currentPage", currentPage);
		mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));

		return mv;
	}

	
	/* --- 관리자 주문 관리 : 수정 --- */
	// 관리자 주문 관리 수정폼 이동
	@RequestMapping(value = "/adminOrderUpdateForm", method = RequestMethod.POST)
	public ModelAndView adminOrderUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/adminBoard/adminOrderUpdate");

		//Map<String, Object> map = adminOrderService.adminOrderDetail(commandMap.getMap());// 상세보기 정보를 맵에서 받아옴
		// 상세보기에 들어있는 정보를 꺼내서 mv에 다시저장
		
//		List<Map<String,Object>> map = adminOrderService.adminOrderList(commandMap.getMap());
		List<Map<String, Object>> list = adminOrderService.adminOrderDetail2(commandMap.getMap());
		Map<String, Object> map = adminOrderService.adminOrderDetail(commandMap.getMap());

		mv.addObject("list", list);
		mv.addObject("map", map);
		mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));
		
		System.out.println(map);
		System.out.println("수정완료");
		return mv;
	}

	
	// 관리자 주문 관리 수정
	@RequestMapping(value = "/adminOrderUpdate", method = RequestMethod.POST)
	public ModelAndView adminOrderUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminOrderDetail.pulu");
		System.out.println(commandMap.getMap());
		adminOrderService.adminOrderUpdate(commandMap.getMap(), request);
		Map<String , Object> map = adminOrderService.adminOrderDetail(commandMap.getMap());

		mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));
		mv.addObject("map", map);
//		mv.addObject("isSearch", isSearch);
//		mv.addObject("searchNum", searchNum);
//		mv.addObject("currentPage", currentPage);

		return mv;
	}
	
	
	// --- 관리자 주문 관리 : 삭제지만 수정 --- //
	@RequestMapping(value = "/adminOrderDelete")
	public ModelAndView adminOrderDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminOrderList.pulu");
		
		System.out.println(request.getParameter("ORDER_NUM"));
		adminOrderService.adminOrderDelete(commandMap.getMap(), request);
		Map<String , Object> map = adminOrderService.adminOrderDetail(commandMap.getMap());
		
		mv.addObject("map", map);
		
		return mv;
	}
	
	
	
}


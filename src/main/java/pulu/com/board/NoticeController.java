package pulu.com.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pulu.com.common.CommandMap;
import pulu.com.common.Paging;

@Controller
public class NoticeController {

Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="NoticeService")
	private NoticeService NoticeService;
	
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
	
	// 공지사항 목록
		@RequestMapping(value="/noticeList") 
		public ModelAndView noticeList(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("notice_list");
			
			if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
					|| request.getParameter("currentPage").equals("0")) {
				currentPage = 1;
				//받아오는 현제페이지가 없으면 페이지 1부터시작
			} else {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
				//받아오는 현제페이지가 있으면 인트값으로해서 현제페이지 값설정
			}
			
			List<Map<String, Object>> noticeList = NoticeService.noticeList(commandMap.getMap());
			//System.out.println(noticeList);
			isSearch = request.getParameter("isSearch");
			
			if(isSearch != null) {
				searchNum = Integer.parseInt(request.getParameter("searchNum"));
				commandMap.put("searchNum", searchNum);
				commandMap.put("isSearch", isSearch);
				
				if(searchNum == 0) { // 제목
					noticeList = NoticeService.noticeSearch0(commandMap.getMap());
				} else if(searchNum == 1) { // 내용
					noticeList = NoticeService.noticeSearch1(commandMap.getMap());
				}
			
			
			totalCount = noticeList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "noticeList.pulu", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
			startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
			endPage = startPage + blockPage - 1;

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			noticeList = noticeList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("noticeList", noticeList);
			
			return mv;
			
			}else{
		

			totalCount = noticeList.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "noticeList.pulu");
			pagingHtml = page.getPagingHtml().toString();
			startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
			endPage = startPage + blockPage - 1;

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			noticeList = noticeList.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("noticeList", noticeList);
			
			return mv;
		}  
		}
	
	// 공지사항 상세보기
	@RequestMapping(value="/noticeDetail") 
	public ModelAndView noticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("notice_detail");
		
		Map<String, Object> map = NoticeService.noticeDetail(commandMap.getMap());
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("map", map);
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		//mv.addObject("map", map.get("map"));
		//mv.addObject("list", map.get("list"));
		
		return mv;
		}
}
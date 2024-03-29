package pulu.com.adminCS;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pulu.com.common.CommandMap;
import pulu.com.common.Paging;

@Controller
public class AdminReviewController {

	@Resource(name="AdminReviewService")
	private AdminReviewService adminReviewService;
	
	// 페이징 변수	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private int startPage;
	private int endPage;
	private String pagingHtml;
	private Paging page;
	
	// 관리자 후기 답변 등록
	@RequestMapping(value="/adminReviewComInsert")
	public ModelAndView adminReviewComInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminReviewList.pulu");
		adminReviewService.adminReviewComInsert(commandMap.getMap());
		
		return mv;
	}
	
	
	// 관리자 후기 리스트 
	@RequestMapping(value="/adminReviewList")
	public ModelAndView adminReviewList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("admin_review_list");
		
		List<Map<String, Object>> adminReviewList = adminReviewService.adminReviewList(commandMap.getMap());
		
		
		totalCount = adminReviewList.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminReviewList.pulu");
		pagingHtml = page.getPagingHtml().toString();
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;
				
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		adminReviewList = adminReviewList.subList(page.getStartCount(), lastCount);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("adminReviewList", adminReviewList);
		
		
		return mv;
	}
	
	
	// 관리자 후기 답변 삭제
	@RequestMapping(value="/adminReviewComDelete")
	public ModelAndView adminReviewComDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminReviewList.pulu");
				
		adminReviewService.adminReviewComDelete(commandMap.getMap());
		
		return mv;
	}
	
	// 관리자 후기 삭제
	@RequestMapping(value = "/adminReviewDelete")
	public ModelAndView reviewDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminReviewList.pulu");

		adminReviewService.adminReviewDelete(commandMap.getMap());

		return mv;
	}
}

package pulu.com.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pulu.com.common.CommandMap;

@Controller
public class ReviewController {

	@Resource(name = "ReviewService")
	private ReviewService reviewService;

	// 후기 등록
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public ModelAndView reviewInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/Detail.pulu?GOODS_NUM=" + commandMap.get("GOODS_NUM") + "#here2");

		HttpSession session = request.getSession();
		String REVIEW_ID = (String) session.getAttribute("loginId");
		commandMap.getMap().put("REVIEW_ID", REVIEW_ID);
		String ORDER_MEMBER_ID = (String) session.getAttribute("loginId");
		commandMap.getMap().put("ORDER_MEMBER_ID", ORDER_MEMBER_ID);

		Map<String, Object> reviewInsertCheck0 = reviewService.reviewInsertCheck0(commandMap.getMap());
		Map<String, Object> reviewInsertCheck1 = reviewService.reviewInsertCheck1(commandMap.getMap());

		if (reviewInsertCheck0 == null ^ reviewInsertCheck1 != null) {

			List<Map<String, Object>> reviewList = reviewService.reviewList(commandMap.getMap());

			mv.addObject("reviewList", reviewList);

			return mv;
		}

		reviewService.reviewInsert(commandMap.getMap(), request);

		commandMap.getMap().put("GOODS_NUM", commandMap.get("GOODS_NUM"));
		System.out.println(commandMap.get("GOODS_NUM"));
		List<Map<String, Object>> reviewList = reviewService.reviewList(commandMap.getMap());

		mv.addObject("reviewInsertCheck0", reviewInsertCheck0);
		mv.addObject("reviewInsertCheck1", reviewInsertCheck1);
		mv.addObject("reviewList", reviewList);
		return mv;

	}

	// 후기 목록
	@RequestMapping(value = "/reviewList")
	public ModelAndView reviewList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/Detail.pulu?GOODS_NUM=" + commandMap.get("GOODS_NUM") + "#here2");

		List<Map<String, Object>> reviewList = reviewService.reviewList(commandMap.getMap());

		mv.addObject("reviewList", reviewList);

		return mv;

	}

	// 후기 수정폼
	@RequestMapping(value = "/reviewUpdateForm")
	public ModelAndView reviewUpdateForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/goods/comment/reviewUpdateForm");
		
		Map<String, Object> map = reviewService.reviewDetail(commandMap.getMap());
		
		mv.addObject("map", map);

		return mv;
	}

	// 후기 수정
	@RequestMapping(value = "/reviewUpdate", method=RequestMethod.POST)
	public ModelAndView reviewUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/Detail.pulu?GOODS_NUM=" + commandMap.get("GOODS_NUM") + "#here2");
		
		reviewService.reviewUpdate(commandMap.getMap(), request);
		
		return mv;
	}

	// 후기 삭제
	@RequestMapping(value = "/reviewDelete")
	public ModelAndView reviewDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/Detail.pulu?GOODS_NUM=" + commandMap.get("GOODS_NUM") + "#here2");

		reviewService.reviewDelete(commandMap.getMap());

		return mv;
	}

}

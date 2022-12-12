
package pulu.com.order;

import java.util.ArrayList;
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


@Controller
@Log4j
public class OrderController {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	// 선민: 단일상품 주문 - 주문페이지에 필요한 정보(회원, 상품, 이미지)를 DB로부터 가져오기
	@RequestMapping(value = "/selectOrderGoodsInfo", method = RequestMethod.POST)
	public ModelAndView selectOrderGoodsInfo (CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("pOrder");
		
		// pOrder.jsp
		List<Map<String, Object>> mapList = orderService.selectOrderGoodsInfo(commandMap.getMap(), session);
		Map<String, Object> memberMap = mapList.get(0); 
		Map<String, Object> goodsMap = mapList.get(1);
		goodsMap.put("SELECTED_GOODS_AMOUNT", commandMap.getMap().get("SELECTED_GOODS_AMOUNT"));
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		list.add(goodsMap);
		
		mv.addObject("list", list);
		mv.addObject("map", memberMap);
		log.info("\nCONT -> 최종 list의 내용 == \n" + list);
		log.info("\nCONT -> 최종 map의 내용 == \n" + memberMap);
		
		return mv;
	}
	
	@RequestMapping(value = "/orderResult", method = RequestMethod.POST)
	public ModelAndView orderResult(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("orderResult");
		log.info("orderResult========="+commandMap.getMap());
		orderService.insertOrderGoods(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value = "/pOrder", method = RequestMethod.GET)
	public String insertOrderGoods(CommandMap commandMap) throws Exception {
		orderService.insertOrderGoods(commandMap.getMap());
		return "redirect:/orderResult.pulu";
	}
	
	
	// 선민: 장바구니 전체 주문
//	@RequestMapping(value = "/selectOrderBasketAllInfo", method = RequestMethod.POST)
//	public ModelAndView selectOrderBasketAllInfo (CommandMap commandMap, HttpSession session) throws Exception {
//
//		ModelAndView mv = new ModelAndView("pOrder");
		
//		List<Map<String, Object>> list = (List<Map<String, Object>>)commandMap.get("LIST");
		
//		log.info(list);
		
//		// pOrder.jsp
//		List<Map<String, Object>> mapList = orderService.selectOrderGoodsInfo(commandMap.getMap(), session);
//		Map<String, Object> memberMap = mapList.get(0); 
//		Map<String, Object> goodsMap = mapList.get(1);
//		goodsMap.put("SELECTED_GOODS_AMOUNT", commandMap.getMap().get("SELECTED_GOODS_AMOUNT"));
//		
//		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
//		list.add(goodsMap);
//		
//		mv.addObject("list", list);
//		mv.addObject("map", memberMap);
//		log.info("\nCONT -> 최종 list의 내용 == \n" + list);
//		log.info("\nCONT -> 최종 map의 내용 == \n" + memberMap);
		
//		return mv;
//	}


}

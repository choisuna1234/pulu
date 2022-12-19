
package pulu.com.order;

import java.util.ArrayList;
import java.util.HashMap;
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
import pulu.com.basket.BasketListDTO;
import pulu.com.common.CommandMap;


@Controller
@Log4j
public class OrderController {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	// 선민: 상품상세페이지->단일상품 주문: 주문페이지에 필요한 정보(회원, 상품, 이미지)를 DB로부터 가져오기
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
	
	
	// 선민: 장바구니리스트->선택상품 주문페이지로 이동
	@RequestMapping(value = "/pOrderBasketList")
	public ModelAndView pOrderBasketList(HttpSession session, BasketListDTO bl) throws Exception {
		
		ModelAndView mv = new ModelAndView("pOrder");
		Map<String, Object> memberMap = new HashMap<String, Object>();
		memberMap = orderService.selectMemberInfo(memberMap, session);
		List<Map<String, Object>> goodslist = orderService.getGoodsInfo(bl.getOrders());
		
		log.info("01. 세션 == " + session.getAttribute("loginId"));
		log.info("02. ListDTO == " + bl.getOrders());
		log.info("03. memberMap == " + memberMap);
		log.info("04. goodslist == " + goodslist);

		mv.addObject("map", memberMap);
		mv.addObject("list", goodslist);
		return mv;
	}
	

	//선아: 주문 값 DB에 넣기 + 주문 완료 창으로 넘어가기
	@RequestMapping(value = "/orderResult", method = RequestMethod.POST)
	public ModelAndView orderResult(HttpServletRequest request, CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",commandMap.getMap());
		mv.setViewName("orderResult");
		log.info("orderResult========="+commandMap.getMap());
		
		commandMap.getMap().put("ORDER_MEMBER_ID", (String)session.getAttribute("loginId"));
		
		orderService.insertOrderGoods(commandMap.getMap());
		return mv;
	}

	


}

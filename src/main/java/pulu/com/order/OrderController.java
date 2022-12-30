
package pulu.com.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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

	@Resource(name = "orderService")
	private OrderService orderService;

	// 선민: (페이지이동) 상품상세페이지->주문페이지: 단일상품주문에 필요한 정보 DB로부터 가져오기
	@RequestMapping(value = "/orderByDetail", method = RequestMethod.POST)
	public ModelAndView orderByDetail(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("pOrder");

		// pOrder.jsp
		List<Map<String, Object>> mapList = orderService.orderByDetail(commandMap.getMap(), session);
		Map<String, Object> memberMap = mapList.get(0);
		Map<String, Object> goodsMap = mapList.get(1);
		goodsMap.put("SELECTED_GOODS_AMOUNT", commandMap.getMap().get("SELECTED_GOODS_AMOUNT"));

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list.add(goodsMap);

		mv.addObject("list", list);
		mv.addObject("map", memberMap);
		log.info("\n01. 최종 list의 내용 == " + list);
		log.info("\n02. 최종 map의 내용 == " + memberMap);

		return mv;
	}

	// 선민: (페이지이동) 장바구니리스트->주문페이지: 선택된 모든 상품의 정보 DB로부터 가져오기
	@RequestMapping(value = "/orderByBasket", method = RequestMethod.POST)
	public ModelAndView orderByBasket(HttpSession session, BasketListDTO bl) throws Exception {

		ModelAndView mv = new ModelAndView("pOrder");
		Map<String, Object> memberMap = new HashMap<String, Object>();
		memberMap = orderService.selectMemberInfo(memberMap, session);
		List<Map<String, Object>> goodslist = orderService.selectGoodsInfo(bl.getOrders());

		log.info("\n01. 세션 == " + session.getAttribute("loginId"));
		log.info("\n02. ListDTO == " + bl.getOrders());
		log.info("\n03. memberMap == " + memberMap);
		log.info("\n04. goodslist == " + goodslist);

		mv.addObject("map", memberMap);
		mv.addObject("list", goodslist);
		return mv;
	}

	// 선민: (DB 삽입) 주문페이지->주문처리->주문완료페이지: ORDER_DELI, ORDER_GOODS 테이블에 값 넣기 + 주문완료 페이지로 이동
	@RequestMapping(value = "/orderResult", method = RequestMethod.POST)
	public ModelAndView orderResult(HttpSession session, OrderListDTO ol) throws Exception {
		
		ModelAndView mv = new ModelAndView("orderResult");
		orderService.insertOrder(ol.getOrders());
		
		Map<String, Object> orderDeliMap = orderService.selectOrderDeliSuccess(session);
		List<Map<String, Object>> orderGoodslist = orderService.selectOrderGoodsSuccess(orderDeliMap);
		
		mv.addObject("map", orderDeliMap);
		mv.addObject("list", orderGoodslist);
		return mv;
		
	}

}

package pulu.com.basket;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import pulu.com.common.CommandMap;

@Controller
@Log4j
public class BasketController {

	@Resource(name = "basketService")
	private BasketService basketService;

	// 선민: 장바구니 중복 확인
	@RequestMapping(value = "/checkBasket", method = RequestMethod.POST)
	public ModelAndView checkBasket(CommandMap commandMap, HttpSession session) throws Exception {

		Map<String, Object> basketMap = basketService.checkBasket(commandMap.getMap(), session);
		ModelAndView mv = new ModelAndView();

		if (basketMap == null) { // 장바구니 새로 등록 (insert)
			basketService.insertBasket(commandMap.getMap(), session);
			mv.setViewName("redirect:/Detail.pulu?GOODS_NUM=" + commandMap.get("GOODS_NUM") + "#goodsimg");
			return mv;
		} else { // 기존 장바구니 수량 추가 (update)
			basketMap.put("SELECTED_GOODS_AMOUNT", commandMap.getMap().get("SELECTED_GOODS_AMOUNT"));
			basketService.updateBasket(basketMap, session);
			mv.setViewName("redirect:/Detail.pulu?GOODS_NUM=" + commandMap.get("GOODS_NUM") + "#goodsimg");
			return mv;
		}
	}

	// 선민: 기존 장바구니 수량 추가 (update)
	@RequestMapping(value = "/updateBasket", method = RequestMethod.POST)
	public void updateBasket(CommandMap commandMap, HttpSession session) throws Exception {
		basketService.updateBasket(commandMap.getMap(), session);
	}

	// 선민: 장바구니 전체 삭제 (delete)
	@RequestMapping(value = "/deleteBasketAll")
	public String deleteBasketAll(HttpSession session) throws Exception {
		basketService.deleteBasketAll(session);
		return "basketList";
	}

	// 선민: 장바구니 넣기 완료 팝업 (계속 쇼핑, 장바구니 이동)
	@RequestMapping(value = "/basketSuccess")
	public String basketCheck() throws Exception {
		return "/basket/basketSuccess";
	}

	// 명식: 장바구니 리스트 불러오기
	@RequestMapping(value = "/basketList")
	public ModelAndView basketList(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("basketList");
		List<Map<String, Object>> list = basketService.basketList(commandMap.getMap(), session);
		mv.addObject("list", list);
		System.out.println(list);
		return mv;
	}

}
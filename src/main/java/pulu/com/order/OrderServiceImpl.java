package pulu.com.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.velocity.runtime.log.Log;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import pulu.com.basket.BasketListDTO;
import pulu.com.basket.BasketListItemDTO;

@Service("orderService")
@Log4j
public class OrderServiceImpl implements OrderService {

	@Resource(name = "orderDAO")
	private OrderDAO orderDAO;

	@Override // 선민: 주문페이지에 필요한 정보(회원, 상품, 이미지)를 DB로부터 가져오기
	public List<Map<String, Object>> selectOrderGoodsInfo(Map<String, Object> map, HttpSession session)
			throws Exception {

		// 선민: 세션에 존재하는 아이디를 DB에 접근할 map에 추가
		String loginId = String.valueOf((session.getAttribute("loginId")));
		map.put("ID", loginId);

		return orderDAO.selectOrderGoodsInfo(map);
	}

//	@Override
//	public List<Map<String, Object>> selectBasketListInfo(Map<String, Object> map, HttpSession session) {
//		String loginId = String.valueOf((session.getAttribute("loginId")));
//		map.put("ID", loginId);
//		
//		return orderDAO.selectBasketListInfo(map);
//	}

	@Override
	public List<Map<String, Object>> getGoodsInfo(List<BasketListItemDTO> orders) throws Exception {

		Map<String, Object> goodsMap = new HashMap<String, Object>();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();

		for (BasketListItemDTO ord : orders) {
			goodsMap = orderDAO.getGoodsInfo(ord.getGOODS_NUM());
			log.info("001 ord 수량 == " + ord.getSELECTED_GOODS_AMOUNT());
			log.info("002 goodsMap == " + goodsMap);
			log.info("003 ord.getGOODS_NUM == " + ord.getGOODS_NUM());
			goodsMap.put("SELECTED_GOODS_AMOUNT", ord.getSELECTED_GOODS_AMOUNT());
			result.add(goodsMap);
		}
		log.info("쿼리결과를 list에 add");
		return result;
	}

	@Override
	public Map<String, Object> selectMemberInfo(Map<String, Object> map, HttpSession session) throws Exception {
		String loginId = String.valueOf((session.getAttribute("loginId")));
		map.put("ID", loginId);

		return orderDAO.selectMemberInfo(map);
	}

	// 선아: 주문 값 DB에 넣기
	public void insertOrderGoods(Map<String, Object> map) throws Exception {
		orderDAO.insertOrderGoods(map);

	}

}

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

	@Override // 선민: 상세페이지에서 주문페이지 이동 시 회원, 상품, 이미지 정보를 DB로부터 가져오기
	public List<Map<String, Object>> orderByDetail(Map<String, Object> map, HttpSession session)
			throws Exception {

		// 선민: 세션에 존재하는 아이디를 DB에 접근할 map에 추가
		String loginId = String.valueOf((session.getAttribute("loginId")));
		map.put("ID", loginId);

		return orderDAO.orderByDetail(map);
	}

	@Override // 선민: 장바구니리스트->주문페이지 값 넘기기
	public List<Map<String, Object>> selectGoodsInfo(List<BasketListItemDTO> orders) throws Exception {

		Map<String, Object> goodsMap = new HashMap<String, Object>();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();

		for (BasketListItemDTO ord : orders) {
			goodsMap = orderDAO.selectGoodsInfo(ord.getGOODS_NUM());
			log.info("\nord 수량 == " + ord.getSELECTED_GOODS_AMOUNT());
			log.info("\ngoodsMap == " + goodsMap);
			log.info("\nord.getGOODS_NUM == " + ord.getGOODS_NUM());
			goodsMap.put("SELECTED_GOODS_AMOUNT", ord.getSELECTED_GOODS_AMOUNT());
			result.add(goodsMap);
		}
		return result;
	}

	@Override
	public Map<String, Object> selectMemberInfo(Map<String, Object> map, HttpSession session) throws Exception {
		String loginId = String.valueOf((session.getAttribute("loginId")));
		map.put("ID", loginId);

		return orderDAO.selectMemberInfo(map);
	}

	@Override // 선민: 주문 값 DB에 넣기
	public void insertOrder(List<OrderListItemDTO> orders) throws Exception {

		// 각 테이블마다 각자의 쿼리로 전달할 Map을 생성
		Map<String, Object> orderDeli = new HashMap<String, Object>();
		Map<String, Object> orderGoods = new HashMap<String, Object>();

		// 주문인, 수령인 정보는 1회만 필요하므로 첫번째 객체만 꺼내서 만들어놓은 Map에 값을 복사
		OrderListItemDTO ordFirst = orders.get(0);
		orderDeli.put("ORDER_PAY_TYPE", ordFirst.getORDER_PAY_TYPE());
		orderDeli.put("ORDER_MEMBER_ID", ordFirst.getORDER_MEMBER_ID());
		orderDeli.put("ORDER_MEMBER_NAME", ordFirst.getORDER_MEMBER_NAME());
		orderDeli.put("ORDER_MEMBER_PHONE", ordFirst.getORDER_MEMBER_PHONE());
		orderDeli.put("ORDER_MEMBER_ZIPCODE", ordFirst.getORDER_MEMBER_ZIPCODE());
		orderDeli.put("ORDER_MEMBER_ADDR1", ordFirst.getORDER_MEMBER_ADDR1());
		orderDeli.put("ORDER_MEMBER_ADDR2", ordFirst.getORDER_MEMBER_ADDR2());
		orderDeli.put("ORDER_RECEIVE_NAME", ordFirst.getORDER_RECEIVE_NAME());
		orderDeli.put("ORDER_RECEIVE_PHONE", ordFirst.getORDER_RECEIVE_PHONE());
		orderDeli.put("ORDER_RECEIVE_ZIPCODE", ordFirst.getORDER_RECEIVE_ZIPCODE());
		orderDeli.put("ORDER_RECEIVE_ADDR1", ordFirst.getORDER_RECEIVE_ADDR1());
		orderDeli.put("ORDER_RECEIVE_ADDR2", ordFirst.getORDER_RECEIVE_ADDR2());
		orderDeli.put("ORDER_MEMO", ordFirst.getORDER_MEMO());
		orderDeli.put("ORDER_SUM_MONEY", ordFirst.getORDER_SUM_MONEY());

		// ORDER_DELI 테이블에 1회 insert
		int order_num = orderDAO.insertOrderDeli(orderDeli);

		
		
		
		
		
		// 상품 정보는 구매한 상품의 종류만큼 필요, 따라서 Map에 값을 복사하고 쿼리를 실행하는 과정을 객체의 개수만큼 반복
		for (OrderListItemDTO ord : orders) {
			orderGoods.put("ORDER_NUM", order_num);
			orderGoods.put("ORDER_GOODS_NUM", ord.getORDER_GOODS_NUM());
			orderGoods.put("ORDER_GOODS_NAME", ord.getORDER_GOODS_NAME());
			orderGoods.put("ORDER_GOODS_PRICE", ord.getORDER_GOODS_PRICE());
			orderGoods.put("ORDER_GOODS_AMOUNT", ord.getORDER_GOODS_AMOUNT());
			orderGoods.put("ORDER_GOODS_IMAGE", ord.getORDER_GOODS_IMAGE());
			orderGoods.put("ORDER_MEMBER_ID", ord.getORDER_MEMBER_ID());

			// ORDER_GOODS 테이블에 반복 insert
			orderDAO.insertOrderGoods(orderGoods);
		}
	}

	@Override // 선민: 주문완료페이지에 보여줄 주문건에 대한 정보 DB로부터 가져오기
	public Map<String, Object> selectOrderDeliSuccess(HttpSession session) throws Exception {

		// 세션에 존재하는 아이디를 DB에 접근할 map에 추가
		String loginId = String.valueOf((session.getAttribute("loginId")));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ID", loginId);

		return orderDAO.selectOrderDeliSuccess(map);
	}
	
	@Override // 선민: 주문완료페이지에 보여줄 모든 주문상품 정보 DB로부터 가져오기
	public List<Map<String, Object>> selectOrderGoodsSuccess(Map<String, Object> map) throws Exception {

		return orderDAO.selectOrderGoodsSuccess(map);
	}

}

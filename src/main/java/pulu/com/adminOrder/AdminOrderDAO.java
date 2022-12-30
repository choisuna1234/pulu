package pulu.com.adminOrder;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("AdminOrderDAO")
public class AdminOrderDAO extends AbstractDAO {
	
	

	//관리자 주문처리 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminOrderList(Map<String, Object> map) throws Exception {
//		return (List<Map<String,Object>>) selectList("adminOrder.orderList", map);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Integer> orderNumList = selectList("adminOrder.selectOrderNum", map);
		log.info("\n01. 모든 주문번호 == " + orderNumList);

		for (int ORDER_NUM : orderNumList) {
			Map<String, Object> orderDeliMap = (Map<String, Object>) selectOne("adminOrder.selectOrderDeliByOrderNum",
					ORDER_NUM);
			log.info("\n02. 주문번호 " + ORDER_NUM + "의 주문정보 == " + orderDeliMap);
			List<Map<String, Object>> orderGoodsList = (List<Map<String, Object>>) selectList(
					"adminOrder.selectOrderGoodsByOrderNum", ORDER_NUM);
			log.info("\n03. 주문번호 " + ORDER_NUM + "의 상품항목 수 == " + orderGoodsList.size());
			orderDeliMap.put("ORDER_GOODS_COUNT", orderGoodsList.size());
			orderDeliMap.put("ORDER_GOODS_NUM", orderGoodsList.get(0).get("ORDER_GOODS_NUM"));
			orderDeliMap.put("ORDER_GOODS_NAME", orderGoodsList.get(0).get("ORDER_GOODS_NAME"));
			orderDeliMap.put("ORDER_GOODS_IMAGE", orderGoodsList.get(0).get("ORDER_GOODS_IMAGE"));
			list.add(orderDeliMap);
		}
		return list;
	}

	//관리자 주문처리 검색 0(주문상태) - 상단 카테고리	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderSearch0(Map<String, Object> map) throws Exception {
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> orderNumList = selectList("adminOrder.orderSearch0", map);
		log.info("\n01. 모든 주문번호 == " + orderNumList);

		for (Map<String, Object> ORDER_NUM : orderNumList) {
			Map<String, Object> orderDeliMap = (Map<String, Object>) selectOne("adminOrder.selectOrderDeliByOrderNum",
					ORDER_NUM);
			log.info("\n02. 주문번호 " + ORDER_NUM + "의 주문정보 == " + orderDeliMap);
			List<Map<String, Object>> orderGoodsList = (List<Map<String, Object>>) selectList(
					"adminOrder.selectOrderGoodsByOrderNum", ORDER_NUM);
			log.info("\n03. 주문번호 " + ORDER_NUM + "의 상품항목 수 == " + orderGoodsList.size());
			orderDeliMap.put("ORDER_GOODS_COUNT", orderGoodsList.size());
			orderDeliMap.put("ORDER_GOODS_NUM", orderGoodsList.get(0).get("ORDER_GOODS_NUM"));
			orderDeliMap.put("ORDER_GOODS_NAME", orderGoodsList.get(0).get("ORDER_GOODS_NAME"));
			orderDeliMap.put("ORDER_GOODS_IMAGE", orderGoodsList.get(0).get("ORDER_GOODS_IMAGE"));
			list.add(orderDeliMap);
		}
		return list;
	}

	//관리자 주문처리 검색 1(주문자 ID)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderSearch1(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> orderNumList = selectList("adminOrder.orderSearch1", map);
		log.info("\n01. 모든 주문번호 == " + orderNumList);

		for (Map<String, Object> ORDER_NUM : orderNumList) {
			Map<String, Object> orderDeliMap = (Map<String, Object>) selectOne("adminOrder.selectOrderDeliByOrderNum",
					ORDER_NUM);
			log.info("\n02. 주문번호 " + ORDER_NUM + "의 주문정보 == " + orderDeliMap);
			List<Map<String, Object>> orderGoodsList = (List<Map<String, Object>>) selectList(
					"adminOrder.selectOrderGoodsByOrderNum", ORDER_NUM);
			log.info("\n03. 주문번호 " + ORDER_NUM + "의 상품항목 수 == " + orderGoodsList.size());
			orderDeliMap.put("ORDER_GOODS_COUNT", orderGoodsList.size());
			orderDeliMap.put("ORDER_GOODS_NUM", orderGoodsList.get(0).get("ORDER_GOODS_NUM"));
			orderDeliMap.put("ORDER_GOODS_NAME", orderGoodsList.get(0).get("ORDER_GOODS_NAME"));
			orderDeliMap.put("ORDER_GOODS_IMAGE", orderGoodsList.get(0).get("ORDER_GOODS_IMAGE"));
			list.add(orderDeliMap);
		}
		return list;
	}

	//관리자 주문처리 검색 2(주문번호
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderSearch2(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> orderNumList = selectList("adminOrder.orderSearch2", map);
		log.info("\n01. 모든 주문번호 == " + orderNumList);

		for (Map<String, Object> ORDER_NUM : orderNumList) {
			Map<String, Object> orderDeliMap = (Map<String, Object>) selectOne("adminOrder.selectOrderDeliByOrderNum",
					ORDER_NUM);
			log.info("\n02. 주문번호 " + ORDER_NUM + "의 주문정보 == " + orderDeliMap);
			List<Map<String, Object>> orderGoodsList = (List<Map<String, Object>>) selectList(
					"adminOrder.selectOrderGoodsByOrderNum", ORDER_NUM);
			log.info("\n03. 주문번호 " + ORDER_NUM + "의 상품항목 수 == " + orderGoodsList.size());
			orderDeliMap.put("ORDER_GOODS_COUNT", orderGoodsList.size());
			orderDeliMap.put("ORDER_GOODS_NUM", orderGoodsList.get(0).get("ORDER_GOODS_NUM"));
			orderDeliMap.put("ORDER_GOODS_NAME", orderGoodsList.get(0).get("ORDER_GOODS_NAME"));
			orderDeliMap.put("ORDER_GOODS_IMAGE", orderGoodsList.get(0).get("ORDER_GOODS_IMAGE"));
			list.add(orderDeliMap);
		}
		return list;
	}

	//관리자 주문처리 디테일
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminOrderDetail(Map<String, Object> map) throws Exception {

		return (Map<String, Object>) selectOne("adminOrder.orderDetail", map);
	}

	// 관리자 주문처리 디테일
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminOrderDetail2(Map<String, Object> map) throws Exception {
//		return (List<Map<String, Object>>) selectList("adminOrder.orderDetail2", map);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> orderNumList = selectList("adminOrder.orderDetail2", map);
		log.info("\n01. 모든 주문번호 == " + orderNumList);

		for (Map<String, Object> ORDER_NUM : orderNumList) {
			Map<String, Object> orderDeliMap = (Map<String, Object>) selectOne("adminOrder.selectOrderDeliByOrderNum",
					ORDER_NUM);
			log.info("\n02. 주문번호 " + ORDER_NUM + "의 주문정보 == " + orderDeliMap);
			List<Map<String, Object>> orderGoodsList = (List<Map<String, Object>>) selectList(
					"adminOrder.selectOrderGoodsByOrderNum", ORDER_NUM);
			log.info("\n03. 주문번호 " + ORDER_NUM + "의 상품항목 수 == " + orderGoodsList.size());
			orderDeliMap.put("ORDER_GOODS_COUNT", orderGoodsList.size());
			orderDeliMap.put("ORDER_GOODS_NUM", orderGoodsList.get(0).get("ORDER_GOODS_NUM"));
			orderDeliMap.put("ORDER_GOODS_NAME", orderGoodsList.get(0).get("ORDER_GOODS_NAME"));
			orderDeliMap.put("ORDER_GOODS_IMAGE", orderGoodsList.get(0).get("ORDER_GOODS_IMAGE"));
			orderDeliMap.put("ORDER_GOODS_PRICE", orderGoodsList.get(0).get("ORDER_GOODS_PRICE"));
			list.add(orderDeliMap);
		}
		return list;
	}
	

	//관리자 주문처리 수정
	@SuppressWarnings("unchecked")
	public void adminOrderUpdate(Map<String, Object> map) throws Exception {
		update("adminOrder.orderUpdate",map);
	}

	//관리자 주문처리 삭제
	@SuppressWarnings("unchecked")
	public void adminOrderDelete(Map<String, Object> map) throws Exception {
		update("adminOrder.orderDelete",map);
//		update("adminOrder.goodsAmountUpdate",map);
	}
	
	//주문 처리 시 수량 업데이트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsAmountSelect(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminOrder.goodsAmountSelect", map);
	}

	public void goodsAmountUpdate(Map<String, Object> map) throws Exception {
		update("adminOrder.goodsAmountUpdate",map);
		
	}
	

}

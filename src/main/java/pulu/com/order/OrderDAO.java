package pulu.com.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO {

	// 선민: 상세페이지에서 주문페이지 이동 시 회원, 상품, 이미지 정보를 DB로부터 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderByDetail(Map<String, Object> map) throws Exception {

		// map안의 아이디에 해당하는 회원정보를 모두 select
		Map<String, Object> memberMap = (Map<String, Object>) selectOne("member.selectId", map.get("ID"));

		// map안의 상품번호에 해당하는 상품정보(번호/이름/가격)와 이미지정보 1개를 select
		Map<String, Object> goodsMap = (Map<String, Object>) selectOne("order.orderByDetail", map);

		// pOrder.jsp의 구조에 맞게 list로 반환
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		mapList.add(memberMap);
		mapList.add(goodsMap);

		return mapList;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBasketListInfo(Map<String, Object> map) throws Exception {
		return selectList("basket.basketList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception {
		Map<String, Object> memberMap = (Map<String, Object>) selectOne("member.selectId", map.get("ID"));
		return memberMap;
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsInfo(int GOODS_NUM) throws Exception {
		Map<String, Object> memberMap = (Map<String, Object>) selectOne("order.selectGoodsInfo", GOODS_NUM);
		return memberMap;
	}

	
	
	
	// 선민: 주문/수령인 값 DB에 넣기 (ORDER_DELI)
	public int insertOrderDeli(Map<String, Object> map) throws Exception {

		int order_num = 0;
		
		
		insert("order.insertOrderDeli", map);
		order_num = (int) map.get("ORDER_NUM"); // selectKey로 ORDER_DELI 테이블의 ORDER_NUM(PK)값을 뽑아오기
		log.info("\n\n셀렉트 키로 뽑아온 주문번호 == " + order_num + "\n\n");

		return order_num; // selectKey로 뽑아온 값을 리턴 (ORDER_GOODS 테이블의 ORDER_NUM에도 같은 값을 삽입하기 위함)
	}

	
	
	
	
	
	
	// 선민: 주문상품 값 DB에 넣기 (ORDER_GOODS) + 장바구니 삭제 + 수량변경
	public void insertOrderGoods(Map<String, Object> map) throws Exception {
		insert("order.insertOrderGoods", map);

		int checkResult = (int) selectOne("basket.checkBasketOrder", map);
		log.info("\n01. select 결과 == " + checkResult);
		if (checkResult != 0) {
			delete("basket.deleteBasketOrder", map);
		}
		update("goods.updateGoodsAmount", map);

	}

	// 선민: 주문완료페이지에 보여줄 주문건에 대한 정보 DB로부터 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderDeliSuccess(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("order.selectOrderDeliSuccess", map);
	}
	
	// 선민: 주문완료페이지에 보여줄 모든 주문상품 정보 DB로부터 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderGoodsSuccess(Map<String, Object> map) {
		return selectList("order.selectOrderGoodsSuccess", map);
	}

}

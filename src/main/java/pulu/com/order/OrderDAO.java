package pulu.com.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.aspectj.org.eclipse.jdt.internal.compiler.env.AccessRestriction;
import org.springframework.stereotype.Repository;

import pulu.com.basket.BasketListItemDTO;
import pulu.com.common.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO {

	// 선민: 주문페이지에 필요한 정보(회원, 상품, 이미지)를 DB로부터 가져오기 
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderGoodsInfo(Map<String, Object> map) throws Exception {
		
		// map안의 아이디에 해당하는 회원정보를 모두 select 
		Map<String, Object> memberMap = (Map<String, Object>)selectOne("member.selectId", map.get("ID"));
		
		// map안의 상품번호에 해당하는 상품정보(번호/이름/가격)와 이미지정보 1개를 select 
		Map<String, Object> goodsMap = (Map<String, Object>)selectOne("order.selectOrderGoodsInfo", map);

		// pOrder.jsp의 구조에 맞게 list로 반환
		List<Map<String, Object>> mapList = new ArrayList<Map<String,Object>>();
		mapList.add(memberMap);
		mapList.add(goodsMap);
		
		log.info("\nDAO -> 임시 mapList의 내용 == \n" + mapList);
		
		return mapList;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBasketListInfo(Map<String, Object> map) throws Exception {
		return selectList("basket.basketList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception {
		Map<String, Object> memberMap = (Map<String, Object>)selectOne("member.selectId", map.get("ID"));
		return memberMap;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getGoodsInfo(int GOODS_NUM) throws Exception {
		Map<String, Object> memberMap = (Map<String, Object>)selectOne("order.getGoodsInfo", GOODS_NUM);
		return memberMap;		
	}
	
	//선아: 주문 값 DB에 넣기
	public void insertOrderGoods (Map<String, Object> map) throws Exception {
		insert("order.insertOrderGoods", map);
	}
	
	

}

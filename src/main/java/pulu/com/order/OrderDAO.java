package pulu.com.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.aspectj.org.eclipse.jdt.internal.compiler.env.AccessRestriction;
import org.springframework.stereotype.Repository;

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

//		memberMap.put("GOODS_NUM", goodsMap.get("GOODS_NUM"));  
//		memberMap.put("GOODS_NAME", goodsMap.get("GOODS_NAME"));  
//		memberMap.put("GOODS_PRICE", goodsMap.get("GOODS_PRICE"));  
//		memberMap.put("IMAGE_STORED", goodsMap.get("IMAGE_STORED"));
//		memberMap.put("SELECTED_GOODS_AMOUNT", map.get("SELECTED_GOODS_AMOUNT"));

		// pOrder.jsp의 구조에 맞게 list로 반환
		List<Map<String, Object>> mapList = new ArrayList<Map<String,Object>>();
		mapList.add(memberMap);
		mapList.add(goodsMap);
		
		log.info("\nDAO -> 임시 mapList의 내용 == \n" + mapList);
		
		return mapList;
	}
	
	
	public void insertOrderGoods (Map<String, Object> map) throws Exception {
		insert("order.insertOrderGoods", map);
	}
	
	

}

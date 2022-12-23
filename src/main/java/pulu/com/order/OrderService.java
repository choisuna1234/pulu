package pulu.com.order;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import pulu.com.basket.BasketListItemDTO;

public interface OrderService {
	
	// 선민: 상세페이지에서 주문페이지 이동 시 회원, 상품, 이미지 정보를 DB로부터 가져오기
	public List<Map<String, Object>> selectOrderGoodsInfo(Map<String, Object> map, HttpSession session)
			throws Exception;
	
	// 선민: 장바구니에서 주문페이지 이동 시 회원정보 DB로부터 가져오기
	public Map<String, Object> selectMemberInfo(Map<String, Object> map, HttpSession session) throws Exception;

	// 선민: 장바구니에서 주문페이지로 넘길 상품목록 정보를 DB로부터 가져오기
	public List<Map<String, Object>> selectGoodsInfo(List<BasketListItemDTO> orders) throws Exception;

	// 선민: 주문 값 DB에 넣기
	void insertOrder(List<OrderListItemDTO> orders) throws Exception;
}

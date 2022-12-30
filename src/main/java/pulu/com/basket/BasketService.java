package pulu.com.basket;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import pulu.com.common.CommandMap;

public interface BasketService {

	// 선민: 사용자가 선택한 상품번호와 수량, 상품이미지를 DB에 등록
	public void insertBasket(Map<String, Object> map, HttpSession session) throws Exception ;

	// 명식: 장바구니 중복 확인
	public Map<String, Object> basketCheck(Map<String, Object> map, HttpSession session) throws Exception;

	// 명식: 장바구니 수량 변경
	public void updateBasket(Map<String, Object> map, HttpSession session) throws Exception ;

	// 선민: 장바구니 수량 변경 (+, -가 아닌 값을 대체하는 방식의 변경)
	public int updateCount(Map<String, Object> map) throws Exception;

	// 명식: 장바구니 리스트 불러오기
	public List<Map<String, Object>> basketList(Map<String, Object> map, HttpSession session) throws Exception;
	
	// 선민: 장바구니 전체 삭제
	public void deleteBasketAll(HttpSession session) throws Exception;

	// 선민: 장바구니 선택 삭제
	public void deleteBasketSelect(List<BasketListItemDTO> orders);
	
}

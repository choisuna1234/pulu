package pulu.com.basket;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface BasketService {

	// 선민: 사용자가 선택한 상품번호와 수량, 상품이미지를 DB에 등록
	void insertBasket(Map<String, Object> map, HttpSession session) throws Exception ;

	// 명식: 장바구니 중복 확인
	Map<String, Object> checkBasket(Map<String, Object> map, HttpSession session) throws Exception;

	// 명식: 장바구니 수량 변경
	void updateBasket(Map<String, Object> map, HttpSession session) throws Exception ;

	// 명식: 장바구니 리스트 불러오기
	public List<Map<String, Object>> basketList(Map<String, Object> map, HttpSession session) throws Exception;
	
	// 선민: 장바구니 전체 삭제
	void deleteBasketAll(HttpSession session) throws Exception ;

}

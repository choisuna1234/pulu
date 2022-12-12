package pulu.com.order;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface OrderService {
	
	// 선민: 주문페이지에 필요한 정보(회원, 상품, 이미지)를 DB로부터 가져오기
	List<Map<String, Object>> selectOrderGoodsInfo(Map<String, Object> map, HttpSession session) throws Exception ;
	
	void insertOrderGoods(Map<String, Object> map) throws Exception;

}

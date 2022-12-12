package pulu.com.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;


@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Resource(name = "orderDAO")
	private OrderDAO orderDAO;

	@Override // 선민: 주문페이지에 필요한 정보(회원, 상품, 이미지)를 DB로부터 가져오기
	public List<Map<String, Object>> selectOrderGoodsInfo(Map<String, Object> map, HttpSession session) throws Exception {
		
		// 선민: 세션에 존재하는 아이디를 DB에 접근할 map에 추가
		String loginId = String.valueOf((session.getAttribute("loginId")));
		map.put("ID", loginId);
		
		return orderDAO.selectOrderGoodsInfo(map);
		
		}
	
	
	public void insertOrderGoods (Map<String, Object> map) throws Exception {
		orderDAO.insertOrderGoods(map);
	
		
	}
	
	
}

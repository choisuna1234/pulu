package pulu.com.basket;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service("basketService")
@Log4j
public class BasketServiceImpl implements BasketService {

	@Resource(name = "basketDAO")
	private BasketDAO basketDAO;

	
	@Override // 선민: 장바구니 중복 확인
	public Map<String, Object> checkBasket(Map<String, Object> map, HttpSession session) throws Exception {
		String loginId = String.valueOf((session.getAttribute("loginId")));
		map.put("LOGIN_ID", loginId);
		
		return basketDAO.checkBasket(map);
	}

	
	@Override // 선민: 사용자가 선택한 상품번호와 수량, 상품이미지를 DB에 등록
	public void insertBasket(Map<String, Object> map, HttpSession session) throws Exception {
		String loginId = String.valueOf((session.getAttribute("loginId")));
		map.put("LOGIN_ID", loginId);

		log.info("\nService - 장바구니 상품번호 == " + map.get("GOODS_NUM"));
		log.info("\nService - 장바구니 상품수량 == " + map.get("SELECTED_GOODS_AMOUNT"));
		log.info("\nService - 요청한 회원 아이디 == " + map.get("LOGIN_ID"));
		basketDAO.insertBasket(map);
	}

	@Override // 명식: 장바구니 수량 변경
	public void updateBasket(Map<String, Object> map, HttpSession session) throws Exception {
		basketDAO.updateBasket(map);
	}

	@Override // 명식: 장바구니 리스트 불러오기
	public List<Map<String, Object>> basketList(Map<String, Object> map, HttpSession session) throws Exception {
		String loginId = String.valueOf((session.getAttribute("loginId")));
		map.put("LOGIN_ID", loginId);
		
		return basketDAO.basketList(map);
	}

	@Override // 선민: 장바구니 전체 삭제
	public void deleteBasketAll(HttpSession session) throws Exception {
		String LOGIN_ID = (String)(session.getAttribute("loginId"));
		basketDAO.deleteBasketAll(LOGIN_ID);
	}

}

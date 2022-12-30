package pulu.com.basket;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("basketDAO")
public class BasketDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> basketCheck(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("basket.basketCheck", map);
	}

	public void insertBasket(Map<String, Object> map) throws Exception {
		log.info("\ninsert - 장바구니에 등록");
		insert("basket.insertBasket", map);
	}

	public void updateBasket(Map<String, Object> map) throws Exception {
		log.info("\nupdate - 기존 장바구니 수량만 변경");
		update("basket.updateBasket", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketList(Map<String, Object> map) throws Exception {
		return selectList("basket.basketList", map);
	}

	public void deleteBasketAll(String LOGIN_ID) throws Exception {
		delete("basket.deleteBasketAll", LOGIN_ID);
	}

	// 장바구니 리스트 수량 변경
	public int updateCount(Map<String, Object> map) {
		log.info("\nupdate - 장바구니리스트 수량 변경");
		int result = (int)update("basket.updateCount", map);
		return result;
	}

	public void deleteBasketSelect(int BASKET_NUM) {
		delete("basket.deleteBasketSelect", BASKET_NUM);
		
	}

}

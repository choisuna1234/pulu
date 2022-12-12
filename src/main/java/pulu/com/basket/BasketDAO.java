package pulu.com.basket;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("basketDAO")
public class BasketDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> checkBasket(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("basket.checkBasket", map);
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

}

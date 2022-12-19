package pulu.com.adminGoods;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminGoodsService {

	void insertAdminGoods(Map<String, Object> map, HttpServletRequest request) throws Exception;

	List<Map<String, Object>> adminGoodsList(Map<String, Object> map) throws Exception;

	void deleteAdminGoods(Map<String, Object> map) throws Exception;


	Map<String, Object> adminGoodsUpdateDetail(Map<String, Object> map) throws Exception;
    
	
	void adminGoodsUpdate(Map<String,Object> map,HttpServletRequest request)throws Exception;


}

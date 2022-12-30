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
	
	//상품 삭제 취소
		void updateAdminGoodsD(Map<String, Object> map) throws Exception;
		
		//관리자 상품 검색
	    List<Map<String, Object>> adminGcategory(Map<String, Object> map) throws Exception;
		
		List<Map<String, Object>> adminGpricehigh(Map<String, Object> map) throws Exception;
		
		List<Map<String, Object>> adminGpricerow(Map<String, Object> map) throws Exception;
		
		List<Map<String, Object>> adminGdelete(Map<String, Object> map) throws Exception;
	    
		List<Map<String, Object>> adminGdate(Map<String, Object> map) throws Exception;



}

package pulu.com.adminOrder;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("AdminOrderDAO")
public class AdminOrderDAO extends AbstractDAO {

	//관리자 주문처리 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminOrderList(Map<String, Object> map) throws Exception {
		return (List<Map<String,Object>>) selectList("adminOrder.orderList", map);
	}

	//관리자 주문처리 검색 0(주문상태) - 상단 카테고리	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderSearch0(Map<String, Object> map) throws Exception {
		return (List<Map<String,Object>>) selectList("adminOrder.orderSearch0", map);
	}

	//관리자 주문처리 검색 1(주문자 ID)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderSearch1(Map<String, Object> map) throws Exception {
		return (List<Map<String,Object>>) selectList("adminOrder.orderSearch1", map);
	}

	//관리자 주문처리 검색 2(주문번호
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderSearch2(Map<String, Object> map) throws Exception {
		return (List<Map<String,Object>>) selectList("adminOrder.orderSearch2", map);
	}

	//관리자 주문처리 디테일
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminOrderDetail(Map<String, Object> map) throws Exception {
		return (Map<String,Object>) selectOne("adminOrder.orderDetail", map);
	}
	
	  //관리자 주문처리 디테일
//	@SuppressWarnings("unchecked") 
//	public List<Map<String, Object>>adminOrderDetail(Map<String, Object> map) throws Exception { 
//		return(List<Map<String,Object>>) selectList("adminOrder.orderDetail", map); 
//		}
	 

	//관리자 주문처리 수정
	@SuppressWarnings("unchecked")
	public void adminOrderUpdate(Map<String, Object> map) throws Exception {
		update("adminOrder.orderUpdate",map);
	}

	//관리자 주문처리 삭제
	@SuppressWarnings("unchecked")
	public void adminOrderDelete(Map<String, Object> map) throws Exception {
		update("adminOrder.orderDelete",map);
	}
	

}

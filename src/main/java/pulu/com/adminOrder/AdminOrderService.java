package pulu.com.adminOrder;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminOrderService {

	//관리자 주문처리 리스트
	List<Map<String, Object>> adminOrderList(Map<String, Object> map) throws Exception;

	//관리자 주문처리 검색 0(주문상태) - 상단 카테고리
	List<Map<String, Object>> orderSearch0(Map<String, Object> map) throws Exception;

	//관리자 주문처리 검색 1(주문자 ID) 
	List<Map<String, Object>> orderSearch1(Map<String, Object> map) throws Exception;

	//관리자 주문처리 검색 2(주문번호)
	List<Map<String, Object>> orderSearch2(Map<String, Object> map) throws Exception;

	//관리자 주문처리 디테일
	Map<String, Object> adminOrderDetail(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> adminOrderDetail2(Map<String, Object> map) throws Exception;
	
//관리자 주문처리 디테일 
//	List<Map<String, Object>> adminOrderDetail(Map<String, Object>map) throws Exception;
	 

	//관리자 주문처리 수정
	void adminOrderUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//관리자 주문처리 삭제
	void adminOrderDelete(Map<String, Object> map, HttpServletRequest request) throws Exception;

	

}

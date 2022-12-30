package pulu.com.adminOrder;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("AdminOrderService")	//Service 객체임을 선언. (객체 이름)
public class AdminOrderServiceImpl implements AdminOrderService {	//Service 인터페이스에서 정의된 메서드를 실제로 구현
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "AdminOrderDAO")
	private AdminOrderDAO adminOrderDAO;

	//관리자 주문처리 리스트
	@Override
	public List<Map<String, Object>> adminOrderList(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adminOrderList(map);
	}

	//관리자 주문처리 검색 0(주문상태) - 상단 카테고리
	@Override
	public List<Map<String, Object>> orderSearch0(Map<String, Object> map) throws Exception {
		return adminOrderDAO.orderSearch0(map);
	}

	//관리자 주문처리 검색 1(주문자 ID)
	@Override
	public List<Map<String, Object>> orderSearch1(Map<String, Object> map) throws Exception {
		return adminOrderDAO.orderSearch1(map);
	}
	
	//관리자 주문처리 검색 2(주문번호)
	@Override
	public List<Map<String, Object>> orderSearch2(Map<String, Object> map) throws Exception {
		return adminOrderDAO.orderSearch2(map);
	}

	//관리자 주문처리 디테일
	@Override
	public Map<String, Object> adminOrderDetail(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adminOrderDetail(map);
	}
	
	@Override
	public List<Map<String, Object>> adminOrderDetail2(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adminOrderDetail2(map);
	}
	
	
//	@Override public List<Map<String, Object>> adminOrderDetail(Map<String,Object> map) throws Exception { 
//		return adminOrderDAO.adminOrderDetail(map); 
//		}
	 

	//관리자 주문처리 수정
	@Override
	public void adminOrderUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminOrderDAO.adminOrderUpdate(map);
		
	}

	//관리자 주문처리 삭제
	@Override
	public void adminOrderDelete(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminOrderDAO.adminOrderDelete(map);
		
		List<Map<String, Object>> list = adminOrderDAO.goodsAmountSelect(map);
		
		for(Map<String, Object> map_amount : list) {
			adminOrderDAO.goodsAmountUpdate(map_amount);
		}
	
	}

}

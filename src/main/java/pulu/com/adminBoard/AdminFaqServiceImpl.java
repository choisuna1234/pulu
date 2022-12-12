package pulu.com.adminBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("AdminFaqService")	//Service 객체임을 선언. (객체 이름)
public class AdminFaqServiceImpl implements AdminFaqService {	//Service 인터페이스에서 정의된 메서드를 실제로 구현
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminFaqDAO")	//데이터 접근을 위한 DAO 객체 선언.  //@Autowired : SC에 '타입'으로 저장됨!!
	private AdminFaqDAO adminFaqDAO;							 //@Resource(name="sampleDAO") : SC에 지정한 이름으로 등록된 것을 찾음

	// FAQ 리스트
	@Override
	public List<Map<String, Object>> adminFaqList(Map<String, Object> map) throws Exception {
		//adminFaqList의 결과값으로 adminFaqDAO의 adminFaqList호출
		return adminFaqDAO.adminFaqList(map);
		
	}

/*
	@Override
	public void adminFaqInsert(Map<String, Object> map) throws Exception {
		
		adminFaqDAO.adminFaqInsert(map);
	}*/

	// FAQ 등록
	@Override
	public void adminFaqInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminFaqDAO.adminFaqInsert(map);
		
	}

	// FAQ 내용보기
	@Override
	public Map<String, Object> adminFaqDetail(Map<String, Object> map) throws Exception {
		adminFaqDAO.updateReadCount(map);
		Map<String, Object> tempMap = adminFaqDAO.adminFaqDetail(map);
		
		return tempMap;
	}

	// FAQ 수정
	@Override
	public void adminfaqUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminFaqDAO.adminfaqUpdate(map);
		
	}

	// FAQ 삭제
	@Override
	public void adminFaqDelete(Map<String, Object> map) throws Exception {
		adminFaqDAO.adminFaqDelete(map);
		
	}

	// FAQ 조회수
	@Override
	public void faqReadCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	// FAQ 검색 - 제목
	@Override
	public List<Map<String, Object>> faqSearch0(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminFaqDAO.faqSearch0(map);
	}

	// FAQ 검색 - 내용
	@Override
	public List<Map<String, Object>> faqSearch1(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminFaqDAO.faqSearch1(map);
	}

}

package pulu.com.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("FaqService")	//Service 객체임을 선언. (객체 이름)
public class FaqServiceImpl implements FaqService {	//Service 인터페이스에서 정의된 메서드를 실제로 구현
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FaqDAO")	//데이터 접근을 위한 DAO 객체 선언.  //@Autowired : SC에 '타입'으로 저장됨!!
	private FaqDAO faqDAO;							 //@Resource(name="sampleDAO") : SC에 지정한 이름으로 등록된 것을 찾음

	// FAQ 리스트
	@Override
	public List<Map<String, Object>> faqList(Map<String, Object> map) throws Exception {
		//faqList의 결과값으로 faqDAO의 faqList호출
		return faqDAO.faqList(map);
		
	}


	// FAQ 내용보기
	@Override
	public Map<String, Object> faqDetail(Map<String, Object> map) throws Exception {
		faqDAO.updateReadCount(map);
		Map<String, Object> tempMap = faqDAO.faqDetail(map);
		
		return tempMap;
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
		return faqDAO.faqSearch0(map);
	}

	
	// FAQ 검색 - 내용
	@Override
	public List<Map<String, Object>> faqSearch1(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return faqDAO.faqSearch1(map);
	}

}

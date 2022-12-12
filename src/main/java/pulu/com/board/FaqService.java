package pulu.com.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface FaqService {	//Service : 비지니스 로직 작성을 위한 메서드 (인터페이스. 실제 구현은 Impl)

	//FAQ 리스트
	List<Map<String, Object>> faqList(Map<String, Object> map) throws Exception;

	//FAQ 상세보기
	Map<String, Object> faqDetail(Map<String, Object> map) throws Exception;

	//FAQ 조회수
	void faqReadCount(Map<String , Object>map) throws Exception;
	
	//FAQ 검색 - 제목
	List<Map<String,Object>> faqSearch0(Map<String,Object>map) throws Exception;
	
	//FAQ 검색 - 내용
	List<Map<String,Object>> faqSearch1(Map<String,Object>map) throws Exception;

	//FAQ
	

}


package pulu.com.adminBoard;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminFaqService {	//Service : 비지니스 로직 작성을 위한 메서드 (인터페이스. 실제 구현은 Impl)

	//FAQ 리스트
	List<Map<String, Object>> adminFaqList(Map<String, Object> map) throws Exception;

	//FAQ 등록
	void adminFaqInsert(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//FAQ 내용보기
	Map<String, Object> adminFaqDetail(Map<String, Object> map) throws Exception;

	//FAQ 수정
	void adminfaqUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//FAQ 삭제
	void adminFaqDelete(Map<String, Object> map) throws Exception;

	//FAQ 조회수
	void faqReadCount(Map<String , Object>map) throws Exception;
	
	//FAQ 검색 - 제목
	List<Map<String,Object>> faqSearch0(Map<String,Object>map) throws Exception;
	
	//FAQ 검색 - 내용
	List<Map<String,Object>> faqSearch1(Map<String,Object>map) throws Exception;

	//FAQ
	

}


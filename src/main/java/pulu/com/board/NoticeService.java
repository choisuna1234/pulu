package pulu.com.board;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	// 관리자 페이지 공지사항 리스트
	public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception;
		
	// 관리자 페이지 공지사항 상세보기
	public Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception;
	
	// 공지사항 검색 (제목)
	public List<Map<String, Object>> noticeSearch0(Map<String, Object> map) throws Exception;
	
	// 공지사항 검색 (내용)
	public List<Map<String, Object>> noticeSearch1(Map<String, Object> map) throws Exception;
	
}

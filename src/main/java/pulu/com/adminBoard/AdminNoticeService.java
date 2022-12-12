package pulu.com.adminBoard;

import java.util.List;
import java.util.Map;

public interface AdminNoticeService {
	
	// 관리자 공지사항 등록
	void adminNoticeInsert(Map<String, Object> map) throws Exception;
	
	// 관리자 페이지 공지사항 리스트
	List<Map<String, Object>> adminNoticeList(Map<String, Object> map) throws Exception;
	
	// 관리자 페이지 공지사항 상세보기
	Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception;
	
	// 관리자 공지사항 수정
	void adminNoticeUpdate(Map<String, Object> map) throws Exception;
	
	// 관리자 공지사항 삭제
	void adminNoticeDelete(Map<String, Object> map) throws Exception;
	
	// 공지사항 조회수
	void NoticeReadCount(Map<String, Object> map) throws Exception;
	
	// 공지사항 검색 (제목)
	List<Map<String, Object>> NoticeSearch0(Map<String, Object> map) throws Exception;
	
	// 공지사항 검색 (내용)
	List<Map<String, Object>> NoticeSearch1(Map<String, Object> map) throws Exception;
	
}

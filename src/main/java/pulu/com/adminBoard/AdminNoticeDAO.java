package pulu.com.adminBoard;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("AdminNoticeDAO")
public class AdminNoticeDAO extends AbstractDAO {

	// 관리자 공지사항 등록
	public void adminNoticeInsert(Map<String, Object> map) throws Exception {
		insert("notice.adminnoticeInsert", map);
	}
	
	// 관리자 페이지 공지사항 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminNoticeList(Map<String, Object> map) throws Exception {
		return(List<Map<String, Object>>) selectList("notice.noticeList", map);
	}
	
	// 관리자 페이지 공지사항 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception {
		return(Map<String, Object>) selectOne("notice.noticeDetail", map);
	}
	
	// 공지사항 수정
	public void adminNoticeUpdate(Map<String, Object> map) throws Exception {
		update("notice.noticeUpdate", map);
	}
	
	// 공지사항 삭제
	public void adminNoticeDelete(Map<String, Object> map) throws Exception {
		delete("notice.noticeDelete", map);
	}
	
	// 공지사항 조회수
	public void NoticeReadCount(Map<String, Object> map) throws Exception {
		update("notice.noticeReadCount", map);
	}
	
	// 회원 공지사항 검색 (제목)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> SearchSubject(Map<String, Object>map) throws Exception{
		return (List<Map<String, Object>>)selectList("notice.searchSubject", map);
	}
	
	// 회원 공지사항 검색 (내용)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> SearchContent(Map<String, Object>map) throws Exception{
		return (List<Map<String, Object>>)selectList("notice.searchContent", map);
	}
	
} 

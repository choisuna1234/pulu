package pulu.com.board;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;


@Repository("NoticeDAO")
public class NoticeDAO extends AbstractDAO {

	//회원 공지사항 목록조회
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> noticeList(Map<String,Object>map)throws Exception{
		return (List<Map<String,Object>>)selectList("notice.noticeList", map);
	}
		
	//회원 공지사항 상세보기
	@SuppressWarnings("unchecked")
	public Map<String,Object> noticeDetail(Map<String,Object>map)throws Exception{
		return (Map<String, Object>)selectOne("notice.noticeDetail", map);
	}
	
	// 회원 공지사항 검색 (제목)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchSubject(Map<String, Object>map) throws Exception{
		return (List<Map<String, Object>>)selectList("notice.searchSubject", map);
	}
	
	// 회원 공지사항 검색 (내용)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchContent(Map<String, Object>map) throws Exception{
		return (List<Map<String, Object>>)selectList("notice.searchContent", map);
	}
	
	// 공지사항 조회수 업데이트
	public void noticeReadCount(Map<String, Object>map) throws Exception{
		update("notice.noticeReadCount", map);
	}
}
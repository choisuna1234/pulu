package pulu.com.adminBoard;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("AdminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Resource(name = "AdminNoticeDAO")
	private AdminNoticeDAO adminNoticeDAO;
	
	// 공지사항 등록
	public void adminNoticeInsert(Map<String, Object> map) throws Exception {
		
		adminNoticeDAO.adminNoticeInsert(map);
	}
	
	// 관리자 페이지 공지사항 리스트
	public List<Map<String, Object>> adminNoticeList(Map<String, Object> map) throws Exception {
		
		return adminNoticeDAO.adminNoticeList(map);
	}
	
	// 관리자 페이지 공지사항 상세보기
	public Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception {
		adminNoticeDAO.NoticeReadCount(map);
		Map<String, Object> resultMap = adminNoticeDAO.adminNoticeDetail(map);
		
		return resultMap;
	}

	// 공지사항 수정
	public void adminNoticeUpdate(Map<String, Object> map) throws Exception {
		
		adminNoticeDAO.adminNoticeUpdate(map);
	}

	// 공지사항 삭제
	public void adminNoticeDelete(Map<String, Object> map) throws Exception {
	
		adminNoticeDAO.adminNoticeDelete(map);
	}

	// 공지사항 조회수
	public void NoticeReadCount(Map<String, Object> map) throws Exception {
		
		adminNoticeDAO.NoticeReadCount(map);
	}

	// 공지사항 검색 (제목)
	public List<Map<String, Object>> NoticeSearch0(Map<String, Object> map) throws Exception {
		
		return adminNoticeDAO.SearchSubject(map);
	}

	// 공지사항 검색 (내용)
	public List<Map<String, Object>> NoticeSearch1(Map<String, Object> map) throws Exception {
		
		return adminNoticeDAO.SearchContent(map);
	}
	
	
}

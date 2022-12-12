package pulu.com.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {

	@Resource(name = "NoticeDAO")
	private NoticeDAO NoticeDAO;
	
	// 공지사항 리스트
	public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
			
		return NoticeDAO.noticeList(map);
	}
		
	// 공지사항 상세보기
	public Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception {
		
		NoticeDAO.noticeReadCount(map);
		Map<String, Object> resultMap = NoticeDAO.noticeDetail(map);
		
		return resultMap;
	}
	
	// 공지사항 검색 (제목)
	@Override
	public List<Map<String, Object>> noticeSearch0(Map<String, Object> map) throws Exception {
		
		return NoticeDAO.searchSubject(map);
	}

	// 공지사항 검색 (내용)
	@Override
	public List<Map<String, Object>> noticeSearch1(Map<String, Object> map) throws Exception {
		
		return NoticeDAO.searchContent(map);
	}
}
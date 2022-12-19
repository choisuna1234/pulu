package pulu.com.adminCS;

import java.util.List;
import java.util.Map;

public interface AdminReviewService {

	// 관리자 후기 답변 등록
	public void adminReviewInsert(Map<String, Object> map) throws Exception;
	
	// 관리자 후기 답변 삭제
	public void adminReviewDelete(Map<String, Object> map) throws Exception;
	
	// 관리자가 회원 후기 삭제
	public void reviewDelete(Map<String, Object> map) throws Exception;
	
	// 관리자 페이지 후기 리스트
	public List<Map<String, Object>> adminReviewList(Map<String, Object> map) throws Exception;
}

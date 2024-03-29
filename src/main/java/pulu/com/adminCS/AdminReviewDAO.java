package pulu.com.adminCS;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("adminReviewDAO")
public class AdminReviewDAO extends AbstractDAO {

	// 관리자 후기 답변 등록
	public void adminReviewComInsert(Map<String, Object> map) {
		insert("review.adminReviewInsert", map);
	}
	
	
	// 관리자 후기 답변 삭제
	public void adminReviewComDelete(Map<String, Object> map) {
		delete("review.adminReviewDelete", map);
	}
	
	// 관리자가 회원 후기 삭제
	public void adminReviewDelete(Map<String, Object> map) {
		delete("review.reviewDelete", map);
	}
	
	// 관리자 페이지 후기 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminReviewList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("review.adminReviewList", map);
	}

}

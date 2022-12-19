package pulu.com.adminCS;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("AdminReviewService")
public class AdminReviewServiceImpl implements AdminReviewService {

	@Resource(name="adminReviewDAO")
	private AdminReviewDAO adminReviewDAO;

	@Override // 관리자 후기 답변 등록
	public void adminReviewInsert(Map<String, Object> map) throws Exception {
		
		adminReviewDAO.adminReviewInsert(map);
	}

	@Override // 관리자 페이지 후기 리스트
	public List<Map<String, Object>> adminReviewList(Map<String, Object> map) throws Exception {
		
		return adminReviewDAO.adminReviewList(map);
	}

	@Override // 관리자 후기 답변 삭제
	public void adminReviewDelete(Map<String, Object> map) throws Exception {
		
		adminReviewDAO.adminReviewDelete(map);
	}

	@Override // 관리자 후기 삭제
	public void reviewDelete(Map<String, Object> map) throws Exception {
		
		adminReviewDAO.reviewDelete(map);
	}
	
}

package pulu.com.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;

	@Override // 후기 등록 조건 체크
	public Map<String, Object> reviewInsertCheck(Map<String, Object> map) throws Exception {

		return reviewDAO.reviewInsertCheck(map);
	}

	@Override // 후기 등록
	public void reviewInsert(Map<String, Object> map) throws Exception {
	
		reviewDAO.reviewInsert(map);
	}

	@Override // 후기 목록
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		
		return reviewDAO.reviewList(map);
	}

	@Override // 후기 수정
	public void reviewUpdate(Map<String, Object> map) throws Exception {
		
		reviewDAO.reviewUpdate(map);
	}

	@Override // 후기 삭제
	public void reviewDelete(Map<String, Object> map) throws Exception {
		
		reviewDAO.reviewDelete(map);
	}

	@Override // 후기 검색 (내용)
	public List<Map<String, Object>> reviewSearch0(Map<String, Object> map) throws Exception {
		
		return reviewDAO.SearchContent(map);
	}
	
}

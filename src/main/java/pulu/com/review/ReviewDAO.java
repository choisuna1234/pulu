package pulu.com.review;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO {

	// 후기 등록 조건 체크
	@SuppressWarnings("unchecked")
	public Map<String, Object> reviewInsertCheck0(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("review.reviewInsertCheck0", map);
	}

	// 후기 등록 조건 체크
	@SuppressWarnings("unchecked")
	public Map<String, Object> reviewInsertCheck1(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("review.reviewInsertCheck1", map);
	}

	// 후기 등록
	public void reviewInsert(Map<String, Object> map) throws Exception {
		insert("review.reviewInsert", map);
	}

	// 후기 수정
	public void reviewUpdate(Map<String, Object> map) throws Exception {
		update("review.reviewUpdate", map);
	}

	// 후기 삭제
	public void reviewDelete(Map<String, Object> map) throws Exception {
		delete("review.reviewDelete", map);
	}

	// 후기 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("review.reviewList", map);
	}

	// 회원 후기 검색 (내용)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> SearchContent(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("review.searchContent", map);
	}
	
	// 후기 수정 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("review.reviewDetail", map);
	}

}

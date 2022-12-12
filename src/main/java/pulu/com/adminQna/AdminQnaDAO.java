package pulu.com.adminQna;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("AdminQnaDAO")	//데이터베이스 접근, 조작 저장소
public class AdminQnaDAO extends AbstractDAO {

	// 관리자 QNA 리스트	
	public List<Map<String, Object>> adminQnaList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("qna.qnaList", map);
	}

	// 관리자 QNA 검색0 - 상품번호
	public List<Map<String, Object>> adminQnaSearch0(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("qna.adminQnaSearch0", map);
	}

	// 관리자 QNA 검색1 - 작성자
	public List<Map<String, Object>> adminQnaSearch1(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("qna.qnaSearch1", map);
	}

	// 관리자 QNA 상세보기
	public Map<String, Object> adminQnaDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("qna.qnaDetail", map);
	}

	// 관리자 QNA 삭제
	public void adminQnaDelete(Map<String, Object> map) {
		update("qna.qnaDelete", map);
		
	}

	// 관리자 QNA 코멘트 작성
	public void adminQnaComInsert(Map<String, Object> map) {
		insert("qna.qnaComInsert", map);
		
	}

	// 관리자 QNA 코멘트 수정
	public void adminQnaComUpdate(Map<String, Object> map) {
		update("qna.qnaComUpdate", map);
		
	}

	// 관리자 QNA 코멘트 삭제
	public void adminQnaComDelete(Map<String, Object> map) {
		update("qna.qnaComDelete", map);
		
	}

}

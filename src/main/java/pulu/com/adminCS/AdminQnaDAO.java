package pulu.com.adminCS;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("AdminQnaDAO")	//데이터베이스 접근, 조작 저장소
public class AdminQnaDAO extends AbstractDAO {

	// 관리자 QNA 리스트	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminQnaList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("qna.adminQnaList", map);
	}

	// 관리자 QNA 검색0 - 상품번호
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminQnaSearch0(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("qna.adminQnaSearch0", map);
	}

	// 관리자 QNA 검색1 - 제목
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminQnaSearch1(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("qna.adminQnaSearch1", map);
	}

	// 관리자 QNA 검색2 - 작성자
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminQnaSearch2(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("qna.adminQnaSearch2", map);
	}
	
	// 관리자 QNA 검색3 - 답변상태
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminQnaSearch3(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("qna.adminQnaSearch3", map);
	}

	// 관리자 QNA 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminQnaDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("qna.qnaDetail", map);
	}

	// 관리자 QNA 삭제
	@SuppressWarnings("unchecked")
	public void adminQnaDelete(Map<String, Object> map) throws Exception{
		update("qna.qnaDelete", map);
		
	}

	// 관리자 QNA 수정
	@SuppressWarnings("unchecked")
	public void adminQnaUpdate(Map<String, Object> map) throws Exception{
		update ("qna.qnaUpdate", map);
		
	}

	// 관리자 QNA 코멘트 작성
	@SuppressWarnings("unchecked")
	public void adminQnaComInsert(Map<String, Object> map) throws Exception{
		update ("qna.qnaComInsert", map);
		
	}
	@SuppressWarnings("unchecked")
	public void adminQnaComStatus(Map<String, Object> map) throws Exception{
		update ("qna.qnaComStatus", map);
			
		}
	
	// 관리자 QNA 코멘트 수정
	@SuppressWarnings("unchecked")
	public void adminQnaComUpdate(Map<String, Object> map) throws Exception{
		update ("qna.qnaComUpdate", map);
		
	}

	// 관리자 QNA 코멘트 삭제
	@SuppressWarnings("unchecked")
	public void adminQnaComDelete(Map<String, Object> map) throws Exception{
		update ("qna.qnaComDelete", map);
		
	}

	

}

package pulu.com.qna;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("QnaDAO")
public class QnaDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("qna.qnaList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaSearch0(Map<String, Object> map) throws Exception {
		return (List<Map<String,Object>>) selectList("qna.qnaSearch0", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaSearch1(Map<String, Object> map) throws Exception {
		return (List<Map<String,Object>>) selectList("qna.qnaSearch1", map);
	}

	@SuppressWarnings("unchecked")
	public void qnaInsert(Map<String, Object> map) throws Exception {
		insert("qna.qnaInsert", map);
		
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("qna.qnaDetail", map);
	}

	@SuppressWarnings("unchecked")
	public void qnaUpdate(Map<String, Object> map) throws Exception {
		update("qna.qnaUpdate", map);
	}

	@SuppressWarnings("unchecked")
	public void qnaDelete(Map<String, Object> map) throws Exception {
		update("qna.qnaDelete", map);
	}

	
}

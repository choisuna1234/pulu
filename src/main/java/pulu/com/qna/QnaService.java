package pulu.com.qna;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface QnaService {

	List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> qnaSearch0(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> qnaSearch1(Map<String, Object> map) throws Exception;

	void qnaInsert(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception;

	void qnaUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void qnaDelete(Map<String, Object> map, HttpServletRequest request) throws Exception;

}

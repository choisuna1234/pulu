package pulu.com.goods;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface GoodsService {

	public List<Map<String, Object>> goodsList(int categoryNo) throws Exception;

	public Map<String, Object> goodsDetail(Map<String, Object> map) throws Exception;

	/* �˻� */
	List<Map<String, Object>> goodsSearch(Map<String, Object> map, int categoryNo) throws Exception;

	/* �ɼǺ� �˻� */
	List<Map<String, Object>> searchOption0(Map<String, Object> map, int categoryNo) throws Exception;

	List<Map<String, Object>> searchOption1(Map<String, Object> map, int categoryNo) throws Exception;

	List<Map<String, Object>> searchOption2(Map<String, Object> map, int categoryNo) throws Exception;

	// 후기 등록 조건 체크
	public Map<String, Object> reviewInsertCheck0(Map<String, Object> map) throws Exception;

	// 후기 등록 조건 체크
	public Map<String, Object> reviewInsertCheck1(Map<String, Object> map) throws Exception;

	// 후기 등록
	public void reviewInsert(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// 후기 목록
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception;

	// 후기 수정
	public void reviewUpdate(Map<String, Object> map) throws Exception;

	// 후기 삭제
	public void reviewDelete(Map<String, Object> map) throws Exception;

	// 후기 검색 (내용)
	public List<Map<String, Object>> reviewSearch0(Map<String, Object> map) throws Exception;

	// QNA 목록
	List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception;

	// QNA 검색 (제목)
	List<Map<String, Object>> qnaSearch0(Map<String, Object> map) throws Exception;

	// QNA 검색 (내용)
	List<Map<String, Object>> qnaSearch1(Map<String, Object> map) throws Exception;

	// QNA 등록
	void qnaInsert(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// QNA 상세보기
	Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception;

	// QNA 수정
	void qnaUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// QNA 삭제
	void qnaDelete(Map<String, Object> map) throws Exception;
}
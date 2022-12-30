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

	// 후기 목록
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception;

	// 후기 검색 (내용)
	public List<Map<String, Object>> reviewSearch0(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> qnaSearch0(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> qnaSearch1(Map<String, Object> map) throws Exception;
	

	/* 전체 상품 검색 */
	List<Map<String, Object>> goodsAllSearch(Map<String, Object> map) throws Exception;

	/* 전체 상품 옵션 */
	List<Map<String, Object>> searchAllOption0(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> searchAllOption1(Map<String, Object> map) throws Exception;
	
	//전체 상품 리스트
	public List<Map<String, Object>> allGoodsList(Map<String, Object> map) throws Exception;



}
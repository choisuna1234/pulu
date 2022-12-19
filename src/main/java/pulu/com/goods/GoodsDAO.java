package pulu.com.goods;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("goodsDAO")
public class GoodsDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsList(int categoryNo) throws Exception {
		return selectList("goods.goodsList", categoryNo);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> goodsDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("goods.goodsdetail", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception {
		return selectList("adminGoods.selectFileList", map);
	}

	/* �˻���� */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSearch(Map<String, Object> map, int categoryNo) throws Exception {
		return (List<Map<String, Object>>) selectList("goods.searchGoods", map);
	}

	/* �ɼǺ� �˻���� 1,2,3 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchOption0(Map<String, Object> map, int categoryNo) throws Exception {
		return (List<Map<String, Object>>) selectList("goods.searchOption0", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchOption1(Map<String, Object> map, int categoryNo) throws Exception {
		return (List<Map<String, Object>>) selectList("goods.searchOption1", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchOption2(Map<String, Object> map, int categoryNo) throws Exception {
		return (List<Map<String, Object>>) selectList("goods.searchOption2", map);
	}

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

	// 후기 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("review.reviewList", map);
	}

	// 후기 수정
	public void reviewUpdate(Map<String, Object> map) throws Exception {
		update("review.reviewUpdate", map);
	}

	// 후기 삭제
	public void reviewDelete(Map<String, Object> map) {
		delete("review.reviewDelete", map);
	}

	// 후기 검색 (내용)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> SearchContent(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("review.searchContent", map);
	}

	// QNA 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("qna.qnaList", map);
	}

	// QNA 검색 (제목)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaSearch0(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("qna.qnaSearch0", map);
	}

	// QNA 검색 (내용)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaSearch1(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("qna.qnaSearch1", map);
	}

	// QNA 등록
	public void qnaInsert(Map<String, Object> map) throws Exception {
		insert("qna.qnaInsert", map);

	}

	// QNA 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("qna.qnaDetail", map);
	}

	// QNA 수정
	public void qnaUpdate(Map<String, Object> map) throws Exception {
		update("qna.qnaUpdate", map);
	}

	// QNA 삭제
	public void qnaDelete(Map<String, Object> map) throws Exception {
		update("qna.qnaDelete", map);
	}

}

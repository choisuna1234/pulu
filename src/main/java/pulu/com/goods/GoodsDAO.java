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
	
	/* 전체상품 검색 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsAllSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("goods.searchAllGoods", map);
	}

	/* 전체 상품 옵션 1,2 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchAllOption0(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("goods.searchAllOption0", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchAllOption1(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("goods.searchAllOption1", map);
	}
	
	//전체 상품 리스트
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> allGoodsList(Map<String, Object> map) throws Exception {
			return selectList("goods.allGoodsList");
		}


}

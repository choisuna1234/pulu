package pulu.com.goods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

	@Resource(name = "goodsDAO")
	private GoodsDAO goodsDao;

	@Override
	public List<Map<String, Object>> goodsList(int categoryNo) throws Exception {
		return goodsDao.goodsList(categoryNo);
	}

	@Override
	public Map<String, Object> goodsDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> tempMap = goodsDao.goodsDetail(map);
		resultMap.put("map", tempMap);

		List<Map<String, Object>> list = goodsDao.selectFileList(map);
		resultMap.put("list", list);

		return resultMap;
	}

	// ��ǰ �˻�
	@Override
	public List<Map<String, Object>> goodsSearch(Map<String, Object> map, int categoryNo) throws Exception {
		return goodsDao.goodsSearch(map, categoryNo);
	}

	// ��ǰ �ɼǺ� �˻�
	@Override
	public List<Map<String, Object>> searchOption0(Map<String, Object> map, int categoryNo) throws Exception {
		return goodsDao.searchOption0(map, categoryNo);
	}

	@Override
	public List<Map<String, Object>> searchOption1(Map<String, Object> map, int categoryNo) throws Exception {
		return goodsDao.searchOption1(map, categoryNo);
	}

	@Override
	public List<Map<String, Object>> searchOption2(Map<String, Object> map, int categoryNo) throws Exception {
		return goodsDao.searchOption2(map, categoryNo);
	}

	@Override // 후기 등록 조건 체크
	public Map<String, Object> reviewInsertCheck0(Map<String, Object> map) throws Exception {

		return goodsDao.reviewInsertCheck0(map);
	}

	@Override // 후기 등록 조건 체크
	public Map<String, Object> reviewInsertCheck1(Map<String, Object> map) throws Exception {

		return goodsDao.reviewInsertCheck1(map);
	}

	@Override // 후기 등록
	public void reviewInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {

		goodsDao.reviewInsert(map);
	}

	@Override // 후기 목록
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {

		return goodsDao.reviewList(map);
	}

	@Override // 후기 수정
	public void reviewUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override // 후기 검색 (내용)
	public List<Map<String, Object>> reviewSearch0(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override // 후기 삭제
	public void reviewDelete(Map<String, Object> map) throws Exception {

		goodsDao.reviewDelete(map);
	}

	@Override // QNA 목록
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {

		return goodsDao.qnaList(map);
	}

	@Override // QNA 검색 (제목)
	public List<Map<String, Object>> qnaSearch0(Map<String, Object> map) throws Exception {

		return goodsDao.qnaSearch0(map);
	}

	@Override // QNA 검색 (내용)
	public List<Map<String, Object>> qnaSearch1(Map<String, Object> map) throws Exception {

		return goodsDao.qnaSearch1(map);
	}

	@Override // QNA 등록
	public void qnaInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {

		goodsDao.qnaInsert(map);
	}

	@Override // QNA 상세보기
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {

		return goodsDao.qnaDetail(map);
	}

	@Override // QNA 수정
	public void qnaUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {

		goodsDao.qnaUpdate(map);
	}

	@Override // QNA 삭제
	public void qnaDelete(Map<String, Object> map) throws Exception {

		goodsDao.qnaDelete(map);
	}

}

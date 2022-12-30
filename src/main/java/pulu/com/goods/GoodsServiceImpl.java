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

		System.out.println(map.get("GOODS_NUM"));

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

	@Override // 후기 목록
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {

		return goodsDao.reviewList(map);
	}
	
	@Override // 후기 검색 (내용)
	public List<Map<String, Object>> reviewSearch0(Map<String, Object> map) throws Exception {
		
		return goodsDao.SearchContent(map);
	}
	
	@Override
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		return goodsDao.qnaList(map);
	}

	// 검색 1 - 제목
	@Override
	public List<Map<String, Object>> qnaSearch0(Map<String, Object> map) throws Exception {
		return goodsDao.qnaSearch0(map);	}

	// 검색 1 - 아이디
	@Override
	public List<Map<String, Object>> qnaSearch1(Map<String, Object> map) throws Exception {
		return goodsDao.qnaSearch1(map);
	}
	
	//전체 상품 리스트
	@Override
	public List<Map<String, Object>> allGoodsList(Map<String, Object> map) throws Exception {
		return goodsDao.allGoodsList(map);
	}
	
	// 전체상품 검색
			@Override
			public List<Map<String, Object>> goodsAllSearch(Map<String, Object> map) throws Exception {
				return goodsDao.goodsAllSearch(map);
			}

			//전체 상품 옵션 1,2
			@Override
			public List<Map<String, Object>> searchAllOption0(Map<String, Object> map) throws Exception {
				return goodsDao.searchAllOption0(map);
			}

			@Override
			public List<Map<String, Object>> searchAllOption1(Map<String, Object> map) throws Exception {
				return goodsDao.searchAllOption1(map);
			}


}

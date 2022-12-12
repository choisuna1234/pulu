package pulu.com.goods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {


	@Resource(name="goodsDAO")
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

			List<Map<String,Object>> list = goodsDao.selectFileList(map);
			resultMap.put("list", list);

			return resultMap;
	}



}

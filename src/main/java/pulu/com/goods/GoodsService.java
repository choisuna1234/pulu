package pulu.com.goods;

import java.util.List;
import java.util.Map;

public interface GoodsService {

	public List<Map<String, Object>> goodsList(int num) throws Exception ;

	public Map<String, Object> goodsDetail(Map<String, Object> map) throws Exception;
}
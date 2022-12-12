package pulu.com.goods;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("goodsDAO")
public class GoodsDAO extends AbstractDAO {



	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsList(int categoryNo) throws Exception {
		return selectList("goods.goodsList",categoryNo);
	}


	@SuppressWarnings("unchecked")
	public Map<String,Object> goodsDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("goods.goodsdetail",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return selectList("adminGoods.selectFileList", map);
	}

}

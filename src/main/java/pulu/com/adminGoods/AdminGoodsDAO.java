package pulu.com.adminGoods;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("adminGoodsDAO")
public class AdminGoodsDAO extends AbstractDAO{

	public void insertAdminGoods(Map<String, Object> map) throws Exception{
		insert("adminGoods.insertAdminGoods", map);
	}

	public void insertGoodsFile(Map<String, Object> map) throws Exception{
		insert("adminGoods.insertGoodsFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminGoodsList(Map<String, Object> map) throws Exception {
		return selectList("adminGoods.adminGoodsList",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> adminGoodsUpdateDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("adminGoods.adminGoodsUpdateDetail", map);

	}


	public void adminGoodsUpdatePro(Map<String, Object> map) throws Exception{
		update("adminGoods.adminGoodsUpdate", map);
	}

	public void deleteAdminGoods(Map<String, Object> map) throws Exception{
		update("adminGoods.deleteAdminGoods", map);
	}


	//  파일 업로드,수정,삭제,목록


	public void updateFile(Map<String, Object> map) throws Exception{
		update("admingoods.updateFile", map);
	}

	public void deleteFileList(Map<String, Object> map) throws Exception{
		update("adminGoods.deleteFileList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return selectList("adminGoods.selectFileList", map);
	}

}

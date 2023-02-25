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

	public void deleteAdminGoods(Map<String, Object> map) throws Exception{
		update("adminGoods.deleteAdminGoods", map);
	}
	
	//상품 수정 
	public void adminGoodsUpdatePro(Map<String, Object> map) throws Exception{
		update("adminGoods.adminGoodsUpdate", map);
	}

    // 파일 수정
	public void updateFile(Map<String, Object> map) throws Exception{
		update("adminGoods.updateFile", map);
		
	}
	
	//파일 삭제
	public void deleteFile(Map<String, Object> map) throws Exception{
		update("adminGoods.deleteFile", map);
	}



	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return selectList("adminGoods.selectFileList", map);
	}

	//상품 삭제 취소
			public void updateAdminGoodsD(Map<String, Object> map) throws Exception{
				update("adminGoods.updateAdminGoodsD", map);
			}
		//상품 옵션 검색
			@SuppressWarnings("unchecked")
			public List<Map<String, Object>> adminGcategory(Map<String, Object> map) throws Exception {
				return selectList("adminGoods.admingGcategory",map);
			}
			
			@SuppressWarnings("unchecked")
			public List<Map<String, Object>> adminGpricehigh(Map<String, Object> map) throws Exception {
				return selectList("adminGoods.admingGpricehigh",map);
			}
			
			@SuppressWarnings("unchecked")
			public List<Map<String, Object>> adminGpricerow(Map<String, Object> map) throws Exception {
				return selectList("adminGoods.admingGpricerow",map);
			}
			
			@SuppressWarnings("unchecked")
			public List<Map<String, Object>> adminGdelete(Map<String, Object> map) throws Exception {
				return selectList("adminGoods.admingGdelete",map);
			}
			
			@SuppressWarnings("unchecked")
			public List<Map<String, Object>> adminGdate(Map<String, Object> map) throws Exception {
				return selectList("adminGoods.admingGdate",map);
			}
	
	
}

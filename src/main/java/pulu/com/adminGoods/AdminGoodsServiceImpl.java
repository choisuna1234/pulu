package pulu.com.adminGoods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import pulu.com.common.FileUtils;


@Service("adminGoodsService")
public class AdminGoodsServiceImpl implements AdminGoodsService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="fileUtils")
	private FileUtils fileUtils;


	@Resource(name="adminGoodsDAO")
	private AdminGoodsDAO adminGoodsDAO;

	@Override
	public void insertAdminGoods(Map<String, Object> map, HttpServletRequest request) throws Exception {

	  adminGoodsDAO.insertAdminGoods(map);

	  List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for (Map<String, Object> element : list) {
			adminGoodsDAO.insertGoodsFile(element);
		}
	}


	@Override
	public List<Map<String, Object>> adminGoodsList(Map<String, Object> map) throws Exception {
		return adminGoodsDAO.adminGoodsList(map);
	}
    
	/* ��ǰ���� �󼼺��� */
	@Override
	public Map<String, Object> adminGoodsUpdateDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> tempMap = adminGoodsDAO.adminGoodsUpdateDetail(map);
		resultMap.put("map", tempMap);

		List<Map<String,Object>> list = adminGoodsDAO.selectFileList(map);
		resultMap.put("list", list);

		return resultMap;
	}
    
	/* ��ǰ ���� */
	@Override
	public void adminGoodsUpdate(Map<String, Object> map,HttpServletRequest request) throws Exception {
		adminGoodsDAO.adminGoodsUpdatePro(map);

		adminGoodsDAO.updateFile(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		
		System.out.println("service수정전 list===============" + list );
		  Map<String,Object> tempMap = null;
			for(int i=0, size=list.size(); i<size; i++){     
		      tempMap = list.get(i);
		       if(tempMap.get("IS_NEW").equals("Y")){
					adminGoodsDAO.insertGoodsFile(tempMap);				
				}
				else{
					adminGoodsDAO.deleteFile(tempMap);				
				}
	     }						
	}
    
	/* ��ǰ ���� */
	@Override
	public void deleteAdminGoods(Map<String, Object> map) throws Exception {

		adminGoodsDAO.deleteAdminGoods(map);
	}


}

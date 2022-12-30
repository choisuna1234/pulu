package pulu.com.adminGoods;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pulu.com.common.CommandMap;
import pulu.com.common.Paging;



@Controller
public class AdminGoodsController {
	Logger log = Logger.getLogger(this.getClass());
	
	// �˻� �ѹ�, ���� �޾ƿ��� ����
			private int searchNum;
			private String isSearch;
			
		//����¡ ����
			private int currentPage = 1;
			private int totalCount;
			private int blockCount = 7;
			private int blockPage = 5;
			private int startPage;
			private int endPage;
			private String pagingHtml;
			private Paging page;

	@Resource(name="adminGoodsService")
	private AdminGoodsService adminGoodsService;

	@RequestMapping(value="/adminGoodsInsertForm")
	public ModelAndView adminGoodsInsertForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("admin_goods_insert");

		return mv;
	}

	@RequestMapping(value="/adminGoodsInsert")
	public ModelAndView adminGoodsInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminGoodsList.pulu");

		adminGoodsService.insertAdminGoods(commandMap.getMap(),request);

		return mv;
	}

	@RequestMapping(value="/adminGoodsList")
	public ModelAndView adminGoodsList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("admin_goods_list");
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
			//�޾ƿ��� ������������ ������ ������ 1���ͽ���
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//�޾ƿ��� ������������ ������ ��Ʈ�������ؼ� ���������� ������
		}
		
		List<Map<String, Object>> resultMap = adminGoodsService.adminGoodsList(commandMap.getMap());
		
		// �˻� & ī�װ� ���� ���� ���
		// ��ǰ ����
	
		
		  if(request.getParameter("isSearch") != null){ 
		   isSearch = request.getParameter("isSearch");//�˻��� System.out.println(isSearch);
		  
		   searchNum = Integer.parseInt(request.getParameter("searchNum").toString());
		  
		  
		  if(searchNum == 5){  //��ϼ�
		    resultMap = adminGoodsService.adminGoodsList(commandMap.getMap());
		  } else if(searchNum == 6){  //�����ȼ�
			resultMap = adminGoodsService.adminGdate(commandMap.getMap());  
		  } else if(searchNum == 1 || searchNum == 2 || searchNum == 3){  //ī�װ�
			resultMap = adminGoodsService.adminGcategory(commandMap.getMap());
		  } else if(searchNum == 7){  //���ݼ�
			resultMap = adminGoodsService.adminGpricehigh(commandMap.getMap());
		  } else if(searchNum == 8){  //���ݼ�
			resultMap = adminGoodsService.adminGpricerow(commandMap.getMap());
		  } else if(searchNum == 9){  //��������
		    resultMap = adminGoodsService.adminGdelete(commandMap.getMap());
		  }
		  
		  totalCount = resultMap.size(); page = new Paging(currentPage, totalCount,
		  blockCount, blockPage, "adminGoodsList.pulu",searchNum,isSearch); pagingHtml
		  = page.getPagingHtml().toString(); startPage = ((currentPage - 1) /
		  blockPage) * blockPage + 1; endPage = startPage + blockPage - 1;
		  
		  int lastCount = totalCount;
		  
		  if (page.getEndCount() < totalCount) lastCount = page.getEndCount() + 1;
		  
		  resultMap = resultMap.subList(page.getStartCount(), lastCount);
		  
		  mv.addObject("totalCount", totalCount); // ���� ���� ����� mv�� ��� jsp���� ���
		  mv.addObject("pagingHtml", pagingHtml);
		  mv.addObject("currentPage",currentPage); 
		  mv.addObject("isSearch", isSearch);
		  mv.addObject("searchNum",searchNum); 
		  mv.addObject("startPage", startPage);
		  mv.addObject("endPage",endPage); 
		  mv.addObject("adminlist",resultMap);
		 
		  System.out.println("adminlist============" + resultMap);
		 
		  return mv;
		  
		  } else {
		 
		 
		
		totalCount = resultMap.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminGoodsList.pulu");
		pagingHtml = page.getPagingHtml().toString();
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		resultMap = resultMap.subList(page.getStartCount(), lastCount);

		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);		
		mv.addObject("adminlist",resultMap);

		return mv;
	  }
	}

	@RequestMapping(value="/adminGoodsDelete")
	public ModelAndView adminGoodsDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/adminGoodsList.pulu");

		adminGoodsService.deleteAdminGoods(commandMap.getMap());

		return mv;
	}

	@RequestMapping(value="/adminGoodsUpdateForm")
	public ModelAndView adminGoodsUpdateForm(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("admin_goods_update");
		System.out.println(commandMap.getMap());
		Map<String,Object> resultMap= adminGoodsService.adminGoodsUpdateDetail(commandMap.getMap());
		mv.addObject("map", resultMap.get("map"));
		mv.addObject("list", resultMap.get("list"));
    
		return mv;
	}
    
	//�Խñ� ����
	@RequestMapping(value="/adminGoodsUpdate")
	public ModelAndView adminGoodsUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/adminGoodsList.pulu");

		adminGoodsService.adminGoodsUpdate(commandMap.getMap(), request);
        
		mv.addObject("IMAGE_GOODS_NUM", commandMap.get("IDX"));
		mv.addObject("goodsnum", commandMap.get("goodsnum"));
		
		
		return mv;
	}
	
	//상품 삭제 취소
	  @RequestMapping(value="/adminGoodsUpdateD") 
	  public ModelAndView adminGoodsUpdateD(CommandMap commandMap) throws Exception{ 
	    ModelAndView mv = new ModelAndView("redirect:/adminGoodsList.pulu");
	  
	  adminGoodsService.updateAdminGoodsD(commandMap.getMap());
	  
	  return mv; 
	}









}

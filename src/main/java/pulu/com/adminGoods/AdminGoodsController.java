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



@Controller
public class AdminGoodsController {
	Logger log = Logger.getLogger(this.getClass());

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
		List<Map<String, Object>> resultMap = adminGoodsService.adminGoodsList(commandMap.getMap());
		mv.addObject("adminlist",resultMap);

		return mv;
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
    
	//게시글 수정
	@RequestMapping(value="/adminGoodsUpdate")
	public ModelAndView adminGoodsUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/adminGoodsList.pulu");

		adminGoodsService.adminGoodsUpdate(commandMap.getMap(), request);

		mv.addObject("goodsnum", commandMap.get("goodsnum")); //image goodsnum 으로
		return mv;
	}









}

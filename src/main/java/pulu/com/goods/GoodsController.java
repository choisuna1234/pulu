package pulu.com.goods;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pulu.com.common.CommandMap;

@Controller
public class GoodsController {

	@Resource(name="goodsService")
	private GoodsService goodsService;

	@RequestMapping(value="/List")
	public ModelAndView List(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("goods_list");
		List<Map<String, Object>> list = goodsService.goodsList(Integer.parseInt(request.getParameter("categoryNo")));
		mv.addObject("goodsList",list);

		return mv;
	}

	@RequestMapping(value="/Detail")
	public ModelAndView Detail(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("goods_detail");
		System.out.println(commandMap.getMap());
		Map<String,Object> map = goodsService.goodsDetail(commandMap.getMap());

		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		return mv;
	}


}

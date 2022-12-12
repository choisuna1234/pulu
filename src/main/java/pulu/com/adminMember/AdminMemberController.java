package pulu.com.adminMember;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import pulu.com.common.CommandMap;

@Controller
@Log4j
public class AdminMemberController {
	
	@Resource(name = "adminService")
	private AdminMemberService adminService;
	
	/* ---------------------- (1) 관리자-회원 ---------------------- */
	
	// 선민: 전체 회원리스트 가져오기
	@RequestMapping(value = "/adminMemberList")
	public ModelAndView selectMemberList(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin_member_list");
		
		List<Map<String, Object>> list = adminService.selectMemberList(commandMap.getMap());
		mv.addObject("adminMemberList", list);

		return mv;
	}
	
	// 선민: 단일 회원정보 가져오기, 상세보기 창으로 이동
	@RequestMapping(value = "/adminMemberDetail")
	public ModelAndView adminMemberDetail(HttpServletRequest request) throws Exception {                                                                                                                                                                                                                                                                                                                                                                                                                                    
		
		ModelAndView mv = new ModelAndView("/adminMember/adminMemberDetail");
	
		String id = request.getParameter("ID");
		Map<String, Object> map = adminService.selectMemberInfo(id);
		mv.addObject("adminMemberDetail", map);
		
		return mv;
	}
	
	// 선민: 회원정보 수정 창으로 이동
	@RequestMapping(value = "/adminMemberUpdateForm", method = RequestMethod.POST)
	public ModelAndView adminMemberUpdateForm(CommandMap commandMap) throws Exception {                                                                                                                                                                                                                                                                                                                                                                                                                                    
		
		ModelAndView mv = new ModelAndView("/adminMember/adminMemberUpdate");
	
		String id = (String)commandMap.get("ID");
		Map<String, Object> map = adminService.selectMemberInfo(id);
		mv.addObject("adminMemberUpdate", map);
		
		return mv;
	}
	
	// 선민: 회원정보 수정(DB에 update), 상세정보 창으로 이동
	@RequestMapping(value = "/adminMemberUpdate", method = RequestMethod.POST)
	public ModelAndView adminMemberUpdate(CommandMap commandMap) throws Exception {                                                                                                                                                                                                                                                                                                                                                                                                                                    
		
		ModelAndView mv = new ModelAndView("/adminMember/adminMemberDetail");
		
		String id = (String)commandMap.get("ID");
		adminService.updateMemberInfo(commandMap.getMap());
		Map<String, Object> map = adminService.selectMemberInfo(id);
		mv.addObject("adminMemberDetail", map);
		
		return mv;
	}
	
	// 선민: 회원정보 삭제(DB에 delete)
	@RequestMapping(value = "/adminMemberDelete", method = RequestMethod.POST)
	public String adminMemberDelete(HttpServletRequest request, CommandMap commandMap) throws Exception {
		
		String ID = (String)commandMap.getMap().get("ID");
		log.info(ID + "의 정보를 삭제합니다.");
		adminService.deleteMemberInfo(ID);
		
		return "redirect:/adminMemberDelete.pulu";
	}
		
	// 선민: 삭제완료 창으로 이동
	@RequestMapping(value = "/adminMemberDelete", method = RequestMethod.GET)
	public String adminMemberDelete() throws Exception {
		
		return "/adminMember/adminMemberDelete";
	}
	
	/* ---------------------- (2) 관리자-게시판 ---------------------- */

	/* ---------------------- (3) 관리자-상품 ---------------------- */

	/* ---------------------- (4) 관리자-주문 ---------------------- */

}

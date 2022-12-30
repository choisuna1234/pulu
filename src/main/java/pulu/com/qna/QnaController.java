package pulu.com.qna;
//소영 : QNA 페이지 

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pulu.com.common.CommandMap;

@Controller // 웹 클라이언트에서 들어온 요청을 해당 비지니스 로직 호출, 수행결과와 함께 응답해주는 Dispatcher
public class QnaController {
	Logger log = Logger.getLogger(this.getClass());


	@Resource(name = "QnaService") // Service 영억 접근을 위한 선언(qnaServiceImpl의 이름과 통일)
	private QnaService qnaService; // 빈 수동 등록

	// QNA 리스트
	@RequestMapping(value = "/qnaList", method = RequestMethod.POST) // 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView qnaList(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("/goods/detail");
		ModelAndView mv = new ModelAndView("goods_detail"); // jsp 경로 설정

		// 받아오는 현제페이지가 없으면 페이지 1부터시작
		List<Map<String, Object>> qnaList = qnaService.qnaList(commandMap.getMap()); // service단의 qnaList
		Map<String, Object> qnaMap = qnaService.qnaDetail(commandMap.getMap());
																
			mv.addObject("qnaList", qnaList); // 서비스 로직 결과를 mv에 담아 jsp에서 사용
			mv.addObject("qnaMap", qnaMap);

			return mv;
	}

	
	// QNA 등록폼
	@RequestMapping(value = "/qnaInsertForm") // 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView qnaInsertForm(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("/goods/detail");
		ModelAndView mv = new ModelAndView("/board/qnaList"); // jsp 경로 설정

		return mv;
	}

	
	//  QNA 등록
	@RequestMapping(value = "/qnaInsert", method = RequestMethod.POST) // 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView qnaInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/Detail.pulu?GOODS_NUM="+commandMap.get("GOODS_NUM")+"#here3"); // 등록 후 리스트로 돌아갈 수 있도록 리다이렉트를 통한 jsp 경로 설정

		//로그인된 ID 정보
		HttpSession session = request.getSession();
		String QNA_ID = (String) session.getAttribute("loginId");
		commandMap.getMap().put("QNA_ID", QNA_ID);
		
		// 줄바꿈 시 <br/> 넣기
		String QNA_CONTENTS = (String)commandMap.get("QNA_CONTENTS");
		QNA_CONTENTS = QNA_CONTENTS.replace("\r\n", "<br/>");
		commandMap.getMap().put("QNA_CONTENTS", QNA_CONTENTS);
		
		qnaService.qnaInsert(commandMap.getMap(), request); // service단의 qnaInsert 로직 호출
		Map<String, Object> qnaMap = qnaService.qnaDetail(commandMap.getMap());
		
		mv.addObject("qnaMap", qnaMap);
		
		return mv;
	}

	
	// QNA 수정폼 이동
	@RequestMapping(value = "/qnaUpdateForm")
	public ModelAndView qnaUpdateForm(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("/goods/detail");
		ModelAndView mv = new ModelAndView("/goods/comment/qnaUpdateForm");
		
		Map<String, Object> qnaMap = qnaService.qnaDetail(commandMap.getMap());// 상세보기 정보를 맵에서 받아옴
		// 상세보기에 들어있는 정보를 꺼내서 mv에 다시저장

		mv.addObject("qnaMap", qnaMap);

		System.out.println(qnaMap);
		System.out.println("수정완료");
		return mv;
	}

	
	// QNA 수정
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public ModelAndView qnaUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/Detail.pulu");
		
		// 줄바꿈 시 <br/> 넣기
		String QNA_CONTENTS = (String)commandMap.get("QNA_CONTENTS");
		QNA_CONTENTS = QNA_CONTENTS.replace("\r\n", "<br/>");
		commandMap.getMap().put("QNA_CONTENTS", QNA_CONTENTS);
		
		qnaService.qnaUpdate(commandMap.getMap(), request);
		Map<String, Object> qnaMap = qnaService.qnaDetail(commandMap.getMap());// 상세보기 정보를 맵에서 받아옴
		// 상세보기에 들어있는 정보를 꺼내서 mv에 다시저장
		
		mv.addObject("qnaMap", qnaMap);
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		mv.addObject("QNA_CONTENTS", commandMap.get("QNA_CONTENTS"));
		mv.addObject("QNA_GOODS_NUM",commandMap.get("QNA_GOODS_NUM"));
		mv.addObject("GOODS_NUM",commandMap.get("QNA_GOODS_NUM"));
		
		System.out.println(commandMap.get("QNA_NUM"));
		System.out.println(commandMap.get("QNA_GOODS_NUM"));
		System.out.println(commandMap.get("QNA_CONTENTS"));
		
		return mv;
	}

	
	// QNA 삭제하기
	@RequestMapping(value = "/qnaDelete")
	public ModelAndView qnaDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/Detail.pulu?GOODS_NUM="+commandMap.get("GOODS_NUM")+"#here3");

		// 줄바꿈 시 <br/> 넣기
		String QNA_CONTENTS = (String)commandMap.get("QNA_CONTENTS");
		QNA_CONTENTS = QNA_CONTENTS.replace("\r\n", " ");
		commandMap.getMap().put("QNA_CONTENTS", QNA_CONTENTS);
		
		qnaService.qnaDelete(commandMap.getMap(), request);
		Map<String, Object> map = qnaService.qnaDetail(commandMap.getMap());// 상세보기 정보를 맵에서 받아옴
		// 상세보기에 들어있는 정보를 꺼내서 mv에 다시저장

		mv.addObject("map", map);

		return mv;
	}
}

package pulu.com.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.log4j.Log4j;

// 선민: 관리자페이지 권한 인터셉터
@Log4j
public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String loginGrade = (String) session.getAttribute("loginGrade");
		log.info("\n=== 세션 등급: " + loginGrade + " ===");

		if (loginGrade == null || loginGrade.equals("Admin") == false) { // 관리자 계정 아닌 경우
			log.info("\n=== 관리자 권한 없음 ===");
			response.sendRedirect("/main.pulu"); // 메인페이지로 리다이렉트
			return false;
		}
		
		return true; // 관리자 계정 로그인 경우
	}

}

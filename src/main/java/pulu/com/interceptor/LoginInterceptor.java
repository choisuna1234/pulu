package pulu.com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String loginStatus = (String) session.getAttribute("loginStatus");
		
		if (loginStatus != null) { 
			log.info("\n=== 이미 로그인 세션이 존재 ===");
			response.sendRedirect("/main.pulu"); // 메인페이지로 리다이렉트
			return false;
		}
		else {
			log.info("\n=== 로그인 세션이 존재하지 않음 ===");
			log.info("\n=== 로그인 전 세션 초기화 ===");
			session.invalidate();
			return true;
		}
	}

}

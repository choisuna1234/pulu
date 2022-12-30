package pulu.com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.log4j.Log4j;

@Log4j
public class OrderInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String loginStatus = (String) session.getAttribute("loginStatus");

		if (loginStatus == null) {
			log.info("\n=== 로그인 없이 진입 불가 ===");
			response.sendRedirect("/main.pulu"); // 메인페이지로 리다이렉트
			return false;
		}

		return true;
	}

}

package pulu.com.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {

	/* ---------------------- (1) 회원가입 ---------------------- */

	// 선민: 회원정보를 DB에 등록
	void insertMember(Map<String, Object> map) throws Exception;

	// 선민: 아이디 중복확인
	String confirmId(String inputId) throws Exception;
	
	/* ---------------------- (2) 로그인 ---------------------- */
	
	// 선민: 로그인 정보 불러오기
	Map<String, Object> selectId(Map<String, Object> map) throws Exception;
	
	// 선아: 아이디 찾기
	Map<String, Object> findId(Map<String, Object> map) throws Exception;

	// 선아: 비밀번호 찾기
	Map<String, Object> findPw(Map<String, Object> map) throws Exception;
	
	// 선아: 아이디찾기 실패
	Map<String, Object> findFail0(Map<String, Object> map) throws Exception;

	// 선아: 비밀번호찾기 실패
	Map<String, Object> findFail(Map<String, Object> map) throws Exception;

	
	/* ---------------------- (3) 마이페이지 ---------------------- */

	// 선아: 회원정보 조회
	void memberInfo(Map<String, Object> map) throws Exception;

	// 선아: 회원탈퇴
	void memberDelete(Map<String, Object> commandMap) throws Exception;

}

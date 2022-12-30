package pulu.com.member;

import java.util.List;
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
	Map<String, Object> memberInfo(Map<String, Object> map) throws Exception;

	// 선아: 회원탈퇴
	void memberDelete(Map<String, Object> commandMap) throws Exception;

	// 선아: 회원수정
	void memberUpdate(Map<String, Object> commandMap) throws Exception;

	// 선아: 새 비밀번호 변경
	void newPassword(Map<String, Object> commandMap) throws Exception;

	// 병찬: 나의 후기 리스트
	List<Map<String, Object>> myReview(Map<String, Object> map) throws Exception;

	// 선민: 마이페이지 주문 리스트
	public List<Map<String, Object>> myInfoOrder(Map<String, Object> map) throws Exception;

	// 병찬: 마이페이지 주문 상세보기
	public List<Map<String, Object>> myInfoOrderDetail(Map<String, Object> map) throws Exception;

	// 병찬: 마이페이지 주문 상세보기
	public Map<String, Object> myInfoOrderDetail2(Map<String, Object> map) throws Exception;

	// 병찬: 마이페이지 주문 수정
	public void myInfoOrderUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// 병찬: 마이페이지 주문 취소
	public void myInfoOrderDelete(Map<String, Object> map) throws Exception;
	
}

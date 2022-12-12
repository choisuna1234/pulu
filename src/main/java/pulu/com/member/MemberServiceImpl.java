package pulu.com.member;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service("memberService")
@Log4j
public class MemberServiceImpl implements MemberService {
	
	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;
	
	
	/* ---------------------- (1) 회원가입 ---------------------- */
	
	@Override // 회원정보를 DB에 등록
	public void insertMember(Map<String, Object> map) throws Exception {
		log.info(map.get("ID")); //
		log.info("ServiceImple의 insertMember() 동작");
		memberDAO.insertMember(map);
	}
	
	@Override // 선민: 아이디 중복확인
	public String confirmId(String inputId) throws Exception {
		return memberDAO.confirmId(inputId);
	}
	
	/* ---------------------- (2) 로그인 ---------------------- */
	
	@Override // 선민: 로그인 정보 불러오기
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		return memberDAO.selectId(map);
	}

	@Override // 선아: 아이디 찾기
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		return memberDAO.findId(map);
	}

	@Override // 선아: 비밀번호 찾기
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception {
		return memberDAO.findPw(map);
	}
	
	@Override // 선아: 아이디 찾기 실패
	public Map<String, Object> findFail0(Map<String, Object> map) throws Exception {
		return memberDAO.findFail0(map);
	}

	@Override // 선아: 비밀번호 찾기 실패
	public Map<String, Object> findFail(Map<String, Object> map) throws Exception {
		return memberDAO.findFail(map);
	}
	
	/* ---------------------- (3) 마이페이지 ---------------------- */
	
	@Override //선아: 마이페이지 정보 수정
	public void memberInfo(Map<String, Object> map) throws Exception {
		memberDAO.memberInfo(map);
	}
	
	@Override // 선아: 회원탈퇴
	public void memberDelete(Map<String, Object> map) throws Exception {
		log.info(map.get("str_Num"));
		log.info("ServiceImple의 memberDelete() 동작");
		memberDAO.memberDelete(map);
	}

}
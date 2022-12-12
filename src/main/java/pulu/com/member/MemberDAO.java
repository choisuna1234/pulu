package pulu.com.member;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.log4j.Log4j;
import pulu.com.common.AbstractDAO;

@Repository("memberDAO")
@Log4j
public class MemberDAO extends AbstractDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/* ---------------------- (1) 회원가입 ---------------------- */

	// 선민: 회원정보를 DB에 등록
	public void insertMember(Map<String, Object> map) throws Exception {
		log.info(map.get("ID")); //
		log.info("memberDao의 insertMember() 동작");
		insert("member.insertMember", map);
	}
	
	// 선민: 아이디 중복확인
	public String confirmId(String inputId) throws Exception { 
		return (String)selectOne("member.confirmId", inputId);
	}

	/* ---------------------- (2) 로그인 ---------------------- */

	// 선민: 로그인 정보 불러오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("member.selectId", map);
	}

	// 선아: 아이디 찾기
	@SuppressWarnings("unchecked")
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.findId", map);
	}

	// 선아: 비번 찾기
	@SuppressWarnings("unchecked")
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.findPw", map);
	}

	// 선아: 아이디 찾기 실패
	@SuppressWarnings("unchecked")
	public Map<String, Object> findFail0(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.findId_fail", map);
	}

	// 선아: 비밀번호 찾기 실패
	@SuppressWarnings("unchecked")
	public Map<String, Object> findFail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.findPw_fail", map);
	}

	/* ---------------------- (3) 마이페이지 ---------------------- */

	//선아: 회원 수정페이지
	public void memberInfo(Map<String, Object> map) throws Exception {
	update("member.memberInfo", map);
	}
	

	
	//선아: 회원탈퇴
	public void memberDelete(Map<String, Object> map) throws Exception {
		// return (Map<String,Object>)update("member.memberDelete",map);
		log.info(map.get("str_Num")); //
		log.info("memberDao의 memberDelete() 동작");
		update("member.memberDelete", map);

	}

}
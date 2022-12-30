package pulu.com.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import pulu.com.order.OrderListDTO;
import pulu.com.order.OrderListItemDTO;

@Service("memberService")
@Log4j
public class MemberServiceImpl implements MemberService {

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;

	/* ---------------------- (1) 회원가입 ---------------------- */

	@Override // 회원정보를 DB에 등록
	public void insertMember(Map<String, Object> map) throws Exception {
		//log.info(map.get("ID")); //
		//log.info("ServiceImple의 insertMember() 동작");
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

	@Override // 선아: 마이페이지 정보 수정(조회)
	public Map<String, Object> memberInfo(Map<String, Object> map) throws Exception {
		return memberDAO.memberInfo(map);
	}

	@Override // 선아: 회원탈퇴
	public void memberDelete(Map<String, Object> map) throws Exception {
		//log.info(map.get("str_Num"));
		//log.info("ServiceImple의 memberDelete() 동작");
		memberDAO.memberDelete(map);
	}

	@Override // 선아: 회원수정
	public void memberUpdate(Map<String, Object> map) throws Exception {
		memberDAO.memberUpdate(map);
	}

	@Override // 선아: 새 비밀번호 변경
	public void newPassword(Map<String, Object> map) throws Exception {
		memberDAO.newPassword(map);
	}
	
	@Override // 병찬: 나의 후기 목록
	public List<Map<String, Object>> myReview(Map<String, Object> map) throws Exception {
		
		return memberDAO.myReview(map);
	}

	@Override // 선민: 마이페이지 주문 리스트
	public List<Map<String, Object>> myInfoOrder(Map<String, Object> map) throws Exception {
		
		return memberDAO.myInfoOrder(map);
	}

	@Override // 병찬: 마이페이지 주문 상세보기
	public List<Map<String, Object>> myInfoOrderDetail(Map<String, Object> map) throws Exception {
		
		return memberDAO.myInfoOrderDetail(map);
	}
	
	@Override // 병찬: 마이페이지 주문 상세보기
	public Map<String, Object> myInfoOrderDetail2(Map<String, Object> map) throws Exception {
		
		return memberDAO.myInfoOrderDetail2(map);
	}

	@Override // 병찬: 마이페이지 주문 수정
	public void myInfoOrderUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		memberDAO.myInfoOrderUpdate(map);
	}

	@Override // 병찬: 마이페이지 주문 취소
	public void myInfoOrderDelete(Map<String, Object> map) throws Exception {
			
		memberDAO.myInfoOrderDelete(map);
		
		List<Map<String, Object>> list = memberDAO.goodsAmountSelect(map);
		
		for(Map<String, Object> mapp : list) {
			
			
			
			memberDAO.goodsAmountUpdate(mapp);	
		}
	}
}
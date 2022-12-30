package pulu.com.member;

import java.util.ArrayList;
import java.util.List;
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
		return (String) selectOne("member.confirmId", inputId);
	}

	/* ---------------------- (2) 로그인 ---------------------- */

	// 선민: 로그인 정보 불러오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectId", map);
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

	// 선아: 회원 수정페이지
	@SuppressWarnings("unchecked")
	public Map<String, Object> memberInfo(Map<String, Object> map) throws Exception {
		log.info("memberDAO>>>>>>>>>>>>>>" + map);
		return (Map<String, Object>) selectOne("member.memberInfo", map);
	}

	// 선아: 회원탈퇴
	public void memberDelete(Map<String, Object> map) throws Exception {
		// return (Map<String,Object>)update("member.memberDelete",map);
		log.info(map.get("str_Num"));
		log.info("memberDao의 memberDelete() 동작");
		update("member.memberDelete", map);
	}

	// 선아: 회원수정
	public void memberUpdate(Map<String, Object> map) throws Exception {
		update("member.memberUpdate", map);
	}

	// 선아: 새 비밀번호 변경
	public void newPassword(Map<String, Object> map) throws Exception {
		update("member.newPassword", map);
	}

	// 병찬: 내가 쓴 후기 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myReview(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("review.myReview", map);
	}

	// 선민: 마이페이지 주문 리스트 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myInfoOrder(Map<String, Object> map) throws Exception {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Integer> orderNumList = selectList("member.selectMyOrderNum", map);
		log.info("\n01. 회원이 주문한 모든 주문번호 == " + orderNumList);

		for (int ORDER_NUM : orderNumList) {
			Map<String, Object> orderDeliMap = (Map<String, Object>) selectOne("member.selectOrderDeliByOrderNum",
					ORDER_NUM);
			log.info("\n02. 주문번호 " + ORDER_NUM + "의 주문정보 == " + orderDeliMap);
			List<Map<String, Object>> orderGoodsList = (List<Map<String, Object>>) selectList(
					"member.selectOrderGoodsByOrderNum", ORDER_NUM);
			log.info("\n03. 주문번호 " + ORDER_NUM + "의 상품항목 수 == " + orderGoodsList.size());
			orderDeliMap.put("ORDER_GOODS_COUNT", orderGoodsList.size());
			orderDeliMap.put("ORDER_GOODS_NUM", orderGoodsList.get(0).get("ORDER_GOODS_NUM"));
			orderDeliMap.put("ORDER_GOODS_NAME", orderGoodsList.get(0).get("ORDER_GOODS_NAME"));
			orderDeliMap.put("ORDER_GOODS_IMAGE", orderGoodsList.get(0).get("ORDER_GOODS_IMAGE"));
			list.add(orderDeliMap);
		}
		return list;
	}

	// 병찬: 마이페이지 주문 상세보기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myInfoOrderDetail(Map<String, Object> map) throws Exception {

		List<Map<String, Object>> list = selectList("member.selectOrderGoodsByOrderNum", map);

		return list;
	}

	// 병찬: 마이페이지 주문 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> myInfoOrderDetail2(Map<String, Object> map) throws Exception {

		Map<String, Object> mapp = (Map<String, Object>) selectOne("member.selectOrderDeliByOrderNum", map);

		return mapp;
	}

	// 병찬: 마이페이지 주문 수정
	public void myInfoOrderUpdate(Map<String, Object> map) throws Exception {

		update("member.myInfoOrderUpdate", map);
	}

	// 병찬: 마이페이지 주문 취소
	public void myInfoOrderDelete(Map<String, Object> map) throws Exception {

		delete("member.myInfoOrderDelete", map);
	}
	
	//
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsAmountSelect(Map<String, Object> map) throws Exception {
		
		List<Map<String, Object>> list = selectList("member.goodsAmountSelect", map);
		
		return list;
	}
	
	
	//
	public void goodsAmountUpdate(Map<String, Object> map) throws Exception {
		
		update("member.goodsAmountUpdate", map);
	}

}

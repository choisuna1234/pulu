package pulu.com.adminMember;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import lombok.extern.log4j.Log4j;
import pulu.com.common.AbstractDAO;

@Repository("adminDAO")
@Log4j
public class AdminMemberDAO extends AbstractDAO {

	/* ---------------------- (1) 관리자-회원 ---------------------- */

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("adminMember.selectMemberList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(String id) throws Exception {
		return (Map<String, Object>)selectOne("adminMember.selectMemberInfo", id);
	}
	
	@SuppressWarnings("unchecked")
	public void updateMemberInfo(Map<String, Object> map) throws Exception {
		selectOne("adminMember.updateMemberInfo", map);
	}

//	@SuppressWarnings("unchecked")
	public void deleteMemberInfo(String id) throws Exception {
		delete("adminMember.deleteMemberInfo", id); 
	}
	
	/* ---------------------- (2) 관리자-게시판 ---------------------- */

	/* ---------------------- (3) 관리자-상품 ---------------------- */

	/* ---------------------- (4) 관리자-주문 ---------------------- */

}

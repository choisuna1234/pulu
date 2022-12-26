package pulu.com.adminMember;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import lombok.extern.log4j.Log4j;
import pulu.com.common.AbstractDAO;

@Repository("adminDAO")
@Log4j
public class AdminMemberDAO extends AbstractDAO {

	/* ---------------------- (1) 관리자-회원 ---------------------- */

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminMember.selectMemberList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(String id) throws Exception {
		return (Map<String, Object>) selectOne("adminMember.selectMemberInfo", id);
	}

	public void updateMemberInfo(Map<String, Object> map) throws Exception {
		selectOne("adminMember.updateMemberInfo", map);
	}

	public void deleteMemberInfo(String id) throws Exception {
		delete("adminMember.deleteMemberInfo", id);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchMemberInfo(HttpServletRequest request, Map<String, Object> map) throws Exception {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		int option = Integer.parseInt(request.getParameter("SEARCH_OPTION"));

		switch (option) {
		case 1:
			list = (List<Map<String, Object>>) selectList("adminMember.searchMemberInfoById", map);
			break;
		case 2:
			list = (List<Map<String, Object>>) selectList("adminMember.searchMemberInfoByName", map);
			break;
		case 3:
			list = (List<Map<String, Object>>) selectList("adminMember.searchMemberInfoByPhone", map);
			break;
		default:
			list = (List<Map<String, Object>>) selectList("adminMember.searchMemberInfoByAll", map);
			break;
		}

		return list;
	}

	/* ---------------------- (2) 관리자-게시판 ---------------------- */

	/* ---------------------- (3) 관리자-상품 ---------------------- */

	/* ---------------------- (4) 관리자-주문 ---------------------- */

}

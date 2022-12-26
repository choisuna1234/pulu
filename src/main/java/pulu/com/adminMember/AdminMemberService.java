package pulu.com.adminMember;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminMemberService {

	/* ---------------------- (1) 관리자-회원 ---------------------- */

	List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMemberInfo(String id) throws Exception;

	void updateMemberInfo(Map<String, Object> map) throws Exception;

	void deleteMemberInfo(String id) throws Exception;

	List<Map<String, Object>> searchMemberInfo(HttpServletRequest request, Map<String, Object> map) throws Exception;

	/* ---------------------- (2) 관리자-게시판 ---------------------- */

	/* ---------------------- (3) 관리자-상품 ---------------------- */

	/* ---------------------- (4) 관리자-주문 ---------------------- */

}

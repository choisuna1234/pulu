package pulu.com.adminMember;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service("adminService")
@Log4j
public class AdminMemberServiceImpl implements AdminMemberService {

	@Resource(name = "adminDAO")
	private AdminMemberDAO adminDAO;

	/* ---------------------- (1) 관리자-회원 ---------------------- */

	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return adminDAO.selectMemberList(map);
	}

	@Override
	public Map<String, Object> selectMemberInfo(String id) throws Exception {
		return adminDAO.selectMemberInfo(id);
	}

	@Override
	public void updateMemberInfo(Map<String, Object> map) throws Exception {
		adminDAO.updateMemberInfo(map);
	}

	@Override
	public void deleteMemberInfo(String id) throws Exception {
		adminDAO.deleteMemberInfo(id);

	}

	@Override
	public List<Map<String, Object>> searchMemberInfo(HttpServletRequest request, Map<String, Object> map) throws Exception {
		return adminDAO.searchMemberInfo(request, map);
	}

	/* ---------------------- (2) 관리자-게시판 ---------------------- */

	/* ---------------------- (3) 관리자-상품 ---------------------- */

	/* ---------------------- (4) 관리자-주문 ---------------------- */

}

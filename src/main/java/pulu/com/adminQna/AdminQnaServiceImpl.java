package pulu.com.adminQna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("AdminQnaService")
public class AdminQnaServiceImpl implements AdminQnaService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "AdminQnaDAO")
	private AdminQnaDAO adminQnaDAO;

	// 관리자 QNA 리스트
	@Override
	public List<Map<String, Object>> adminQnaList(Map<String, Object> map) throws Exception {
		return adminQnaDAO.adminQnaList(map);
	}

	// 관리자 QNA 검색0 - 상품번호
	@Override
	public List<Map<String, Object>> adminQnaSearch0(Map<String, Object> map) throws Exception {
		return adminQnaDAO.adminQnaSearch0(map);
	}

	// 관리자 QNA 검색1 - 작성자
	@Override
	public List<Map<String, Object>> adminQnaSearch1(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminQnaDAO.adminQnaSearch1(map);
	}

	// 관리자 QNA 상세보기
	@Override
	public Map<String, Object> adminQnaDetail(Map<String, Object> map) throws Exception {
		return adminQnaDAO.adminQnaDetail(map);
	}

	// 관리자 QNA 삭제
	@Override
	public void adminQnaDelete(Map<String, Object> map) throws Exception {
		adminQnaDAO.adminQnaDelete(map);
		
	}

	// 관리자 QNA 코멘트 작성
	@Override
	public void adminQnaComInsert(Map<String, Object> map) throws Exception {
		adminQnaDAO.adminQnaComInsert(map);
		
	}

	// 관리자 QNA 코멘트 수정
	@Override
	public void adminQnaComUpdate(Map<String, Object> map) throws Exception {
		adminQnaDAO.adminQnaComUpdate(map);
		
	}

	// 관리자 QNA 코멘트 삭제
	@Override
	public void adminQnaComDelete(Map<String, Object> map) throws Exception {
		adminQnaDAO.adminQnaComDelete(map);
		
	}
}

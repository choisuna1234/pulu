package pulu.com.qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("QnaService")
public class QnaServiceImpl implements QnaService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "QnaDAO")
	private QnaDAO qnaDAO;

	@Override
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		return qnaDAO.qnaList(map);
	}

	// 검색 1 - 제목
	@Override
	public List<Map<String, Object>> qnaSearch0(Map<String, Object> map) throws Exception {
		return qnaDAO.qnaSearch0(map);	}

	// 검색 1 - 아이디
	@Override
	public List<Map<String, Object>> qnaSearch1(Map<String, Object> map) throws Exception {
		return qnaDAO.qnaSearch1(map);
	}

	@Override
	public void qnaInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
		qnaDAO.qnaInsert(map);
	}

	@Override
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {
		return qnaDAO.qnaDetail(map);
	}

	@Override
	public void qnaUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		qnaDAO.qnaUpdate(map);
	}

	@Override
	public void qnaDelete(Map<String, Object> map, HttpServletRequest request) throws Exception {
		qnaDAO.qnaDelete(map);
	}
	
	

}

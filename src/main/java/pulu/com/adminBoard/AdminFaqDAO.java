package pulu.com.adminBoard;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pulu.com.common.AbstractDAO;

@Repository("AdminFaqDAO")	//데이터베이스 접근, 조작 저장소
public class AdminFaqDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	/*코드가 형 안전성을 보장한다는 사실을 입증할 수 있다면, 
	@SuppressWarnings("unchecked")어노테이션을 사용해 해당 경고를 억제(어노테이션 적용 범위는 최소화) 
	그리고, 경고 메시지를 억제한 이유를 주석을 통해 알리는것을 추천*/
	public List<Map<String, Object>> adminFaqList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("faq.faqList", map);
				//쿼리에 필요한 변수						 //쿼리 이름
	}

	public void adminFaqInsert(Map<String, Object> map) throws Exception {
		insert("faq.adminFaqInsert", map);
	}

	public void updateReadCount(Map<String, Object> map) throws Exception {
		update("faq.faqUpdateReadCount", map);
		
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> adminFaqDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("faq.faqDetail", map);
	}

	public void adminfaqUpdate(Map<String, Object> map) throws Exception {
		update("faq.faqUpdate", map);
	}

	public void adminFaqDelete(Map<String, Object> map) throws Exception {
		update("faq.faqDelete", map);
	}
	
	//FAQ검색=1
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> faqSearch0(Map<String,Object>map){
		return (List<Map<String,Object>>) selectList("faq.faqSearch0", map);
		
	}
	//FAQ검색=2
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> faqSearch1(Map<String,Object>map){
		return (List<Map<String,Object>>) selectList("faq.faqSearch1", map);
		
	}

}

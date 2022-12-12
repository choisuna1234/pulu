package pulu.com.adminQna;

import java.util.List;
import java.util.Map;

public interface AdminQnaService {

	List<Map<String, Object>> adminQnaList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> adminQnaSearch0(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> adminQnaSearch1(Map<String, Object> map) throws Exception;

	Map<String, Object> adminQnaDetail(Map<String, Object> map) throws Exception;

	void adminQnaDelete(Map<String, Object> map) throws Exception;

	void adminQnaComInsert(Map<String, Object> map) throws Exception;

	void adminQnaComUpdate(Map<String, Object> map) throws Exception;

	void adminQnaComDelete(Map<String, Object> map) throws Exception;

}

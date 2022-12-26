package pulu.com.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("unchecked")
public class ObjToListUtils {

	public List<Map<String, Object>> objToList(Object obj) throws Exception {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		if (obj instanceof ArrayList<?>) {
			for (Object o : (List<?>) obj) {
				result.add(HashMap.class.cast(o));
			}
		}
		return result;
	}
}

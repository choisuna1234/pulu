package pulu.com.adminSales;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminSalesService")
public class AdminSalesServiceImpl implements AdminSalesService {
	
	@Resource(name="adminSalesDAO")	//데이터 접근을 위한 DAO 객체 선언.  //@Autowired : SC에 '타입'으로 저장됨!!
	private AdminSalesDAO adminSalesDAO;

}

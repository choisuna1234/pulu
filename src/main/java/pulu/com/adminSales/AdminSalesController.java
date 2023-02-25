package pulu.com.adminSales;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

@Controller 
public class AdminSalesController {
	
	@Resource(name = "adminSalesService")
	private AdminSalesService adminSalesService;

}

package pulu.com.order;

import java.util.List;

import lombok.Data;

@Data
public class OrderListDTO {
	
	private List<OrderListItemDTO> orders;
	
	@Override
	public String toString() {
		return "OrderListDTO [orders=" + orders + "]";
	}

}

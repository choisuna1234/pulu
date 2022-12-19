package pulu.com.basket;

import java.util.List;

import lombok.Data;

@Data
public class BasketListDTO {
	
	private List<BasketListItemDTO> orders;
	
	@Override
	public String toString() {
		return "BasketListDTO [orders=" + orders + "]";
	}

}

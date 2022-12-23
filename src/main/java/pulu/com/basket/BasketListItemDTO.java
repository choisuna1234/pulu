package pulu.com.basket;

import lombok.Data;

@Data
public class BasketListItemDTO {

	// 뷰로부터 전달받을 값
	private int GOODS_NUM;
	private int SELECTED_GOODS_AMOUNT;
	private int BASKET_NUM = 0;

	// DB로부터 꺼내올 값
//	private String GOODS_NAME;
//	private int GOODS_PRICE;
//	private String IMAGE_STORED;

	// 만들어낼 값
//	private int totalPrice = 0;

	// 단일 항목 총 가격 계산
//	public int initTotalPrice() {
//		this.totalPrice = this.GOODS_PRICE * this.SELECTED_GOODS_AMOUNT;
//		return this.totalPrice;
//	}
//	
//	@Override
//	public String toString() {
//		return "BasketListItemDTO [GOODS_NUM=" + GOODS_NUM + ", SELECTED_GOODS_AMOUNT=" + SELECTED_GOODS_AMOUNT + ", GOODS_NAME=" + GOODS_NAME
//				+ ", GOODS_PRICE=" + GOODS_PRICE + ", totalPrice=" + totalPrice + "]";
//	}
}

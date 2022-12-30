package pulu.com.order;

import lombok.Data;

@Data
public class OrderListItemDTO {

	// 뷰로부터 전달받을 값 (ORDER_DELI)
	private int ORDER_PAY_TYPE;
	private String ORDER_MEMBER_ID;
	private String ORDER_MEMBER_NAME;
	private String ORDER_MEMBER_ZIPCODE;
	private String ORDER_MEMBER_ADDR1;
	private String ORDER_MEMBER_ADDR2;
	private String ORDER_MEMBER_PHONE; //
	private String ORDER_RECEIVE_NAME;
	private String ORDER_RECEIVE_ZIPCODE;
	private String ORDER_RECEIVE_ADDR1;
	private String ORDER_RECEIVE_ADDR2;
	private String ORDER_RECEIVE_PHONE; //
	private String ORDER_MEMO;
	private String ORDER_SUM_MONEY; //

	// 뷰로부터 전달받을 값 (ORDER_DELI)
	private int ORDER_GOODS_NUM;
	private String ORDER_GOODS_NAME;
	private int ORDER_GOODS_PRICE;
	private int ORDER_GOODS_AMOUNT;
	private String ORDER_GOODS_IMAGE;

}
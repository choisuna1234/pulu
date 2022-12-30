<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>

<style>
.allbasketContainer {
	position: relative;
	width: 100%;
	min-width: 1280px;
	margin: 0px auto 0;
}

.allbasketContainer:after {
	content: "";
	display: block;
	clear: both;
}

.basketContainer {
	width: 100%;
	margin: 0 auto;
	*zoom: 1;
	max-width: 1920px;
}

.subcontenet {
	width: 100%;
	min-width: 1280px;
	margin: 0 auto;
}

.wid1280px {
	width: 100%;
	max-width: 1280px;
	margin: 0 auto;
}

.goodsimg {
	width: 80px;
}

.basketTitleArea {
	border: 0;
	margin-bottom: 30px;
	overflow: hidden;
	overflow-x: hidden;
	overflow-y: hidden;
	min-height: 30px;
	margin: 10px 0 20px;
	font-size: 15px;
}

.topCategory {
	overflow: hidden;
	line-height: 30px;
	*zoom: 1;
	margin: 0 20px 30px 0;
}

.topCategory ol {
	float: right;
}

.topCategory li {
	float: left;
	padding: 0 0 0 12px;
	margin: 0 0 0 8px;
	color: #555;
	background:
		url(//img.echosting.cafe24.com/skin/base/layout/ico_path.gif)
		no-repeat 0 12px;
}

.goodstable {
	position: relative;
	margin: 10px 0 0;
	border-top: 2px solid #01934c;
	border-bottom: 1px solid #d7d5d5;
	line-height: 1.5;
	width: 1280px;
	border-collapse: collapse;
}

.goodstable td.tableTitle {
	text-align: left;
	font-size: 15px;
	font-weight: 800;
}

.goodstable td {
	text-align: center;
}

.goodstable th, td {
	border-bottom: 1px solid #d7d5d5;
	padding: 10px;
}

.goodstable tfoot {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}

.head {
	height: 35px;
	font-size: 13px;
}

.basketTitle {
	font-size: 25px;
	color: #333333;
	font-weight: normal;
	font-family: '';
}

.basketTitleArea h2 {
	display: inline-block;
	color: #2e2e2e;
	font-size: 25px;
	*display: inline;
	vertical-align: top;
}

.basketTitle span {
	font-size: 15px;
	margin-left: 20px;
	font-family: '';
}

.basketProcess {
	display: inline-block;
	float: right;
	margin-top: 5px;
}

.basketTitleArea ul {
	padding: 5px 0;
	color: #939393;
	line-height: 18px;
}

.basketProcess ul li {
	position: relative;
	display: inline-block;
	font-size: 15px;
	color: #cccccc;
	padding: 0 25px 0 0px !important;
}

.basketProcess ul li.on {
	color: #01934c;
}

.btn a {
	transition: all 0.4s ease;
	font-size: 12px;
	color: #01934c;
	width: 92px;
	margin-right: 5px;
	float: left;
	height: 33px;
	line-height: 35px;
	display: inline-block;
	border: 1px solid #01934c;
	text-align: center;
}

.btn left {
	float: left;
}

.btn.right {
	float: right;
}

.totalAll {
	display: flex;
	justify-content: center;
	vertical-align: middle;
}

.total {
	float: left;
	font-size: 15px;
	font-weight: 800;
	margin: 0 40px 0 40px;
}

.totalicon {
	display: flex;
	align-items: center; /* 방향이 row 기준: 세로 중앙 정렬*/
	margin: 10px;
}

.finalTotalPrice_span {
	color: #ff0000;
}
</style>




<div class="allbasketContainer">
	<div class="basketContainer">
		<div class="subcontenet">
			<div class="wid1280px">
				<div class="topCategory">
					<ol>
						<li><a href="./main.pulu">홈</a></li>
						<li><strong>장바구니</strong></li>
					</ol>
				</div>
				<div class="basketTop">
					<div class="basketTitleArea">
						<h2 class="basketTitle">
							<b>장바구니</b> <span>주문하실 상품의 상품명과 수량을 정확히 확인해주세요.</span>
						</h2>
						<div class="basketProcess">
							<ul>
								<li class="on">01. 장바구니</li>
								<li>02. 주문서/결제</li>

								<li>03. 주문완료</li>
							</ul>
						</div>
					</div>


				</div>
				<div class="basketBody">
					<table class="goodstable">
						<colgroup>
							<col style="width: 50px">
							<col style="width: 80px">
							<col style="width: auto">
							<col style="width: 100px">
							<col style="width: 150px">
							<col style="width: 165px">
							<col style="width: 110px">
						</colgroup>
						<thead>
							<tr>
								<td colspan="7" class="tableTitle">
									<h3>상품정보 (${fn:length(list)})</h3>
								</td>
							</tr>
							<tr class="head">
								<th scope="col"><input type="checkbox" id="chkAll" onclick="chkAll();"></th>
								<th scope="col">이미지</th>
								<th scope="col">상품명</th>
								<th scope="col">수량</th>
								<th scope="col">배송비</th>
								<th scope="col">가격</th>
								<th scope="col">상품 금액</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list}" var="row" varStatus="status">
									<tfoot>
										<tr>
											<!-- 체크박스 -->
											<td class="basket_info">
												<input type="checkbox" class="checkbox" checked="checked">
												<input type="hidden" class="individual_goodsprice" value="${row.GOODS_PRICE}">
												<input type="hidden" class="individual_goods_amount" value="${row.BASKET_GOODS_AMOUNT}">
												<input type="hidden" class="individual_totalPrice" value="${row.GOODS_PRICE * row.BASKET_GOODS_AMOUNT}">
												<input type="hidden" class="individual_goods_num" value="${row.BASKET_GOODS_NUM}">
												<input type="hidden" class="individual_basket_num" value="${row.BASKET_NUM}">
											</td>

											<!-- 썸네일이미지 -->
											<td style="text-align: center">
												<a href="Detail.pulu?GOODS_NUM=${row.GOODS_NUM}"><img class="goodsimg" src="./resources/file/${row.IMAGE_STORED}" /></a>
											</td>

											<!-- 상품이름 -->
											<td style="text-align: center">
												<a href="Detail.pulu?GOODS_NUM=${row.GOODS_NUM}">${row.GOODS_NAME}</a>
											</td>

											<!-- 수량 -->
											<td style="text-align: center">
												<form id="items">
													<input type="hidden" value="${row.BASKET_GOODS_AMOUNT}" id='order_amount_${status.index}' name="SELECTED_GOODS_AMOUNT">
													<input type="hidden" value="${row.GOODS_NUM }" id='order_goods_num_${status.index}' name="GOODS_NUM">
													<input type="hidden" value="${row.BASKET_NUM}" id='order_basket_num_${status.index}' name="BASKET_NUM">
													<button type="button" onClick='changeAmount("minus",${status.index})' style="width: 30px;">-</button>
													<span id='amount_${status.index}' style="text-align: center; width: 30px">${row.BASKET_GOODS_AMOUNT}</span>
													<button type="button" onClick='changeAmount("plus",${status.index})' style="width: 30px;">+</button>
													<br />
												</form>
											</td>

											<!-- 배송비 -->
											<td style="text-align: center">
												<span id='delivery_fee_${status.index}'> 3,000원 </span>
											</td>

											<!-- 개당 가격 -->
											<td style="text-align: center">
												<span id='price_${status.index}'> <%-- ${row.GOODS_PRICE} --%> <fmt:formatNumber value="${row.GOODS_PRICE}" pattern="#,###,###" />원
												</span>
											</td>

											<!-- 단일 항목의 총 가격 -->
											<td style="text-align: center">
												<span id='price_sum_${status.index}'> <%-- ${row.BASKET_GOODS_AMOUNT * row.GOODS_PRICE} --%> <fmt:formatNumber value="${row.BASKET_GOODS_AMOUNT * row.GOODS_PRICE}" pattern="#,###,###" />원 <!-- 상품별 총 가격 -->
												</span>
											</td>
										</tr>
									</tfoot>

									<!-- 수량변경 저장 from -->
									<form class="amountForm" action="updateBasket.pulu" method="post">
										<input type="hidden" name="BASKET_NUM" class="basket_num">
										<input type="hidden" name="GOODS_NUM" class="goods_num">
										<input type="hidden" name="SELECTED_GOODS_AMOUNT" class="selected_goods_amount">
									</form>
									<!-- 상품주문 form -->
									<form action="orderByBasket.pulu" class="order_form" method="post"></form>
									<!-- 선택삭제 form -->
									<form action="deleteBasketSelect.pulu" class="delete_form" method="post"></form>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tfoot>
									<tr>
										<td colspan="7">장바구니가 비어 있습니다.</td>
									</tr>
								</tfoot>
							</c:otherwise>
						</c:choose>
						<c:if test="${fn:length(list) > 0}">
							<tr>
								<td colspan="7" align="center">
									<div class="totalAll">
										<div class="total">
											<strong>총 상품금액</strong><br> <strong><span class="totalPrice_span"></span>원</strong>
										</div>
										<img src="./resources/img/icon/shipping_bg.png" width="19px" height="19px" class="totalicon">
										<div class="total">
											배달비<br> <span class="delivery_price"></span>원
										</div>
										<img src="./resources/img/icon/basket_price_bg.png" width="19px" height="19px" class="totalicon">
										<div class="total">
											<strong class="total_title">결제예정금액</strong><br> <strong><span class="finalTotalPrice_span"></span>원</strong>
										</div>
									</div>
								</td>
							</tr>
						</c:if>
					</table>
				</div>
				<br />
				<div class="btn left">
					<a href='javascript:void(0);' class="delete_btn">선택 삭제</a>
					<a href="deleteBasketAll.pulu">전체 삭제</a>
				</div>
				<div class="btn right">
					<a href="list" class="btt">쇼핑 계속하기</a>
					<a href='javascript:void(0);' class="order_btn">상품주문</a>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
<!-- 선민: 주문페이지 이동 -->
$(".order_btn").on("click", function() {
	let form_contents ='';
	let orderNumber = 0;
	
	$(".basket_info").each(function(index, element) {
		
	    if($(element).find(".checkbox").is(":checked") === true) {	// 체크된 항목만 주문페이지로 이동
			let goodsNum = $(element).find(".individual_goods_num").val();
			let goodsAmount = $(element).find(".individual_goods_amount").val();
	
			let goodsNum_input = "<input name='orders[" + orderNumber + "].GOODS_NUM' type='hidden' value='" + goodsNum + "'>";
			form_contents += goodsNum_input;
			
			let goodsAmount_input = "<input name='orders[" + orderNumber + "].SELECTED_GOODS_AMOUNT' type='hidden' value='" + goodsAmount + "'>";
			form_contents += goodsAmount_input;
			
			orderNumber += 1;
	    }
	});
	
	$(".order_form").html(form_contents);
	$(".order_form").submit();
});

<!-- 선민: 체크박스 선택 삭제 -->
$(".delete_btn").on("click", function() {
	let form_contents ='';
	let orderNumber = 0;
	
	$(".basket_info").each(function(index, element) {
		
	    if($(element).find(".checkbox").is(":checked") === true) {	// 체크여부
			let basketNum = $(element).find(".individual_basket_num").val();
	
			let basketNum_input = "<input name='orders[" + orderNumber + "].BASKET_NUM' type='hidden' value='" + basketNum + "'>";
			form_contents += basketNum_input;
			
			orderNumber += 1;
	    }
	});
	
	$(".delete_form").html(form_contents);
	$(".delete_form").submit();
});

<!-- 선민: 수량변경 버튼 함수 (표시된 수량 변경 후 DB에 적용) -->
function updateAmount(type, index) {
	
	let form = $(".amountForm");
	const a = document.getElementById('amount_'+ index);
	const bn = document.getElementById('order_basket_num_'+ index);		
	
	if(type === 'plus') {
		let basket_num = bn.value;
		let selected_goods_amount = 1;
		$(".basket_num").val(basket_num);
		$(".selected_goods_amount").val(selected_goods_amount);
		form.submit();			
	}
	else if(type === 'minus') {
		let basket_num = bn.value;
		let selected_goods_amount = -1;
		$(".basket_num").val(basket_num);
		$(".selected_goods_amount").val(selected_goods_amount);
		form.submit();	
	}
}

<!-- 선민: 수량변경에 따른 단일항목의 총 상품금액 변경 -->
function changeAmount(type, index)  {
    
	const a = document.getElementById('amount_'+ index);
	const p = document.getElementById('price_'+ index);
	const ps = document.getElementById('price_sum_'+ index);
	const oa = document.getElementById('order_amount_'+ index);
	
	// 현재 화면에 표시된 값
	let amount = a.innerText; 
	let price = p.innerText;
	let price_sum = ps.innerText;
	
	price = price.replace(/,/g, "");
	price = price.replace("원", "");
	price_sum = price_sum.replace(/,/g, "");
	price_sum = price_sum.replace("원", "");
	
	if(type === 'plus') {
		amount = parseInt(amount) + 1;
		price_sum = parseInt(amount) * parseInt(price);
		price_sum = price_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
	}
	else if(type === 'minus') {
		amount = parseInt(amount) - 1;
		price_sum =  parseInt(amount) * parseInt(price);
		price_sum = price_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
	}
	
	if(parseInt(amount) < 1) {
		amount = 1;
		price_sum = parseInt(price);
		price_sum = price_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
	}
	
	// 결과 출력
	a.innerText = amount;
	ps.innerText = price_sum;
	
	document.getElementById('order_amount_'+ index).value = amount;
// 	alert("order amount == " + document.getElementById('order_amount_'+ index).value);

	updateAmount(type, index);
}

<!-- 선민: 체크박스 전체 선택 -->
function chkAll() {
	if( $("#chkAll").is(':checked') ) {
	$("input[name=checkRow]").prop("checked", true);
	} else {
	$("input[name=checkRow]").prop("checked", false);
	}	 	 
}

function chkAll2() {
	$("input[name=checkRow]").prop("checked", true);
}

function numberWithCommas(e) {
	return e.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>


<script>
$(document).ready(function(){
	
	/* 종합 정보 섹션 정보 삽입 */
	setTotalInfo();	
	
});	

/* 체크여부에따른 종합 정보 변화 */
$(".checkbox").on("change", function(){
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".basket_info"));
});

/* 체크박스 전체 선택 */
$("#chkAll").on("click", function(){

	/* 체크박스 체크/해제 */
	if($("#chkAll").prop("checked")){
		$(".checkbox").attr("checked", true);
	} else{
		$(".checkbox").attr("checked", false);
	}
	
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".basket_info"));	
	
});


/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)

	
	$(".basket_info").each(function(index, element){
		
		if($(element).find(".checkbox").is(":checked") === true){	//체크여부
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice").val());
			// 총 갯수
			totalCount += parseInt($(element).find(".individual_goods_amount").val());		
		}

	});
	
	
	/* 배송비 결정 */
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
		finalTotalPrice = totalPrice + deliveryPrice;
	
	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 배송비
	$(".delivery_price").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
}



</script>
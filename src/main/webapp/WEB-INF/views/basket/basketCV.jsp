<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</style>

<script>

$(document).ready(function(){
	/* 종합 정보 섹션 정보 삽입 */
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
	
	$(".check").each(function(index, element){
		
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		// 총 갯수
		totalCount += parseInt($(element).find(".individual_bookCount_input").val());
	});	
	
	/* 배송비 결정 */
		deliveryPrice = 3000;	
	
	/* 최종 가격 */
	finalTotalPrice = totalPrice + deliveryPrice;
	
	/* 값 삽입 */
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 배송비
	$(".delivery_price").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
});


function changeAmount(type, index)  {
	  
	const a = document.getElementById('amount_'+ index);
	const p = document.getElementById('price_'+ index);
	const ps = document.getElementById('price_sum_'+ index);
// 	const df = document.getElementById('delivery_fee_'+ index);
	const oa = document.getElementById('order_amount_'+ index);
	
	// 현재 화면에 표시된 값
	let amount = a.innerText; 
	let price = p.innerText;
	let price_sum = ps.innerText;
// 	let hhh = 0;
	
	price = price.replace(/,/g, "");
	price = price.replace("원", "");
	price_sum = price_sum.replace(/,/g, "");
	price_sum = price_sum.replace("원", "");

	
	if(type === 'plus') {
		amount = parseInt(amount) + 1;
		price_sum = parseInt(amount) * parseInt(price);
// 		hhh = priceee;
		price_sum = price_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
	}
	else if(type === 'minus') {
		amount = parseInt(amount) - 1;
		price_sum =  parseInt(amount) * parseInt(price);
// 		hhh = priceee;
		price_sum = price_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
	}
	if(parseInt(amount) < 1) {
		amount = 1;
		price_sum = parseInt(price);
		price_sum = price_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
// 		price_sum = '₩' + price_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	  
		// 결과 출력
		a.innerText = amount;
		ps.innerText = price_sum;
		
		document.getElementById('order_amount_'+ index).value = amount;
// 		alert("order amount == " + document.getElementById('order_amount_'+ index).value);
		
// 		if(hhh > 30000){
// 			dp.append('무료');
// 		}
// 		if(hhh <= 30000){
// 			dp.innerHtml = '3000원';
// 		}
		updateAmount(type, index);
	}





	/* 수량 수정 버튼 */
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

	function orderBasket() {
		let form = $(".basketListForm");
		form.submit();
	}
	function orderBasketAll() {
		var form = document.getElementById("basketListForm");
		form.action = "selectOrderBasketAllInfo.pulu";
		form.method = "post";
		form.submit();
	}
</script>
<script type="text/javascript">
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
								<th scope="col">
									<input type="checkbox" id="chkAll" onclick="chkAll();">
								</th>
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
								<!-- 포이치 시작 foreach -->
								<c:forEach items="${list}" var="row" varStatus="status">
									<tfoot>
										<tr>
											<!-- 체크박스 -->
											<td style="text-align: center" class="check">
												<input type="checkbox" id="checkRow" name="checkRow">
<%-- 												<input type="hidden" class="individual_bookPrice_input" value="${row.GOODS_PRICE}"> --%>
<%-- 												<input type="hidden" class="individual_bookCount_input" value="${row.BASKET_GOODS_AMOUNT}"> --%>
<%-- 												<input type="hidden" class="individual_totalPrice_input" value="${row.GOODS_PRICE * row.BASKET_GOODS_AMOUNT}"> --%>
											</td>

											<!-- 썸네일이미지 -->
											<td style="text-align: center">
												<img class="goodsimg" src="./resources/file/${row.IMAGE_STORED}" />
											</td>

											<!-- 상품이름 -->
											<td style="text-align: center">${row.GOODS_NAME}<br />index: ${status.index}
											</td>

											<!-- 수량 -->
											<td style="text-align: center">
												<form id="items">
													<input type="hidden" name="GOODS_NUM" value="${row.GOODS_NUM }">
													<input type="hidden" name="SELECTED_GOODS_AMOUNT" value="${row.BASKET_GOODS_AMOUNT}">
													<input type="hidden" id="b_num" name="BASKET_NUM" value="${row.BASKET_NUM}">
<%-- 													<input type="hidden" id='order_goods_num_${status.index}' name="GOODS_NUM" value="${row.GOODS_NUM }"> --%>
<%-- 													<input type="hidden" id='order_amount_${status.index}' name="SELECTED_GOODS_AMOUNT" value="${row.BASKET_GOODS_AMOUNT}"> --%>
<%-- 													<input type="hidden" id='order_basket_num_${status.index}' name="BASKET_NUM" value="${row.BASKET_NUM}"> --%>
													
													<button type="button" class='minus' style="width: 24px;"> - </button>
													<input type='number' name="CART_CNT" id="cnt" value="${row.BASKET_GOODS_AMOUNT}" readonly>
													<button type="button" class='plus' style="width: 24px;"> + </button>
<%-- 													<button type="button" onClick='changeAmount("minus",${status.index})' style="width: 30px;"> - </button> --%>
<%-- 													<span id='amount_${status.index}' style="text-align: center; width: 30px">${row.BASKET_GOODS_AMOUNT}</span> --%>
<%-- 													<button type="button" onClick='changeAmount("plus",${status.index})' style="width: 30px;"> + </button> --%>
													
													
													
													
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

									<!-- 수량변경 저장을 위한 from -->
									<form class="amountForm" action="updateBasket.pulu" method="post">
										<input type="hidden" name="BASKET_NUM" class="basket_num">
										<input type="hidden" name="GOODS_NUM" class="goods_num">
										<input type="hidden" name="SELECTED_GOODS_AMOUNT" class="selected_goods_amount">
									</form>
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
										<div class="box txt16">
											<strong class="totalPrice_span">총 상품금액</strong> <strong><span class="txt23 basic_total"><span class="total_product_price_display_front"></span></span>원</strong>
										</div>
										<div>
											<span class="delivery_price"></span>원
										</div>
										<div>
											<strong class="total_title">결제예정금액</strong> <strong class="txt23">= </strong> <strong><span class="finalTotalPrice_span"></span>원</strong>
										</div>
									</div>
								</td>
							</tr>
						</c:if>
					</table>
				</div>
				<br />
				<div class="btn left">
					
					<a href='javascript:void(0);' onclick="chkAll2();">전체 선택</a>
					<a href="">선택 삭제</a>
					<a href="deleteBasketAll.pulu">전체 삭제</a>
				</div>
				<div class="btn right">
					<a href="list" class="btt">쇼핑 계속하기</a>
					<a href="" class="btt">선택상품주문</a>
					<a href='javascript:void(0);' class="order_bt" onclick="orderBasket()">전체상품주문</a>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){


    $(document).on('click','.plus',function(){
    	$(this).prev('.count').val(parseInt($(this).prev('.count').val()) + 1 );
		
    	var cnt = parseInt($(this).prev('.count').val());
//     	var price =parseInt($(this).closest("tr").find('.price').val());
//     	var sum = cnt*price;
    	
//     	$(this).closest("tr").find('#sum').val(sum);
    	var num = parseInt($(this).parent().siblings("#b_num").val());
    	
    	$.ajax({
			type: "POST",
			url:"<c:url value='/myPage/myCartUpdate'/>",
			data:{CART_NUM:num, CART_CNT:cnt},
			success: function(data){
				}	
        	});
    	var sum = cnt*price;	
 	});
 	
 	$(document).on('click','.minus',function(){
   		 $(this).next('.count').val(parseInt($(this).next('.count').val()) - 1 );
   		var cnt = parseInt($(this).next('.count').val());
    	var price =parseInt($(this).closest("tr").find('.price').val());
    	var sum = cnt*price;
    	$(this).closest("tr").find('#sum').val(sum);
    
   		 
       	 if ($(this).next('.count').val() == 0) {
          	$(this).next('.count').val(1);
          	cnt = parseInt($(this).next('.count').val());
        	price = parseInt($(this).closest("tr").find('.price').val());
        	sum = cnt*price; 
        	$(this).closest("tr").find('#sum').val(sum);
        	
         	return;
    	 }   
	       	var num = parseInt($(this).parent().siblings("#num").val());
	    	$.ajax({
				type: "POST",
				url:"<c:url value='/myPage/myCartUpdate'/>",
				data:{CART_NUM:num, CART_CNT:cnt},
				success: function(data){
						
					}	
	        });	 
	});

// 	$(document).on('click','#deleteChk', function(){
//  		if($("input:checkbox[name=checkRow]:checked").length == 0){
//  			alert("삭제할 대상을 선택하세요.");
//  			return false;
//  	 	} else if(confirm("선택한 상품을 삭제하시겠습니까?")== true){
//  	 		$("input:checkbox[name=checkRow]:checked").each(function(){
 	 	 		
//  				var tr = $(this).closest("tr").index();
//  				var num = $("#tbody tr").eq(tr).find("#num").val();
//  				$.ajax({
//  	 				type: "POST",
//  	 				url:"<c:url value='/myPage/myCartDelete'/>",
//  	 				data:{CART_NUM:num},
//  	 				success: function(data){
//  	 						location.reload();
//  	 				}	
//  	 	        });
 	 	        
//  	 		});
//  	 	}
//  	});
 	
 		
});
</script>

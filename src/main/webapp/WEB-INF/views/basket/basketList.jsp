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
	align-items: center; /* ????????? row ??????: ?????? ?????? ??????*/
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
						<li><a href="./main.pulu">???</a></li>
						<li><strong>????????????</strong></li>
					</ol>
				</div>
				<div class="basketTop">
					<div class="basketTitleArea">
						<h2 class="basketTitle">
							<b>????????????</b> <span>???????????? ????????? ???????????? ????????? ????????? ??????????????????.</span>
						</h2>
						<div class="basketProcess">
							<ul>
								<li class="on">01. ????????????</li>
								<li>02. ?????????/??????</li>

								<li>03. ????????????</li>
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
									<h3>???????????? (${fn:length(list)})</h3>
								</td>
							</tr>
							<tr class="head">
								<th scope="col"><input type="checkbox" id="chkAll" onclick="chkAll();"></th>
								<th scope="col">?????????</th>
								<th scope="col">?????????</th>
								<th scope="col">??????</th>
								<th scope="col">?????????</th>
								<th scope="col">??????</th>
								<th scope="col">?????? ??????</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list}" var="row" varStatus="status">
									<tfoot>
										<tr>
											<!-- ???????????? -->
											<td class="basket_info">
												<input type="checkbox" class="checkbox" checked="checked">
												<input type="hidden" class="individual_goodsprice" value="${row.GOODS_PRICE}">
												<input type="hidden" class="individual_goods_amount" value="${row.BASKET_GOODS_AMOUNT}">
												<input type="hidden" class="individual_totalPrice" value="${row.GOODS_PRICE * row.BASKET_GOODS_AMOUNT}">
												<input type="hidden" class="individual_goods_num" value="${row.BASKET_GOODS_NUM}">
												<input type="hidden" class="individual_basket_num" value="${row.BASKET_NUM}">
											</td>

											<!-- ?????????????????? -->
											<td style="text-align: center">
												<a href="Detail.pulu?GOODS_NUM=${row.GOODS_NUM}"><img class="goodsimg" src="./resources/file/${row.IMAGE_STORED}" /></a>
											</td>

											<!-- ???????????? -->
											<td style="text-align: center">
												<a href="Detail.pulu?GOODS_NUM=${row.GOODS_NUM}">${row.GOODS_NAME}</a>
											</td>

											<!-- ?????? -->
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

											<!-- ????????? -->
											<td style="text-align: center">
												<span id='delivery_fee_${status.index}'> 3,000??? </span>
											</td>

											<!-- ?????? ?????? -->
											<td style="text-align: center">
												<span id='price_${status.index}'> <%-- ${row.GOODS_PRICE} --%> <fmt:formatNumber value="${row.GOODS_PRICE}" pattern="#,###,###" />???
												</span>
											</td>

											<!-- ?????? ????????? ??? ?????? -->
											<td style="text-align: center">
												<span id='price_sum_${status.index}'> <%-- ${row.BASKET_GOODS_AMOUNT * row.GOODS_PRICE} --%> <fmt:formatNumber value="${row.BASKET_GOODS_AMOUNT * row.GOODS_PRICE}" pattern="#,###,###" />??? <!-- ????????? ??? ?????? -->
												</span>
											</td>
										</tr>
									</tfoot>

									<!-- ???????????? ?????? from -->
									<form class="amountForm" action="updateBasket.pulu" method="post">
										<input type="hidden" name="BASKET_NUM" class="basket_num">
										<input type="hidden" name="GOODS_NUM" class="goods_num">
										<input type="hidden" name="SELECTED_GOODS_AMOUNT" class="selected_goods_amount">
									</form>
									<!-- ???????????? form -->
									<form action="orderByBasket.pulu" class="order_form" method="post"></form>
									<!-- ???????????? form -->
									<form action="deleteBasketSelect.pulu" class="delete_form" method="post"></form>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tfoot>
									<tr>
										<td colspan="7">??????????????? ?????? ????????????.</td>
									</tr>
								</tfoot>
							</c:otherwise>
						</c:choose>
						<c:if test="${fn:length(list) > 0}">
							<tr>
								<td colspan="7" align="center">
									<div class="totalAll">
										<div class="total">
											<strong>??? ????????????</strong><br> <strong><span class="totalPrice_span"></span>???</strong>
										</div>
										<img src="./resources/img/icon/shipping_bg.png" width="19px" height="19px" class="totalicon">
										<div class="total">
											?????????<br> <span class="delivery_price"></span>???
										</div>
										<img src="./resources/img/icon/basket_price_bg.png" width="19px" height="19px" class="totalicon">
										<div class="total">
											<strong class="total_title">??????????????????</strong><br> <strong><span class="finalTotalPrice_span"></span>???</strong>
										</div>
									</div>
								</td>
							</tr>
						</c:if>
					</table>
				</div>
				<br />
				<div class="btn left">
					<a href='javascript:void(0);' class="delete_btn">?????? ??????</a>
					<a href="deleteBasketAll.pulu">?????? ??????</a>
				</div>
				<div class="btn right">
					<a href="list" class="btt">?????? ????????????</a>
					<a href='javascript:void(0);' class="order_btn">????????????</a>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
<!-- ??????: ??????????????? ?????? -->
$(".order_btn").on("click", function() {
	let form_contents ='';
	let orderNumber = 0;
	
	$(".basket_info").each(function(index, element) {
		
	    if($(element).find(".checkbox").is(":checked") === true) {	// ????????? ????????? ?????????????????? ??????
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

<!-- ??????: ???????????? ?????? ?????? -->
$(".delete_btn").on("click", function() {
	let form_contents ='';
	let orderNumber = 0;
	
	$(".basket_info").each(function(index, element) {
		
	    if($(element).find(".checkbox").is(":checked") === true) {	// ????????????
			let basketNum = $(element).find(".individual_basket_num").val();
	
			let basketNum_input = "<input name='orders[" + orderNumber + "].BASKET_NUM' type='hidden' value='" + basketNum + "'>";
			form_contents += basketNum_input;
			
			orderNumber += 1;
	    }
	});
	
	$(".delete_form").html(form_contents);
	$(".delete_form").submit();
});

<!-- ??????: ???????????? ?????? ?????? (????????? ?????? ?????? ??? DB??? ??????) -->
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

<!-- ??????: ??????????????? ?????? ??????????????? ??? ???????????? ?????? -->
function changeAmount(type, index)  {
    
	const a = document.getElementById('amount_'+ index);
	const p = document.getElementById('price_'+ index);
	const ps = document.getElementById('price_sum_'+ index);
	const oa = document.getElementById('order_amount_'+ index);
	
	// ?????? ????????? ????????? ???
	let amount = a.innerText; 
	let price = p.innerText;
	let price_sum = ps.innerText;
	
	price = price.replace(/,/g, "");
	price = price.replace("???", "");
	price_sum = price_sum.replace(/,/g, "");
	price_sum = price_sum.replace("???", "");
	
	if(type === 'plus') {
		amount = parseInt(amount) + 1;
		price_sum = parseInt(amount) * parseInt(price);
		price_sum = price_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '???';
	}
	else if(type === 'minus') {
		amount = parseInt(amount) - 1;
		price_sum =  parseInt(amount) * parseInt(price);
		price_sum = price_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '???';
	}
	
	if(parseInt(amount) < 1) {
		amount = 1;
		price_sum = parseInt(price);
		price_sum = price_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '???';
	}
	
	// ?????? ??????
	a.innerText = amount;
	ps.innerText = price_sum;
	
	document.getElementById('order_amount_'+ index).value = amount;
// 	alert("order amount == " + document.getElementById('order_amount_'+ index).value);

	updateAmount(type, index);
}

<!-- ??????: ???????????? ?????? ?????? -->
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
	
	/* ?????? ?????? ?????? ?????? ?????? */
	setTotalInfo();	
	
});	

/* ????????????????????? ?????? ?????? ?????? */
$(".checkbox").on("change", function(){
	/* ??? ?????? ?????? ??????(?????????, ??? ??????, ????????????, ?????? ???, ??????) */
	setTotalInfo($(".basket_info"));
});

/* ???????????? ?????? ?????? */
$("#chkAll").on("click", function(){

	/* ???????????? ??????/?????? */
	if($("#chkAll").prop("checked")){
		$(".checkbox").attr("checked", true);
	} else{
		$(".checkbox").attr("checked", false);
	}
	
	/* ??? ?????? ?????? ??????(?????????, ??? ??????, ????????????, ?????? ???, ??????) */
	setTotalInfo($(".basket_info"));	
	
});


/* ??? ?????? ?????? ??????(?????????, ??? ??????, ????????????, ?????? ???, ??????) */
function setTotalInfo(){
	
	let totalPrice = 0;				// ??? ??????
	let totalCount = 0;				// ??? ??????
	let deliveryPrice = 0;			// ?????????
	let finalTotalPrice = 0; 		// ?????? ??????(??? ?????? + ?????????)

	
	$(".basket_info").each(function(index, element){
		
		if($(element).find(".checkbox").is(":checked") === true){	//????????????
			// ??? ??????
			totalPrice += parseInt($(element).find(".individual_totalPrice").val());
			// ??? ??????
			totalCount += parseInt($(element).find(".individual_goods_amount").val());		
		}

	});
	
	
	/* ????????? ?????? */
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
		finalTotalPrice = totalPrice + deliveryPrice;
	
	/* ??? ????????? ?????? Javscript Number ????????? toLocaleString() */
	
	// ??? ??????
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// ??? ??????
	$(".totalCount_span").text(totalCount);
	// ?????????
	$(".delivery_price").text(deliveryPrice);	
	// ?????? ??????(??? ?????? + ?????????)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
}



</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 의종: 주문완료 페이지 -->
<head>
<link rel="stylesheet" href="./resources/sbadmin/vendor/bootstrap/css/bootstrap.min2.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 js -->
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<style>
@font-face {
	font-family: 'NanumBarunGothic';
	src: url('/fonts/NanumBarunGothic.eot');
	src: url('/fonts/NanumBarunGothic.eot') format('embedded-opentype'),
		url('/fonts/NanumBarunGothic.woff') format('woff');
}

.ordercontainer {
	position: relative;
	width: 100%;
	min-width: 900px;
	margin: 0px auto 0;
}

.ordercontainer:after {
	content: "";
	display: block;
	clear: both;
}

.wid900 {
	width: 100%;
	max-width: 900px;
	margin: 0 auto;
}

.orderMain {
	background: #EDEDED;
	margin: 1px 0 -120px 0;
	border-left: 1px solid #dadada;
	border-right: 1px solid #dadada;
}

.panel-default {
	text-align: left;
}

.orderpage {
	width: 100%;
	height: 40px;
	font-size: 20px;
	color: #fff;
	background: #333;
	padding: 12px 0 0 0;
}

.panel-group .panel {
	margin-bottom: 0;
	border-radius: 0px;
}

.panel {
	border-radius: 0px;
	border: 0px;
}

.panel-heading {
	padding: 18px 22px;
}

.panel-title {
	font-weight: 900;
	font-size: 18px;
	color: #223;
}

.ordertable {
	width: 100%;
	font-size: 15px;
}

.ordertable td {
	position: relative;
	padding: 8px 14px 7px 8px;
}

.orderinsert {
	height: 42px;
	width: 100%;
	padding: 10px 11px 10px 10px;
	font-weight: inherit;
	border: 1px solid #E1E1E1;
	outline-style: none;
	line-height: 14px;
	color: #000;
	font-weight: 400;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.ordertable select {
	width: 100%;
	height: 42px;
	margin: 0;
	padding: 0 20px 0 10px;
	line-height: 40px;
	color: #333;
	word-break: break-all;
	border: 1px solid #C5C5C5;
	background: #fff
		url(//img.echosting.cafe24.com/skin/mobile/common/ico_select.gif)
		no-repeat 100% 50%;
	background-size: auto 40px;
	-webkit-appearance: none;
}

.ordertable textarea {
	width: 100%;
	max-width: 100%;
	padding: 7px;
	font-weight: inherit;
	border: 1px solid #E1E1E1;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	resize: none;
}

.zipcodebt {
	position: absolute;
	right: 15px;
	color: #000;
	border: 1px solid #A7A7A7;
	background: #fff;
	min-width: 80px;
	height: 42px;
}

.orderpage span {
	font-family: 'NotoSansKR', "맑은 고딕", Malgun Gothic, AppleSDGothicNeo,
		"돋움", Dotum, sans-serif;
	font-weight: 600;
}

.icoRequired {
	display: inline-block;
	width: 6px;
	height: 6px;
	margin: -2px 0 0;
	vertical-align: middle;
	text-indent: 150%;
	font-size: 0;
	line-height: 0;
	white-space: nowrap;
	background: url(./resources/img/icon/bg_required.png) no-repeat 0 0;
	background-size: auto 6px;
}

.prdName {
	display: block;
	margin: 0 0 9px;
	font-size: 14px;
	font-weight: 400;
	color: #000;
}

.prdText {
	margin: 0 0 2px;
	font-size: 14px;
	color: #606060;
}

.ordergoodsimg {
	width: 90px;
	height: 90px;
	border: solid 1px #A7A7A7;
}

.proPrice {
	font-size: 15px;
	font-weight: 700;
	color: #000;
}

.pricetd {
	vertical-align: text-top;
}

.ordergoodstable {
	width: 100%;
}

.ordergoodstable td {
	padding: 0px 14px 0px 8px;
}

.panel-body {
	position: relative;
}

.total {
	background: #F4F7FF;
	position: absolute;
	width: 100%;
	font-size: 18px;
	left: 0;
	bottom: 0;
	padding: 11px 0px 10px 0px;
	font-family: 'NotoSansKR', "맑은 고딕", Malgun Gothic, AppleSDGothicNeo,
		"돋움", Dotum, sans-serif;
}

.total_title {
	float: left;
	padding: 4px 0 0 35px;
}

.priceTotal {
	padding: 0 30px 0 0;
	float: right;
	color: #3971FF;
	font-size: 22px;
}

.finalTotalPrice_span {
	font-size: 25px;
}

.submitbtn {
	font-size: 18px;
	font-weight: 400;
	width: 100%;
	height: 50px;
	line-height: 50px;
	color: #fff;
	background-color: #3971FF;
	margin: 0;
	border: 0;
}

.orderPayText {
	width: 100%;
	height: 120px;
}

.oderpayDiv {
	margin: 11px 32px 10px 32px;
	font-size: 16px;
}

.payRight {
	float: right;
}

.info {
	padding: 0 0 0 15px;
}

.info .mileage {
	margin: 6px 0 0;
	padding: 10px 0 0;
	*zoom: 1;
}

.info .mileage:after {
	content: "";
	display: block;
	clear: both;
}

.info .displaynone+.mileage {
	margin: 0;
	padding: 0;
	border: 0;
}

.info .mileage li {
	float: left;
	margin: 0 40px 0 0;
}

.info .mileage li a {
	text-decoration: none;
}

.info .mileage li strong {
	color: #008bcc;
}

.orderInfo {
	width: 380px;
	margin: 45px auto 0;
	padding: 0 0 80px 130px;
	color: #353535;
	line-height: 1.5;
	background:
		url("http://img.echosting.cafe24.com/skin/base_ko_KR/order/bg_result.gif")
		no-repeat 0 10px;
}

.orderInfo p {
	/* margin: 64px 0 0 20px; */
	padding: 25px 10px 10px 10px;
}

.orderInfo p strong {
	display: block;
	margin: 0 0 7px;
	color: #000;
	font-size: 20px;
	font-family: gulim, sans-serif;
}

.orderInfo p a {
	color: #008bcc;
	text-decoration: underline;
	font-weight: bold;
}

.orderInfo li strong {
	font-size: 14px;
	letter-spacing: -1px;
}
</style>
</head>
<div class="ordercontainer">
	<div class="wid900">
		<div class="orderMain">
			<div module="Order_result" unroll=1>

				<div align="center" class="orderpage">
					<span>주문완료</span>
				</div>
				<!-- 주문완료 -->
				<div class="orderInfo">
					<p>
						<strong>고객님의 주문이 완료 되었습니다.</strong> 주문내역 및 배송에 관한 안내는
						<a href="/myInfoOrder.pulu">주문조회</a>
						를 통하여 확인 가능합니다.
					</p>
				</div>
				<div class="panel panel-default">
					<!-- 명식 : 판넬 클릭뷰 -->
					<a role="button" data-toggle="collapse" href="#collapse4" aria-expanded="true">
						<div class="panel-heading" role="tab">
							<span class="panel-title">혜택정보</span>
						</div>
					</a>
					<!-- 명식 : 판넬 내용 -->
					<div id="collapse4" class="panel-collapse collapse in" role="tabpanel">
						<div class="panel-body">
							<div class="info">
								<div class="member">
									<p>
										<strong></strong>${loginId }님은, 브론즈 회원이십니다.
									</p>
								</div>
								<ul class="mileage">
									<li><a href="">
											쿠폰 : <strong>0개</strong>
										</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<!-- 명식 : 판넬 클릭뷰 -->
					<a role="button" data-toggle="collapse" href="#collapse3" aria-expanded="true">
						<div class="panel-heading" role="tab">
							<span class="panel-title">주문 상세 ${map.ORDER_DATE}</span>
						</div>
					</a>
					<!-- 명식 : 판넬 내용 -->
					<div id="collapse3" class="panel-collapse collapse in" role="tabpanel">
						<div class="panel-body">
							<div class="ordergoods">

								<table>
									<c:choose>
										<c:when test="${fn:length(list) > 0}">
											<c:forEach items="${list}" var="row" varStatus="status">
												<tbody>
													<tr>
														<td rowspan="4" class="order_info">
															<img src='./resources/img/dummy/sm1.jpg' class="ordergoodsimg">
															<input type="hidden" id="ORDER_GOODS_AMOUNT" name="ORDER_GOODS_AMOUNT" class="ORDER_GOODS_AMOUNT" value="${row.ORDER_GOODS_AMOUNT}" />
															
															<input type="hidden" class="individual_totalPrice" value="${row.ORDER_GOODS_PRICE * row.ORDER_GOODS_AMOUNT}">
														</td>
														<td height="14px">
															<strong class="prdName">${row.ORDER_GOODS_NAME}</strong>
														</td>
													</tr>
													<tr>
														<td height="10px"></td>
													</tr>
													<tr>
														<td height="20px">
															<span class="prdText">${row.ORDER_GOODS_AMOUNT}개</span>
														</td>
													</tr>
													<tr>
														<td height="38px">
															<span class="prdText">[조건] / 기본배송</span>
														</td>
													</tr>
													<tr>
														<td></td>
														<td height="42px" class="pricetd">
															<span class="proPrice"><fmt:formatNumber value="${row.ORDER_GOODS_PRICE * row.ORDER_GOODS_AMOUNT}" pattern="#,###,###" />원
															</span>
														</td>
													</tr>
												</tbody>
											</c:forEach>
										</c:when>
									</c:choose>
								</table>

								<%-- <table class="ordergoodstable">
										<colgroup>
											<col width="10%">
											<col width="90%">
										</colgroup>
										<c:choose>
											<c:when test="${fn:length(list) > 0}">
												<c:forEach items="${list}" var="row" varStatus="status">
													<tbody>
														<tr>
															<td rowspan="4" class="order_info">
																<a href="./Detail.pulu?GOODS_NUM=${row.GOODS_NUM}" target='_blank'>
																	<img src='./resources/file/${row.IMAGE_STORED}' class="ordergoodsimg">
																</a>
																<input type="hidden" id="ORDER_GOODS_NUM" name="ORDER_GOODS_NUM" value="${row.GOODS_NUM}" />
																<input type="hidden" id="ORDER_GOODS_NAME" name="ORDER_GOODS_NAME" value="${row.GOODS_NAME}" />
																<input type="hidden" id="ORDER_GOODS_IMAGE" name="ORDER_GOODS_IMAGE" value="${row.IMAGE_STORED}" />
																<input type="hidden" id="ORDER_GOODS_AMOUNT" name="ORDER_GOODS_AMOUNT" class="ORDER_GOODS_AMOUNT" value="${row.SELECTED_GOODS_AMOUNT}" />
																<input type="hidden" id="ORDER_GOODS_PRICE" name="ORDER_GOODS_PRICE" value="${row.GOODS_PRICE}" />
																<input type="hidden" class="individual_totalPrice" value="${row.GOODS_PRICE * row.SELECTED_GOODS_AMOUNT}">
															</td>
															<td height="14px">
																<strong class="prdName"><a href="./Detail.pulu?GOODS_NUM=${row.GOODS_NUM}" target='_blank'>${row.GOODS_NAME}</a></strong>
															</td>
														</tr>
														<tr>
															<td height="10px"></td>
														</tr>
														<tr>
															<td height="20px">
																<span class="prdText">수량: ${row.SELECTED_GOODS_AMOUNT}개</span>
															</td>
														</tr>
														<tr>
															<td height="38px">
																<span class="prdText">[조건] / 기본배송</span>
															</td>
														</tr>
														<tr>
															<td></td>
															<td height="42px" class="pricetd">

																<span class="proPrice"><fmt:formatNumber value="${row.SELECTED_GOODS_AMOUNT * row.GOODS_PRICE}" pattern="#,###,###" />원 </span>
															</td>
														</tr>
													</tbody>
													<!-- 결제하기 form -->
													<form id="orderMain" action="orderResult.pulu" class="order_main" method="post"></form>
												</c:forEach>
											</c:when>
										</c:choose>
										<tr>
											<td height="60px"></td>
										</tr>
									</table> --%>
							</div>
						</div>
					</div>
				</div>
				<!-- 명식 : 주문 정보 판넬 시작 -->
				<div class="panel panel-default">
					<!-- 명식 : 판넬 클릭뷰 -->
					<a role="button" data-toggle="collapse" href="#collapse1" aria-expanded="true">
						<div class="panel-heading" role="tab">
							<span class="panel-title">받으시는분 정보</span>
						</div>
					</a>
					<!-- 명식 : 판넬 내용 -->
					<div id="collapse1" class="panel-collapse collapse in" role="tabpanel">
						<div class="panel-body">
							<table class="ordertable">
								<colgroup>
									<col width="12%">
									<col width="29%">
									<col width="29%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>받으시는분</th>
									<td colspan="3">
										<div class="orderinsert">${map.ORDER_RECEIVE_NAME}</div>
									</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>
										<div class="orderinsert">${map.ORDER_RECEIVE_ZIPCODE}</div>
									</td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<th></th>
									<td colspan="3">
										<div class="orderinsert">${map.ORDER_RECEIVE_ADDR1}</div>
									</td>
								</tr>
								<tr>
									<th></th>
									<td colspan="3">
										<div class="orderinsert">${map.ORDER_RECEIVE_ADDR2}</div>
									</td>
								</tr>
								<tr>
									<th>휴대전화</th>
									<td colspan="3">
										<div class="orderinsert">${map.ORDER_RECEIVE_PHONE}</div>
									</td>
								</tr>
								<tr>
									<th>배송메시지</th>
									<td colspan="3">
										<div class="orderinsert">${map.ORDER_MEMO}</div>
									</td>
								</tr>
								<tr>
									<th>배송업체</th>
									<td colspan="3">
										<div class="orderinsert">우체국</div>
									</td>
								</tr>

							</table>
						</div>
					</div>
				</div>
				<!-- 명식 : 결제정보 판넬 시작 -->
				<div class="panel panel-default">
					<!-- 명식 : 판넬 클릭뷰 -->
					<a role="button" data-toggle="collapse" href="#collapse4" aria-expanded="true">
						<div class="panel-heading" role="tab">
							<span class="panel-title">결제정보</span>
						</div>
					</a>
					<!-- 명식 : 판넬 내용 -->
					<div id="collapse4" class="panel-collapse collapse in" role="tabpanel">
						<div class="panel-body">
							<div class="paytextall">
								<div class="orderPayText">
									<div class="oderpayDiv">
										<span class="payspanLeft">상품금액</span><strong class="payRight"><span class="totalPrice_span"></span>원</strong>
									</div>
									<div class="oderpayDiv">
										<span class="payspanLeft">배송비</span><strong class="payRight"><span class="delivery_price">3,000</span>원</strong>
									</div>
								</div>
							</div>
							<!-- 수정 예정 -->
							<div class="total">
								<strong class="total_title">최종 결제 금액 </strong> <strong><span class="priceTotal"><span class="finalTotalPrice_span"><fmt:formatNumber value="${map.ORDER_SUM_MONEY}" pattern="#,###,###" /></span>원</span></strong>
								<input type="hidden" id="ORDER_SUM_MONEY" name="ORDER_SUM_MONEY" value="100" />
							</div>
						</div>
					</div>
				</div>
				<div id="button" align="center">
					<!-- 결제 완료페이지로 추후 수정 -->
					<button type="button" id="cddd" class="submitbtn" onclick="location.href = '/main.pulu' ">
						<span>메인화면으로</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	
<script>
$(document).ready(function(){
	
	/* 종합 정보 섹션 정보 삽입 */
	setTotalInfo();
});	

/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)

	
	$(".order_info").each(function(index, element){
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice").val());
			// 총 갯수
			totalCount += parseInt($(element).find(".ORDER_GOODS_AMOUNT").val());		

	});
	
	
	/* 배송비 결정 */

		deliveryPrice = 3000;	
	
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 배송비
	$(".delivery_price").text(deliveryPrice.toLocaleString());	
}

</script>
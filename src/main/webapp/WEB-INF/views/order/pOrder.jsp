<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- 의종: 상품주문페이지 -->
<html>
<head>
<link rel="stylesheet" href="./resources/sbadmin/vendor/bootstrap/css/bootstrap.min2.css">
<!-- 카카오 js -->
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

.ordertable input[type="text"], input[type="password"] {
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
</style>



</head>
<body>
	<div class="ordercontainer">
		<div class="wid900">
			<div class="orderMain">
				<!-- 				<form id="orderMain" action="orderResult.pulu" method="post"> -->

				<div align="center" class="orderpage">
					<span>주문/결제</span>
				</div>
				<div class="orderfirst">
					<div class="ordererInfo" align="center">
						<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">


							<!-- 명식 : 주문 정보 판넬 시작 -->
							<div class="panel panel-default">

								<!-- 명식 : 판넬 클릭뷰 -->
								<a role="button" data-toggle="collapse" href="#collapse1" aria-expanded="true">
									<div class="panel-heading" role="tab">
										<span class="panel-title">주문정보</span>
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
												<th>이름 <span class="icoRequired">필수</span></th>
												<td colspan="3">
													<input type="text" id="ORDER_MEMBER_NAME" value="${map.NAME}" />
													<input type="hidden" id="ORDER_MEMBER_ID" value="${loginId}" />
												</td>
											</tr>
											<tr>
												<th>주소 <span class="icoRequired">필수</span></th>
												<td>
													<input type="text" id="ORDER_MEMBER_ZIPCODE" name="ORDER_MEMBER_ZIPCODE" class="ORDER_MEMBER_ZIPCODE" value="${map.ZIPCODE}" />
													<input type="button" class="zipcodebt" value="주소검색" onclick="kakaoPostMember()">
													<!-- 선민: 버튼 클릭 시 kakaoPost() 함수 실행 -->
												</td>
												<td colspan="2"></td>
											</tr>
											<tr>
												<th></th>
												<td colspan="3">
													<input type="text" id="ORDER_MEMBER_ADDR1" name="ORDER_MEMBER_ADDR1" value="${map.ADDR1}" />
												</td>
											</tr>
											<tr>
												<th></th>
												<td colspan="3">
													<input type="text" id="ORDER_MEMBER_ADDR2" name="ORDER_MEMBER_ADDR2" value="${map.ADDR2}" />
												</td>
											</tr>
											<tr>
												<th>휴대전화 <span class="icoRequired">필수</span></th>
												<td colspan="3">
													<input type="text" id="ORDER_MEMBER_PHONE" name="ORDER_MEMBER_PHONE" value="${map.PHONE}" />
												</td>
											</tr>

										</table>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- 명식 : 배송지 판넬 시작 -->
					<div class="panel panel-default">
						<a role="button" data-toggle="collapse" href="#collapse2" aria-expanded="true">
							<div class="panel-heading" role="tab">
								<span class="panel-title">배송지</span>
							</div>
						</a>
						<div id="collapse2" class="panel-collapse collapse  in" role="tabpanel">
							<div class="panel-body">
								<table class="ordertable">
									<colgroup>
										<col width="12%">
										<col width="29%">
										<col width="29%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>받는사람 <span class="icoRequired">필수</span></th>
										<td colspan="3">
											<input type="text" id="ORDER_RECEIVE_NAME" name="ORDER_RECEIVE_NAME" value="${map.NAME}"></input>
										</td>
									</tr>
									<tr>
										<th>주소 <span class="icoRequired">필수</span></th>
										<td>
											<input type="text" id="ORDER_RECEIVE_ZIPCODE" name="ORDER_RECEIVE_ZIPCODE" class="ORDER_RECEIVE_ZIPCODE" value="${map.ZIPCODE}" />
											<input type="button" class="zipcodebt" value="주소검색" onclick="kakaoPostReceive()">
											<!-- 선민: 버튼 클릭 시 kakaoPost() 함수 실행 -->
										</td>
										<td colspan="2"></td>
									</tr>
									<tr>
										<th></th>
										<td colspan="3">
											<input type="text" id="ORDER_RECEIVE_ADDR1" name="ORDER_RECEIVE_ADDR1" value="${map.ADDR1}" />
										</td>
									</tr>
									<tr>
										<th></th>
										<td colspan="3">
											<input type="text" id="ORDER_RECEIVE_ADDR2" name="ORDER_RECEIVE_ADDR2" value="${map.ADDR2}" />
										</td>
									</tr>
									<tr>
										<th>휴대전화 <span class="icoRequired">필수</span></th>
										<td colspan="3">
											<input type="text" id="ORDER_RECEIVE_PHONE" name="ORDER_RECEIVE_PHONE" class="ORDER_RECEIVE_PHONE" value="${map.PHONE}" />
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<!-- 배송 시 요청사항 -->
											<!-- 선민: 선택된 value값에 따라 각각 다른 내용을 ORDER_MEMO의 innerText로 전달 -->
											<select name="MEMO_OPTION" id="MEMO_OPTION" onChange="setMemoText();">
												<option value="0">- 배송 시 요청사항 입력 -</option>
												<option value="1" id="option_1">배송 전에 미리 연락 바랍니다.</option>
												<option value="2" id="option_2">부재 시 경비실에 맡겨주세요.</option>
												<option value="3" id="option_3">부재 시 문 앞에 놓아주세요.</option>
												<option value="4" id="option_4">배송 전에 미리 연락바랍니다.</option>
												<option value="direct" id="option_d">직접 입력</option>
											</select>
										</td>
									</tr>
									<!-- 직접입력 칸 -->
									<tr>
										<td colspan="4">
											<!-- 선민: 페이지 첫 진입 시 비활성화(display:none), 기본값 "없음"으로 설정 -->
											<textarea style="display: none" id="ORDER_MEMO" name="ORDER_MEMO" fw-filter="" fw-label="배송 메세지" fw-msg="" maxlength="255" cols="70">없음</textarea>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>


				<!-- 명식 : 주문상품 판넬 시작 -->
				<div class="panel panel-default">

					<!-- 명식 : 판넬 클릭뷰 -->
					<a role="button" data-toggle="collapse" href="#collapse3" aria-expanded="true">
						<div class="panel-heading" role="tab">
							<span class="panel-title">주문상품</span>
						</div>
					</a>

					<!-- 명식 : 판넬 내용 -->
					<div id="collapse3" class="panel-collapse collapse in" role="tabpanel">
						<div class="panel-body">
							<div class="ordergoods">
								<table class="ordergoodstable">
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
								</table>

							</div>
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
										<span class="payspanLeft">배송비</span><strong class="payRight"><span class="delivery_price"></span>원</strong>
									</div>
								</div>
							</div>
							<!-- 수정 예정 -->
							<div class="total">
								<strong class="total_title">최종 결제 금액 </strong> <strong><span class="priceTotal"><span class="finalTotalPrice_span"></span>원</span></strong>
								<input type="hidden" id="ORDER_SUM_MONEY" name="ORDER_SUM_MONEY" value="" />
							</div>
						</div>
					</div>
				</div>


				<!-- 명식 : 결제수단 판넬 시작 -->
				<div class="panel panel-default">

					<!-- 명식 : 판넬 클릭뷰 -->
					<a role="button" data-toggle="collapse" href="#collapse5" aria-expanded="true">
						<div class="panel-heading" role="tab">
							<span class="panel-title">결제수단</span>
						</div>
					</a>

					<!-- 명식 : 판넬 내용 -->
					<div id="collapse5" class="panel-collapse collapse in" role="tabpanel">
						<div class="panel-body">
							<div class="payInfo" align="center"></div>
							<!-- 수정 예정 -->
							<div align="center">
								<input type="radio" id="ORDER_PAY_TYPE" name="ORDER_PAY_TYPE" value="0">
								<label>무통장 입금</label>
							</div>
							
							<div id="showResult"></div>
						</div>
					</div>
				</div>
				<div id="button" align="center">
					<!-- 결제 완료페이지로 추후 수정 -->
					<input type="submit" id="cddd" class="submitbtn" value='결제하기' />
				</div>
			</div>
		</div>
</body>


<script>
<!-- 선민: 배송 시 요청사항 -->
function setMemoText() {
    let option = document.getElementById("MEMO_OPTION").value;
    let memoText = document.getElementById("ORDER_MEMO");
    let message;
    
//     alert(option);
   
    if(option == 0) {
		document.getElementById("ORDER_MEMO").value = "없음";
		$("#ORDER_MEMO").hide();
		return false;
    }
    else if(option == 1) {
		$("#ORDER_MEMO").hide();
		message = document.getElementById("option_1")
// 		alert(message.innerText);
		document.getElementById("ORDER_MEMO").value = message.innerText;
    }
    else if(option == 2) {
		$("#ORDER_MEMO").hide();
		message = document.getElementById("option_2")
// 		alert(message.innerText);
		document.getElementById("ORDER_MEMO").value = message.innerText;
    }
    else if(option == 3) {
		$("#ORDER_MEMO").hide();
		message = document.getElementById("option_3")
// 		alert(message.innerText);
		document.getElementById("ORDER_MEMO").value = message.innerText;
    }
    else if(option == 4) {
		$("#ORDER_MEMO").hide();
		message = document.getElementById("option_4")
// 		alert(message.innerText);
		document.getElementById("ORDER_MEMO").value = message.innerText;
    }
    else if(option == 'direct') {
		document.getElementById("ORDER_MEMO").value = "";
		$("#ORDER_MEMO").show();
    }
}

<!-- 선민: 카카오 우편번호 (주문자) -->
function kakaoPostMember() {
	new daum.Postcode({
		oncomplete : function(data) {
		    document.querySelector("#ORDER_MEMBER_ZIPCODE").value = data.zonecode;
			document.querySelector("#ORDER_MEMBER_ADDR1").value = data.address
		}
	}).open();
}

<!-- 선민: 카카오 우편번호 (수령인) -->
function kakaoPostReceive() {
	new daum.Postcode({
		oncomplete : function(data) {
			document.querySelector("#ORDER_RECEIVE_ZIPCODE").value = data.zonecode;
			document.querySelector("#ORDER_RECEIVE_ADDR1").value = data.address
		}
	}).open();
}
		
<!-- 선민: 유효성검사 -->
function val_check() {
	if(document.getElementById('ORDER_MEMBER_NAME').value.length == 0) {
		alert("주문자 이름을 입력하세요.");
		document.getElementById('ORDER_MEMBER_NAME').focus(); 
		return false;
	}
	else if(document.getElementById('ORDER_MEMBER_PHONE').value.length == 0) {
		alert("주문자 연락처를 입력하세요.");
		document.getElementById('ORDER_MEMBER_PHONE').focus();
		return false;
	}
	else if(document.getElementById('ORDER_MEMBER_ZIPCODE').value.length == 0) {
		alert("주문자 우편번호을 입력하세요.");
		document.getElementById('ORDER_MEMBER_ZIPCODE').focus();
		return false;
	}
	else if(document.getElementById('ORDER_MEMBER_ADDR1').value.length == 0) {
		alert("주문자 주소를 입력하세요.");
		document.getElementById('ORDER_MEMBER_ADDR1').focus();
		return false;
	}
	else if(document.getElementById('ORDER_MEMBER_ADDR2').value.length == 0) {
		alert("주문자 상세주소를 입력하세요.");
		document.getElementById('ORDER_MEMBER_ADDR2').focus();
		return false;
	}
	 else if(document.getElementById('ORDER_RECEIVE_NAME').value.length == 0) {
		alert("수령인 이름을 입력하세요.");
		document.getElementById('ORDER_RECEIVE_NAME').focus();
		return false;
	}
	 else if(document.getElementById('ORDER_RECEIVE_PHONE').value.length == 0) {
		alert("수령인 연락처를 입력하세요.");
		document.getElementById('ORDER_RECEIVE_PHONE').focus();
		return false;
	}
	 else if(document.getElementById('ORDER_RECEIVE_ZIPCODE').value.length == 0) {
		alert("수령인 우편번호을 입력하세요.");
		document.getElementById('ORDER_RECEIVE_ZIPCODE').focus();
		return false;
	}
	 else if(document.getElementById('ORDER_RECEIVE_ADDR1').value.length == 0) {
		alert("수령인 주소를 입력하세요.");
		document.getElementById('ORDER_RECEIVE_ADDR1').focus();
		return false;
	}
	 else if(document.getElementById('ORDER_RECEIVE_ADDR2').value.length == 0) {
		alert("수령인 상세주소를 입력하세요.");
		document.getElementById('ORDER_RECEIVE_ADDR2').focus();
		return false;
	}
	 else if(document.getElementById('ORDER_PAY_TYPE').checked == false) {
		alert("결제수단을 선택하세요.");
		document.getElementById('ORDER_PAY_TYPE').focus();
		return false;
	}
	 else {
		alert('결제가 완료되었습니다.');
		return true;
	}
}
			
<!-- 선민: 주문처리 -->
$(".submitbtn").on("click", function() {

    var checkResult = val_check();
    if(checkResult == false) {
    	return false;	
    }
    
    let form_contents ='';
	let arrIndex = 0;
	
	$(".order_info").each(function(index, element) {
		
// 		alert(arrIndex); // 반복여부 체크
	    
		let orderPayType = $("#ORDER_PAY_TYPE").val();
// 		alert(orderPayType);
		let orderMemberId = $("#ORDER_MEMBER_ID").val();
// 		alert(orderMemberId);
		let orderMemberName = $("#ORDER_MEMBER_NAME").val();
// 		alert(orderMemberName);
		let orderMemberPhone = $("#ORDER_MEMBER_PHONE").val();
// 		alert(orderMemberPhone);
		let orderMemberZipcode = $("#ORDER_MEMBER_ZIPCODE").val();
// 		alert(orderMemberZipcode);
		let orderMemberAddr1 = $("#ORDER_MEMBER_ADDR1").val();
// 		alert(orderMemberAddr1);
		let orderMemberAddr2 = $("#ORDER_MEMBER_ADDR2").val();
// 		alert(orderMemberAddr2);
		let orderReceiveName = $("#ORDER_RECEIVE_NAME").val();
// 		alert(orderReceiveName);
		let orderReceivePhone = $("#ORDER_RECEIVE_PHONE").val();
// 		alert(orderReceivePhone);
		let orderReceiveZipcode = $("#ORDER_RECEIVE_ZIPCODE").val();
// 		alert(orderReceiveZipcode);
		let orderReceiveAddr1 = $("#ORDER_RECEIVE_ADDR1").val();
// 		alert(orderReceiveAddr1);
		let orderReceiveAddr2 = $("#ORDER_RECEIVE_ADDR2").val();
// 		alert(orderReceiveAddr2);
		let orderMemo = $("#ORDER_MEMO").val();
// 		alert(orderMemo);
		let orderSumMoney = $("#ORDER_SUM_MONEY").val();
// 		alert(orderSumMoney);                                                                                                                                                                                        
		
		let orderGoodsNum = $(element).find("#ORDER_GOODS_NUM").val();
// 		alert(orderGoodsNum); // 언디파인드
		let orderGoodsName = $(element).find("#ORDER_GOODS_NAME").val();
// 		alert(orderGoodsName);
		let orderGoodsPrice = $(element).find("#ORDER_GOODS_PRICE").val();
// 		alert(orderGoodsPrice);
		let orderGoodsAmount = $(element).find("#ORDER_GOODS_AMOUNT").val();
// 		alert(orderGoodsAmount);
		let orderGoodsImage = $(element).find("#ORDER_GOODS_IMAGE").val();
// 		alert(orderGoodsImage);
		
		// 주문자 정보
		let orderPayType_input = "<input name='orders[" + arrIndex + "].ORDER_PAY_TYPE' type='hidden' value='" + orderPayType + "'>";
		form_contents += orderPayType_input;
		let orderMemberId_input = "<input name='orders[" + arrIndex + "].ORDER_MEMBER_ID' type='hidden' value='" + orderMemberId + "'>";
		form_contents += orderMemberId_input;
		let orderMemberName_input = "<input name='orders[" + arrIndex + "].ORDER_MEMBER_NAME' type='hidden' value='" + orderMemberName + "'>";
		form_contents += orderMemberName_input;
		let orderMemberPhone_input = "<input name='orders[" + arrIndex + "].ORDER_MEMBER_PHONE' type='hidden' value='" + orderMemberPhone + "'>";
		form_contents += orderMemberPhone_input;
		let orderMemberZipcode_input = "<input name='orders[" + arrIndex + "].ORDER_MEMBER_ZIPCODE' type='hidden' value='" + orderMemberZipcode + "'>";
		form_contents += orderMemberZipcode_input;
		let orderMemberAddr1_input = "<input name='orders[" + arrIndex + "].ORDER_MEMBER_ADDR1' type='hidden' value='" + orderMemberAddr1 + "'>";
		form_contents += orderMemberAddr1_input;
		let orderMemberAddr2_input = "<input name='orders[" + arrIndex + "].ORDER_MEMBER_ADDR2' type='hidden' value='" + orderMemberAddr2 + "'>";
		form_contents += orderMemberAddr2_input;
		
		// 수령인 정보
		let orderReceiveName_input = "<input name='orders[" + arrIndex + "].ORDER_RECEIVE_NAME' type='hidden' value='" + orderReceiveName + "'>";
		form_contents += orderReceiveName_input;
		let orderReceivePhone_input = "<input name='orders[" + arrIndex + "].ORDER_RECEIVE_PHONE' type='hidden' value='" + orderReceivePhone + "'>";
		form_contents += orderReceivePhone_input;
		let orderReceiveZipcode_input = "<input name='orders[" + arrIndex + "].ORDER_RECEIVE_ZIPCODE' type='hidden' value='" + orderReceiveZipcode + "'>";
		form_contents += orderReceiveZipcode_input;
		let orderReceiveAddr1_input = "<input name='orders[" + arrIndex + "].ORDER_RECEIVE_ADDR1' type='hidden' value='" + orderReceiveAddr1 + "'>";
		form_contents += orderReceiveAddr1_input;
		let orderReceiveAddr2_input = "<input name='orders[" + arrIndex + "].ORDER_RECEIVE_ADDR2' type='hidden' value='" + orderReceiveAddr2 + "'>";
		form_contents += orderReceiveAddr2_input;
		let orderMemo_input = "<input name='orders[" + arrIndex + "].ORDER_MEMO' type='hidden' value='" + orderMemo + "'>";
		form_contents += orderMemo_input;
		let orderSumMoney_input = "<input name='orders[" + arrIndex + "].ORDER_SUM_MONEY' type='hidden' value='" + orderSumMoney + "'>";
		form_contents += orderSumMoney_input;
		
		// 상품 정보
		let orderGoodsNum_input = "<input name='orders[" + arrIndex + "].ORDER_GOODS_NUM' type='hidden' value='" + orderGoodsNum + "'>";
		form_contents += orderGoodsNum_input;
		let orderGoodsName_input = "<input name='orders[" + arrIndex + "].ORDER_GOODS_NAME' type='hidden' value='" + orderGoodsName + "'>";
		form_contents += orderGoodsName_input;
		let orderGoodsPrice_input = "<input name='orders[" + arrIndex + "].ORDER_GOODS_PRICE' type='hidden' value='" + orderGoodsPrice + "'>";
		form_contents += orderGoodsPrice_input;
		let orderGoodsAmount_input = "<input name='orders[" + arrIndex + "].ORDER_GOODS_AMOUNT' type='hidden' value='" + orderGoodsAmount + "'>";
		form_contents += orderGoodsAmount_input;
		let orderGoodsImage_input = "<input name='orders[" + arrIndex + "].ORDER_GOODS_IMAGE' type='hidden' value='" + orderGoodsImage + "'>";
		form_contents += orderGoodsImage_input;
		
		arrIndex += 1;
	});
	
	$(".order_main").html(form_contents);
	$(".order_main").submit();
});


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
	
		finalTotalPrice = totalPrice + deliveryPrice;
	
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 배송비
	$(".delivery_price").text(deliveryPrice.toLocaleString());	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());	
	
	let orderSumMoney = document.getElementById("ORDER_SUM_MONEY");
	orderSumMoney.value = finalTotalPrice;
	
}
</script>

</html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- 의종: 상품주문페이지 -->
<html>
<head>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 js -->
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<style>
.orderpage h2 {
	line-height: 56px;
	color: #fff;
	font-size: 20px;
	font-weight: normal;
	text-align: center;
	background: #4a5164;
}

input[type=text] {
	width: 250px;
	height: 20px;
	font-size: 13px;
}

.orderMain {
	width: 1000px;
	margin: 0 auto;
	border-left: 1px solid #d7d5d5;
	border-right: 1px solid #d7d5d5;
	box-sizing: border-box;
	/*  background: #e3e4e7; */
}

.goodsInfo {
	text-align: center;
}

.ordererInfo {
	margin-right: 100px;
}

.ordererInfo h2 {
	margin-left: 100px;
}
</style>


<script>
		// 선민: 카카오 우편번호 api
		function kakaoPost() {
			new daum.Postcode({
				oncomplete : function(data) {
					document.querySelector("#zipcode").value = data.zonecode;
					document.querySelector("#addr1").value = data.address
				}
			}).open();
		}
		
		<!-- 결제수단 체크-->
		$(document).ready(function() {
			$("#pay_bt").click(function() {
		if (!$("input:checked[id='ORDER_PAY_TYPE']").is(":checked")){ 
			alert("결제수단을 선택하세요."); 
			return false;
		         }
		     })
		});
		<!-- 유효성검사 -->
		function val_check() {
			 var form = document.getElementById("orderMain");
			 if(form.ORDER_MEMBER_ID.value.length == 0) {
					alert("이름을 입력하세요.");
					form.ORDER_MEMBER_ID.focus(); 
					return false;
					}
			 else if(form.PHONE.value.length == 0) {
					alert("핸드폰 번호를 입력하세요.");
					form.PHONE.focus();
					return false;
					}
			 else if(form.ORDER_RECEIVE_NAME.value.length == 0) {
					alert("받는 분을 입력하세요.");
					form.ORDER_RECEIVE_NAME.focus();
					return false;
					}
			 else if(form.ORDER_RECEIVE_PHONE.value.length == 0) {
					alert("핸드폰 번호를 입력하세요.");
					form.ORDER_RECEIVE_PHONE.focus();
					return false;
					}
			 else if(form.ORDER_RECEIVE_ZIPCODE.value.length == 0) {
					alert("우편번호을 입력하세요.");
					form.ORDER_RECEIVE_ZIPCODE.focus();
					return false;
					}
			 else if(form.ORDER_RECEIVE_ADDR1.value.length == 0) {
					alert("주소를 입력하세요.");
					form.ORDER_RECEIVE_ADDR1.focus();
					return false;
					}
			 else if(form.ORDER_RECEIVE_ADDR2.value.length == 0) {
					alert("상세주소를 입력하세요.");
					form.ORDER_RECEIVE_ADDR2.focus();
					return false;
					}
			 else{
				 alert('결제가 완료되었습니다.');
				 return true;
			 }
			 
		}
		<!-- 체크박스 선택시 계좌번호 띄우기 수정 예정 -->
		$(document).ready(function() {
			$("#ORDER_PAY_TYPE").click(function() {
				if ($("#check1").is(":checked") == false) {
					$("#showResult").append('<h1 align="center">대명은행 012-456789-01-123 (주)푸르뎁</h1>');
				} 	
			});
		});
		
		 <!-- 직접입력 클릭 시 텍스트 띄우기 --> 
			$(function(){
			      //직접입력 인풋박스 기존에는 숨어있다가

			$("#selboxDirect").hide();
			$("#ORDER_MEMO").change(function() {
					
			                //직접입력을 누를 때 나타남

					if($("#ORDER_MEMO").val() == "direct") {
						$("#selboxDirect").show();
					}  else {
						$("#selboxDirect").hide();
					}			

				}) 	

			});
</script>

</head>
<body>
	<div class="orderMain">
		<form id="orderMain"
			action="orderResult.pulu?GOODS_NUM=${list[0].GOODS_NUM}"
			onsubmit="return val_check();" method="post">

			<div align="center" class="orderpage">
				<h2>주문페이지</h2>
			</div>


			<div class="ordererInfo" align="center">
				<table>

					<br>
					<br>
					<h2>주문자 정보</h2>

					<tr>
						<th>&nbsp; 이름</th>

						<td><input type="text" id="ORDER_MEMBER_ID"
							name="ORDER_MEMBER_ID" value="${map.NAME}" /></td>
					</tr>

					<tr>
						<th>핸드폰 번호</th>
						<td><input type="text" id="PHONE" name="PHONE" class="PHONE"
							value="${map.PHONE}" /></td>
					</tr>
				</table>
			</div>


			<div align="center">
				<table class="order">
					<br>
					<br>
					<br>
					<h2>배송 정보</h2>
					<br>
					<br>
					<tr>
						<th>받으시는 분</th>
						<td><input type="text" id="ORDER_RECEIVE_NAME"
							name="ORDER_RECEIVE_NAME" value="${map.NAME}"></input></td>
					</tr>
					<tr>
						<th>핸드폰 번호</th>
						<td><input type="text" id="ORDER_RECEIVE_PHONE"
							name="ORDER_RECEIVE_PHONE" class="ORDER_RECEIVE_PHONE"
							value="${map.PHONE}" /></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type="text" id="ORDER_RECEIVE_ZIPCODE"
							name="ORDER_RECEIVE_ZIPCODE" class="ORDER_RECEIVE_ZIPCODE"
							value="${map.ZIPCODE}" /> <input type="button" class="zipcodebt"
							value="우편번호 찾기" onclick="kakaoPost()"> <!-- 선민: 버튼 클릭 시 kakaoPost() 함수 실행 -->
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" id="ORDER_RECEIVE_ADDR1"
							name="ORDER_RECEIVE_ADDR1" value="${map.ADDR1}" /></td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" id="ORDER_RECEIVE_ADDR2"
							name="ORDER_RECEIVE_ADDR2" value="${map.ADDR2}" /></td>
					</tr>
				</table>
			</div>


			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<!-- 명식 : 컨트롤러 작성 후 변수명을 넣어주세요 -->
					<c:forEach items="${list}" var="row">
						<!-- 명식 : 위와 같음 -->
						<div class="goodsInfo">
							<table align="center">
								<tr>
									<h2>주문 상품</h2>
									<tr>
									<td rowspan="5"><img class=""
								src='./resources/file/${row.IMAGE_STORED}' width=200px;
								height=150px;></td>

									<!-- 이미지값 넣기 -->
									<td><input type="hidden" id="ORDER_GOODS_IMAGE"
								name="ORDER_GOODS_IMAGE" value="${row.IMAGE_STORED}" /></td>

								</tr>
								<tr>
									<td><h4>${row.GOODS_NAME}</h4></td>
									<!-- 상품 이름 넣기 -->
									<td><input type="hidden" id="ORDER_GOODS_NAME"
								name="ORDER_GOODS_NAME" value="${row.GOODS_NAME}" /></td>
								</tr>
								<tr>
									<td><h4>
											상품가격 :
											<fmt:formatNumber value="${row.GOODS_PRICE}"
										pattern="#,###,###" />
											<!-- 상품가격 넣기 -->
											<td><input type="hidden" id="ORDER_GOODS_PRICE"
										name="ORDER_GOODS_PRICE" value="${row.GOODS_PRICE}" />원</td> 
										</h4></td>
								</tr>
								<tr>
									<td><h4>수량 : ${row.SELECTED_GOODS_AMOUNT}</h4></td>
									<td><input type="hidden" id="ORDER_GOODS_AMOUNT"
								name="ORDER_GOODS_AMOUNT" value="${row.SELECTED_GOODS_AMOUNT}" />개</td>

								</tr>
								<tr>
									<td><h4>
											결제금액 :
											<fmt:formatNumber
										value="${row.SELECTED_GOODS_AMOUNT * row.GOODS_PRICE}"
										pattern="#,###,###" />

											<!-- 총 결제 금액 -->
											<td><input type="hidden" id="ORDER_SUM_MONEY"
										name="ORDER_SUM_MONEY"
										value="${row.SELECTED_GOODS_AMOUNT * row.GOODS_PRICE}" />원</td> 
										</h4>
									
							<td>
								
						</tr>
								</tr>
								<tr>
									<td>
										<h1>
											총 결제 금액
											<fmt:formatNumber
										value="${row.SELECTED_GOODS_AMOUNT * row.GOODS_PRICE}"
										pattern="#,###,###" />
											원
										</h1> <!-- 수량x상품가격 미구현 -->
									</td>
								</tr>
							</table>
							<!-- 						<table> -->
							<!-- 						</table> -->
						
	</div>
					</c:forEach>
				</c:when>
			</c:choose>

			<!-- 배송 -->
									<!-- <td><input type="hidden" id="ORDER_STATUS"
										name="ORDER_STATUS" value="입금대기중" /></td> -->
										
								<!-- 		<td><input type="hidden" id="ORDER_NUM"
										name="ORDER_NUM" value="12345" /></td> -->



			<div class="message" align="center">
				<tr>
					<td><select name="ORDER_MEMO" id="ORDER_MEMO"
												style="width: 400px; height: 30px; padding-left: 70px; font-size: 15px;">
							<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
							<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
							<option value="부재 시 문 앞에 놓아주세요">부재 시 문 앞에 놓아주세요.</option>
							<option value="배송 전에 미리 연락바랍니다.">배송 전에 미리 연락바랍니다.</option>
							<option value="direct">내용을 입력하세요.</option>
					</select></td>
				</tr>

				<!-- 직접입력 칸 -->
				<tr>
					<td><input type="messageText" id="selboxDirect"
												name="selboxDirect"
												style="width: 325px; height: 30px; padding-left: 70px; font-size: 15px;" /></td>
				</tr>
				
							</table>
			</div>





			<div class="payInfo" align="center">
				<h1>결제정보</h1>
				<tr>
					<td>배송비 : 3000원</td>
				</tr>
			</div>

			<!-- 수정 예정 -->
			<div align="center">
				<br> <br> 결제수단 선택 <br> <label><input
								type="checkbox" id="ORDER_PAY_TYPE" name="ORDER_PAY_TYPE"
								value="무통장 입금" onclick="cbList">무통장 입금</label>
			</div>

			<div id="showResult"></div>






			<div id="button" align="center">
				<br> 
				<br>
				<!-- 결제 완료페이지로 추후 수정 -->
				<br> 
				<input type="submit" id="cddd" value="결제하기" />
				<input type="button" value="목록으로"
								onclick="location.href='Detail.pulu?GOODS_NUM= ${map.GOODS_NUM}'" />
			</div>
		</form>
	</div>
	<!-- 선긋기 -->
	<br>
	<br>
	<div style="border-top: 1px black solid"></div>

</body>
</html>
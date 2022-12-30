<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 js -->

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.ordergoodsimg {
	float:right; 
	width: 150px;
}

.ordergoodstable td{
	border-top:0px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper">
			
			
			
			<div class="titleArea">
	            <h1 class="page-header">주문 내역 정보</h1>
	        </div>
			<div class="base-table boardWrite">
				<table>
					<colgroup>
						<col width="150px"/>
						<col width="*"/>
						<col width="*"/>
						<col width="130px"/>
					</colgroup>
					<tbody>
					
						<tr>
							<th scope="row">주문자</th>
							<td>${myInfoOrderDetail2.ORDER_MEMBER_ID}님의 주문 정보 입니다. 
											<input type="hidden" id="ID" name="ID" value="${myInfoOrderDetail2.loginId}"></td>
							<th>주문번호</th>
							<td><input class="form-control"
															type="text" value="${myInfoOrderDetail2.ORDER_NUM}" name="ORDER_NUM"
															readonly> <input type="hidden" id="ORDER_NUM"
															name="ORDER_NUM" value="${myInfoOrderDetail2.ORDER_NUM}"></td>
						</tr>
						<tr>
							<td colspan="4">
								<table class="ordergoodstable">
									<colgroup>
										<col width="10%">
										<col width="90%">
									</colgroup>
									<c:choose>
										<c:when test="${fn:length(myInfoOrderDetail) > 0}">
											<c:forEach items="${myInfoOrderDetail}" var="row" varStatus="status">
												<tbody>
													<tr>
														<td rowspan="4" class="order_info">
															<a href="./Detail.pulu?GOODS_NUM=${row.ORDER_GOODS_NUM}" target='_blank'>
																<img src='./resources/file/${row.ORDER_GOODS_IMAGE}' class="ordergoodsimg">
															</a>
														</td>
														<td height="14px">
															<strong class="prdName"><a href="./Detail.pulu?GOODS_NUM=${row.ORDER_GOODS_NUM}" target='_blank'>${row.ORDER_GOODS_NAME}</a></strong>
														</td>
													</tr>
													<tr>
														<td height="10px"></td>
													</tr>
													<tr>
														<td height="20px">
															<span class="prdText">수량: ${row.ORDER_GOODS_AMOUNT}개</span>
														</td>
													</tr>
													<tr>
														<td height="38px">
															<span class="prdText">[조건] / 기본배송${row.ORDER_GOODS_AMOUNT * row.ORDER_GOODS_PRICE}</span>
														</td>
													</tr>
													<tr>
														<td></td>
														<td height="42px" class="pricetd">
															<span class="proPrice"><fmt:formatNumber value="${row.ORDER_GOODS_AMOUNT * row.ORDER_GOODS_PRICE}" pattern="#,###,###" />원 </span>
														</td>
													</tr>
												</tbody>
											</c:forEach>
										</c:when>
									</c:choose>
									<tr>
										<td height="60px"></td>
									</tr>
								</table>
							</td>
		
						</tr>
						<tr>
							<th scope="row">결제방식</th>
							<c:choose>
								<c:when test="${myInfoOrderDetail2.ORDER_PAY_TYPE == 0}">
									<td colspan="3">무통장입금</td>
								</c:when>
							</c:choose>		
						</tr>
						<tr>
							<th scope="row">주문자 이름</th>
							<td colspan="3">${myInfoOrderDetail2.ORDER_MEMBER_NAME}</td>
						</tr>
						<tr>
							<th scope="row">주문자 연락처</th>
							<td colspan="3">${myInfoOrderDetail2.ORDER_MEMBER_PHONE}</td>
						</tr>
						<tr>
							<th scope="row">수령인 이름</th>
							<td colspan="3">${myInfoOrderDetail2.ORDER_RECEIVE_NAME}</td>
						</tr>
						<tr>
							<th scope="row">수령인 연락처</th>
							<td colspan="3">${myInfoOrderDetail2.ORDER_RECEIVE_PHONE}</td>
						</tr>
						<tr>
							<th scope="row">수령인 우편번호</th>
							<td colspan="3">${myInfoOrderDetail2.ORDER_RECEIVE_ZIPCODE}</td>
						</tr>
						<tr>
							<th scope="row">수령인 주소</th>
							<td colspan="3">${myInfoOrderDetail2.ORDER_RECEIVE_ADDR1} ${myInfoOrderDetail2.ORDER_RECEIVE_ADDR2}</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td scope="row"></td> -->
<!-- 							<td colspan="3"></td> -->
<!-- 						</tr> -->
						<tr>
							<th scope="row">요청 사항</th>
							<td colspan="3">${myInfoOrderDetail2.ORDER_MEMO}</td>
						</tr>
						<tr>
							<th scope="row">배송 상태</th>
							<c:choose>
									<c:when test="${myInfoOrderDetail2.ORDER_STATUS == 0}">
										<td colspan="3">주문접수</td>
									</c:when>
									<c:when test="${myInfoOrderDetail2.ORDER_STATUS == 1}">
										<td colspan="3">결제완료</td>
									</c:when>
									<c:when test="${myInfoOrderDetail2.ORDER_STATUS == 2}">
										<td colspan="3">배송준비</td>
									</c:when>
									<c:when test="${myInfoOrderDetail2.ORDER_STATUS == 3}">
										<td colspan="3">배송중</td>
									</c:when>
									<c:when test="${myInfoOrderDetail2.ORDER_STATUS == 4}">
										<td colspan="3">배송완료</td>
									</c:when>
									<c:otherwise>
										<td style="color: red" colspan="3">주문취소</td>
									</c:otherwise>
							</c:choose>
						</tr>
						<tr>	
							<th scope="row">주문 날짜</th>
<%-- 							<td colspan="3">${myInfoOrderDetail2.ORDER_DATE}</td> --%>
							<td colspan="3"><fmt:formatDate value="${myInfoOrderDetail2.ORDER_DATE}" pattern="yyyy-MM-dd"/></td>
							
						</tr>
						<tr>
							<th scope="row">주문 총 가격</th>
							<td colspan="3">${myInfoOrderDetail2.ORDER_SUM_MONEY}</td>
						</tr>
					</tbody>
				</table>
				<div class="base-button">
					<a href="#this" class="btnNo" id="list">리스트</a>
					<c:if test="${ORDER_STATUS != 5}">
					<a href="#this" class="btnNo" id="update">배송지 수정</a>
					<a href="#this" class="btnNo" id="delete">주문 취소</a>
					</c:if>
				</div>
			</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //리스트
				e.preventDefault(); //
				fn_myInfoOrder();
			});

			$("#update").on("click", function(e) { //수정하기
				e.preventDefault();
				fn_myInfoOrderUpdate();
			});

			$("#delete").on("click", function(e) { //삭제하기 
				e.preventDefault();
				fn_myInfoOrderDelete();
			});
		});

		function fn_myInfoOrder() {
			var comSubmit = new ComSubmit();

			comSubmit.setUrl("<c:url value='/myInfoOrder.pulu'/>");

			comSubmit.submit();

		}

		function fn_myInfoOrderUpdate() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myInfoOrderUpdateForm.pulu'/>");
			comSubmit.addParam("ORDER_NUM", $("#ORDER_NUM").val());
			comSubmit.submit();
		}

		function fn_myInfoOrderDelete() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myInfoOrderDelete.pulu'/>");
			comSubmit.addParam("ORDER_NUM", $("#ORDER_NUM").val());
			comSubmit.addParam("ORDER_GOODS_NUM", $("#ORDER_GOODS_NUM").val());
			comSubmit.addParam("ORDER_GOODS_AMOUNT", $("#ORDER_GOODS_AMOUNT").val());
			comSubmit.submit();
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
</style>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">주문 목록</h1>
	</div>
	<form action="" method="post">
		<div class="col-sm-6" >
			<a href="/adminOrderList.pulu"> 
			<button type="button" class="btn btn-outline btn-default">전체주문 보기</button></a> 
			
			<select class="form-control" name="select" onchange="window.open(value,'_self');" style="width: 120px;display: inline-block;">
				<option value="">주문상태</option>
				<option value="/adminOrderList.pulu?searchNum=0&isSearch=0">주문접수</option>
				<option value="/adminOrderList.pulu?searchNum=0&isSearch=1">결제완료</option>
				<option value="/adminOrderList.pulu?searchNum=0&isSearch=2">배송준비</option>
				<option value="/adminOrderList.pulu?searchNum=0&isSearch=3">배송중</option>
				<option value="/adminOrderList.pulu?searchNum=0&isSearch=4">배송완료</option>
				<option value="/adminOrderList.pulu?searchNum=0&isSearch=5">주문취소</option>
			</select>
		</div>
	</form>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">회원이 주문한 모든 목록을 조회, 관리합니다.</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form action="" id="adminOrderList" method="post">
					<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
						<thead>
							<tr>
								<th width="8%" style="text-align:center;">주문번호</th>
								<th width="8%" style="text-align:center;"> 송장번호</th>
								<th width="20%" style="text-align:center;">주문상품</th>
								<th width="8%" style="text-align:center;">회원ID</th>
								<th style="text-align:center;">			   주문합계</th>
								<th width="8%" style="text-align:center;">결제방식</th>
								<th width="8%" style="text-align:center;">주문상태</th>
								<th width="15%" style="text-align:center;">주문일자</th>
								<th width="8%" style="text-align:center;">수정/삭제</th>
							</tr>
						</thead>
						<tbody align="center">
							<tr class="odd gradeX">
								<c:choose>
									<c:when test="${fn:length(orderList) > 0}">
										<c:forEach items="${orderList}" var="row" varStatus="status">
										
											<tr>
												
												<td><a href='#this' onclick="openOrderDetail('${row.ORDER_NUM}')">${row.ORDER_NUM}</a></td>
												<form id="adminOrderList">
													<input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${row.ORDER_NUM}">
												</form>
												<td>00000000</td>
												<%-- <td>${row.ORDER_GOODS_NAME} 외 <span>${row.ORDER_GOODS_AMOUNT}개</span></td> --%>
												
												<c:choose>
													<c:when test="${row.ORDER_GOODS_COUNT > 1}">
														<td>${row.ORDER_GOODS_NAME} 외 ${row.ORDER_GOODS_COUNT-1}개</td>
													</c:when>
													<c:otherwise>
														<td>${row.ORDER_GOODS_NAME}</td>
													</c:otherwise>
												</c:choose>
												
												<td>${row.ORDER_MEMBER_ID}</td>
												<td>${row.ORDER_SUM_MONEY}원</td>
												<%-- <td><fmt:formatNumber pattern="#,###.##" value="${row.ORDER_SUM_MONEY}" type="number"/>원</td> --%>
												<c:choose>
													<c:when test="${row.ORDER_PAY_TYPE == 0}"><td>무통장입금</td></c:when>
													<c:when test="${row.ORDER_PAY_TYPE == 1}"><td>카드결제</td></c:when>
													<c:otherwise><td>결제방법(3)</td></c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${row.ORDER_STATUS == 0}"><td>주문접수</td></c:when>
													<c:when test="${row.ORDER_STATUS == 1}"><td>결제완료</td></c:when>
													<c:when test="${row.ORDER_STATUS == 2}"><td>배송준비</td></c:when>
													<c:when test="${row.ORDER_STATUS == 3}"><td>배송중</td></c:when>
													<c:when test="${row.ORDER_STATUS == 4}"><td>배송완료</td></c:when>
													<c:otherwise><td style="color: red">주문취소</td></c:otherwise>
												</c:choose>
												<td><fmt:formatDate value="${row.ORDER_DATE}" pattern="yyyy-MM-dd"/></td>
												<td>
													<form role="form" id="adminOrderDelete"  method="post">
														<%-- <input type="hidden" id="ORDER_NUM${status.index }" name="ORDER_NUM" value="${row.ORDER_NUM}"> --%>
														<!-- <input type="button" value="삭제" class="btn btn-danger" onclick="checkOrderDelete()"> -->
														<input type="button" value="주문취소" onclick="checkOrderDelete(${row.ORDER_NUM})">
													</form>
												</td>											
											</tr>
											
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="9">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tr>
						</tbody>
					</table>
					</form>
					<div>
					
					
					<div>
							<div style="border: 1px; float: left; width: 310px;">
								<div class="form-group input-group">
									<form action="">
										<select style="width: 80px;" class="form-control" name="searchNum" id="searchNum">
											<option value="1">회원ID</option>
											<option value="2">주문번호</option>
										</select> 
										<input class="form-control" type="text" name="isSearch" id="isSearch" style="width: 190px;" /> 
											<span class="input-group-btn">
												<button type="submit" class="btn btn-primary">
													<i class="fa fa-search"></i>
												</button>
											</span>
									</form>
								</div>
							</div>
							<div class="paging" style="border: 1px; float: right;">${pagingHtml}</div>
						</div>
					</div>

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</div> <!-- "row" --> 
<%@ include file="/WEB-INF/include/include-body.jspf"%>


<script type="text/javascript">
// 회원정보 상세보기 팝업창 띄우기 + Post로 값 넘기기
	function openOrderDetail(ORDER_NUM) {
		var orderNum = ORDER_NUM;
		window.open("adminOrderDetail.pulu?ORDER_NUM="+orderNum, 'window_adminOrderDetail', 'width=430, height=600, location=no, status=no, scrollbars=yes');
	}
</script>

<script type="text/javascript">
	function checkOrderDelete(ORDER_NUM){
		if (confirm("주문 취소 하겠습니까?") == true) {
		var comSubmit = new ComSubmit("adminOrderDelete");
		comSubmit.setUrl("<c:url value='/adminOrderDelete.pulu' />");
		comSubmit.addParam("ORDER_NUM", ORDER_NUM);
		comSubmit.submit();
		opener.parent.location.reload();
		}
	}
</script>


    
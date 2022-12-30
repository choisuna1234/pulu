<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>주문관리</title>
	<!-- <link rel="stylesheet" href="resources/css/ui.css" type="text/css" /> -->
  
    <!-- Bootstrap Core CSS -->
    <link href="/resources/sbadmin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/sbadmin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/sbadmin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/sbadmin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 js -->

<div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
					<div class="col-lg-12">
						<h2 class="page-header">주문정보</h2>
					</div>
				<div class="panel-heading">
						<h4 align="center">
							<strong>[ 주문번호 : ${map.ORDER_NUM} ]</strong> 정보 입니다.
						</h4>
					</div>
					
				
					<form role="form" id="adminOrderUpdateForm" action="adminOrderUpdate.pulu" method="post">
						<input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${map.ORDER_NUM}"/>	

						<div class="panel panel-default">
						<div class="panel-heading"
							style="background-color: #006F3E; color: white; text-align: center; font-family: notoKrR;">
							주문자 정보</div>

						<div class="panel-body">

						<div class="form-group">
							<label>아이디[등급]</label> 
								<input class="form-control" type="text" value="${map.ID }&nbsp;&nbsp;[${map.GRADE }]" name="ID" readonly>
						</div>
						<div class="form-group">
							<label>이름</label> 
								<input class="form-control" type="text" value="${map.NAME }" name="NAME" readonly>
						</div>
						<div class="form-group">
							<label>연락처</label> 
								<input class="form-control" type="text" value="${map.PHONE }" name="PHONE" readonly>
						</div></div></div>
						
						<div class="panel panel-default">
							<div class="panel-heading" style="background-color: #006F3E; color: white; text-align: center; font-family: notoKrR;">
								상품정보
							</div>
							<div class="panel-body">
							
								<div class="form-group">
									<label>상품(수량)</label>
									<c:choose>
										<c:when test="${fn:length(list) > 0}">
											<c:forEach items="${list}" var="row" varStatus="status">
												<table>
													<tr>
														<td width="40%">
														<!-- 썸네일이미지 -->
															<a href="/Detail.pulu?GOODS_NUM=${row.ORDER_GOODS_NUM}" target="_blank">
																<img class="goodsimg" src="./resources/file/${row.ORDER_GOODS_IMAGE}" style="width: 50%"/>
															</a>
														</td>
														<td>
															<label>상품이름</label> 
																<input class="form-control" type="text" value="${row.ORDER_GOODS_NAME }" name="ORDER_GOODS_NAME" readonly>
															<label>상품가격</label> 
																<input class="form-control" type="text" value="${row.ORDER_GOODS_PRICE }" name="ORDER_GOODS_PRICE" readonly>
															<label>상품수량</label> 
																<input class="form-control" type="text" value="${row.ORDER_GOODS_COUNT }" name="ORDER_GOODS_COUNT" readonly>
														</td>
													</tr>
												</table>	
											</c:forEach>
										</c:when>
									</c:choose>
								</div>
								<div class="form-group">
									<label>총금액</label> 
										<input class="form-control" type="text" value="${map.ORDER_SUM_MONEY }" name="SUM_MONEY" readonly>
								</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading" style="background-color: #006F3E; color: white; text-align: center; font-family: notoKrR;">
								주문 정보
							</div>
							<div class="panel-body">
						
								<div class="form-group">
									<label>결제방법</label>
									<c:choose>
										<c:when test="${map.ORDER_PAY_TYPE == 0}">
											<input class="form-control" type="text" value="무통장입금" name="ORDER_PAY_TYPE" readonly></c:when>
										<c:when test="${map.ORDER_PAY_TYPE == 1}">
											<input class="form-control" type="text" value="카드결제" name="ORDER_PAY_TYPE" readonly></c:when>
										<c:otherwise>
											<input class="form-control" type="text" value="결제방법(3)" name="ORDER_PAY_TYPE" readonly></c:otherwise>
									</c:choose> 
								</div>
								
								<div class="form-group">
									<label>주문상태</label>
									<c:choose>
										<c:when test="${map.ORDER_STATUS == 0}">
											  <select class="form-control" id="ORDER_STATUS" value="주문접수" name=ORDER_STATUS>	
											      <option value="0" style="font-weight:bold;">주문접수</option>
											      <option value="1">결제완료</option>
											      <option value="2">배송준비</option>
											      <option value="3">배송중</option>
											      <option value="4">배송완료</option>
											      <option value="5" style="color: red">주문취소</option>
											  </select>									
										</c:when>
										<c:when test="${map.ORDER_STATUS == 1}">
											<select class="form-control" id="ORDER_STATUS" value="결제완료" name=ORDER_STATUS>	
											      <option value="1" style="font-weight:bold;">결제완료</option>
											      <option value="0">주문접수</option>
											      <option value="1">결제완료</option>
											      <option value="2">배송준비</option>
											      <option value="3">배송중</option>
											      <option value="4">배송완료</option>
											      <option value="5" style="color: red">주문취소</option>
											  </select>	
										</c:when>
										<c:when test="${map.ORDER_STATUS == 2}">
											<select class="form-control" id="ORDER_STATUS" value="배송준비" name=ORDER_STATUS>	
											      <option value="2" style="font-weight:bold;">배송준비</option>
											      <option value="0">주문접수</option>
											      <option value="1">결제완료</option>
											      <option value="2">배송준비</option>
											      <option value="3">배송중</option>
											      <option value="4">배송완료</option>
											      <option value="5" style="color: red">주문취소</option>
											  </select>	
										</c:when>
										<c:when test="${map.ORDER_STATUS == 3}">
											<select class="form-control" id="ORDER_STATUS" value="배송중" name=ORDER_STATUS>	
											      <option value="3" style="font-weight:bold;">배송중</option>
											      <option value="0">주문접수</option>
											      <option value="1">결제완료</option>
											      <option value="2">배송준비</option>
											      <option value="3">배송중</option>
											      <option value="4">배송완료</option>
											      <option value="5" style="color: red">주문취소</option>
											  </select>	
										</c:when>
										<c:when test="${map.ORDER_STATUS == 4}">
											<select class="form-control" id="ORDER_STATUS" value="배송완료" name=ORDER_STATUS>	
											      <option value="4" style="font-weight:bold;">배송완료</option>
											      <option value="0">주문접수</option>
											      <option value="1">결제완료</option>
											      <option value="2">배송준비</option>
											      <option value="3">배송중</option>
											      <option value="4">배송완료</option>
											      <option value="5" style="color: red">주문취소</option>
											  </select>	
										</c:when>
										<c:otherwise>
											<select class="form-control" id="ORDER_STATUS" name=ORDER_STATUS>	
											      <option value="5" style="font-weight:bold;">주문취소</option>
											 <!-- <option value="0">주문접수</option>
											      <option value="1">결제완료</option>
											      <option value="2">배송준비</option>
											      <option value="3">배송중</option>
											      <option value="4">배송완료</option> -->
											      <option value="5" style="color: red">주문취소</option>
											  </select>	
										</c:otherwise>
									</c:choose> 
								</div>
								<div class="form-group">
									<label>수령인 이름</label> 
										<input class="form-control" type="text" value="${map.ORDER_RECEIVE_NAME }" name="ORDER_RECEIVE_NAME" >
								</div>
								<div class="form-group">
									<label>수령인 연락처</label> 
										<input class="form-control" type="text" value="${map.ORDER_RECEIVE_PHONE }" name="ORDER_RECEIVE_PHONE" >
								</div>
								<div class="form-group">
									<label>우편번호</label><br/>
						            <button type="button" class="btn btn-primary" style="background-color: #006F3E;" onclick="kakaoPost()">우편번호 찾기</button>
						            <input class="form-control" type="text" value="${map.ORDER_RECEIVE_ZIPCODE }" name="ORDER_RECEIVE_ZIPCODE" id="zipcode" maxlength="7">
						        </div>
								<div class="form-group">
									<label>주소</label> 
										<input class="form-control" type="text" value="${map.ORDER_RECEIVE_ADDR1 }" name="ORDER_RECEIVE_ADDR1" id="addr1" >
										<input class="form-control" type="text" value="${map.ORDER_RECEIVE_ADDR2 }" name="ORDER_RECEIVE_ADDR2" >
								</div>
								<div class="form-group">
									<label>배송요청사항</label> 
										<input class="form-control" type="text" value="${map.ORDER_MEMO }" name="ORDER_MEMO" id="MEMO" >
								</div>
							</div>
						</div>
						<div align="center">
							<input type="submit" value="수정 완료" class="btn btn-primary" style="background-color: #006F3E;" onclick="opener.parent.location.reload()">
					        <input type="button" value="삭제" class="btn btn-danger" onclick="checkOrderDelete()">
					        <button type="button" class="btn btn-primary" style="background-color: #006F3E;" onclick="window.close()">닫기</button>
					    </div>
				    </form></br></br></br>
				   </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    
    
    
    
<script>
//카카오 우편번호 api
function kakaoPost() {
	new daum.Postcode({
		oncomplete : function(data) {
			document.querySelector("#zipcode").value = data.zonecode;
			document.querySelector("#addr1").value = data.address
		}
	}).open();
}
</script>
<script>
//주문취소 알림 팝업
function checkOrderDelete() {
	var form = document.getElementById("adminOrderUpdateForm");
	if (confirm("주문을 취소 하겠습니까?") == true) {
		form.action = "adminOrderDelete.pulu";
		form.target = "_self";
		form.method = "post";
		form.submit();
		opener.parent.location.reload();
		window.close();
	} else {}
}
</script>

	
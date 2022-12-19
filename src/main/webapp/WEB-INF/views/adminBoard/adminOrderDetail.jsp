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

</head>
<body>
 <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
					<h1 class="page-header">주문정보</h1>
				
				
					<div class="panel-heading"><h3><strong>[ 주문번호 : ${map.ORDER_NUM} ]</strong> 정보 입니다.</h3></div>
				
					<form role="form" action="adminOrderUpdateForm.pulu" method="post">
						<input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${map.ORDER_NUM}"/>
					
						<div class="form-group">
							<label>아이디[등급]</label> 
								<input class="form-control" type="text" value="${map.ID }&nbsp;&nbsp;[${map.GRADE }]" name="ID" readonly>
						</div>
						<div class="form-group">
							<label>이름</label> 
								<input class="form-control" type="text" value="${map.NAME }" name="NAME" readonly>
						</div>
						<div class="form-group">
							<label>상품(수량)</label> 
								<input class="form-control" type="text" value="${map.ORDER_GOODS_NAME }&nbsp;&nbsp;(수량 : ${map.ORDER_GOODS_AMOUNT })" name="GOODS_NAME" readonly>
						</div>
						<div class="form-group">
							<label>총금액</label> 
								<input class="form-control" type="text" value="${map.ORDER_SUM_MONEY }" name="SUM_MONEY" readonly>
						</div>
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
									<input class="form-control" type="text" value="주문접수" name=ORDER_STATUS readonly></c:when>
								<c:when test="${map.ORDER_STATUS == 1}">
									<input class="form-control" type="text" value="결제완료" name="ORDER_STATUS" readonly></c:when>
								<c:when test="${map.ORDER_STATUS == 2}">
									<input class="form-control" type="text" value="배송준비" name="ORDER_STATUS" readonly></c:when>
								<c:when test="${map.ORDER_STATUS == 3}">
									<input class="form-control" type="text" value="배송중" name="ORDER_STATUS" readonly></c:when>
								<c:when test="${map.ORDER_STATUS == 4}">
									<input class="form-control" type="text" value="배송완료" name="ORDER_STATUS" readonly></c:when>
								<c:otherwise>
									<input class="form-control" type="text" value="주문취소" name="ORDER_STATUS" readonly style="color: red"></c:otherwise>
							</c:choose> 
						</div>
						<div class="form-group">
							<label>연락처</label> 
								<input class="form-control" type="text" value="${map.PHONE }" name="PHONE" readonly>
						</div>
						<div class="form-group">
							<label>수령인 이름</label> 
								<input class="form-control" type="text" value="${map.ORDER_RECEIVE_NAME }" name="RECEIVE_NAME" readonly>
						</div>
						<div class="form-group">
							<label>수령인 연락처</label> 
								<input class="form-control" type="text" value="${map.ORDER_RECEIVE_PHONE }" name="RECEIVE_PHONE" readonly>
						</div>
						<div class="form-group">
							<label>우편번호</label><br /> 
								<input class="form-control" type="text" value="${map.ORDER_RECEIVE_ZIPCODE }" name="ZIPCODE" id="zipcode" maxlength="7" readonly>
						</div>
						<div class="form-group">
							<label>주소</label> 
								<input class="form-control" type="text" value="${map.ORDER_RECEIVE_ADDR1 }" name="ADDR1" id="addr1" readonly>
								<input class="form-control" type="text" value="${map.ORDER_RECEIVE_ADDR2 }" name="ADDR2" readonly>
						</div>
						<div class="form-group">
							<label>배송요청사항</label> 
								<input class="form-control" type="text" value="${map.ORDER_MEMO }" name="MEMO" id="MEMO" readonly>
						</div>
						<button type="button" class="btn btn-primary" onclick="window.close(); opener.parent.location.reload()";>확인</button>
						<input type="submit" class="btn btn-primary" value="수정하기">
					</form></br></br></br>
				   </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
</body>
</html>
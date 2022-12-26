<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.goodsimg {
	width: 80px;
}
</style>
</head>
<body>
	<div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">주문 내역 정보</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            ${myInfoOrderDetail.ORDER_MEMBER_ID}님의 회원정보 입니다.
                            <input type="hidden" id="ID" name="ID" value="${MyInfoOrderDetail.loginId}">
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form">
                                    <img class="goodsimg" src="./resources/file/${myInfoOrderDetail.IMAGE_STORED}" />
                                        <div class="form-group">
                                            <label>주문번호</label>
                                            <input class="form-control" type="text" value="${myInfoOrderDetail.ORDER_NUM}" name="ORDER_NUM" readonly>
                                            <input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${myInfoOrderDetail.ORDER_NUM}">
                                        </div>
                                        <div class="form-group">
                                            <label>결제방식</label>
                                             <c:choose>
										<c:when test="${myInfoOrderDetail.ORDER_PAY_TYPE == 0}"><td>무통장입금</td></c:when>
											</c:choose>
                                        </div>
                                        <div class="form-group">
                                            <label>주문자 이름</label>
                                            <input class="form-control" type="text" value="${myInfoOrderDetail.ORDER_MEMBER_NAME}" name="ORDER_MEMBER_NAME" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>주문자 연락처</label>
                                            <input class="form-control" type="text" value="${myInfoOrderDetail.ORDER_MEMBER_PHONE}" name="ORDER_MEMBER_PHONE" readonly>
                                        </div>
                                         <div class="form-group">
                                            <label>수령인 이름</label>
                                            <input class="form-control" type="text" value="${myInfoOrderDetail.ORDER_RECEIVE_NAME}" name="ORDER_RECEIVE_NAME" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>수령인 연락처</label>
                                            <input class="form-control" type="text" value="${myInfoOrderDetail.ORDER_RECEIVE_PHONE}" name="ORDER_RECEIVE_PHONE" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>수령인 우편번호</label>
                                            <input class="form-control" type="text" value="${myInfoOrderDetail.ORDER_RECEIVE_ZIPCODE}" name="ORDER_RECEIVE_ZIPCODE" id="ORDER_RECEIVE_ZIPCODE" maxlength="7" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>수령인 주소</label>
                                            <input class="form-control" type="text" value="${myInfoOrderDetail.ORDER_RECEIVE_ADDR1}" name="ORDER_RECEIVE_ADDR1" id="ORDER_RECEIVE_ADDR1" readonly>
                                            <input class="form-control" type="text" value="${myInfoOrderDetail.ORDER_RECEIVE_ADDR2}" name="ORDER_RECEIVE_ADDR2" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>요청 사항</label>
                                            <input class="form-control" type="text" value="${myInfoOrderDetail.ORDER_MEMO}" name="ORDER_MEMO" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>배송 상태</label>
                                            <c:choose>
										<c:when test="${myInfoOrderDetail.ORDER_STATUS == 0}"><td>주문접수</td></c:when>
										<c:when test="${myInfoOrderDetail.ORDER_STATUS == 1}"><td>결제완료</td></c:when>
										<c:when test="${myInfoOrderDetail.ORDER_STATUS == 2}"><td>배송준비</td></c:when>
										<c:when test="${myInfoOrderDetail.ORDER_STATUS == 3}"><td>배송중</td></c:when>
										<c:when test="${myInfoOrderDetail.ORDER_STATUS == 4}"><td>배송완료</td></c:when>
										<c:otherwise><td style="color: red">주문취소</td></c:otherwise>
											</c:choose>
                                        </div>
                                         <div class="form-group">
                                            <label>주문 날짜</label>
                                            <input class="form-control" type="text" value="${myInfoOrderDetail.ORDER_DATE}" name="ORDER_DATE" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>상품 수량</label>
                                            <input class="form-control" type="text" value="${myInfoOrderDetail.ORDER_GOODS_AMOUNT}" name="ORDER_GOODS_AMOUNT" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>상품 가격</label>
                                            <input class="form-control" type="text" value="${myInfoOrderDetail.ORDER_GOODS_PRICE}" name="ORDER_GOODS_PRICE" readonly>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
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
			comSubmit.submit();

		}
	</script>
</body>
</html>
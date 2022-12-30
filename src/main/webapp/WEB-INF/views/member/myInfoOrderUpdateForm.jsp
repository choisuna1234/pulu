<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 js -->
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<meta charset="UTF-8">
<title>나의 주문 내역</title>
<style>
.goodsimg {
	width: 80px;
}
</style>
</head>
<body>
	<form role="form" id="frm">
		<div class="titleArea">
			<h1 class="page-header">주문 내역 정보</h1>
		</div>
		<div class="base-table boardWrite">
			<table>
				<colgroup>
					<col width="150px" />
					<col width="*" />
					<col width="*" />
					<col width="130px" />
				</colgroup>
				<tbody>

					<tr>
						<th scope="row">주문자</th>
						<td>${map.ORDER_MEMBER_ID}님의
							주문 내역 수정
							<input type="hidden" id="ID" name="ID" value="${myInfoOrderDetail2.loginId}">
						</td>
						<th>주문번호</th>
						<td>${map.ORDER_NUM}</td>
					</tr>
					<tr>
						<th scope="row">결제방식</th>
						<td colspan="3">무통장입금</td>
					</tr>
					<tr>
						<th>주문자 이름</th>
						<td colspan="3">
							<input class="form-control" type="text" value="${map.ORDER_MEMBER_NAME}" name="ORDER_MEMBER_NAME">
						</td>
					</tr>
					<tr>
						<th scope="row">주문자 연락처</th>
						<td colspan="3">
							<input class="form-control" type="text" value="${map.ORDER_MEMBER_PHONE}" name="ORDER_MEMBER_PHONE">
						</td>
					</tr>
					<tr>
						<th scope="row">수령인 이름</th>
						<td colspan="3">
							<input class="form-control" type="text" value="${map.ORDER_RECEIVE_NAME}" name="ORDER_RECEIVE_NAME">
						</td>
					</tr>
					<tr>
						<th scope="row">수령인 연락처</th>
						<td colspan="3">
							<input class="form-control" type="text" value="${map.ORDER_RECEIVE_PHONE}" name="ORDER_RECEIVE_PHONE">
						</td>
					</tr>
					<tr>
						<th scope="row">수령인 우편번호</th>
						<td colspan="3">
							<input class="form-control" type="text" value="${map.ORDER_RECEIVE_ZIPCODE}" name="ORDER_RECEIVE_ZIPCODE" id="ORDER_RECEIVE_ZIPCODE" maxlength="7">
							<a href='#this' class="btnNo" id="post" onclick="kakaoPost()">주소검색</a>
						</td>
					</tr>
					<tr>
						<th scope="row">수령인 주소</th>
						<td colspan="3">
							<input class="form-control" type="text" value="${map.ORDER_RECEIVE_ADDR1}" name="ORDER_RECEIVE_ADDR1" id="ORDER_RECEIVE_ADDR1">&nbsp;
							<input class="form-control" type="text" value="${map.ORDER_RECEIVE_ADDR2}" name="ORDER_RECEIVE_ADDR2" id="ORDER_RECEIVE_ADDR2">
						</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td scope="row"></td> -->
<!-- 						<td colspan="3"></td> -->
<!-- 					</tr> -->
					<tr>
						<th scope="row">요청 사항</th>
						<td colspan="3">
							<input class="form-control" type="text" value="${map.ORDER_MEMO}" name="ORDER_MEMO">
						</td>
					</tr>
					<tr>
						<th scope="row">배송 상태</th>
						<c:choose>
							<c:when test="${map.ORDER_STATUS == 0}">
								<td colspan="3">주문접수</td>
							</c:when>
							<c:when test="${map.ORDER_STATUS == 1}">
								<td colspan="3">결제완료</td>
							</c:when>
							<c:when test="${map.ORDER_STATUS == 2}">
								<td colspan="3">배송준비</td>
							</c:when>
							<c:when test="${map.ORDER_STATUS == 3}">
								<td colspan="3">배송중</td>
							</c:when>
							<c:when test="${map.ORDER_STATUS == 4}">
								<td colspan="3">배송완료</td>
							</c:when>
							<c:otherwise>
								<td style="color: red" colspan="3">주문취소</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</tbody>
			</table>
			<div class="base-button">
				<a href="#this" class="btnNo" id="list">리스트</a>
				<a href="#this" class="btnNo" id="update">수정 완료</a>
			</div>
		</div>
		<input type="hidden" value="${map.ORDER_NUM}" name="ORDER_NUM">
	</form>
	<!-- /#wrapper -->

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

	});

	function fn_myInfoOrder() {
	    var comSubmit = new ComSubmit();

	    comSubmit.setUrl("<c:url value='/myInfoOrder.pulu'/>");
	    comSubmit.submit();
	}

	function fn_myInfoOrderUpdate() {
	    var comSubmit = new ComSubmit("frm");
	    comSubmit.setUrl("<c:url value='/myInfoOrderUpdate.pulu'/>");
	    comSubmit.submit();
	}

	function val_check() {
	    if (document.getElementById('ORDER_MEMBER_NAME').value.length == 0) {
		alert("주문자 이름을 입력하세요.");
		document.getElementById('ORDER_MEMBER_NAME').focus();
		return false;
	    } else if (document.getElementById('ORDER_MEMBER_PHONE').value.length == 0) {
		alert("주문자 연락처를 입력하세요.");
		document.getElementById('ORDER_MEMBER_PHONE').focus();
		return false;
	    }

	    else if (document.getElementById('ORDER_RECEIVE_NAME').value.length == 0) {
		alert("수령인 이름을 입력하세요.");
		document.getElementById('ORDER_RECEIVE_NAME').focus();
		return false;
	    } else if (document.getElementById('ORDER_RECEIVE_PHONE').value.length == 0) {
		alert("수령인 연락처를 입력하세요.");
		document.getElementById('ORDER_RECEIVE_PHONE').focus();
		return false;
	    } else if (document.getElementById('ORDER_RECEIVE_ZIPCODE').value.length == 0) {
		alert("수령인 우편번호을 입력하세요.");
		document.getElementById('ORDER_RECEIVE_ZIPCODE').focus();
		return false;
	    } else if (document.getElementById('ORDER_RECEIVE_ADDR1').value.length == 0) {
		alert("수령인 주소를 입력하세요.");
		document.getElementById('ORDER_RECEIVE_ADDR1').focus();
		return false;
	    } else if (document.getElementById('ORDER_RECEIVE_ADDR2').value.length == 0) {
		alert("수령인 상세주소를 입력하세요.");
		document.getElementById('ORDER_RECEIVE_ADDR2').focus();
		return false;
	    }
	    else {
		alert('주문 정보가 수정되었습니다..');
		return true;
	    }
	}
	
	// 선민: 카카오 우편번호 api
	function kakaoPost() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.querySelector("#ORDER_RECEIVE_ZIPCODE").value = data.zonecode;
				document.querySelector("#ORDER_RECEIVE_ADDR1").value = data.address
			}
		}).open();
	}
// 	// 선민: 카카오 우편번호 api
// 	function kakaoPost() {
// 		new daum.Postcode({
// 			oncomplete : function(data) {
// 				document.querySelector("#zipcode").value = data.zonecode;
// 				document.querySelector("#addr1").value = data.address
// 			}
// 		}).open();
// 	}
    </script>
</body>
</html>
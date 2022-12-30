<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
img.goodsimg {
	width: 100px;
}

.state {
	border: 1px solid #ebebeb;
	overflow: hidden;
	padding: 0;
}

.order {
	max-width: 760px;
	float: left;
	width: 80%;
}

.order li {
	padding: 26px 0;
	position: relative;
	border: 0;
	float: left;
	width: 25%;
	margin: 0 -1px 0 0;
	text-align: center;
}

.order li strong {
	display: block;
	margin: 2px 0 7px;
	font-size: 16px;
	color: #353535;
}

.order .count {
	color: #333;
	font-size: 25px;
	font-family: 'notoKrM';
	line-height: 1;
}

.order li:after {
	content: '';
	position: absolute;
	right: 0;
	top: 40px;
	width: 16px;
	height: 30px;
	display: inline-block;
	background: url(/resources/img/icon/order_info_bg.png) no-repeat center;
}

.noticeList {
	width: 100%;
}

.cs {
	padding: 32px 26px;
	background: #f5f5f5;
	float: right;
	width: 142px;
	max-width: 190px;
	margin: 0;
}

.cs li {
	margin-left: 0;
	margin: 0 0 5px 0;
	letter-spacing: 0.04em;
	word-spacing: 4px;
}

.mpdelismall {
	float: right;
	color: #333;
	padding: 0 0 0 4px;
	font-weight: bold;
}

.mptoptext {
	margin-bottom: 5px;
}
</style>
<div>
	<div>
		<h2>주문/결제 내역</h2>
		<h4>최근 30일 내에 주문하신 내역입니다.</h4>
		<p class="mptoptext">주문 처리 현황(최근 3개월)</p>

		<div class="state">
			<ul class="order">
				<li><strong>입금 전</strong> <span class="mpdeli">0</span></li>
				<li><strong>배송준비 중</strong> <span class="mpdeli">0</span></li>
				<li><strong>배송 중</strong> <span class="mpdeli">0</span></li>
				<li><strong>배송 완료</strong> <span class="mpdeli">0</span></li>
			</ul>
			<ul class="cs">
				<li><strong>취소현황 : </strong><span class="mpdelismall">0</span></li>
				<li><strong>교환현황 : </strong><span class="mpdelismall">0</span></li>
				<li><strong>반품현황 : </strong><span class="mpdelismall">0</span></li>
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${myInfoOrder[0].ORDER_STATUS == '5'}"> --%>
<%-- 				<li><strong>입금 전</strong> <span class="mpdeli">${fn:length(myInfoOrder) -1}</span></li> --%>
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<%-- 				<li><strong>입금 전</strong> <span class="mpdeli">${fn:length(myInfoOrder)}</span></li> --%>
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<!-- <!-- 				<li><strong>입금 전</strong> <span class="mpdeli">0</span></li> -->
<!-- 				<li><strong>배송준비 중</strong> <span class="mpdeli">0</span></li> -->
<!-- 				<li><strong>배송 중</strong> <span class="mpdeli">0</span></li> -->
<!-- <!-- 				<li><strong>배송 완료</strong> <span class="mpdeli">0</span></li> --> 
<!-- 				<li><strong>배송 완료</strong> <span class="mpdeli">1</span></li> -->
<!-- 			</ul> -->
<!-- 			<ul class="cs"> -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${myInfoOrder[0].ORDER_STATUS == '5'}"> --%>
<!-- 					<li><strong>취소현황 : </strong><span class="mpdelismall">1</span></li> -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 					<li><strong>취소현황 : </strong><span class="mpdelismall">0</span></li> -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<!-- 				<li><strong>교환현황 : </strong><span class="mpdelismall">0</span></li> -->
<!-- 				<li><strong>반품현황 : </strong><span class="mpdelismall">0</span></li> -->
			</ul>
		</div>

		<div class="base-table boardList">
			<table border="1" summary>
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="15%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">주문번호</th>
						<th scope="col">상품정보</th>
						<th scope="col">상품이름</th>
						<th scope="col">배송상태</th>
						<th scope="col">총 가격</th>
						<th scope="col">결제일</th>
					</tr>
				</thead>
				<tbody class="boardtbody center">
					<c:choose>
						<c:when test="${fn:length(myInfoOrder) > 0}">
							<c:forEach items="${myInfoOrder}" var="row">
								<tr>
									<td>${row.ORDER_NUM}</td>
									<!-- 썸네일이미지 -->
									<td style="text-align: center" class="title">
										<a href="#this" name="title">
											<img class="goodsimg" src="./resources/file/${row.ORDER_GOODS_IMAGE}" />
										</a>
										<input type="hidden" id="GOODS_NUM" value="${row.GOODS_NUM}">
										<input type="hidden" id="ORDER_NUM" value="${row.ORDER_NUM}">
									</td>
									<c:choose>
										<c:when test="${row.ORDER_GOODS_COUNT == 1}">
											<td>${row.ORDER_GOODS_NAME}</td>
										</c:when>
										<c:otherwise>
											<td>${row.ORDER_GOODS_NAME}<br/>외 ${row.ORDER_GOODS_COUNT-1}개</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${row.ORDER_STATUS == 0}">
											<td>입금대기</td>
										</c:when>
										<c:when test="${row.ORDER_STATUS == 1}">
											<td>결제완료</td>
										</c:when>
										<c:when test="${row.ORDER_STATUS == 2}">
											<td>배송준비</td>
										</c:when>
										<c:when test="${row.ORDER_STATUS == 3}">
											<td>배송중</td>
										</c:when>
										<c:when test="${row.ORDER_STATUS == 4}">
											<td>배송완료</td>
										</c:when>
										<c:otherwise>
											<td style="color: red">주문취소</td>
										</c:otherwise>
									</c:choose>
									<td>${row.ORDER_SUM_MONEY}</td>
									<td>
										<fmt:formatDate value="${row.ORDER_DATE}" pattern="yyyy-MM-dd"/>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>



		<div class="paging">${pagingHtml}</div>
		<div class="row"></div>
	</div>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
    $(document).ready(function() {
	$("a[name='title']").on("click", function(e) { //제목 
	    e.preventDefault();
	    fn_myInfoOrderDetail($(this));
	});
    });

    function fn_myInfoOrderDetail(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/myInfoOrderDetail.pulu'/>");
	comSubmit.addParam("ORDER_NUM", obj.parent().find("#ORDER_NUM").val());
	comSubmit.submit();
    }
</script>
</body>
</body>
</html>
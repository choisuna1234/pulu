<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>구매내역</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<style>
img.goodsimg {
    width: 100px;
}
</style>

</head>
<body class="bg-light">

<h2>마이페이지- 구매내역 확인</h2>
<table class="noticeList">
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
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
	<tbody>
		<c:choose>
			<c:when test="${fn:length(myInfoOrder) > 0}">
				<c:forEach items="${myInfoOrder}" var="row">
					<tr>
						<td>${row.ORDER_NUM}</td>
					<!-- 썸네일이미지 -->
						<td style="text-align: center"  class="title">
						<a href="#this" name="title">
						<img class="goodsimg" src="./resources/file/${row.IMAGE_STORED}" /></a>
							<input type="hidden" id="GOODS_NUM" value="${row.GOODS_NUM}">
							<input type="hidden" id="ORDER_NUM" value="${row.ORDER_NUM}">
						</td>
						<td>${row.GOODS_NAME}</td>
				<c:choose>
				<c:when test="${row.ORDER_STATUS == 0}"><td>주문접수</td></c:when>
				<c:when test="${row.ORDER_STATUS == 1}"><td>결제완료</td></c:when>
				<c:when test="${row.ORDER_STATUS == 2}"><td>배송준비</td></c:when>
				<c:when test="${row.ORDER_STATUS == 3}"><td>배송중</td></c:when>
				<c:when test="${row.ORDER_STATUS == 4}"><td>배송완료</td></c:when>
				<c:otherwise><td style="color: red">주문취소</td></c:otherwise>
				</c:choose>
						<td>${row.ORDER_SUM_MONEY}</td>
						<td>${row.ORDER_DATE}</td>
						<td></td>
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
<div class="paging">
${pagingHtml}
</div>
<div class="row">
</div>
<br/>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
   <script type="text/javascript">
      $(document).ready(function(){
         $("a[name='title']").on("click", function(e){ //제목 
            e.preventDefault();
            fn_myInfoOrderDetail($(this));
         });
      });
      
      
      function fn_myInfoOrderDetail(obj){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/myInfoOrderDetail.pulu'/>");
         comSubmit.addParam("ORDER_NUM", obj.parent().find("#ORDER_NUM").val());
         comSubmit.submit();
      }
   </script>  
</body>
</body>
</html>
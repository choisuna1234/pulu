<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<title>REVIEW</title>
</head>
<body>
<h2>review</h2>
<table style="border:1px solid #ccc">
	<colgroup>
		<col width="10%"/>
		<col width="15%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">후기번호</th>
			<th scope="col">후기상품번호</th>
			<th scope="col">후기작성자</th>
			<th scope="col">후기내용</th>
			<th scope="col">작성일</th>
			<th scope="col">답변상태</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(reviewList) > 0}">
				<c:forEach items="${reviewList}" var="row">
					<tr>
						<td>${row.REVIEW_NUM }</td>
						<td class="title">
                        <a href="#this" name="title">
						${row.REVIEW_GOODS_NUM }</a>
						<input type="hidden" id="REVIEW_NUM" value="${row.REVIEW_NUM}"></td>
						
						<td>${row.REVIEW_ID }</td>
						<td>${row.REVIEW_CONTENTS }</td>
						<td>${row.REVIEW_DATE }</td>
						<td>${row.REVIEW_STATUS }</td>
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

	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">

</script>
</body>
</html>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<title>REVIEW</title>
</head>
<body>
<table style="border:1px solid #ccc">
	<colgroup>
		<col width="10%"/>
		<col width="15%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr class="item">
		
			<th scope="col">후기번호</th>
			<th scope="col">후기작성자</th>
			<th scope="col">후기내용</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(reviewList) > 0}">
				<c:forEach items="${reviewList}" var="row" varStatus="status">
					<tr>
						<td>${row.REVIEW_NUM }</td>
						<td>${row.REVIEW_ID }</td>
						<td>${row.REVIEW_CONTENTS }</td>
						<td>${row.REVIEW_DATE }</td>	
						<c:if test="${loginId == row.REVIEW_ID}">
						<td><a href="#this" class="btn" id="update">수정</a></td>
						<td><a href="#this" class="btn-primary" id="delete">삭제</a></td>
						<input type="hidden" name="GOODS_NUM" value="${map.GOODS_NUM}">
						<input type="hidden" name="REVIEW_ID" value="${map.loginId}">
						</c:if>
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
$(document).ready(function(){
	
	$("#delete").on("click", function(e){ //삭제하기 버튼
		e.preventDefault();
		fn_reviewDelete();
	});
});


function fn_reviewDelete(){
	var comSubmit = new ComSubmit();
	var review_num = "${map.REVIEW_NUM}";
	comSubmit.setUrl("<c:url value='/reviewDelete.pulu' />");
	comSubmit.addParam("REVIEW_NUM", review_num);
	comSubmit.submit();
	
}
</script>
</body>
</html>    
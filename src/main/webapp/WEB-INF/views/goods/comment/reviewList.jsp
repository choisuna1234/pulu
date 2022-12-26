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
			<c:if test="${loginId == null}">
			로그인이 필요합니다.
						</c:if>
						<c:if test="${loginId != null}">
						<section class="reviewForm">
	 					 <form role="form" method="post" autocomplete="off" id="reviewInsert" action="reviewInsert.pulu">
	 					 <input type="hidden" name="REVIEW_GOODS_NUM" value="${map.GOODS_NUM}">
	 					 <input type="hidden" name="GOODS_NUM" value="${map.GOODS_NUM}">
	 					 <input type="hidden" name="ORDER_GOODS_NUM" value="${map.GOODS_NUM}">
  						 <div class="input_area">
    					<textarea rows="4" cols="100" id="REVIEW_CONTENTS" name="REVIEW_CONTENTS"></textarea>
   						</div>
   						<div class="input_area">
   						<button type="submit" id="review_btn">리뷰 작성</button>
   						</div>
   						</form>
   						</section>
						</c:if>
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr class="item">
		
			<th scope="col">글번호</th>
			<th scope="col">작성자</th>
			<th scope="col">내용</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(reviewList) > 0}">
				<c:forEach items="${reviewList}" var="row" varStatus="status">
					<tr>
						<td>${row.REVIEW_NUM}
						<input type="hidden" id="REVIEW_NUM" name="REVIEW_NUM" value="${row.REVIEW_NUM}">
						<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${map.GOODS_NUM}"></td>
						<td>${row.REVIEW_ID}</td>
						<td>${row.REVIEW_CONTENTS}</td>
						<td>${row.REVIEW_DATE}</td>	
						<c:if test="${loginId == row.REVIEW_ID}">
						<td><a href='#this' type="button" class="btn btn-default" onclick="openreviewUpdate('${row.REVIEW_NUM}','${row.REVIEW_CONTENTS}','${map.GOODS_NUM}')">수정</a></td>
						<td><a href="#this" class="btn" id="delete">삭제</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">작성된 글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<div class="Paging">
${pagingHtml}
<input type="hidden" name="GOODS_NUM" value="${row.GOODS_NUM}">
</div>
<!--<div class="row">
	<div style="text-align:center;">
		<div id="dataTables-example_filter1" class="dataTables_filter1">
			<form action="">
			<select class="form-control" name="searchNum" id="searchNum">
				<option value="0">내용</option>
			</select>
				<input class="form-control" type="text" name="isSearch" id="isSearch"/>
				<span>
				<button type="submit" class="btn btn-primary">검색</button>
				<input type="hidden" name="GOODS_NUM" value="${row.GOODS_NUM}">
				<input type="hidden" name="REVIEW_GOODS_NUM" value="${row.GOODS_NUM}">
				</span>
			</form>
		</div>							
	</div>
</div>-->
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
function openreviewUpdate(REVIEW_NUM, GOODS_NUM) {
var REVIEW_NUM = REVIEW_NUM;
var GOODS_NUM = GOODS_NUM;
window.open("reviewUpdateForm.pulu?REVIEW_NUM="+REVIEW_NUM, 'window_reviewUpdate', 'width=800, height=400, location=no, status=no, scrollbars=yes');
}
</script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#delete").on("click", function(e){ //삭제하기 버튼
		e.preventDefault();
		fn_reviewDelete();
	});
});


function fn_reviewDelete(){
	var comSubmit = new ComSubmit();
	var goods_Num = "${map.GOODS_NUM}";
	comSubmit.setUrl("<c:url value='/reviewDelete.pulu' />");
	comSubmit.addParam("REVIEW_NUM", $("#REVIEW_NUM").val());
	comSubmit.addParam("GOODS_NUM",goods_Num);
	comSubmit.submit();
	
}

</script>
</body>
</html>    
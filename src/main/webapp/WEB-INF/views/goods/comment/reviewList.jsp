<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.reviewListall, .input_area {
	text-align: center;
	width: 100%;
}

.input_area {
    margin: -10px 0 0 0;
}

.reviewListall table {
    width: 1000px;
    display: inline-table;
}

.review_contents {
	border-radius: 10px 0px 0px 10px;
	padding: 17px;
	width: 1000px;
	height: 48px;
	border: 1px solid #dadada;
	resize: none;
}

.review_contents:focus {
	outline: none;
	border: 1px solid #006F3E;
}

.reviewcount {
    width: 1000px;
    padding: 15px 50px 10px 57px;
    text-align: left;
}

.reviewtable td {
    border: 0;
    vertical-align: top;
    height: 60px;
    padding: 20px;
}

.reviewtable {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    width: 1172px;
    display: inline-block;
}


.admintd{

}

.reviewtable table{
}

.reviewtable td{
	word-break: break-all;
}

.disabled{
    background: #f6f8fa;
    color: #959da5;
    cursor: not-allowed;
}

.rvbtn {
	vertical-align: top;
	border-radius: 0px 10px 10px 0px;
	font-size: 17px;
	margin: 0px 0px 0px -4px;
	color: #fff;
	background: #006F3E;
	font-weight: normal;
	padding: 30px 22px;
	width: 132px;
	border: 0;
}

.textarea {
	appearance: none;
	display: block;
	max-height: 550px;
	resize: vertical;
}
</style>


<div class="reviewListall">
	
					<c:if test="${loginId == null}">
						<section class="reviewForm">
							<form role="form" method="post" autocomplete="off"
								id="reviewInsert" action="reviewInsert.pulu">
								<input type="hidden" name="REVIEW_GOODS_NUM"
									value="${map.GOODS_NUM}"> <input type="hidden"
									name="GOODS_NUM" value="${map.GOODS_NUM}"> <input
									type="hidden" name="ORDER_GOODS_NUM" value="${map.GOODS_NUM}">
								<div class="input_area">
									<textarea rows="4" cols="100" id="REVIEW_CONTENTS"
										class="review_contents disabled" name="REVIEW_CONTENTS" disabled>로그인이 필요함</textarea>
									<button type="button" id="review_btn" class="rvbtn">후기등록</button>
								</div>
							</form>
						</section>
					
					</c:if> 
					<c:if test="${loginId != null}">
						<section class="reviewForm">
							<form role="form" method="post" autocomplete="off"
								id="reviewInsert" action="reviewInsert.pulu">
								<input type="hidden" name="REVIEW_GOODS_NUM"
									value="${map.GOODS_NUM}"> <input type="hidden"
									name="GOODS_NUM" value="${map.GOODS_NUM}"> <input
									type="hidden" name="ORDER_GOODS_NUM" value="${map.GOODS_NUM}">
								<div class="input_area">
									<textarea rows="4" cols="100" id="REVIEW_CONTENTS"
										class="review_contents" name="REVIEW_CONTENTS"></textarea>
									<button type="submit" id="review_btn" class="rvbtn">후기등록</button>
								</div>
							</form>
						</section>
				</c:if>
				
		<div class="reviewcount">
		<span><strong>후기갯수: </strong>${fn:length(reviewList)} 개</span>
		</div>
		<div class="reviewtable">
		<table width="1000px">
		<colgroup>
			<col width="150px">
			<col width="*">
			<col width="130px">
		</colgroup>
		<thead>
			<tr class="item">

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
							<td>${row.REVIEW_ID}
							<input type="hidden" id="REVIEW_NUM"
								name="REVIEW_NUM" value="${row.REVIEW_NUM}"> <input
								type="hidden" id="GOODS_NUM" name="GOODS_NUM"
								value="${map.GOODS_NUM}">
							</td>
							<td align="left">${row.REVIEW_CONTENTS}</td>
							<td>${row.REVIEW_DATE}</td>
							<c:if test="${loginId == row.REVIEW_ID}">
								<td class="admintd"><a href='#this' type="button" class="btn btn-default"
									onclick="openreviewUpdate('${row.REVIEW_NUM}','${row.REVIEW_CONTENTS}','${map.GOODS_NUM}')" style="width: 65px">수정</a></td>
								<td class="admintd"><a href="#this" class="btn" id="delete" style="width: 65px">삭제</a></td>
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
	</div>
	<div class="paging greenp">
		${pagingHtml} <input type="hidden" name="GOODS_NUM"
			value="${row.GOODS_NUM}">
	</div>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	function openreviewUpdate(REVIEW_NUM, GOODS_NUM) {
		var REVIEW_NUM = REVIEW_NUM;
		var GOODS_NUM = GOODS_NUM;
		window
				.open("reviewUpdateForm.pulu?REVIEW_NUM=" + REVIEW_NUM,
						'window_reviewUpdate',
						'width=800, height=400, location=no, status=no, scrollbars=yes');
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#delete").on("click", function(e) { //삭제하기 버튼
			e.preventDefault();
			fn_reviewDelete();
		});
	});

	function fn_reviewDelete() {
		var comSubmit = new ComSubmit();
		var goods_Num = "${map.GOODS_NUM}";
		comSubmit.setUrl("<c:url value='/reviewDelete.pulu' />");
		comSubmit.addParam("REVIEW_NUM", $("#REVIEW_NUM").val());
		comSubmit.addParam("GOODS_NUM", goods_Num);
		comSubmit.submit();

	}
</script>

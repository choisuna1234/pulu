<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
html, body {
	margin: 0;
}

table.table.table-bordered.table-hover {
	border: 1px solid #ddd;
}

td.bannertd {
	padding: 0px !important;
}

.col-sm-3\; {
	display: inline-flex;
}

.form-control {
	display: inline-flex;
}

.panel-review-container {
	margin-bottom: -16px;
}

.panel-review-title {
	
}

.panel-review-answer {
	display: none;
	/* 변화가 시작되는 쪽에다가 transition 적용해준다 0 -> 300px 
		  왜? 닫기 버튼을 누를 때 변화가 티남 */
	transition: all 1s;
}

.innertable td{

padding-left: 20px;
}

.active {
	display: block;
	/* 높이를 정해줘야지만 transition이 적용됨 */
	height: 115%;
}
</style>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">adminReview</h1>
	</div>

	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">후기 관리</div>
				<div class="panel-body">

					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="adminReviewList">
						<thead>
							<tr>
								<th>후기번호</th>
								<th>상품번호</th>
								<th>후기작성자</th>
								<th>후기내용</th>
								<th>작성일</th>
								<th>답변상태</th>
								<th>답변내용</th>
							</tr>
						</thead>
						<tbody>
							<tr class="odd gradeX">
								<c:choose>
									<c:when test="${fn:length(adminReviewList) > 0}">
										<c:forEach items="${adminReviewList}" var="row">
											<tr>
												<td>${row.REVIEW_NUM }</td>
												<td>${row.REVIEW_GOODS_NUM }</td>
												<td>${row.REVIEW_ID }</td>
												<td>
													<div class="panel-review-container">
														<p class="panel-review-title"
															style="word-break: break-all;">${row.REVIEW_CONTENTS}</p>
													</div>
												</td>
												<td>${row.REVIEW_DATE }</td>
												<td>${row.REVIEW_STATUS }</td>
												<c:choose>
													<c:when test="${row.REVIEW_COMMENT == null }">
														<td>X</td>
													</c:when>
													<c:otherwise>
														<td>O</td>
													</c:otherwise>
												</c:choose>
											</tr>
											<!-- 내용 클릭 시 나타나는 창 -->
											<tr>
												<td colspan="7" style="padding: 0; margin: 10">
													<div class="panel-review-answer">
														<table class="innertable"
															style="width: 100%; border-collapse: collapse; margin-top: 15px; margin-bottom: 15px; ">
															<c:choose>
																<c:when test="${row.REVIEW_COMMENT == null }">
																	<tbody>
																		<tr>
																			<td colspan="4" style="">등록된 답변이 없습니다. <input
																				style="text-align: left;" type="button" class="btn"
																				value="후기삭제"
																				onclick="adminReviewDelete(${row.REVIEW_NUM})"></td>
																		</tr>
																		<!--  -->
																		<!--  -->
																		<tr>
																			<td width="*%" height="10px">
																				<form role="form" id="adminReviewComInsert"
																					method="post" action="adminReviewComInsert.pulu">
																					<input type="hidden" name="REVIEW_NUM"
																						id="REVIEW_NUM" value="${row.REVIEW_NUM}" />
																					<table class="comInsert"
																						style="width: 100%; height: 100%; padding: 10px; border: 0px;">
																						<tr height="5px">
																							<td style="text-align: left; padding: 0px;"
																								height="100%" width="100%"><textarea
																									class="REVIEW_COMMENT" rows="5"
																									style="width: 98%; height: 100%; border: 0px; background: #f0f0f0; padding: 10px; margin: 10px; border-radius: 10px;"
																									placeholder="${row.REVIEW_COMMENT}"
																									id="REVIEW_COMMENT" name="REVIEW_COMMENT">${row.REVIEW_COMMENT}</textarea>
																							</td>
																						</tr>
																					</table>
																					<input type="submit" class="btn" value="답변등록"
																						onsubmit="location.href = location.href;">
																				</form>
																			</td>
																		</tr>
																	</tbody>
																</c:when>
																<c:otherwise>
																	<tbody>
																		<tr>
																			<td width="*%"
																				style="text-align: left; margin-left: 10px"><p
																					style="word-break: break-all;">${row.REVIEW_COMMENT}</p>
																			</td>
																		</tr>
																		<tr>
																			<td><input style="text-align: left;"
																				type="button" class="btn" value="후기삭제"
																				onclick="adminReviewDelete(${row.REVIEW_NUM})">
																			</td>
																			<td>
																				<form role="form" id="adminReviewComDelete"
																					method="post" action="adminReviewComDelete.pulu">
																					<input type="hidden" name="REVIEW_NUM"
																						id="REVIEW_NUM" value="${row.REVIEW_NUM}" /> <input
																						type="button" class="btn" value="답변삭제"
																						onclick="adminReviewComDelete('${row.REVIEW_COMMENT}','${row.REVIEW_NUM}')">
																				</form>
																			</td>
																		</tr>
																		<tr>
																			<td width="10%"></td>
																			<td width="*%"></td>
																		</tr>
																</c:otherwise>
															</c:choose>
														</table>
													</div>
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
					<div style="border: 1px; float: right; width: 300px;">
						<div class="paging">${pagingHtml}</div>
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</div>
<!-- "row" -->
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">

const panelReviewContainer = document.querySelectorAll(".panel-review-container");

let panelReviewAnswer = document.querySelectorAll(".panel-review-answer");

 

for( let i=0; i < panelReviewContainer.length; i++ ) {
	panelReviewContainer[i].addEventListener("click", function() {

	panelReviewAnswer[i].classList.toggle("active");
	});
};

/* QNA 관리자 삭제 */
function adminReviewDelete(REVIEW_NUM){
	var comSubmit = new ComSubmit();
	if (confirm("삭제 하겠습니까?") == true) {
		comSubmit.setUrl("<c:url value='/adminReviewDelete.pulu' />");
		comSubmit.addParam("REVIEW_NUM", REVIEW_NUM);
		comSubmit.submit();
		opener.location.href = location.href;
	}
}

/* QNA 답변 삭제 */
function adminReviewComDelete(REVIEW_COMMENT, REVIEW_NUM){
	var comSubmit = new ComSubmit();
	if (confirm("삭제 하겠습니까?") == true) {
		comSubmit.setUrl("<c:url value='/adminReviewComDelete.pulu' />");
		comSubmit.addParam("REVIEW_NUM", REVIEW_NUM);
		comSubmit.addParam("REVIEW_COMMENT", REVIEW_COMMENT);
		comSubmit.submit();
		opener.location.href = location.href;
	}
}

</script>
</body>
</html>

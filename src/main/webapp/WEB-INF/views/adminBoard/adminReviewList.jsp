<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>

<body>
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

<table width="100%" class="table table-striped table-bordered table-hover"
							id="adminReviewList">
	<thead>
		<tr>
			<th>후기번호</th>
			<th>후기상품번호</th>
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
						<td>${row.REVIEW_CONTENTS }</td>
						<td>${row.REVIEW_DATE }</td>
						<td>${row.REVIEW_STATUS }</td>
						<td>${row.REVIEW_COMMENT }</td>
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
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- "row" -->

</body>
</html>    

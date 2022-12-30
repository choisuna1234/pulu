<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script language="javascript">
<!-- 선민: 회원정보 상세보기 팝업창 띄우기 + Post로 값 넘기기 -->
    function openMemberDetail(index) {
	var form = document.getElementById("memberListForm_" + index);
	var id = document.getElementById("ID_" + index).value;

	window.open('', 'window_adminMemberDetail', 'width=430, height=600, location=no, status=no, scrollbars=yes');
	form.action = "adminMemberDetail.pulu";
	form.target = "window_adminMemberDetail";
	form.method = "post";
	form.submit();
    }
</script>

</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">회원 목록</h1>
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">회원정보를 조회, 수정하거나 최근 주문 건을 확인할 수 있습니다.</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
							<thead>
								<tr>
									<th>회원번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>연락처</th>
									<th>주소</th>
									<th>등급</th>
<!-- 									<th>최근 주문</th> -->
									<th>삭제여부</th>
								</tr>
							</thead>
							<tbody>
								<tr class="odd gradeX">
									<c:choose>
										<c:when test="${fn:length(adminMemberList) > 0}">
											<c:forEach items="${adminMemberList}" var="row" varStatus="status">

												<tr>
													<td style="width: 80px;">${row.NUM}</td>
													<td>
														<a href='javascript:void(0);' onclick="openMemberDetail('${status.index }')">${row.ID}</a>
													</td>
													<td>${row.NAME}</td>
													<td>${row.PHONE}</td>
													<td>${row.ZIPCODE}&nbsp${row.ADDR1}${row.ADDR2}</td>
													<td>${row.GRADE}</td>
<!-- 													<td> -->
<%-- 														<button type="button" class="btn btn-default btn-xs" id="recentOrderById_bt" onclick="window.open('recentOrderById.pulu?ID=${row.ID }', 'window_recentOrderById', 'width=860, height=600, location=no, status=no, scrollbars=yes')">보기</button> --%>
<!-- 													</td> -->
													<td>${row.BLOCK}</td>
												</tr>
												<form id="memberListForm_${status.index }">
													<input type="hidden" id="ID_${status.index }" name="ID" value="${row.ID}">
												</form>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="4">조회된 결과가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tr>
							</tbody>
						</table>
						<div>
							<div style="border: 1px; float: left; width: 330px;">
								<div class="form-group input-group searchDiv">
									<!-- 검색 form -->
									<form id="search_form" action="adminMemberSearch.pulu" method="post">
										<select class="form-control" id="SEARCH_OPTION" name="SEARCH_OPTION" style="width: 80px;">
											<option value="0">전체</option>
											<option value="1">아이디</option>
											<option value="2">이름</option>
											<option value="3">연락처</option>
										</select>
										<input type="text" name="SEARCH_KEYWORD" class="form-control" style="width: 190px;">
										<span class="input-group-btn">
											<button type="submit" class="btn btn-primary search_btn">검색</button>
										</span>
									</form>
								</div>
							</div>
							<div style="border: 1px; float: right; width: 300px;">
								<div class="paging">${pagingHtml}</div>
							</div>
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
</body>
</html>

<!-- function openMemberDetail(index) { -->
<!-- 	var form = document.getElementById("memberListForm_" + index); -->
<!-- 	var id = document.getElementById("ID_" + index).value; -->

<!-- 	window.open('', 'window_adminMemberDetail', 'width=430, height=600, location=no, status=no, scrollbars=yes'); -->
<!-- 	form.action = "adminMemberDetail.pulu"; -->
<!-- ﻿	form.target = "window_adminMemberDetail"; -->
<!-- ﻿	form.method = "post"; -->
<!-- ﻿	form.submit(); -->
<!-- } -->

<!-- jQuery -->
<script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/sbadmin/vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="/resources/sbadmin/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/resources/sbadmin/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="/resources/sbadmin/vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/resources/sbadmin/dist/js/sb-admin-2.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->

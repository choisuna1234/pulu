<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script language="javascript">

// 선민: 회원정보 상세보기 팝업창 띄우기 + Post로 값 넘기기 (페이징 시 rownum과 forms[i] 값이 안맞을 가능성 있음)
function openMemberDetail(rownum) {
	var form = document.forms[rownum-1];
	window.open('', 'window_adminMemberDetail', 'width=430, height=600, location=no, status=no, scrollbars=yes');
	form.action = "adminMemberDetail.pulu";
﻿	form.target = "window_adminMemberDetail";
﻿	form.method = "post";
﻿	form.submit();
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
				
<!-- 					<div align="left"> -->
<!-- 					<div class="form-group input-group"> -->
<!-- 						<form action=""> -->
<!-- 							<select class="form-control" style="width:80px;"> -->
<!-- 								<option value="0">전체</option> -->
<!-- 								<option value="1">아이디</option> -->
<!-- 								<option value="2">이름</option> -->
<!-- 								<option value="3">연락처</option> -->
<!-- 							</select> -->
<!-- 							<input type="text" class="form-control" style="width:136px;"> -->
<!-- 							<span class="input-group-btn"> -->
<!-- 								<button type="submit" class="btn btn-primary"> -->
<!-- 									<i class="fa fa-search"></i> -->
<!-- 								</button> -->
<!-- 							</span> -->
<!-- 						</form> -->
<!-- 					</div> -->
<!-- 					</div> -->
					
					<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
						<thead>
							<tr>
								<th>회원번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>연락처</th>
								<th>주소</th>
								<th>등급</th>
								<th>최근 주문</th>
							</tr>
						</thead>
						<tbody>
							<tr class="odd gradeX">
								<c:choose>
									<c:when test="${fn:length(adminMemberList) > 0}">
										<c:forEach items="${adminMemberList}" var="row">
										
											<tr>
												<td style="width:80px;">${row.NUM}</td>
<%-- 											<td><a href='javascript:void(0);' onclick="window.open('adminMemberDetail.pulu?ID=${row.ID }', 'window_adminMemberDetail', 'width=430, height=600, location=no, status=no, scrollbars=yes')">${row.ID}</a></td> --%>
												<td><a href='javascript:void(0);' onclick="openMemberDetail('${row.ROWNUM}')">${row.ID}</a></td>
												<form id="memberListForm">
													<input type="hidden" id="id" name="ID" value="${row.ID}">
												</form>
												<td>${row.NAME}</td>
												<td>${row.PHONE}</td>
												<td>${row.ZIPCODE}&nbsp ${row.ADDR1} ${row.ADDR2}</td>
												<td>${row.GRADE}</td>
												<td><button type="button" class="btn btn-default btn-xs" id="recentOrderById_bt" onclick="window.open('recentOrderById.pulu?ID=${row.ID }', 'window_recentOrderById', 'width=860, height=600, location=no, status=no, scrollbars=yes')">보기</button></td>
											</tr>
											
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
					
					
					<div style="border: 1px; float:left; width: 310px;">
					<div class="form-group input-group">
						<form action="">
							<select class="form-control" style="width:80px;">
								<option value="0">전체</option>
								<option value="1">아이디</option>
								<option value="2">이름</option>
								<option value="3">연락처</option>
							</select>
							<input type="text" class="form-control" style="width:190px;">
							<span class="input-group-btn">
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</form>
					</div>
					</div>
						
						
					<div style="border: 1px; float:right; width: 300px;">
					<div class="form-group input-group">
					<div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
					<ul class="pagination">
					<li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
						<a href="#">Previous</a></li>
					<li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="#">1</a>
					</li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">2</a>
					</li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">3</a>
					</li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">4</a>
					</li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">5</a>
					</li><li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
						<a href="#">Next</a></li>
					</ul>
					</div>
					</div>
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
</div> <!-- "row" --> 


</body>
</html>


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
    
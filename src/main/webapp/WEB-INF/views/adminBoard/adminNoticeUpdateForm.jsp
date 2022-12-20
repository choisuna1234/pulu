<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Notice</h1>
		</div>

		<!-- /.row -->
		<div class="row">
			<div class="col-lg-10">
				<div class="panel panel-default">
					<div class="panel-heading">게시글 수정하기</div>
					<div class="panel-body">

						<form id="frm">
							<table class="table table-striped table-bordered table-hover"
								id="adminNoticeList">

								<tbody>
									<tr>
										<th style="width: 7%">글 번호</th>
										<td>${map.NOTICE_NUM } <input type="hidden"
											id="NOTICE_NUM" name="NOTICE_NUM" value="${map.NOTICE_NUM }">
										</td>
										<th style="width: 7%">조회수</th>
										<td>${map.NOTICE_READCOUNT }</td>
									</tr>
									<tr>
										<th style="width: 7%">작성자</th>
										<td>${map.NOTICE_ID }</td>
										<th style="width: 7%">작성일</th>
										<td>${map.NOTICE_DATE }</td>
									</tr>
									<tr>
										<th style="width: 7%">제목</th>

										<td colspan="3"><input type="text" id="NOTICE_SUBJECT"
											name="NOTICE_SUBJECT" class="form-control"
											value="${map.NOTICE_SUBJECT }" /></td>
									</tr>
									<tr>
										<td colspan="4" class="view_text"><textarea rows="20"
												cols="100" title="내용" id="NOTICE_CONTENT"
												class="form-control" name="NOTICE_CONTENT">${map.NOTICE_CONTENT }</textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- "row" -->

	<a href="#this" class="btn btn-success" id="list">목록으로</a>
	<a href="#this" class="btn btn-primary" id="update">수정하기</a>
	<a href="#this" class="btn btn-primary" id="delete">삭제하기</a>


	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_adminNoticeList();
			});

			$("#update").on("click", function(e) { //저장하기 버튼
				e.preventDefault();
				fn_adminNoticeUpdate();
			});

			$("#delete").on("click", function(e) { //삭제하기 버튼
				e.preventDefault();
				fn_adminNoticeDelete();
			});
		});

		function fn_adminNoticeList() {
			var comSubmit = new ComSubmit();
			var currentPage = 0;
			var isSearch;
			var searchNum;

			comSubmit
					.setUrl("<c:url value='/adminNoticeList.pulu?searchNum=${searchNum}&isSearch=${isSearch}&currentPage=${currentPage}'/>");
			comSubmit.submit();
		}

		function fn_adminNoticeUpdate() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/adminNoticeUpdate.pulu'/>");
			comSubmit.submit();
		}

		function fn_adminNoticeDelete() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminNoticeDelete.pulu'/>");
			comSubmit.addParam("NOTICE_NUM", $("#NOTICE_NUM").val());
			comSubmit.submit();

		}
	</script>
</body>
</html>
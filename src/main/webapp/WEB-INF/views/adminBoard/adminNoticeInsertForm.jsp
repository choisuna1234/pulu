<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">공지사항</h1>
	</div>

	<!-- /.row -->
	<div class="row">
		<div class="col-lg-10">
			<div class="panel panel-default">
				<div class="panel-heading">공지사항 작성</div>
				<div class="panel-body">

					<form id="frm" name="frm" method="get"
						enctype="multipart/form-data">
						<table class="board_view">

							<tbody>
								<tr>
									<th style="width: 5%">제목</th>
									<td><input type="text" id="NOTICE_SUBJECT" name="NOTICE_SUBJECT"
										class="form-control" class="form-control"></input></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="2" class="view_text" height="30"><pre>
											<textarea rows="20" class="form-control" cols="100"
												title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT"></textarea>
										</pre></td>
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


<table>
	<colgroup>
		<col width="80px"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th></th>
		<td></td>
	</tr>
</table>

<!-- <a href="#this" class="btn btn-primary" id="insert" type="submit">작성하기</a> -->
<a href="#this" class="btn btn-primary" id="write">작성하기</a>
<a href="#this" class="btn btn-primary" id="list">목록으로</a>



<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#list").on("click", function(e) { // 목록으로 버튼
			e.preventDefault();
			alert("목록으로 넘어가시겠습니까?");
			fn_adminNoticeList();
		});

		$("#write").on("click", function(e) { // 작성하기 버튼
			e.preventDefault();
			fn_adminNoticeInsert();

		});

	});

	function fn_adminNoticeList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/adminNoticeList.pulu' />");
		comSubmit.submit();

	}

	
	function fn_adminNoticeInsert() {
		var comSubmit = new ComSubmit("frm");

		if (frm.NOTICE_SUBJECT.value.length == 0) { //선아: 제목, 내용 유효성검사
			frm.NOTICE_SUBJECT.focus();
			alert("제목을 입력하세요.");
			return false;
		}
		if (frm.NOTICE_CONTENT.value.length == 0) {
			frm.NOTICE_CONTENT.focus();
			alert("내용을 입력하세요.");
			return false;
		}

		comSubmit.setUrl("<c:url value='/adminNoticeInsert.pulu' />");
		comSubmit.submit();
	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
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
					<div class="panel-heading">공지사항 작성하기</div>
					<div class="panel-body">
						<form id="frm" name="frm" enctype="multipart/form-data">
							<table class="adminNoticeInsert">
								<tbody>
									<tr>
										<th style="width: 5%">제목</th>
										<td><input type="text" id="NOTICE_SUBJECT"
											name="NOTICE_SUBJECT" class="form-control"></input></td>
									</tr>

									<tr>
										<th>내용</th>
										<td colspan="2" class="view_text" height="30">
										<textarea rows="20" cols="100" title="내용" id="NOTICE_CONTENT"
												class="form-control" name="NOTICE_CONTENT"></textarea>
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

	<a href="#this" class="btn btn-primary" id="write">작성하기</a>
	<a href="#this" class="btn btn-primary" id="list">목록으로</a>


	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">


$(document).ready(function(){
	$("#list").on("click", function(e){ // 목록으로 버튼
		e.preventDefault();
		alert("목록으로 넘어가시겠습니까?");
	fn_adminNoticeList();
	});
	
	$("#write").on("click", function(e){ // 작성하기 버튼
		e.preventDefault();
		fn_adminNoticeInsert();
	
	});

});

function fn_adminNoticeList(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/adminNoticeList.pulu' />");
	comSubmit.submit();
	
}

function fn_adminNoticeInsert(){
	var comSubmit = new ComSubmit("frm");

    if (frm.NOTICE_SUBJECT.value.length == 0) {   //선아: 제목, 내용 유효성검사
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
</body>
</html>
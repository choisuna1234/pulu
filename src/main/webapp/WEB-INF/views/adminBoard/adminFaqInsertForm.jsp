<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">FAQ</h1>
		</div>

<!-- /.row -->
		<div class="row">
			<div class="col-lg-10">
				<div class="panel panel-default">
					<div class="panel-heading">자주묻는질문 작성하기</div>
					<div class="panel-body">

						<form id="frm" name="frm" method="get"
							enctype="multipart/form-data" action="adminFaqInsert.pulu"
							onsubmit="return checkFaqInsertForm();">
							<table class="board_view">

								<tbody>
									<tr>
										<th style="width: 5%">제목</th>
										<td><input type="text" id="FAQ_SUBJECT"
											name="FAQ_SUBJECT" class="form-control" class="form-control"></input></td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="2" class="view_text" height="30">
											<pre><textarea rows="20" class="form-control" cols="100" title="내용"
												id="FAQ_CONTENT" name="FAQ_CONTENT"></textarea></pre></td>
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

		<a href="#this" class="btn btn-primary" id="insert" type="submit">작성하기</a>
	<a href="#this" class="btn btn-primary" id="list">목록으로</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault(); //동작 중단
				fn_adminFaqList();
			});

			$("#insert").on("click", function(e) { //작성하기 버튼
				if ($("#FAQ_SUBJECT").val().length == 0) {
					alert("제목을 입력하세요");
					$("#FAQ_SUBJECT").focus();
					return false;
				}
				if ($("#FAQ_CONTENT").val().length == 0) {
					alert("내용을 입력하세요");
					$("#FAQ_CONTENT").focus();
					return false;
				}

				e.preventDefault();
				fn_adminFaqInsert();
			});

		})

		function fn_adminFaqList() {
			var comSubmit = new ComSubmit(); //자바 스크립트 객체 생성
			var currentPage;
			var isSearch;
			var searchNum;
			comSubmit.setUrl("<c:url value='/adminFaqList.pulu'/>"); //submit 기능(JSTL태그로 자동 ContextPath='호출 URL')
			comSubmit.submit(); //전송
		}

		function fn_adminFaqInsert() {
			var comSubmit = new ComSubmit("frm"); //form id를 함수를 호출할 때 전달하는 변수로 설정하여 객체 생성
			comSubmit.setUrl("<c:url value='/adminFaqInsert.pulu'/>");
			comSubmit.submit();
		}

		// 빈칸 체크
		/*		function checkFaqInsertForm() {
		 var subject = document.getElementById("FAQ_SUBJECT");
		 var content = document.getElementById("FAQ_CONTENT");
		
		 if($("#subject").val() == null || $("#subject").val() == ""	) {
		 alert("제목을 입력해 주세요");
		 $("#subject").focus();
		 return false;
		 }
		
		 if($("#content").val() == null || $("#content").val() == "" ) {
		 alert("내용을 입력해 주세요");
		 $("#content").focus();
		 return false;
		 }
		 return true;
		 }  */
	</script>


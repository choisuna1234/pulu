<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 소영 :FAQ 입력폼 test -->
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id="frm" name="frm" method="get" enctype="multipart/form-data" action="adminFaqInsert.pulu" onsubmit="return checkFaqInsertForm();">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="FAQ_SUBJECT" name="FAQ_SUBJECT" class="wdp_90"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="FAQ_CONTENT" name="FAQ_CONTENT"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
	<a href="#this" class="btn" id="insert" type="submit">작성하기</a>
	<a href="#this" class="btn" id="list">목록으로</a>
	</form>
	
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


</body>
</html>
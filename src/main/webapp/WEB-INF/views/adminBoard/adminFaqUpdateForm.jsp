<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="frm">
		<table class="board_view">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>
						${map.FAQ_NUM }
						<input type="hidden" id="FAQ_NUM" name="FAQ_NUM" value="${map.FAQ_NUM }">
					</td>
					<th scope="row">조회수</th>
					<td>${map.FAQ_READCOUNT }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.FAQ_ID }</td>
					<th scope="row">작성일</th>
					<td>${map.FAQ_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="FAQ_SUBJECT" name="FAQ_SUBJECT" class="wdp_90" value="${map.FAQ_SUBJECT }"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="FAQ_CONTENT" name="FAQ_CONTENT">${map.FAQ_CONTENT }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>   
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_adminFaqList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
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
				fn_adminFaqUpdate();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_adminFaqDelete();
			});
		});
		
		function fn_adminFaqList(){
			var comSubmit = new ComSubmit();	//자바 스크립트 객체 생성
			var currentPage;
			var isSearch;
			var searchNum;
			comSubmit.setUrl("<c:url value='/adminFaqList.pulu?searchNum=${searchNum}&isSearch=${isSearch}&currentPage=${currentPage}'/>"); //submit 기능(JSTL태그로 자동 ContextPath='호출 URL')
			comSubmit.submit();	//전송
		}
		
		function fn_adminFaqUpdate(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/adminFaqUpdate.pulu'/>");
			comSubmit.submit();
		}
		
		function fn_adminFaqDelete(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminFaqDelete.pulu'/>");
			comSubmit.addParam("FAQ_NUM", $("#FAQ_NUM").val());
			comSubmit.submit();
			
		}
	</script>
</body>
</html>
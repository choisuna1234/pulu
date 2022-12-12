<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf" %>
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
						${map.NOTICE_NUM }
						<input type="hidden" id="NOTICE_NUM" name="NOTICE_NUM" value="${map.NOTICE_NUM }">
					</td>
					<th scope="row">조회수</th>
					<td>${map.NOTICE_READCOUNT }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.NOTICE_ID }</td>
					<th scope="row">작성일</th>
					<td>${map.NOTICE_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="NOTICE_SUBJECT" name="NOTICE_SUBJECT" class="wdp_90" value="${map.NOTICE_SUBJECT }"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT">${map.NOTICE_CONTENT }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
    <a href="#this" class="btn" id="delete">삭제하기</a>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>   
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_adminNoticeList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_adminNoticeUpdate();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
	            e.preventDefault();
	            fn_adminNoticeDelete();
	        });
		});
		
		function fn_adminNoticeList(){
			var comSubmit = new ComSubmit();
			var currentPage = 0;
			var isSearch;
			var searchNum;
			
			comSubmit.setUrl("<c:url value='/adminNoticeList.pulu?searchNum=${searchNum}&isSearch=${isSearch}&currentPage=${currentPage}'/>");
			comSubmit.submit();
		}
		
		function fn_adminNoticeUpdate(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/adminNoticeUpdate.pulu'/>");
			comSubmit.submit();
		}
		
		function fn_adminNoticeDelete(){
	         var comSubmit = new ComSubmit();
	         comSubmit.setUrl("<c:url value='/adminNoticeDelete.pulu'/>");
	         comSubmit.addParam("NOTICE_NUM", $("#NOTICE_NUM").val());
	         comSubmit.submit();
	         
	      }
	</script>
</body>
</html>
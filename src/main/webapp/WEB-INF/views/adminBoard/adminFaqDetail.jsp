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
<h2 onclick="location.href='adminFaqList.pulu';">FAQ</h2><br>
	<table class="board_view" >
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글번호</th>
				<td>${map.FAQ_NUM }</td>
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
				<td colspan="3">${map.FAQ_SUBJECT }</td>
			</tr>
			<tr>
				<td colspan="4">${map.FAQ_CONTENT }</td>
			</tr>
		</tbody>
	</table>
	<a href="#this" class="btn" id="list" >목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //리스트
				e.preventDefault();	//
				fn_adminFaqList();
			});
			
			$("#update").on("click", function(e){	//수정하기
				e.preventDefault();
				fn_adminFaqUpdate();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_adminFaqDelete();
			});
		});
		
		function fn_adminFaqList(){
			var comSubmit = new ComSubmit();
			var currentPage;
			var isSearch;
			var searchNum;
			
/* 			if (isSearch === null) { 
				comSubmit.setUrl("<c:url value='/adminFaqList.pulu?currentPage=${currentPage}'/>");
			} else { */
				comSubmit.setUrl("<c:url value='/adminFaqList.pulu?searchNum=${searchNum}&isSearch=${isSearch}&currentPage=${currentPage}'/>");
/* 			}*/
			comSubmit.submit(); 
			
//			history.go(-1);
		}
		
		function fn_adminFaqUpdate(){
			var faq_num = "${map.FAQ_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminFaqUpdateForm.pulu'/>");
			comSubmit.addParam("FAQ_NUM", faq_num);
			comSubmit.submit();
		}
		
		function fn_adminFaqDelete(){
			var faq_num = "${map.FAQ_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminFaqDelete.pulu'/>");
			comSubmit.addParam("FAQ_NUM", faq_num);
			comSubmit.submit();
			
		}
	</script>
</body>
</html>
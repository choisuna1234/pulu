<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>FAQ</title>
<link rel="stylesheet" href="resources/css/ui.css" type="text/css" />
</head>
<body>
<div class="row">
		<div class="col-lg-12">
<h1 onclick="location.href='adminFaqList.pulu';">FAQ</h1><br>
	<br>
		</div>
	<!-- /.row -->
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default">
					<div class="panel-heading">자주 묻는 질문</div>
					<div class="panel-body">
						<table class="table table-striped table-bordered table-hover"
							id="board_view">
							
		
		<tbody>
			<tr>
				<th style="width: 5%">글번호</th>
				<td>${map.FAQ_NUM }</td>
				<th style="width: 5%">조회수</th>
				<td>${map.FAQ_READCOUNT }</td>
			</tr>
			<tr>
				<th style="width: 5%">작성자</th>
				<td>${map.FAQ_ID }</td>
				<th style="width: 5%">작성일</th>
				<td>${map.FAQ_DATE }</td>
			</tr>
			<tr>
				<th style="width: 5%">제목</th>
				<td colspan="3">${map.FAQ_SUBJECT }</td>
			</tr>
			<tr>
				<td colspan="4">${map.FAQ_CONTENT }</td>
			</tr>
		</tbody>
	</table>
	
	<Br>
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
			
			comSubmit.setUrl("<c:url value='/adminFaqList.pulu?searchNum=${searchNum}&isSearch=${isSearch}&currentPage=${currentPage}'/>");
			comSubmit.submit(); 

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
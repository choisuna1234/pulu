<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>FAQ</title>
</head>
<body>

<div class="row">
		<div class="col-lg-12">
			<h1 onclick="location.href='adminFaqList.pulu';">FAQ</h1>
			<br>
		</div>


		<!-- /.row -->
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default">
					<div class="panel-heading">게시글 상세</div>
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
									<th>작성자</th>
									<td>${map.FAQ_ID }</td>

									<th style="width: 5%">작성일</th>
									<td>${map.FAQ_DATE }</td>
								</tr>

								<tr>
									<th>제목</th>
									<td colspan="3">${map.FAQ_SUBJECT }</td>
								</tr>

								<tr>
									<th>내용</th>
									<td colspan="4"><pre>${map.FAQ_CONTENT }</pre></td>
								</tr>

							</tbody>
						</table>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>


	
	<Br>
	<a href="#this" class="btn btn-primary" id="list" >목록으로</a>
	<a href="#this" class="btn btn-primary" id="update">수정하기</a>
	<a href="#this" class="btn btn-primary" id="delete">삭제하기</a>
	
	
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
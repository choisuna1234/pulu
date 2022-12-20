<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 onclick="location.href='adminNoticeList.pulu';">Notice</h1>
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
									<td>${map.NOTICE_NUM}</td>
									<th style="width: 5%">조회수</th>
									<td>${map.NOTICE_READCOUNT}</td>
								</tr>

								<tr>
									<th>작성자</th>
									<td>${map.NOTICE_ID }</td>

									<th style="width: 5%">작성일</th>
									<td>${map.NOTICE_DATE }</td>
								</tr>

								<tr>
									<th>제목</th>
									<td colspan="3">${map.NOTICE_SUBJECT }</td>
								</tr>

								<tr>
									<th>내용</th>
									<td colspan="4">${map.NOTICE_CONTENT }</td>
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
	<!-- "row" -->
	<a href="#this" class="btn btn-primary" id="list">목록으로</a>
	<a href="#this" class="btn btn-primary" id="update">수정하기</a>
	<a href="#this" class="btn btn-primary" id="delete">삭제하기</a>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //리스트
				e.preventDefault();	//
				fn_adminNoticeList();
			});
			
			$("#update").on("click", function(e){ //수정하기
				e.preventDefault();
				fn_adminNoticeUpdate();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 
	            e.preventDefault();
	            fn_adminNoticeDelete();
	        });
		});
		
		function fn_adminNoticeList(){
			var comSubmit = new ComSubmit();
			var currentPage;
			var isSearch;
			var searchNum;
			
/* 			if (isSearch === null) { 
			comSubmit.setUrl("<c:url value='/adminNoticeList.pulu?currentPage=${currentPage}'/>");
			} else { */
			comSubmit.setUrl("<c:url value='/adminNoticeList.pulu?searchNum=${searchNum}&isSearch=${isSearch}&currentPage=${currentPage}'/>");
/* 			}*/
			comSubmit.submit(); 	
//			history.go(-1);
		}
		
		
		function fn_adminNoticeUpdate(){
			var notice_num = "${map.NOTICE_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminNoticeUpdateForm.pulu'/>");
			comSubmit.addParam("NOTICE_NUM", notice_num);
			comSubmit.submit();
		}
		
		function fn_adminNoticeDelete(){
			 var notice_num = "${map.NOTICE_NUM}";
	         var comSubmit = new ComSubmit();
	         comSubmit.setUrl("<c:url value='/adminNoticeDelete.pulu'/>");
	         comSubmit.addParam("NOTICE_NUM", notice_num);
	         comSubmit.submit();
	         
	      }
	</script>
</body>
</html>
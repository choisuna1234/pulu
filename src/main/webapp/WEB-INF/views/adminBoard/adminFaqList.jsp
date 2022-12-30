<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header" onclick="location.href='adminFaqList.pulu';">FAQ</h1>
		</div>

		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">자주 묻는 질문</div>
					<div class="panel-body">

						<a href="#this" class="btn btn-primary" id="insert">글쓰기</a>
						<br> <br>

						<table class="table table-striped table-bordered table-hover" id="adminNoticeList">




							<thead>
								<tr>
									<th style="width: 7%">글번호</th>
									<th>제목</th>
									<th style="width: 10%">작성자</th>
									<th style="width: 10%">조회수</th>
									<th style="width: 13%">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(faqList) > 0}">
										<c:forEach items="${faqList}" var="row">
											<!--  controller에서 받아온 list를 row라는 이름의 변수에 담아 사용 -->
											<tr>
												<td align="center">${row.FAQ_NUM }</td>
												<%-- <td>${row.FAQ_SUBJECT }</td> --%>
												<td align="left" class="FAQ_SUBJECT">
												<a href="#this" id="FAQ_SUBJECT">${row.FAQ_SUBJECT }</a> 
												<input type="hidden" id="FAQ_NUM" value="${row.FAQ_NUM }"></td>
												<td align="center">${row.FAQ_ID}</td>
												<td align="center">${row.FAQ_READCOUNT}</td>
												<td align="center">${row.FAQ_DATE}</td>
<%-- 												<td align="center"><fmt:formatDate value="${row.FAQ_DATE}" pattern="yyyy-MM-dd"/></td> --%>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
						</tbody>
					</table>

						<div>
							<div style="border: 1px; float: left; width: 310px;">
								<div class="form-group input-group">


									<form action="">
										<select style="width: 80px;" class="form-control" name="searchNum" id="searchNum">
											<option value="0">제목</option>
											<option value="1">내용</option>
										</select> 
										<input class="form-control" type="text" name="isSearch" id="isSearch" style="width: 190px;" /> 
											<span class="input-group-btn">
												<button type="submit" class="btn btn-primary">
													<i class="fa fa-search"></i>
												</button>
											</span>
									</form>
								</div>
							</div>
							<div class="paging" style="border: 1px; float: right;">${pagingHtml}</div>
						</div>

					</div>

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>



	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<!-- <a href="#this" class="btn" id="insert">글쓰기</a> -->
	<script type="text/javascript">
		$(document).ready(function() {

			$("#insert").on("click", function(e) { //글쓰기 버튼
				//<id가 insert인 a를 클릭했을 경우 이벤트 발생>
				e.preventDefault(); //동작 중단
				fn_adminFaqInsert(); //fn_adminFaqInsertt()실행
			});

			$("a[id='FAQ_SUBJECT']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_adminFaqDetail($(this));
			});
		});

		function fn_adminFaqInsert() {
			var comSubmit = new ComSubmit();
			comSubmit
					.setUrl("<c:url value='/adminFaqInsertForm.pulu'/>");
			comSubmit.submit();
		}

		function fn_adminFaqDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit
					.setUrl("<c:url value='/adminFaqDetail.pulu'/>");
			comSubmit.addParam("FAQ_NUM", obj.parent().find(
					"#FAQ_NUM").val());
			comSubmit.submit();
		}
	</script>

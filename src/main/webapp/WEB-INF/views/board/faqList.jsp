<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<link rel="stylesheet" type="text/css" href="./resources/css/board.css" />

<div class="boardcontainer">
	<div class="wid1280">
		<div class="titleArea">
			<h2>
				<font color="#555555">FAQ</font>
			</h2>
			<p>푸르뎁의 새로운 소식을 알려드립니다.</p>
		</div>
		<div class="board_tab_cont">
			<ul>
				<li><a href='noticeList.pulu'>공지사항</a></li>
				<li><a class="selected" href='faqList.pulu'>자주묻는질문</a></li>
			</ul>
		</div>
		<div class="base-table boardList">
			<table class="board_list">
				<colgroup>
					<col width="70px">
					<col width="*">
					<col width="84px">
					<col width="120px">
					<col width="175px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
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
									<td align="left" class="FAQ_SUBJECT"><a align="left"
										href="#this" name="FAQ_SUBJECT">${row.FAQ_SUBJECT }</a> <input
										type="hidden" id="FAQ_NUM" value="${row.FAQ_NUM }"></td>
									<td align="center">${row.FAQ_ID }</td>
									<td align="center">${row.FAQ_READCOUNT }</td>
									<td align="center">${row.FAQ_DATE }</td>
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
		</div>
		<div class="paging">
		${pagingHtml}
		</div>
		<div class="row">
			<div style="text-align:center;">
				<div id="dataTables-example_filter" class="dataTables_filter">
					<form action="">
					<select class="form-control" name="searchNum" id="searchNum">
						<option value="0">제목</option>
						<option value="1">내용</option>
					</select>
						<input class="inputTypeText" type="text" name="isSearch" id="isSearch"/>
						<span>
							<button type="submit" class="btn btn-primary">검색</button>
						</span>
					</form>
				</div>							
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	$(document).ready(function() {

		$("a[name='FAQ_SUBJECT']").on("click", function(e) { //제목 
			e.preventDefault();
			fn_FaqDetail($(this));
		});
	});

	function fn_FaqDetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/faqDetail.pulu'/>");
		comSubmit.addParam("FAQ_NUM", obj.parent().find("#FAQ_NUM").val());
		comSubmit.submit();
	}
</script>

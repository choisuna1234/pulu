<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--소영: FAQ jsp 테스트 -->
<html>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<title>FAQ</title>
</head>
<body>
<h2 onclick="location.href='faqList.pulu';">FAQ</h2><h3 onclick="location.href='main.pulu';">Main</h3>
<div class="row">

	<div style="text-align:center;">
		<div id="dataTables-example_filter" class="dataTables_filter">
			<form action="">
			<select class="form-control" name="searchNum" id="searchNum">
				<option value="0">제목</option>
				<option value="1">내용</option>
			</select>
				<input class="form-control" type="text" name="isSearch" id="isSearch"/>
				<span>
				<button type="submit" class="btn btn-primary">검색</button>
				</span>
			</form>
		</div>							
	</div>
</div>
<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<!-- <col width="15%"/> -->
			<col width="20%"/>
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
						<td align="left" class="FAQ_SUBJECT">
							<a align="left" href="#this" name="FAQ_SUBJECT">${row.FAQ_SUBJECT }</a>
							<input type="hidden" id="FAQ_NUM" value="${row.FAQ_NUM }">
						</td>
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
<div>

</div>
	<div class="paging">
		<ul class="inline">
			${pagingHtml}
			<div id="dataTables-example_filter" class="dataTables_filter"
				style="width: 600px;">
				<form action="">
					<div style="float: left; width: 20%">
						<select class="form-control" name="searchNum" id="searchNum">
							<option value="0">제목</option>
							<option value="1">내용</option>
						</select>
					</div>
					<div style="float: left; width: 70%;">
						<input class="form-control" type="text" name="isSearch"
							id="isSearch" />
					</div>
					<span>
						<div style="float: left; width: 10%;">
							<button type="submit" class="btn btn-default">검색</button>
						</div>
					</span>

				</form>
			</div>
		</ul>
	</div>
	<br/>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("a[name='FAQ_SUBJECT']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_FaqDetail($(this));
			});
		});
		
		function fn_FaqDetail(obj){			
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/faqDetail.pulu'/>");
			comSubmit.addParam("FAQ_NUM", obj.parent().find("#FAQ_NUM").val());
			comSubmit.submit();
		}
	</script>	
</body>
</html>
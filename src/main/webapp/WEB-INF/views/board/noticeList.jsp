<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<h2>Notice</h2>
<h2 onclick="location.href='faqList.pulu';">FAQ</h2>
<table class="noticeList">
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
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
			<c:when test="${fn:length(noticeList) > 0}">
				<c:forEach items="${noticeList}" var="row">
					<tr>
						<td>${row.NOTICE_NUM}</td>
					<td align="left" class="NOTICE_SUBJECT">
							<a href="#this" name="NOTICE_SUBJECT">${row.NOTICE_SUBJECT }</a>
							<input type="hidden" id="NOTICE_NUM" value="${row.NOTICE_NUM }">
						</td>
						<td>${row.NOTICE_READCOUNT}</td>
						<td>${row.NOTICE_ID}</td>
						<td>${row.NOTICE_DATE}</td>
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
				<input class="form-control" type="text" name="isSearch" id="isSearch"/>
				<span>
				<button type="submit" class="btn btn-primary">검색</button>
				</span>
			</form>
		</div>							
	</div>
</div>
<br/>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
   <script type="text/javascript">
      $(document).ready(function(){
         $("a[name='NOTICE_SUBJECT']").on("click", function(e){ //제목 
            e.preventDefault();
            fn_noticeDetail($(this));
         });
      });
      
      
      function fn_noticeDetail(obj){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/noticeDetail.pulu'/>");
         comSubmit.addParam("NOTICE_NUM", obj.parent().find("#NOTICE_NUM").val());
         comSubmit.submit();
      }
   </script>  
</body>
</body>
</html>
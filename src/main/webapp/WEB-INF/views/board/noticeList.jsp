<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<link rel="stylesheet" type="text/css"
	href="./resources/css/board.css" />
<div class="boardcontainer">
	<div class="wid1280">
		<div class="titleArea">
            <h2><font color="#555555">NOTICE</font> </h2>
            <p>푸르뎁의 새로운 소식을 알려드립니다.</p>
        </div>
		<div class="board_tab_cont">
			<ul>
				<li><a class="selected" href='noticeList.pulu'>공지사항</a></li>
				<li><a href='faqList.pulu'>자주묻는질문</a></li>
			</ul>
		</div>
		<div class="base-table boardList">
			<table border="1" summary>
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
				<tbody class="boardtbody center">
					<c:choose>
						<c:when test="${fn:length(noticeList) > 0}">
							<c:forEach items="${noticeList}" var="row">
								<tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
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
		<div>
		<div class="paging" style="border: 1px;">${pagingHtml}</div>

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
		<br/>
	</div>
</div>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Notice</h1>
		</div>

		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="paZnel-heading">공지사항</div>
					<div class="panel-body">
						<a href="#this" id="insert" class="btn btn-primary">글쓰기</a>
						<br>
						<br>
						<table width="100%"
							class="table table-striped table-bordered table-hover"
							id="adminNoticeList">

							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>조회수</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr class="odd gradeX">
									<c:choose>
										<c:when test="${fn:length(noticeList) > 0}">
											<c:forEach items="${noticeList}" var="row">
												<tr>
													<td style="width: 80px;">${row.NOTICE_NUM}</td>
													<td align="left" class="NOTICE_SUBJECT"><a
														href="#this" name="NOTICE_SUBJECT">${row.NOTICE_SUBJECT }</a>
														<input type="hidden" id="NOTICE_NUM"
														value="${row.NOTICE_NUM }"></td>
													<td>${row.NOTICE_READCOUNT}</td>
													<td>${row.NOTICE_ID}</td>
													<td>${row.NOTICE_DATE}</td>
<%-- 													<td><fmt:formatDate value="${row.NOTICE_DATE}" pattern="yyyy-MM-dd"/></td> --%>
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
						<div class="paging" style="border: 1px; float: right;">${pagingHtml}</div>

						<div>
							<div style="border: 1px; float: left; width: 310px;">
								<div class="form-group input-group">


									<!-- <div id="dataTables-example_filter" class="dataTables_filter"> -->
									<form action="">
										<select class="form-control" name="searchNum" id="searchNum"
											style="width: 80px;">
											<option value="0">제목</option>
											<option value="1">내용</option>
										</select> <input class="form-control" type="text" name="isSearch"
											id="isSearch" style="width: 190px;" /> <span
											class="input-group-btn">
											<button type="submit" class="btn btn-primary">
												<i class="fa fa-search"></i>
											</button>
										</span>
									</form>
								</div>
							</div>


						</div>

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




	<br/>
   
<%@ include file="/WEB-INF/include/include-body.jspf" %>
   <script type="text/javascript">
      $(document).ready(function(){
         $("#insert").on("click", function(e){ //글쓰기 버튼
         //<id가 insert인 a를 클릭했을 경우 이벤트 발생>
            e.preventDefault();      //동작 중단
            fn_adminNoticeInsert();   //fn_adminNoticeInsert()실행
         });   
         
         $("a[name='NOTICE_SUBJECT']").on("click", function(e){ //제목 
            e.preventDefault();
            fn_adminNoticeDetail($(this));
         });
      });
      
      
      function fn_adminNoticeInsert(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/adminNoticeInsertForm.pulu'/>");
         comSubmit.submit();
      }
      
      function fn_adminNoticeDetail(obj){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/adminNoticeDetail.pulu'/>");
         comSubmit.addParam("NOTICE_NUM", obj.parent().find("#NOTICE_NUM").val());
         comSubmit.submit();
      }
   </script>  

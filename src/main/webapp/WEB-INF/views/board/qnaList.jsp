<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--소영: QNA jsp 테스트 -->
<html>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<title>QNA</title>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<h2 onclick="location.href='qnaList.pulu';">QNA</h2>
<div class="row">
 
<a href="#this" class="btn" id="insert">글쓰기</a>

	<div style="text-align:center;">
		<div id="dataTables-example_filter" class="dataTables_filter">
			<form action="">
			<select class="form-control" name="searchNum" id="searchNum">
				<option value="0">제목</option>
				<option value="1">작성자</option>
			</select>
				<input class="form-control" type="text" name="isSearch" id="isSearch"/>
				<span>
				<button type="submit" class="btn btn-primary">검색</button>
				</span>
			</form>
		</div>							
	</div>
</div> 
<!-- <table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">문의번호</th>
				<th scope="col">제목</th>
				<th scope="col">내용</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${fn:length(qnaList) > 0}">
				<c:forEach items="${qnaList}" var="row">
					<tr>
						<td align="center">${row.QNA_NUM }</td>
						<td>${row.QNA_SUBJECT }</td>
						<td align="left" class="QNA_SUBJECT">
							<a align="left" href="#this" name="QNA_SUBJECT">${row.QNA_SUBJECT }</a>
							<input type="hidden" id="QNA_NUM" value="${row.QNA_NUM }">
						</td>
						<td align="center">${row.QNA_ID }</td>
						<%-- <td align="center">${row.QNA_CONTENTS }</td> --%>
						<td align="center">${row.QNA_DATE }</td>
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
</table> -->
<div>
	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
			<thead>
			<tr>
				<th scope="col">문의번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
	</table>
<div class="heading"> <!-- 펼치기 전 -->
    <table class="board_list">
		<colgroup>
			<col width="100%"/>

		</colgroup>
			<c:choose>
				<c:when test="${fn:length(qnaList) > 0}">
					<c:forEach items="${qnaList}" var="row">
						<tr>
							<td align="left">${row.QNA_CONTENTS }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
	</table>
</div>

<div class="content"> <!-- 펼친 후 -->
   <table>
		<tr>
			<td colspan="4">${map.QNA_CONTENT }</td>
		</tr>
	</table>
	
	<form id="frm">
        <table class="goods0_detail">
            <colgroup>
                <col width="15%">
                <col width="85%">
            </colgroup>
            <tbody>
                <tr>
                    <th>댓글</th>
                    <td>
                        ${fn:length(quaList) }
                    </td>
                </tr>
                <c:if test="${fn:length(quaList)>0 }">
                    <c:forEach items="${quaList }" var="row">
                        <tr>
                            <td style="background:#f7f7f7;color:#3b3a3a;" >
                                Admin
                            </td>
                            <td>
                                <input type="hidden" value="${row.QNA_NUM }" id="QNA_NUM">
								<input type="hidden" value="${row.QNA_GOODS_NUM }" id="QNA_GOODS_NUM">
                                <div id="com_Div"><input type="hidden" value ="${row.QNA_CONTENTS}" id="QNA_CONTENTS">${row.QNA_CONTENTS }</div>                           
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <tr>
                    <td colspan="2">
                        댓글 없어유
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
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
							<option value="1">아이디</option>
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
			
			$("a[name='QNA_SUBJECT']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_QnaDetail($(this));
			});
		});
		
		$(document).ready(function() {
			  $(".content").hide();
			  //content 클래스를 가진 div를 표시/숨김(토글)
			  $(".heading").click(function()
			  {
			    $(this).next(".content").slideToggle(500);
			    $("i", this).toggleClass("fa-chevron-down fa-chevron-up");
			  });
			});
		
		function fn_QnaDetail(obj){			
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qnaDetail.pulu'/>");
			comSubmit.addParam("QNA_NUM", obj.parent().find("#QNA_NUM").val());
			comSubmit.submit();
		}
		
		

	</script>	
</body>
</html>
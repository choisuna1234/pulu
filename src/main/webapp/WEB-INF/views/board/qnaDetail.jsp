<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 onclick="location.href='qnaList.pulu';">QNA</h2>
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글번호</th>
				<td>${map.QNA_NUM }</td>
				<th scope="row">상품번호</th>
				<td>${map.QNA_GOODS_NUM }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.QNA_ID }</td>
				<th scope="row">작성일</th>
				<td>${map.QNA_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.QNA_SUBJECT }</td>
			</tr>
			<tr>
				<td colspan="4">${map.QNA_CONTENT }</td>
			</tr>
		</tbody>
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
                                <div align="right">
                                    <a href="#this" name="comDelete" class="btn">삭제</a>
                                    <a href="#this" name="comUpdate" class="btn">수정</a>
                                </div>                            
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
	
	<a href="#this" class="btn" id="list">목록으로</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //리스트
				e.preventDefault();	//
				fn_qnaList();
			});
		});
		
		function fn_qnaList(){
			var comSubmit = new ComSubmit();
			var currentPage;
			var isSearch;
			var searchNum;
			
//			if (isSearch === null) { 
				comSubmit.setUrl("<c:url value='/qnaList.pulu?searchNum=${searchNum}&isSearch=${isSearch}&currentPage=${currentPage}'/>");
//			} else {
//				comSubmit.setUrl("<c:url value='/qnaList.pulu?currentPage=${currentPage}'/>");
//			}
			comSubmit.submit();
			
//			history.go(-1);
		}
	</script>
</body>
</html>
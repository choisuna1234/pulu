<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<form id="frm" name="frm" enctype="multipart/form-data">
<table class="reviewInsert">
<colgroup>
<col width="15%">
<col width="*"/>
</colgroup>
<caption>리뷰 작성</caption>
<tbody>
<tr>
<th scope="row">내용</th>
<td colspan="2" class="view_text">
<textarea rows="20" cols="100" title="내용" id="REVIEW_CONTENTS" name="REVIEW_CONTENTS"></textarea>
</td></tr>
</tbody>
</table>
<br/><br/>
<a href="#this" class="btn" id="write">작성하기</a>
<a href="#this" class="btn" id="list">목록으로</a>
</form>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">


$(document).ready(function(){
	$("#list").on("click", function(e){ // 목록으로 버튼
		e.preventDefault();
	fn_Detail();
	});
	
	$("#write").on("click", function(e){ // 작성하기 버튼
		e.preventDefault();
	fn_reviewInsert();
	
	});
	
	
});

function fn_Detail(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/Detail.pulu' />");
	comSubmit.submit();
	
}

function fn_reviewInsert(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/reviewInsert.pulu' />");
	comSubmit.submit();
}

</script>
</body>
</html>
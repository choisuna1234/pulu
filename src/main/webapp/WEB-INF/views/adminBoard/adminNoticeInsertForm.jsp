<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form id="frm" name="frm" enctype="multipart/form-data">
<table class="adminNoticeInsert">
<colgroup>
<col width="15%">
<col width="*"/>
</colgroup>
<caption>공지사항 작성</caption>
<tbody>
<tr>
<th scope="row">제목</th>
<td><input type="text" id="NOTICE_SUBJECT" name="NOTICE_SUBJECT" class="wdp_90"></input></td>
</tr>
<tr>
<th scope="row">내용</th>
<td colspan="2" class="view_text">
<textarea rows="20" cols="100" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT"></textarea>
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
	fn_adminNoticeList();
	});
	
	$("#write").on("click", function(e){ // 작성하기 버튼
		e.preventDefault();
	fn_adminNoticeInsert();
	
	});
	
	
});

function fn_adminNoticeList(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/adminNoticeList.pulu' />");
	comSubmit.submit();
	
}

function fn_adminNoticeInsert(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/adminNoticeInsert.pulu' />");
	comSubmit.submit();
}

</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>후기 수정</title>
</head>
<script type="text/javascript">
	function fn_reviewUpdate(){
		var params = $("#reviewUpdateBtn").serialize();
		
		if (confirm("수정 하시겠습니까?") == true) {
		$.ajax(
		{
			url : "<c:url value='/reviewUpdate.pulu'/>",
			data : params,
			type : "post",
			success : function(xh)
					{	
			opener.parent.location.reload();
			window.close();
					}
		});
		}
	}
	
</script>
<body>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
				<h3 class="page-header">후기 수정</h3>
				<form role="form" action="reviewUpdate.pulu" id="reviewUpdateBtn" name="reviewUpdateBtn" method="post">
	<input type="hidden" id="REVIEW_NUM" name="REVIEW_NUM" value="${map.REVIEW_NUM}"> 
	<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${map.GOODS_NUM}">  
			<div class="form-group">
		<label>내용</label>
	<input class="form-control" type="text"value="${map.REVIEW_CONTENTS}" name="REVIEW_CONTENTS" id="REVIEW_CONTENTS">
	</div>
<input type="button" class="btn btn-primary" value="수정" onclick="fn_reviewUpdate()">
<button type="button" class="btn btn-primary" onclick="window.close();">닫기</button>					
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
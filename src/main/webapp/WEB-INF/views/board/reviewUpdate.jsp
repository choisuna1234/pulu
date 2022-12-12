<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id="frm">
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
					<th scope="row">상품 이미지</th>
					<td>
					</td>
		
				</tr>
				<tr>
				<th scope="row">내용</th>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="REVIEW_CONTENTS" name="REVIEW_CONTENTS">${map.REVIEW_CONTENTS}</textarea>
					</td>
				</tr>
				<tr>
				<th scope="row">첨부 이미지</th>
				  <td>
				  </td>
				</tr>
			</tbody>
		</table>
	</form>
	
    <a href="#this" class="btn" id="list">취소</a>
	<a href="#this" class="btn" id="update">확인</a>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	
		$(document).ready(function(){
			$("#update").on("click", function(e){ //확인 버튼
				e.preventDefault();
				fn_reviewUpdate();
			});
			
			$("#list").on("click", function(e){ //취소 버튼
	            e.preventDefault();
	            fn_reviewList();
	        });
		});

		function fn_reviewUpdate(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/detail.pulu'/>");
			comSubmit.submit();
		}
		
		function fn_reviewList(){
			/*var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/reviewList.pulu'/>");
			comSubmit.submit();*/
			history.go(-1);
	         
	    }
	</script>
</body>
</html>
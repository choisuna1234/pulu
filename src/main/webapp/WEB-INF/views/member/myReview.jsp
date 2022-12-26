<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>후기 리스트</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body class="bg-light">

<h2>나의 후기 목록</h2>
<table class="myReview">
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">후기번호</th>
			<th scope="col">상품</th>
			<th scope="col">상품이름</th>
			<th scope="col">답변상태</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(myReview) > 0}">
				<c:forEach items="${myReview}" var="row">
					<tr>
						<td>${row.REVIEW_NUM}</td>
						<!-- 썸네일이미지 -->
						<td style="text-align: center"  class="title">
						<a href="#this" name="title">
						<img class="goodsimg" src="./resources/file/${row.IMAGE_STORED}" /></a>
						<input type="hidden" id="GOODS_NUM" value="${row.GOODS_NUM}">
						</td>
						<td>${row.GOODS_NAME}</td>
						<td>${row.REVIEW_STATUS}</td>
						<td></td>
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
<br/>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
   <script type="text/javascript">
      $(document).ready(function(){
         $("a[name='title']").on("click", function(e){ //제목 
            e.preventDefault();
            fn_Detail($(this));
         });
      });
      
      
      function fn_Detail(obj){
    	  var comSubmit = new ComSubmit();
    		comSubmit.setUrl("<c:url value='/Detail.pulu' />");
    		comSubmit.addParam("GOODS_NUM", obj.parent().find("#GOODS_NUM").val());
    		comSubmit.submit();
      }
   </script>  
</body>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.aagoodsimg{
		width:100px;
	}
</style>
<title>후기 리스트</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body class="bg-light">

<h2>나의 후기 목록</h2>



	<div class="base-table boardList">
			<table border="1" summary class="myReview">
				<colgroup>
					<col width="10%"/>
					<col width="10%"/>
					<col width="*%"/>
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
				<tbody class="boardtbody center">
					<c:choose>
						<c:when test="${fn:length(myReview) > 0}">
							<c:forEach items="${myReview}" var="row">
								<tr>
									<td>${row.REVIEW_NUM}</td>
									<!-- 썸네일이미지 -->
									<td>
									<a href="#this" name="title">
									<img class="aagoodsimg" src="./resources/file/${row.IMAGE_STORED}" /></a>
									<input type="hidden" id="GOODS_NUM" value="${row.GOODS_NUM}">
									</td>
									<td>${row.GOODS_NAME}</td>
									<td>${row.REVIEW_STATUS}</td>
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
					<div style="text-align: center;">
						<div id="dataTables-example_filter" class="dataTables_filter">
							<form action="">
								<select class="form-control" name="searchNum" id="searchNum">
									<option value="0">제목</option>
									<option value="1">내용</option>
								</select> <input class="inputTypeText" type="text" name="isSearch"
									id="isSearch" /> <span>
									<button type="submit" class="btn btn-primary">검색</button>
								</span>
							</form>
						</div>
					</div>
				</div>
				<br />
			</div>
		</div>





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
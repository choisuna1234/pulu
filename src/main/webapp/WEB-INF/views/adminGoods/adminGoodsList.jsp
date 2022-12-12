<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>

.board_list td{
vertical-align: center;
text-align: center;
}

.container{
	position: relative;
    width: 100%;
    min-width: 1280px;
    margin: 0px auto 0;
}

.adminGoodsListAll{
    width: 100%;
    max-width: 1280px;
    margin: 0 auto;
}

.container:after {
	content: "";
	display: block;
	clear: both;
}

</style>

<div class="container">
	<div class="adminGoodsListAll">
		<div class="adminGoodsList">
			<div class="adminListTop">
				<h2>상품 목록</h2>
				<a href="./adminGoodsWriteForm.pulu">글쓰기</a>
			</div>
			<div class="adminListMain">
				<table class="board_list">
					<colgroup>
						<col width="5%" />
						<col width="5%" />
						<col width="20%" />
						<col width="*" />
						<col width="5%" />
						<col width="5%" />
						<col width="10%" />
						<col width="5%" />
						<col width="5%" />
					</colgroup>
					<tread>
					<tr>
						<th scope="col">상품번호</th>
						<th scope="col">카테고리</th>
						<th scope="col">상품사진</th>
						<th scope="col">상품명</th>
						<th scope="col">남은수량</th>
						<th scope="col">가격</th>
						<th scope="col">날짜</th>
						<th scope="col" colspan="2">관리${list}</th>
					</tr>
					</thead>
					<tbody>
						<form id="frm" name="frm" enctype="multipart/form-data">
						<c:choose>
							<c:when test="${fn:length(adminlist) > 0}">
								<c:forEach items="${adminlist}" var="row">
									<tr>
										<td>${row.GOODS_NUM }<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${row.GOODS_NUM}"></td>
										<td><c:if test="${row.GOODS_CATEGORY == 1}">샐러드</c:if> <c:if
												test="${row.GOODS_CATEGORY == 2}">샌드위치</c:if> <c:if
												test="${row.GOODS_CATEGORY == 3}">간식/음료</c:if></td>
										<td><img src="./resources/file/${row.IMAGE_STORED}" width="200"></td>
										<td>${row.GOODS_NAME }</td>
										<td>${row.GOODS_AMOUNT}</td>
										<td>${row.GOODS_PRICE}</td>
										<td>${row.GOODS_DATE}</td>
										<td><a href="#this" class="btn" id="update">수정</a></td>
										<td><a href="#this" class="btn" id="delete"  onclick="removeCheck()">삭제</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">조회된 결과가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						</form>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div id="PAGE_NAVI">

</div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
 <%@ include file="/WEB-INF/include/include-body.jspf" %>

<script type="text/javascript">
function gfn_isNull(str) {
	if (str == null) return true;
	if (str == "NaN") return true;
	if (new String(str).valueOf() == "undefined") return true;    
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;    
    if (chkStr.toString().length == 0 ) return true;   
    return false; 
}

function removeCheck() {
	 if (confirm("정말 삭제하시겠습니까??") == true){
	     document.frm.submit();
	 }else{ 
	     return false;
	 }
}


function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	
	if(this.formId == "commonForm"){
		$("#commonForm")[0].reset();
		$("#commonForm").empty();
	}
	
	this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.addParam = function addParam(key, value){
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
	};
	
	this.submit = function submit(){
		var frm = $("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();	
	};
}

		
		$(document).ready(function(){
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
		});
		
		function fn_updateBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminGoodsModifyForm.pulu' />");
			comSubmit.addParam("GOODS_NUM", $("#GOODS_NUM").val());
			comSubmit.submit();
		}
		function fn_deleteBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminGoodsDelete.pulu' />");
			comSubmit.addParam("GOODS_NUM", $("#GOODS_NUM").val());
			comSubmit.submit();
			
		}
		
		
	</script>

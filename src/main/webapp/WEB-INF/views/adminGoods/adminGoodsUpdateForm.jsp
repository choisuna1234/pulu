<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./resources/js/common.js"></script>

<style>
table {
  border-collapse: separate;
  border-spacing: 0 50px;
}
</style>

<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Goods</h1>
		</div>


		<!-- /.row -->
		<div class="row">
			<div class="col-lg-10">
				<div class="panel panel-default">
					<div class="panel-heading">일반상품 등록하기</div>
					<div class="panel-body">
						<form id="frm" name="frm" enctype="multipart/form-data" >
							<table align="center" width="100%">
								<tbody>
									<tr>
										<th scope="row">상품 번호</th>
										<td>${map.GOODS_NUM }
										<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${map.GOODS_NUM }"></td>
									</tr>
									<tr>
										<th scope="row">상품 이름</th>
										<td><input type="text" id="GOODS_NAME" name="GOODS_NAME" value="${map.GOODS_NAME }"></td>
									</tr>
									<tr>
										<th scope="row">수량</th>
										<td><input type="text" id="GOODS_AMOUNT" name="GOODS_AMOUNT" value="${map.GOODS_AMOUNT }"></td>
									</tr>
									<tr>
										<th scope="row">가격</th>
										<td><input type="text" id="GOODS_PRICE" name="GOODS_PRICE" value="${map.GOODS_PRICE }"></td>
									</tr>
									<tr>
										<th scope="row">카테고리</th>
											<td>
											<select name="GOODS_CATEGORY" id="GOODS_CATEGORY" align="right" >
											<c:choose>
												<c:when test="${map.GOODS_CATEGORY eq 2}">
													<option value="1">샐러드</option>
													<option value="2" selected>샌드위치</option>
													<option value="3">간식/음료</option>
												</c:when>
												<c:when test="${map.GOODS_CATEGORY eq 3}">
													<option value="1">샐러드</option>
													<option value="2">샌드위치</option>
													<option value="3" selected>간식/음료</option>
												</c:when>
												<c:otherwise>
													<option value="1" selected>샐러드</option>
													<option value="2">샌드위치</option>
													<option value="3">간식/음료</option>
												</c:otherwise>
											</c:choose>
										</select></td>
									</tr>
									<tr>
										<th scope="row">칼로리</th>
										<td>
											<input type="text" id="GOODS_CALORIE" name="GOODS_CALORIE" class="inputCalorie" value="${map.GOODS_CALORIE }"/>
										</td>
									</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td>
											<div id="fileDiv">				
												<c:forEach var="row" items="${list}" varStatus="var">
													<p>
														<input type="hidden" id="IMAGE_GOODS_NUM" name="IMAGE_GOODS_NUM_${var.index }" value="${row.IMAGE_GOODS_NUM }" >
														<a href="#this" id="name_${var.index }" name="name_${var.index }">${row.IMAGE_IMG }</a>
														<input type="file" id="file_${var.index }" name="file_${var.index }"  class="btn btn-primary"> 
														<a href="#this" class="btn" id="delete_${var.index}" name="delete_${var.index }"  class="btn btn-primary">삭제</a>
													</p>
												</c:forEach>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->




	
	<a href="#this" class="btn btn-primary" id="addFile">파일 추가</a>
	<a href="#this" class="btn btn-primary" id="list">목록으로</a>
	<a href="#this" class="btn btn-primary" id="update">저장하기</a>
	<a href="#this" class="btn btn-primary" id="delete" onclick="return removeCheck()">삭제하기</a>
	
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
		var gfv_count = '${fn:length(list)+1}';
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
			
			$("#addFile").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});
			
			$("a[name^='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});

		function removeCheck() {
			 if (confirm("정말 삭제하시겠습니까??") == true){
			     document.frm.submit();
			 }else{ 
			     return false;
			 }
		}
		
function fn_openBoardList(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/adminGoodsList.pulu' />");
	comSubmit.submit();
}

function fn_updateBoard(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/adminGoodsUpdate.pulu' />");
	comSubmit.submit();
}

function fn_deleteBoard(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/adminGoodsDelete.pulu' />");
	comSubmit.addParam("GOODS_NUM", $("#GOODS_NUM").val());
	comSubmit.submit();
	
}
	
function fn_addFile(){
	var str = "<p>" +
			"<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+
			"<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" +
		"</p>";
	$("#fileDiv").append(str);
	$("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
		e.preventDefault();
		fn_deleteFile($(this));
	});
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
	function fn_deleteFile(obj){
		obj.parent().remove();
	}

</script>
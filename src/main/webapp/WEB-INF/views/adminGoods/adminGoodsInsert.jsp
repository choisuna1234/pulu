<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./resources/js/common.js"></script>

<style>
table {
  border-collapse: separate;
  border-spacing: 0 50px;
}

.subt{
margin: 60px 0 0 0;
text-align: center;
width: 100%;
font-size: 18px;
font-weight: 900;
}
</style>

<body>
<form id="frm" name="frm" enctype="multipart/form-data" >
<tbody>
<div class="subt">상품 등록</div>
<div id="container1">


<div id="insertTable">
<table align="center">
<tr>
<td>상품 이름<input type="text" id="GOODS_NAME" name="GOODS_NAME" class="wdp_90"></input></td>
</tr>

<tr>
<td>수량<input type="text" id="GOODS_AMOUNT" name="GOODS_AMOUNT" class="wdp_90"></input></td>
</tr>

<tr>
<td>			
			카테고리<select name="GOODS_CATEGORY" id="GOODS_CATEGORY" align="right" >
					<option value="1">샐러드</option>
					<option value="2">샌드위치</option>
					<option value="3">간식/음료</option>
				</select>
	</td>		
</tr>
	  
<tr>
<td>가격<input type="text" id="GOODS_PRICE" name="GOODS_PRICE" class="wdp_90">원</input></td>
</tr>

<tr>
<td>칼로리<input type="text" id="GOODS_CALORIE" name="GOODS_CALORIE" class="wdp_90"></input></td>
</tr>
<tr>
<td>
  <div id="fileDiv">
			<p>
				<input type="file" id="file" name="file_0">
				<a href="#this" class="btn" id="delete" name="delete">삭제</a>
			</p>
		</div>
</td>
</tr>
</tbody>
</table>
</div>


<a href="#this" class="btn" id="addFile">파일 추가</a>
<a href="#this" class="btn" id="insert">등록하기</a>
<a href="#this" class="btn" id="adminList">목록으로</a>
</div>
</form>

<form id="commonForm" name="commonForm"></form>
<script type="text/javascript">
		var gfv_count = 1;
		
$(document).ready(function(){ //목록으로 버튼
		$("#adminList").on("click", function(e){
			e.preventDefault();
			fn_openBoardList();
			
		});
	
	
$("#insert").on("click", function(e){ //등록하기 버튼
	e.preventDefault();
	fn_insertBoard();
});

$("#addFile").on("click", function(e){ //파일 추가 버튼
	e.preventDefault();
	fn_addFile();
});

$("a[name='delete']").on("click", function(e){ //삭제 버튼
	e.preventDefault();
	fn_deleteFile($(this));
});
});

	function fn_openBoardList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/adminGoodsList.pulu'/>");
		comSubmit.submit();
	}
	
	function fn_insertBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/adminGoodsInsert.pulu' />");
		comSubmit.submit();
	}
	
	function fn_addFile(){
		var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
		$("#fileDiv").append(str);
		$("a[name='delete']").on("click", function(e){ //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}
	
	function fn_deleteFile(obj){
		obj.parent().remove();
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


</script>






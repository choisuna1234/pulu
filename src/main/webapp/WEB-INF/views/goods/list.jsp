<%@ page language="java" pageEncoding="UTF-8"%>
<!-- 상품리스트는 상품리스트 작업자들끼리 의논하고나서 구현하는게 편할것 같아서  -->
<!-- 일단 눈에 보이게만 작업해달라고 부탁해서 의종님이 작업해주셨습니다. 감사합니다. -->
<!-- 전부 임시이고 작업할때 제가 다시 만들도록 하겠습니다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
table, th, td {
	border: none;
}

.listcontainer{
    position: relative;
    width: 100%;
    min-width: 1280px;
    margin: 0px auto 0;
}
.sublistcontainer{
    width: 100%;
    margin: 0 auto;
    *zoom: 1;
    max-width: 1920px;
}

.listcontainer:after {
	content: "";
	display: block;
	clear: both;
}

table {
	width: 400px;
	height: 200px;
	float: left;
}

th {
	width: 200px;
	height: 300px;
}

td {
	text-align: center;
}

.wid1280{
    width: 100%;
    max-width: 1280px;
    margin: 0 auto;
}



.goodsListBody{
	width: 100%;
}

.goodsContainer {
	width: 1280px;
    min-width: 756px;
    margin: 0px 0 0;
}

.goodsimg {
	width: 306px;
	object-fit: cover;
}

.goodstable{
    width: 25%;
    max-width: 306px;
    margin: 30px 4px 20px 4px;
}

.SaladAmount {
	font-weight: bold;
	font-size: 20px;
}

.select {
	weight: 200px;
	height: 300px;
}
</style>

<div class="listcontainer">
	<div class="sublistcontainer">
	<div class="wid1280">
	<div class="goodsheader">
		<div class="SaladAmount">상품 ${fn:length(goodsList)} 개</div>
		<div class="SaladCategory">
			<div id="select" align="right">
				<select name="job" align="right">
					<option value="낮은가격">낮은가격</option>
					<option value="높은가격">높은가격</option>
					<option value="추천상품">추천상품</option>

				</select>
			</div>
		</div>
	</div>
	<div class="goodsListBody">
	<div id="goods" class="goodsContainer">
		<c:choose>
			<c:when test="${fn:length(goodsList) > 0}">
				<c:forEach items="${goodsList}" var="row">

					<a href="Detail.pulu?GOODS_NUM=${row.GOODS_NUM}"	name="title">
						<table class="goodstable">
						<thead>
							<tr>
								<th><img class="goodsimg" src="./resources/file/${row.IMAGE_STORED}" /></th>
							</tr>
							<tr>
								<td>
								${row.GOODS_NAME }</td>
							</tr>

							<tr>
								<td><fmt:formatNumber value="${row.GOODS_PRICE}" pattern="#,###,###" />원</td>
							</tr>
							<tr>
								<td><input type="hidden" id="GOODS_NUM" value="${row.GOODS_NUM }"></td>


							</tr>
						</thead>
					</table ></a>
							</c:forEach>
							</c:when>
							<c:otherwise>
					<table class="goodstable">
								<tr>
									<td colspan="4">조회된 결과가 없습니다.</td>
								</tr>
					</table>
							</c:otherwise>
							</c:choose>
					
		</div>
	</div>
	</div>
	</div>
</div>


<script type="text/javascript">
$(document).ready(function(){
	fn_selectBoardList(1);
	
	$("a[name='title']").on("click", function(e){ //제목 
		e.preventDefault();
		fn_openBoardDetail($(this));
	});
});
function fn_openBoardDetail(obj){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/Detail.pulu' />");
	comSubmit.addParam("GOODS_NUM", obj.parent().find("#GOODS_NUM").val());
	comSubmit.submit();
}
</script>

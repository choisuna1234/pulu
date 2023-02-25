<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="./resources/sbadmin/vendor/bootstrap/css/bootstrap.min2.css">

<style>
</style>

<div class="accordion" id="accordionExample">
	<div class="accordion-item">
		<h2 class="accordion-header" id="headingOne">
			<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Accordion
				상품 별 매출
			</button>
		</h2>
		<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
			<div class="accordion-body">
				<div>
					<table>
						<tr>
							<td>메뉴</td>
							<td>수량</td>
							<td>가격</td>
						</tr>
						<c:choose>
							<c:when test="${fn:length(sellGoodsList) > 0}">
								<c:forEach items="${sellGoodsList}" var="row" varStatus="status">
									<tr>
										<td>${row.GOODS_NAME }</td>
										<td>${row.GOODS_SELLCOUNT }</td>
										<td>${row.GOODS_SELLCOUNT * row.GOODS_PRICE }</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a id="btn_toggle" data-toggle="collapse" href="#collapse3" aria-expanded="true"> 
					<span class="panel-title">상품 별 매출</span>
				</a>
			</div>
			<div class="panel-body" id="Toggle" style="display: none;">
				<!-- 명식 : 판넬 내용 -->
				<div>
					<div>
					<div class="row">
						<span style="font-size: large;">매출 상세</span>
						<span>
							<button class="sort_name reverse">이름순</button>
							<button class="sort_price reverse">가격순</button>
						</span>
					</div>
						<div>
							<table>
								<tr>
									<td>메뉴</td>
									<td>수량</td>
									<td>가격</td>
								</tr>
								<c:choose>
									<c:when test="${fn:length(sellGoodsList) > 0}">
										<c:forEach items="${sellGoodsList}" var="row" varStatus="status">
											<tr>
												<td>${row.GOODS_NAME }</td>
												<td>${row.GOODS_SELLCOUNT }</td>
												<td>${row.GOODS_SELLCOUNT * row.GOODS_PRICE }</td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				기간 별 매출
			</div>
			<div class="panel-body">
			

					<div class="box">
						<button class="year_btn">연 매출</button>
						<button class="month_btn">이번 달 매출</button>
						<button class="week_btn">이번 주 매출</button>
						<input type="month" name="date" id="date">
						<button class="other_month_search">검색</button>

						<h1>1월 총 합계</h1>

						<div>(단위 : 만원)</div>
						<div class="graph_box">
							<ul>
								<!-- 
						<li>
							<span class="sales"></span>
							<div class="graph"></div>
							<span class="graph_date"></span>
						</li>
						 -->
							</ul>

							<div class="graph_background">
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
							</div>
						</div>

					</div>
				</div>
				<section class="detail other_detail">
					<div>
						<h3 class="sales_today_detail_title">
							<span id="other_detail_date"></span> <span>
								<button class="sort_name reverse">이름순</button>
								<button class="sort_price reverse">가격순</button>
							</span>
						</h3>
						<div class="sales_today_detail">
							<!-- <div>메뉴</div>
  					<div>수량</div>
  					<div>가격</div> -->
						</div>
					</div>
				</section>

<%@ include file="/WEB-INF/include/include-body.jspf"%>

<script type="text/javascript">
	$(function (){
		$("#btn_toggle").click(function (){
	  	$("#Toggle").toggle();
	  });
	});
</script>
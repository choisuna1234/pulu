<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
	code, form, fieldset, legend, input, textarea, p, blockquote, th, td,
	img {
	margin: 0;
	padding: 0;
}

.topCategory {
	overflow: hidden;
	height: 30px;
	line-height: 30px;
	*zoom: 1;
	margin-top: 20px;
	margin-bottom: 60px;
}

div.topCategory ol {
	float: left;
}

div.topCategory li {
	float: left;
	margin: 0 0 0 8px;
	color: #555;
}

.topCategory ol li a {
	font-size: 16px;
}

.topCategory ol li:first-child {
	margin: 0;
	padding: 0;
}

.goodsmainimg {
	float: left;
	width: 550px;
	margin: 0 0 0 0px;
}

#wrap {
	position: relative;
	width: 100%;
	min-width: 1280px;
	margin: 0px auto 0;
}

.detailArea {
	padding: 0 0 0 600px;
	margin-bottom: 100px;
}

.detail_coupon_banner {
	max-width: 550px;
	width: 100%;
	float: left;
	overflow: hidden;
	margin-top: 5px;
}

.container:after {
	content: "";
	display: block;
	clear: both;
}

.detailArea:after {
	content: "";
	display: block;
	clear: both;
}

.detailInfoArea {
	height: auto;
}

.goodsmainimg {
	float: left;
	width: 550px;
	margin: 0 0 0 -600px;
}

.detailInfo_top {
	width: 100%;
	margin: 0 auto 30px;
	position: relative;
}

.detailInfo_top .name {
	font-size: 25px;
	color: #333;
	margin-bottom: 10px;
	width: 80%;
}

.InfoBody {
	position: relative;
	overflow: visible;
}

.InfoArea table {
	border: 0;
	font-size: 12px;
	margin: 10px 0 0;
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

}
.InfoArea tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

.InfoArea th {
	font-size: 15px;
	color: #555 !important;
	font-weight: normal;
	width: 115px;
	padding: 7px 0 8px 0px;
	text-align: left;
	vertical-align: middle;
}

.InfoArea td {
	padding-bottom: 0;
	padding-top: 0;
}

.InfoArea td {
	padding: 7px 6px 8px 0;
	vertical-align: middle;
	position: relative;
}

.bs_price {
	display: inline-block;
	font-size: 28px;
	color: #222;
	width: auto;
	margin-right: 10px;
	line-height: 1;
	text-decoration: none;
}

.delivery span {
	padding-left: 30px;
	display: inline-block;
	min-height: 30px;
	line-height: 30px;
	position: relative;
}

.detailInfoCon {
	border-bottom: 1px solid #eeeeee;
	margin-bottom: 10px;
}

.simple_desc {
	font-size: 14px;
	color: #555;
	line-height: 1.5;
	padding: 15px 0;
}

.totalPrice {
	font-family: 'notoKrM';
	padding: 0px 9px 19px;
	vertical-align: middle;
	background: #fff;
	font-size: 15px;
	text-align: right;
}

.totalPrice .point_text {
	font-size: 12px;
	color: #01934c;
	display: block;
	margin-bottom: 15px;
}

.totalPrice .total {
	color: #333;
	margin-left: 45px;
}

.totalPrice .total strong {
	font-weight: normal;
}

.totalPrice .total em {
	font-style: normal;
	font-size: 28px;
}

strong {
	font-weight: bold;
}

.basketBt {
	font-size: 16px;
	color: #01934c;
	font-weight: normal;
	border: 1px solid #01934c;
	padding: 15px 16px;
	border-radius: 0;
	width: 337px;
	height: 60;
}

.buyBt {
	border-radius: 0;
	font-size: 15px;
	color: #fff;
	background: #01934c;
	font-weight: normal;
	padding: 15px 16px;
	float: left;
	margin-left: 0;
	width: 337px;
	height: 60;
}

.btAll {
	padding: 18px 0 10px;
}

.InfoButton {
	padding: 0;
	margin: 0 auto;
	display: -webkit-flex;
	display: -moz-flex;
	display: -ms-flex;
	display: flex;
	-webkit-justify-content: center;
	-moz-justify-content: center;
	-ms-justify-content: center;
	justify-content: center;
	padding: 10px 0;
	text-align: center;
}

.detailTopMenu {
	width: 100%;
	margin: 0 auto;
	overflow: hidden;
}

#selected {
	border-top: 2px solid #01934c;
	border-bottom: 0;
}

.detailTopMenu ul li {
	width: 25%;
	float: left;
	text-align: center;
	border-top: 1px solid #ddd;
	border-right: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	max-width: 318px;
}

.detailTopMenu ul li a {
	font-size: 15px;
	color: #999;
	display: block;
	padding: 13px 0;
}

.detailConTentContainer {
	width: 100%;
	max-width: 1280px;
	margin: 0 auto;
}

.Detail_cont {
	clear: both;
	display: block;
	padding: 27px 0px 46px 0px;
	color: #353535;
	line-height: 18px;
	overflow: hidden;
}

.goodsimg {
	width: 550px
}
</style>

<script language="javascript">

	function insertBasket(loginNum) {
	   var goodsAmount = document.getElementById("selectedGoodsAmount");
	   if (loginNum == null)
	   {
	      alert("로그인 후 이용해주세요.");
	      return false;
	   }
	   else if (goodsAmount.value == 0) // 수량 버튼 완성 후 삭제예정
	   {
	      alert("수량을 선택하세요.");
	      return false;
	   }
	   else
	   {
	      var form = document.getElementById("detailForm"); // id="detailForm"인 <form> 받아오기
	      form.action = "checkBasket.pulu"; 
	      form.method = "post";
	      form.submit(); // form안의 파라미터들을 post방식으로 insertBasket.pulu에 보내기
	      window.open('basketSuccess.pulu', 'window_basketCheck', 'width=400, height=250, location=no, status=no, scrollbars=no');
	   }
	}
	
   /* 선아: 바로 구매 연결 */
	function openBuyCheck() {
      var form = document.getElementById("detailForm");
      form.action = "selectOrderGoodsInfo.pulu";
      form.method = "post";
      form.submit();
	}
	
</script>


<body>
<br>
<div id="mainbody">
	<div class="container">
		<div class="sub_content">
			<div class="topCategory">
				<ol>
					<li><a class="topCategorylink" href="main.pulu">홈</a>
					<img src="./resources/img/icon/ico_path.gif"></li>

					
					<c:choose>
						<c:when test="${map.GOODS_CATEGORY eq 1}">
							<li><a class="topCategorylink"
								href="goodsList.pulu?categoryNo=1">샐러드</a></li>
						</c:when>
						<c:when test="${map.GOODS_CATEGORY eq 2}">
							<li><a class="topCategorylink"
								href="goodsList.pulu?categoryNo=2">샌드위치</a></li>
						</c:when>
						<c:when test="${map.GOODS_CATEGORY eq 3}">
							<li><a class="topCategorylink"
								href="goodsList.pulu?categoryNo=3">간식/음료</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="topCategorylink"
								href="goodsList.pulu?categoryNo=0">전체 카테고리</a></li>
						</c:otherwise>
					</c:choose>
				</ol>
			</div>

			<div class="GoodsDetailAll">
				<div class="detailArea">
					<div class="goodsmainimg">
						<ul>
							<li><img class="goodsimg"
								src='./resources/file/${list[0].IMAGE_STORED}'></li>
						</ul>
						<div class="detail_coupon_banner">
							<div class="banner_img">
								<a class="img" href="" target="_blank"><img
									src="./resources/img/dummy/testbanner.jpg" alt="새벽배송"></a>
							</div>
						</div>
					</div>
					<div class="detailInfoArea">
						<div class="InfoArea">
							<div class="detailInfo_top">
								<p class="name">${map.GOODS_NAME}</p>
							</div>
							<div class="InfoBody">
								<div class="price">
									<table>
										<tbody>
											<tr>
												<th scope="row">판매가</th>
												<td>
													<div class="percent_text"></div>
													<div class="bs_price">
														<fmt:formatNumber value="${map.GOODS_PRICE}"
															pattern="#,###,###" />
														원
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="delivery">
									<table>
										<tbody>
											<tr>
												<th scope="row">배송방법</th>
												<td><div class="del_kind ">택배배송</div></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="detailInfoCon">
									<table class="detail_list">
										<tr class="deliverprice">
											<th scope="row"><span>배송비</span></th>
											<td><span><span class="delv_price_B"><strong>3,000원</strong>(30,000원
														이상 구매 시 무료)</span></span></td>
										</tr>
										</tbody>
									</table>
								</div>
								<div class="simple_desc ">
									<b>총 내용량 :</b> 241g<br> <b>드레싱 :</b> 발사믹 드레싱<br> <b>유통기한
										:</b> 수령일 포함 5일<br> <b>알레르기정보 :</b> 우유,토마토,이산화황 함유<br> <b>칼로리
										:</b> ${map.GOODS_CALORIE}kcal
								</div>

								<!-- 선민: 상품번호와 수량을 detailForm의 파라미터로 사용 -->
								<!-- 선아: 바로 구매 연결폼  -->
								<form id="detailForm">
									<input type="hidden" id="goodsNum" name="GOODS_NUM"
										value="${map.GOODS_NUM }">
									<div class="totalProducts">
										<table>
											<tr>
												<td>${goodsDetail.GOODS_NAME}</td>
												<td>수량 <input type="text" id="selectedGoodsAmount"
													name="SELECTED_GOODS_AMOUNT" value="1"
													style="width: 20px; text-align: right;">
												</td>
												<td>수량x가격</td>
											</tr>
										</table>
									</div>
								</form>
								<div id="totalPrice" class="totalPrice">
									<div id="totalPrice" class="totalPrice">

										<!-- 출고 날짜 변경 부분 -->
										<p class="point_text">
											<img src="./resources/img/icon/point_text_bg.png"> 평일 낮
											12시 이전까지 결제시 당일 출고됩니다.
										</p>
										<!-- 출고 날짜 변경 부분 끝 -->
										총 상품금액 <span class="total"> <strong><em><fmt:formatNumber
														value="${map.GOODS_PRICE}" pattern="#,###,###" />원</em></strong> (1개)
										</span>
									</div>

									<div class="btAll">
										<div class="InfoButton">
											<!-- 선민: insertBasket을 위한 스크립트 함수 -->
											<a href='javascript:void(0);' class="basketBt"
												onclick="insertBasket(${loginNum})">장바구니</a>
											<!-- 선아: 주문페이지 이동을 위한 스크립트 함수 -->
											<a href='javascript:void(0);' class="buyBt"
												onclick="openBuyCheck()">구매하기</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="detailConTentContainer">
				<div class="detailContentALl">
					<div class="detailContent1">
						<div class="detailTopMenu">
							<ul>
								<li title="상품정보 이동" id="selected"><a href="#none"
									name="here1">
										<p>상품설명</p>
								</a></li>
								<li title="상품리뷰 이동"><a href="#here2">
										<p>
											구매후기<span style="display: inline-block;"
												class="xans-element- xans-product xans-product-action">(후기개수)</span>
										</p>
								</a></li>
								<li title="상품문의 이동"><a href="#here3">
										<p>
											상품문의 <span style="display: inline-block;"
												class="xans-element- xans-product xans-product-action ">(문의개수)</span>
										</p>
								</a></li>
								<li title="배송안내 이동"><a href="#here4">
										<p>이용안내</p>
								</a></li>
							</ul>
						</div>
						<div class="Detail_cont">
							<table class="dummy" align="center">
								<tr>
									<td><img class=""
										src='./resources/file/${list[1].IMAGE_STORED}' width="1000px"></td>
								</tr>
								<tr>
									<td><img class=""
										src='./resources/file/${list[2].IMAGE_STORED}' width="1000px"></td>
								</tr>
								<tr>
									<td><img class=""
										src='./resources/file/${list[3].IMAGE_STORED}' width="1000px"></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="detailContent2">
						<div class="detailTopMenu">
							<ul>
								<li title="상품정보 이동"><a href="#here1">
										<p>상품설명</p>
								</a></li>
								<li title="상품리뷰 이동" id="selected"><a href="#none"
									name="here2">
										<p>
											구매후기<span style="display: inline-block;"
												class="xans-element- xans-product xans-product-action">(후기개수)</span>
										</p>
								</a></li>
								<li title="상품문의 이동"><a href="#here3">
										<p>
											상품문의 <span style="display: inline-block;"
												class="xans-element- xans-product xans-product-action ">(문의개수)</span>
										</p>
								</a></li>
								<li title="배송안내 이동"><a href="#here4">
										<p>이용안내</p>
								</a></li>
							</ul>
						</div>
						<div class="Detail_cont">
							<table class="dummy" align="center" width="1000" height="800">
								<a href="reviewInsertForm.pulu" class="btn" id="reviewInsert">리뷰작성</a>
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="*" />
									<col width="15%" />
									<col width="20%" />
								</colgroup>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>

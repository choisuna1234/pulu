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

.detailTopMenu ul li:first-child {
    border-left: 1px solid #ddd;
}

.goodsimg {
	width: 550px
}
</style>

<script language="javascript">

	<!-- 선민: basketController로 GOODS_NUM과 SELECTED_GOODS_AMOUNT 보내기 -->
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
	      
	
	 // 팝업 띄우기
        window.open('basketSuccess.pulu', 'window_basketCheck', 'width=460, height=260, location=no, status=no, scrollbars=no');
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
						<li><a class="topCategorylink" href="main.pulu">홈</a> <img
							src="./resources/img/icon/ico_path.gif"></li>


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
											:</b> 수령일 포함 5일<br> <b>알레르기정보 :</b> 우유,토마토,이산화황 함유<br>
										<b>칼로리 :</b> ${map.GOODS_CALORIE}kcal
									</div>

									<!-- 선민: 상품번호와 수량을 detailForm의 파라미터로 사용 (GOODS_NUM, SELECTED_GOODS_AMOUNT) -->
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
												<img src="./resources/img/icon/point_text_bg.png"> 평일
												낮 12시 이전까지 결제시 당일 출고됩니다.
											</p>
											<!-- 출고 날짜 변경 부분 끝 -->
											총 상품금액 <span class="total"> <strong><em><fmt:formatNumber
															value="${map.GOODS_PRICE}" pattern="#,###,###" />원</em></strong> (1개)
											</span>
										</div>

										<div class="btAll">
											<div class="InfoButton">
												<!-- 선민: 장바구니 버튼 클릭 시 basketController로 form안의 파라미터를 보내는 스크립트 함수 실행 -->
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
								<div id="reviewList"><jsp:include
										page="comment/reviewList.jsp"></jsp:include>
								</div>
							</div>
						</div>
						<div class="detailContent3">
							<div class="detailTopMenu">
								<ul>
									<li title="상품정보 이동"><a href="#here1">
											<p>상품설명</p>
									</a></li>
									<li title="상품리뷰 이동"><a href="#here2">
											<p>
												구매후기<span style="display: inline-block;"
													class="xans-element- xans-product xans-product-action">(후기개수)</span>
											</p>
									</a></li>
									<li title="상품문의 이동" id="selected"><a href="#none"
										name="here3">
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
								<jsp:include page="comment/qnaList.jsp"></jsp:include>
							</div>

							<%-- <table class="dummy" align="center" width="1000" height="800">
							<form id="frm1">
								<tr>
									<td colspan="2">
										<div>
											<input type="hidden" name="ID" value="${loginId}"> <input
												type="hidden" name="QNA_GOODS_NUM" value="${map.GOODS_NUM}">
											<input type="hidden" name="GOODS_NUM"
												value="${map.GOODS_NUM}">
											<textarea rows="3" cols="50" name="QNA_SUBJECT"></textarea>
											<textarea rows="5" cols="130" name="QNA_CONTENTS"></textarea>
											<p align="right">
												<input type="button" id="qnaInsert" class="btn2" value="등록">
											</p>
										</div>
									</td>
								</tr>
								<div id="qnaList"><jsp:include page="comment/qnaList.jsp"></jsp:include></div>
							</form>
						</table> --%>
						</div>
					</div>
					<div class="detailContent4">
						<div class="detailTopMenu">
							<ul>
								<li title="상품정보 이동"><a href="#here1">
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
								<li title="배송안내 이동" id="selected"><a href="#none"
									name="here4">
										<p>이용안내</p>
								</a></li>
							</ul>
						</div>
						<div class="Detail_cont">
							<table class="dummy" align="center" width="1000" height="800"
								border=1 border-color=>

								<tr>
									<td>상품결제정보<br> 결제 전에 꼭 확인해주세요.<br> 주문하신 분과 받으실
										분의 성함과 연락처, 주소를 확인해주세요. 제품의 안전한 배송을 위한 필수 정보입니다.<br> <br>
										입력된 정보가 실제와 달라 배송이 지연되거나 반송될 경우 교환 / 재발송 / 환불이 불가능합니다. <br>
										<br> <br> <br> 주문취소<br> <br> 주문 취소는
										배송일(수령일 기준) 2일 전까지 고객센터 또는 1:1 문의 게시판으로 취소 요청이 가능합니다. <br>
										<br> 판다의 샐러드는 주문이 확인 된 이후 수량에 맞춰 생산하기 때문에 생산이 된 이후에는 환불되지
										않습니다.<br> <br> <br> <br> 결제 수단에 따라 영업일 기준
										3~7일 이내 승인 취소 또는 환불처리 해드립니다.<br> <br> 카드 환불의 경우 카드사의
										정책에 따르며, 자세한 사항은 카드사에 문의 부탁드립니다.<br> <br> 결제 취소 시,
										사용한 적립금과 쿠폰은 모두 복원됩니다.<br> <br> 배송안내 배송조회<br>
										배송 안내 : 상단 상세페이지 안내를 확인하세요.<br> 교환 및 반품안내<br> 교환 및
										환불이 어려운 경우<br> 샐러드는 신선식품으로 재판매가 어렵습니다. 또한 신선도를 위해 주문이
										접수되고 난 다음에 제조됩니다.<br> <br> 때문에 신선식품의 특성상 고객님의 단순 변심,
										주문 오류 등으로 인한 교환 / 반품 / 환불은 불가능합니다.<br> <br> 또한
										냉장식품이기 때문에 제품 수령 후 보관상의 이유로 발생한 변질 및 파손에 대해서도 교환 / 반품 / 환불이
										불가능합니다.<br> <br> <br> <br> 또한 다음과 같은 이유로
										배송이 지연되거나 반송이 되는 경우 환불 혹은 재발송이 불가능합니다.<br> <br> - 배송
										받을 주소가 사실과 다를 경우,연락처가 기재되지 않거나 잘못된 경우 (반송시 폐기)<br> <br>
										- 고객센터를 통하지 않은 임의 반송<br> <br> - 제주 및 도서,산간지역의 경우<br>
										<br> - 천재지변 등의 불가항력인 이유로 배송이 지연되는 경우<br> <br> -
										택배배송이 격일로 이루어지는 군부대나 주말에 택배 배송이 어려운 기숙사 등의 장소일 경우 <br> <br>
										<br> <br> 교환 및 환불이 가능한 경우<br> <br> 주문한 제품과
										수령한 제품이 다르거나, 제품이 표시 내용과 다르거나, 권장섭취일에 이미 유통기한이 다 되었거나, 부패했을 경우
										등 <br> 판매자의 실수나 제품에 문제가 있는 경우 교환/재발송/환불 등이 가능합니다.<br>
										<br> 제품의 특성상 제품 수령 2일 이내로 연락부탁합니다. <br> <br> <br>
										교환 및 환불 절차<br> <br> 1. 제품의 이상을 사진으로 남겨 주세요 : 제품에 문제가
										확인되면 배송비는 푸르뎁에서 부담합니다.<br> <br> 2. 고객센터 혹은 1:1게시판으로
										연락주세요 : 고객센터 마감시간 이후로는 1:1 문의 게시판에 남겨주세요.<br> <br>
										3. 교환/재발송/환불 처리해드립니다 : 사전연락 없이 임의로 반송되는 제품은 교환 및 환불이 불가능합니다.<br>
										<br> <br> <br> 환불 안내<br> <br> 고객센터를
										통해 제품의 이상이 확인된 후 환불이 결정되면 3영업일 이내에 결제 금액을 환불해 드립니다. <br>
										<br> 신용카드로 결제하신 경우는 신용카드 승인을 취소하여 결제 대금이 청구되지 않게 합니다.<br>
										<br> (단, 신용카드 결제일자에 맞추어 대금이 청구 될수 있으면 이경우 익월 신용카드 대금청구시
										카드사에서 환급처리 됩니다.) <br> <br> <br> <br> 정기배송
										이용 도중 취소를 할 경우,<br> 정기배송 상품은 정해진 기간동안 전체 이용을 완료할 경우를 전제로
										무료배송해드립니다.<br> 만일 정상 서비스 이용 도중 판매자의 귀책이 아닌 이용자의 사유로 중단을
										하고자 할 경우, <br> 전체 결제금액에서 기수령하신 샐러드의 판매금과 수령하신 횟수에 해당하는
										배송료를 차감한 금액을 환불받으실 수 있습니다.<br> 정기배송 중도취소를 원할 경우 고객센터 혹은
										1:1문의게시판에 남겨주세요.<br> 무통장 입금의 경우, 고객님의 계좌로 입금해드리며 카드결제의 경우
										카드 부분취소로 환불이 이루어집니다.<br> 카드결제 취소의 경우 카드사의 상황에 따라 7영업일 정도
										소요할 수 있습니다.<br> 서비스문의
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>

	<script>

</script>
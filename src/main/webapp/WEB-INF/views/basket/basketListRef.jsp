<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>


<html>

<link href="/resources/assets/css/order.css" rel="stylesheet">


<script>

function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('item');
  
    checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}

function count(type, index)  {
	  
	  // 결과를 표시할 element
	  
	const resultElement = document.getElementById('result_'+ index);
	const priceElement = document.getElementById('gprice_'+ index);
	const pricex = document.getElementById('id2_'+ index);
	const dp = document.getElementById('delivery_price_'+ index);  
	  
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText; //현재 수
	//alert(number);
	  
	  let priceee = priceElement.innerText; //물건 가
	 //alert(priceee);
	  
	  let priceeex = pricex.innerText; //현재 총 가격
	  //alert(priceeex);
	  
	  let hhh = 0;
	  
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	    
	    priceee = parseInt(number) * parseInt(priceee);
	    //alert(priceee);//바뀐 가
	    hhh = priceee;
	    priceee = '₩' + priceee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1;
	    priceee =  parseInt(number) * parseInt(priceee);
	    hhh = priceee;
	    priceee = '₩' + priceee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  }
	  if(parseInt(number)<1){
	    number = 1;
	    priceee = parseInt(priceee);
	    priceee = '₩' + priceee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	  pricex.innerText = priceee;
	  
	  if(hhh > 30000){
		  dp.append('무료');
	  }
	  
	  if(hhh <= 30000){
		  dp.innerHtml = '3000원';
	  }
	  
	  } 
	  
	  function mcount(type, index){}
     
		/* 수량 수정 버튼 */
	  function updateA(index){
		
			var abc = $(".quantity_update_form");
			var resultElement = document.getElementById('result_'+ index);
			var priceElement = document.getElementById('gprice_'+ index);
			var pricex = document.getElementById('id2_'+ index);
			var dp = document.getElementById('delivery_price_'+ index);  
			var bbb = document.getElementById('b_b_num_'+ index);  
			
			
				let b_num = bbb.value;
				//alert(b_num);
				let b_count = resultElement.innerText;
				//alert(b_count);
				$(".update_b_num").val(b_num);
				$(".update_b_count").val(b_count);
				abc.method = "POST";
				abc.submit();			
		}
	  
		/* 주문처리 */
	  function orderA(index){
			
			var abc = $(".order_start_form");
			var resultElement = document.getElementById('result_'+ index); // 상품수량
			var priceElement = document.getElementById('gprice_'+ index); // 단일가격
			var pricex = document.getElementById('id2_'+ index); // 총가격
			var dp = document.getElementById('delivery_price_'+ index);  // 배송비 
			var bbb = document.getElementById('b_b_num2_'+ index);   // 장바구니 번호(PK)
			var bgid = document.getElementById('b_g_id_'+ index); // 상품 번호
			var bgname = document.getElementById('b_g_name_'+ index); // 상품 아이디
			
			
			
			
				let b_num = bbb.value;
				//alert(b_num);
				let b_count = resultElement.innerText;
				//alert(b_count);
				/* let b_totalPrice = pricex.value;
				alert('총 가격:' + pricex); */
				b_g_id = bgid.value;
				alert('상품 id: '+ b_g_id);
				b_g_name = bgname.value;
				alert('상품 이름: '+ b_g_name);
				
				$(".order_b_num").val(b_num);
				alert('장바구니 넘버:' + b_num);
				$(".order_b_count").val(b_count);
				alert('장바구니 수량:' + b_count);
				$(".order_g_id").val(b_g_id);
				alert('상품id: '+ b_g_id);
				$(".order_g_name").val(b_g_name);
				alert('상품 이름: '+ b_g_name);
				/* $(".order_b_totalPrice").val(pricex);
				alert('상품 총 가격 : '+ pricex); */
				
				
				abc.method = "POST";
				abc.submit();			
				
				
				
				
		}
		
		
	  
	  
     </script>

<script>
    
	$(document).ready(function(){
		var abcd = $(".quantity_delete_form");
		
		$(".delete_btn").on("click", function(e){
			e.preventDefault();
			const b_num = $(this).data("b_num");
			$(".delete_b_num").val(b_num);
			abcd.method = "POST";
			abcd.submit();
		});	
		
			
	});

</script>
<body>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />


	<h3 align="center">ORDER</h3>

	<br />
	<br />
	<br />



	<div class="container" align="center">

		<table>

			<colgroup align="center">

				<col width="6%">
				<col width="6%">
				<col width="8%">
				<col width="8%">
				<col width="8%">
				<col width="8%">
				<col width="8%">
				<col width="8%">
				<col width="8%">
			</colgroup>

			<tr align="center">
				<th scope="col"><input id="input1" type="checkbox" name="item" value="selectall" onclick="selectAll(this)" /></th>
				<th scope="col">상품이미지</th>
				<th scope="col">상품명</th>
				<th scope="col">가격</th>
				<th scope="col">옵션</th>
				<th scope="col">수량</th>
				<th scope="col">배송비</th>
				<th scope="col">합계</th>
				<th scope="col">선택</th>
			</tr>



			<c:if test="${fn:length(basketList) == 0 }">
				 없음
				</c:if>

			<c:if test="${fn:length(basketList) != 0 }">

				<c:forEach items="${basketList}" var="basket" varStatus="status">
					<tr align="center">

						<td align="center">
							<input id="input2" type="checkbox" name="item" value="선택">
						<td />
						<img src="/resources/assets/img/menu/spiderman.png" width="90" height="90">
						</td>

						<td align="center">${basket.g_name}</td>
						<td align="center">
							<div id="gprice_${status.index}">${basket.g_price}</div>
						</td>

						<!--  옵션 수정 -->
						<td>
							<select>
								<option value="">${basket.b_option}</option>
								<option value="">S</option>
								<option value="">M</option>
								<option value="">L</option>
								<option value="">XL</option>
							</select>
						<td>
							<table>
								<tr>
									<td>
										<input type="button" value="-" onClick='count("minus",${status.index})' style="width: 30px;">
									</td>
									<td>
										<div id='result_${status.index}' style="text-align: center; width: 30px">${basket.b_count}</div>
									</td>
									<td>
										<input type="button" value="+" onClick='count("plus",${status.index})' style="width: 30px;">
									</td>
									<!-- <tr><td align="center" rowspan="3" colspan="5">
						<button type="button" class="btn-outline-inbtn">변경저장</button> -->
								</tr>
							</table>
						</td>
						<td>
							<span id="delivery_price_${status.index}"> <c:if test="${basket.totalPrice >= 30000}">
								무료
							</c:if> <c:if test="${basket.totalPrice < 30000}">
								3,000원
							</c:if>
							</span>
						</td>
						<!-- <td align="center">3000원</td> -->
						<td align="center">
							<strong id="id2_${status.index}">${basket.totalPrice}</strong>
						</td>
						<%-- <c:set var= "sum" value="${sum + (basketList.basket_goods_price * basketList.basket_goods_amount)}"/>
 							--%>
						<td colspan="300" align="center" height="150">
							<input type="hidden" id="b_b_num_${status.index}" value="${basket.b_num}" />
							<a onclick="updateA(${status.index})" class="quantity_modify_btn btn btn-outline-secondary btn-sm" data-b_num="${basket.b_num}">변경</a>
							<!-- 수량 조정 form -->
							<form action="/basket/modify.toy" method="post" class="quantity_update_form">
								<input type="hidden" name="b_option" value="아무거나">
								<input type="hidden" name="b_num" class="update_b_num">
								<input type="hidden" name="b_count" value="${basket.b_count}" class="update_b_count">
							</form>
							<br>

							<!-- 주문 시작 -->
							<input type="hidden" id="b_b_num2_${status.index}" value="${basket.b_num}" />
							<input type="hidden" id="b_g_id_${status.index}" value="${basket.g_id}" />
							<input type="hidden" id="b_g_name_${status.index}" value="${basket.g_name}" />
							<a onclick="orderA(${status.index})" class="order_start_btn btn btn-outline-secondary btn-sm" data-b_num="${basket.b_num}">주문하기</a>
							<form action="/order/orderStart.toy" method="post" class="order_start_form">
								<input type="hidden" name="o_option" value="아무거나">
								<input type="hidden" name="b_num" class="order_b_num">
								<input type="hidden" name="o_count" value="${basket.b_count}" class="order_b_count">
								<input type="hidden" name="g_id" value="${basket.g_id}" class="order_g_id">
								<input type="hidden" name="g_name" value="${basket.g_name}" class="order_g_name">
								<input type="hidden" name="b_totalPrice" value="${basket.totalPrice}" class="order_b_totalPrice">
								<!-- 총가격 -->
								<input type="hidden" name="m_num" value="${basket.m_num}">
							</form>

							<button type="button" class="delete_btn btn btn-outline-secondary btn-sm" id="select_delete" data-b_num="${basket.b_num}">상품삭제</button>
							<!-- 장바구니 삭제 폼 -->
							<form action="/basket/deleteOne.toy" method="post" class="quantity_delete_form">
								<input type="hidden" name="b_num" class="delete_b_num">
								<input type="hidden" name="m_num" value="${basket.m_num}">
							</form>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td align="center" colspan="10" height="40" style="background: #f6f6f6; border-top: 1px solid #e5e5e5; text-align: right; color: black;">

					<%-- 상품구매금액 <strong><fmt:formatNumber value="${basket.g_price * basket.o_count}" type="number"/> </strong> + 배송비 <strong>0</strong> = <strong style="color: #f8941d;font-size: 14px;">
							합계 : <fmt:formatNumber value="${basket.gprice * basket.o_count}" type="number"/>원 </strong>&nbsp;&nbsp;&nbsp; --%>
					총 주문금액(총 상품금액 + 총 배송비) = 300,000원
				</td>
			</tr>
			<tr>
				<td colspan="100" align="right" height="50">
					<button type="button" class="btn btn-outline-secondary btn-sm" id="modify_order">장바구니 비우기</button>
				</td>
			<tr>
				<td colspan="100" align="center" height="100">
					<button type="button" class="btn btn-outline-submit" id="all_order">전체상품주문</button>
					<button type="button" class="btn btn-outline-submit" id="select_order">선택상품주문</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 담기</title>
<style>
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");

.basket1 {
	width: 100%;
	height: 100%;
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
}

.title {
	border-radius: 15px 15px 0 0;
	min-height: 40px;
	color: #fff;
	background-color: rgb(47, 109, 67);
	padding: 10px 15px;
	box-sizing: border-box;
	font-weight: bold;
}

#toBasket_bt {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
	padding: 10px 10px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 10px;
	font-weight: 50;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	width: 100px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: 0.5s;
}

#toDetail_bt {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
	padding: 10px 10px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 10px;
	font-weight: 50;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	width: 100px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: 0.5s;
}
</style>
<script>
	// 단순 페이지 이동을 위한 스크립트 함수
	function checkBasketOrDetail(dest) {
		if (dest == "basket") {
			opener.parent.location.href = "basketList.pulu"; // 자식창 닫고 부모창 basketList.jsp로 이동
			window.close();
		} else if (dest == "detail") { // 자식창 닫기
			window.close();
		}
	}
</script>


</head>

<body>
	<div class="basket1">
		<div style="width: 450px">
					<div class="title"></div>
					<br />장바구니에 상품을 담았습니다. 
					<br /> 
					<br /> 
					※ 상품이 이미 장바구니에 존재할 경우 '수량'만 증가합니다.
				<br />
			<br />
			<button type="submit" id="toBasket_bt"
				onclick="checkBasketOrDetail('basket')">장바구니 이동</button>
			<button type="submit" id="toDetail_bt"
				onclick="checkBasketOrDetail('detail')">쇼핑 계속하기</button>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 담기</title>
<style>
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");

.bakset1{
position:absolute;
width:100%;
height:100%;
background: rgba(0,0,0,0.8);
top:0; left:0;
display:none;
}


</style>
<script>
// 단순 페이지 이동을 위한 스크립트 함수
function checkBasketOrDetail(dest)
{
	if (dest == "basket") {
			opener.parent.location.href="basketList.pulu"; // 자식창 닫고 부모창 basketList.jsp로 이동
			window.close();
		} else if (dest == "detail") { // 자식창 닫기
			window.close();
		}
	}
</script>


</head>
<body>
<br/>
<div class="basket1">
<div class="basket2">
<br/><b><font size="4" color="black">장바구니에 상품을 담았습니다.</font></b><br/>
<br/><font size="2" color="gray">※ 상품이 이미 장바구니에 존재할 경우 '수량'만 증가합니다.</font><br/>
</div>
	</div>
<br/>
	<div id="check">
			<button type="submit" id="toBasket_bt" onclick="checkBasketOrDetail('basket')">장바구니 이동</button>
			<button type="submit" id="toDetail_bt" onclick="checkBasketOrDetail('detail')">쇼핑 계속하기</button>
	</div>
	
	
	
<!-- 	(window.open('basketCheck.pulu','win_','width=1024,height=768,status=no,toolbar=no,scrollbars=no')) -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<!-- 선아: nutritionFacts 영양정보표 -->


<style>
.parent{
    width: 70%;
    margin: 10px auto;
    display: flex;
}

.first {
    border: 1px solid #ddd;
    flex:1;
    width:30px;
    box-sizing: content-box;
    text-align: center;
    padding: 15px;
}

.second{
    border: 1px solid #ddd;
    flex:1;
    margin: 0px 5%;
    width:30px;
    box-sizing: border-box;
    text-align: center;
    padding: 15px;
}

.third{
     border: 1px solid #ddd;
    flex:1;
    width:30px;
    box-sizing: border-box;
    text-align: center;
    padding: 15px;
}
.button {
    background-color:#ddd;
    color: #fff;
    border:none;
    border-radius:10px;
  }
  


</style>

<head>
</head>
<body>
<br>
	<br>
	<center>
		<h1>영양 정보</h1>
		<h4>다양한 영양 정보들이 업데이트 되어있습니다</h4>
	</center>
	<br>
	<br>

<div style="padding: 20px 50px 50px 130px;">
<img class="nutritionFacts" src="./resources/img/nutritionFacts/balance.jpg" width="1285">
<br>
<img class="nutritionFacts" src="./resources/img/nutritionFacts/plus.jpg" width="1285">
<br>
<img class="nutritionFacts" src="./resources/img/nutritionFacts/minus.jpg" width="1285">
<br>
</div>

<center>
		<h1>가이드 라인</h1>
		<br>
		<hr width="25%" color="grey" >
	</center>
<br>
	<section class="section section4">
		<div class="parent">
			<div class="first">
				<div class="icon">
					<img src="./resources/img/nutritionFacts/guide-icon1.jpg" alt="">
				</div>
				<dl>
					<h3>영양성분표</h3>
					<h4>본인의 식습관과 식단을 고려하여 알맞은 메뉴를 선택하고 <br /> 부족한 영양소는 토핑 추가 등을 통해 보완하세요.</h4>
				</dl>
				<button type="button" class="button">
					<a href="./resources/img/nutritionFacts/nutritionPDF.pdf"
						class="btn-gradient red mini">영양성분표 보기</a>
				</button>
			</div>

			<div class="second">
				<div class="icon">
					<img src="./resources/img/nutritionFacts/guide-icon3.jpg" alt="">
				</div>
				<dl>
					<h3>칼로리표</h3>
					<h4>
						본인에게 맞는 열량을 확인하고 <br /> 다른 끼니의 열량을 고려하여 샐러디 메뉴를 선택하세요.
					</h4>
				</dl>
				<button type="button" class="button">
					<a href="./resources/img/nutritionFacts/caloriePDF.pdf"
						class="btn-gradient red mini">칼로리표 보기</a>
				</button>
			</div>

			<div class="third">
				<div class="icon">
					<img src="./resources/img/nutritionFacts/guide-icon2.jpg" alt="">
				</div>
				<dl>
					<h3>알레르기 정보</h3>
					<h4>
						특정 음식에 대해 알레르기가 있으신 고객분께서는 <br /> 메뉴 선택 전에 알레르기 정보를 꼭 확인하시기 바랍니다.
					</h4>
				</dl>
				<button type="button" class="button">
					<a href="./resources/img/nutritionFacts/allergyPDF.pdf"
						class="btn-gradient red mini">알레르기 정보 보기</a>
				</button>
			</div>
		</div>
	</section>
</body>
</html>
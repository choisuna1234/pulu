<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<title>회원탈퇴</title>
<link rel="stylesheet" type="text/css"
	href="./resources/css/board.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>

<style>
.deletecon{
	width: 100%;
    margin: 0 auto;
    *zoom: 1;
    max-width: 1920px;
}

.deletecon:after {
	content: "";
	display: block;
	clear: both;
}

.subdeletecon{
    width: 100%;
    max-width: 800px;
    margin: 0 auto;
}

h2 {
    margin: 45px 0 5px 0;
}
</style>

<script>
	function checkPasswordConfirm() {
		if ($("#str_Pw").val() == "") {
			alert("비밀번호를을 입력하세요.");
			document.frm.str_Pw.focus();
			return false;
		} else if ($("#str_Pw").val() != $("#str_loginPw").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#str_loginPw").focus();
			return false;
		} else {
			if (confirm("정말로 탈퇴하시겠습니까?")) {
				return true;
			}

		}

	}
</script>


</head>
<body>
<div class="deletecon">
	<div class="subdeletecon">
		<div style="text-align: center;">

			<h2>알려드립니다.</h2>

			<main>
				<div class="joinscroll" style="    overflow: scroll;   width: 800px;    height: 280px;    display: inline-block;">
					<h4>제7조(회원 탈퇴 및 자격 상실 등)</h4><br />
					<br> ① 회원은 “푸르뎁”에 언제든지 탈퇴를 요청할 수 있으며 “푸르뎁”은 즉시 회원탈퇴를 처리합니다.<br /><br />
					② 회원이 다음 각 호의 사유에 해당하는 경우, “푸르뎁”은 회원자격을 제한 및 정지시킬 수 있습니다.<br />
					- 가입 신청 시에 허위 내용을 등록한 경우<br />
					- “푸르뎁” 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br />
					- “푸르뎁”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br />
					<br />③ “푸르뎁”이 회원 자격을 제한, 정지 시킨
					후, 동일한 행위가 2회 이상 반복되거나, <br /> 30일 이내에 그 사유가 시정되지 아니하는 경우 “푸르뎁”은 회원자격을 상실시킬
					수 있습니다.<br /><br /> ④ “푸르뎁”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. <br />이 경우 회원에게 이를
					통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
				</div>
				<div style="line-height:200%;">
					

					<br/>
					<h4>${loginName} 회원님 회원탈퇴를 진행하시려면 비밀번호를 입력하고 '탈퇴하기' 버튼을 눌러주세요.</h4>
					<br>
<%-- 					<h5>회원 ID = ${loginId}</h5> --%>
				</div>

				<form class="needs-validation" method="post" id="frm" name="frm"
					action="deleteForm.pulu" onsubmit="return checkPasswordConfirm();">


					<input type="hidden" id="str_Num" name="str_Num"
						value="${loginNum}"> <input type="hidden" id="str_loginPw"
						name="str_loginPw" value="${loginPw}"> <label
						for="address2" class="form-label">비밀번호 </label> <input
						type="password" class="form-control" name="str_Pw" id="str_Pw"
						size="28" type="text" style="max-width: max-content;"> <br>
					<br>
					<hr class="col-3 col-md-2 mb-5"
						style="width: 470px">
					<br>
					<div style="text-align: center;" id="join_button">
						<input type="submit" name="submit" class="insert_bt btn" value="탈퇴하기">
						<input type="button" onclick="location.href='myPage.pulu'"
							class="insert_bt btn" value="마이페이지">
					</div>
				</form>
			</main>
		</div>
	</div>
</div>
</body>
</html>
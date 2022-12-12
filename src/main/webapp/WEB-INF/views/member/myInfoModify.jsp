<%@ page language="java" pageEncoding="UTF-8"%>

<!-- 선민: id속성값이 zipcode인 <input>에 우편번호 리턴 -->
<!-- 선민: id속성값이 addr1인 <input>에 주소 리턴 -->
<head>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 js -->
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<script>
	// 선민: 카카오 우편번호 api
	function kakaoPost() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.querySelector("#zipcode").value = data.zonecode;
				document.querySelector("#addr1").value = data.address
			}
		}).open();
	}

	// 선민: 유효성 검사
	function checkValidation() {
		var form = document.getElementById("join_form");
		var regNameExp = /^[가-힣]{2,4}$/; // 이름 유효성검사(한글) 정규식
		var regPasswordExp = /^[a-zA-Z0-9]{6,16}$/; // 비밀번호 유효성검사(영어대/소문자, 숫자) 정규식
		var regIdExp = /^[a-z0-9]{4,16}$/; // 아이디 유효성검사(영어소문자, 숫자) 정규식

		if (!regIdExp.test(form.id.value)) {
			alert("아이디는 4자~16자의 영어소문자, 숫자만 사용 가능합니다.");
			form.id.focus();
			return false;
		} else if (!regPasswordExp.test(form.password.value)) {
			form.password.focus();
			alert("비밀번호는 6자~16자의 영어대소문자, 숫자만 사용 가능합니다.");
			return false;
		} else if (form.password.value != form.password_confirm.value) {
			alert("비밀번호 확인이 비밀번호와 일치하지 않습니다.");
			form.password_confirm.focus();
			return false;
		} else if (form.name.value.length == 0) {
			alert("이름을 입력하세요.");
			form.name.focus();
			return false;
		} else if (!regNameExp.test(form.name.value)) {
			alert("이름이 올바르지 않습니다.");
			form.name.focus();
			return false;
		} else if (form.phone.value.length == 0) {
			alert("연락처를 입력하세요.");
			form.phone.focus();
			return false;
		} else if (isNaN(form.phone.value)) {
			alert("연락처는 숫자만 입력 가능합니다.");
			form.phone.focus();
			return false;
		} else if (!form.phone.value == 11) {
			alert("휴대전화 번호 11자리를 정확하게 입력하세요.");
			form.phone.focus();
			return false;
		} else if (form.email.value.length == 0) {
			alert("이메일을 입력하세요.");
			form.email.focus();
			return false;
		} else if (form.zipcode.value.length == 0) {
			alert("우편번호를 입력하세요.");
			form.zipcode.focus();
			return false;
		} else if (form.addr1.value.length == 0) {
			alert("주소를 입력하세요.");
			form.addr1.focus();
			return false;
		} else if (form.addr2.value.length == 0) {
			alert("주소를 입력하세요.");
			form.addr2.focus();
			return false;
		} else if (form.idCheck.value != "Checked") {
			alert("아이디 중복확인을 하지 않았습니다.");
			form.id.focus();
			return false;
		} else {
			alert("검증 완료");
		} else {
			alert('수정 완료되었습니다.'); 
			$("#terms_form").submit();

		}
	}

	// 선민: 중복확인 팝업창을 띄우는 동시에 최초 중복확인 실행
	function openIdCheck() {
		var id = document.getElementById("id").value; // 아이디 창에 기입된 값을 중복확인 팝업창에 Get으로 전달
		var url = "idCheckForm.pulu?INPUTID=" + id;
		var regIdExp = /^[a-z0-9]{4,16}$/; // 아이디 유효성검사(영어소문자, 숫자) 정규식

		if (id.length == 0) {
			alert("아이디를 입력하세요.");
			return false;
		} else if (!regIdExp.test(id)) {
			alert("아이디는 4자~16자의 영어소문자, 숫자만 사용 가능합니다.");
			form.id.focus();
			return false;
		} else { // 중복확인 팝업창 띄우기
			window.name = "parentForm";
			window
					.open(url, "childForm",
							"width=500, height=300, resizable=no");
		}
	}

	// 선민: 중복확인 완료(Checked) 후 아이디 창에 입력된 아이디를 지우거나 변경하면 기존 중복확인 완료여부를 무효화
	function inputIdCheck() {
		document.getElementById("idCheck").value = "Unchecked";
	}
</script>
</head>

<br>
<br>
<br>
<center>
	<h1>회원 정보 수정</h1>
</center>
<br>
<center>
<h3> ${loginId}님의 회원정보 입니다. </h3>
</center>


<hr width="70%" color="grey">

<br>
<br>
<br>

<div id="content">
	<div id="joinAll">
		<div id="joinForm">
			<!-- 선민: submit 시 passwordCheck() 함수 실행 -->
			<form id="terms_form" method="post" action="myPage.pulu"
				onsubmit="return checkValidation()" >

				<!-- 히든타입 폼이 필요할경우 여기에 추가 -->

				<div style="padding: 10px 50px 10px 250px;">
					<h2>기본 정보</h2>
					<hr width="35%" color="grey" align="left">
				</div>
				
				<div style="padding: 10px 50px 50px 250px;">
				
							<h3>아이디</h3>
						<span class="insertbox"> 
						<input type="text" name="ID" id="ID" class="insert" value="${map.ID}" maxlength="20" onkeydown="inputIdCheck()" readonly>
						</span>
						
					<div id="join_password1">
						<div id="join_Title">
							
							<h3>비밀번호</h3>
						</div>
						<span class="insertbox"> <input type="PASSWORD" name="PASSWORD" value="${map.PASSWORD}" id="password" class="insert" maxlength="20">
						</span>
						
						
					</div>
					<div id="join_password2">
						<div id="join_Title">
							
							<h3>비밀번호 확인</h3>
						</div>
						<span class="insertbox"> <input type="PASSWORD"
							id="password_confirm" class="insert" maxlength="20">
						</span>
					</div>
					<div id="join_name">
						<div id="join_Title">
							
							<h3>이름</h3>
						</div>
						<span class="insertbox"> <input type="text" name="NAME"
							id="NAME" class="insert" maxlength="10">
						</span>
					</div>
					<div id="join_phone">
						<div id="join_Title">
							
							<h3>연락처</h3>
						</div>
						<span class="insertbox"> <input type="text" name="PHONE"
							id="PHONE" class="insert" maxlength="11" placeholder="숫자만 입력하세요"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='숫자만 입력하세요'">
						</span>
					</div>
					<div id="join_email">
						<div id="join_Title">
							
							<h3>이메일</h3>
						</div>
						<span class="insertbox"> <input type="text" name="EMAIL"
							id="EMAIL" class="insert" maxlength="40">
						</span>
					</div>
					<div id="join_addressAll">
						<div id="join_zipcode">
							<div id="join_Title">
								
								<h3>우편번호</h3>
							</div>
							<span class="insertbox"> <input type="text" name="ZIPCODE"
								id="ZIPCODE" class="insert" maxlength="5"> <input
								type="button" class="zipcodebt" value="우편번호 찾기"
								onclick="kakaoPost()"> <!-- 선민: 버튼 클릭 시 kakaoPost() 함수 실행 -->
							</span>
						</div>
						<div id="join_address">
							<div id="join_Title">
								
								<h3>주소</h3>
							</div>
							<span class="insertbox"> <input type="text" name="ADDR1"
								id="ADDR1" class="insert" maxlength="200"><br> 
								<input type="text" name="ADDR2" id="addr2" class="insert"
								maxlength="200" size="40">
							</span>
							</div>
						</div>
					</div>
					<br />
					<br />
					<br />

					<!-- 작성완료 버튼 -->
					<div style="text-align: center;" id="join_button">
						<input type="submit" name="submit" class="insert_bt" value="수정 완료">
					</div>
			</form>
		</div>
	</div>
</div>

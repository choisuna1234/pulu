<%@ page language="java" pageEncoding="UTF-8"%>
<!-- 선민: id속성값이 zipcode인 <input>에 우편번호 리턴 -->
<!-- 선민: id속성값이 addr1인 <input>에 주소 리턴 -->
<style>
.titleArea {
	min-height: 30px;
	margin: 0px 0 20px;
}

.mpbtn {
    float: left;
    padding: 11px 220px 29px 220px;
    margin: 7px 0 0 0;
}
.boardList th, td {
    padding: 5px;
    border: 0;
    vertical-align: top;
}

.zipcode{
	width: 120px
}

.insert {
    height: 93px;
    width: 343px;
}
input[type=text], input[type=password] {
    height: 27px;
}

</style>



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
		var form = document.getElementById("modify_form");
		var regNameExp = /^[가-힣]{2,4}$/; // 이름 유효성검사(한글) 정규식
		var regPasswordExp = /^[a-zA-Z0-9]{6,16}$/; // 비밀번호 유효성검사(영어대/소문자, 숫자) 정규식
		var regIdExp = /^[a-z0-9]{4,16}$/; // 아이디 유효성검사(영어소문자, 숫자) 정규식

		if (!regPasswordExp.test(form.password.value)) {
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
		} else {
			alert("수정이 완료되었습니다");
		}
	}

	// 선민: 중복확인 완료(Checked) 후 아이디 창에 입력된 아이디를 지우거나 변경하면 기존 중복확인 완료여부를 무효화
	function inputIdCheck() {
		document.getElementById("idCheck").value = "Unchecked";
	}
</script>
<!-- 선아: 회원 정보 수정 -->
<div class="mpboard">
	<div class="boardcontainer">
		<div class="wid1280">
			<div class="titleArea">
				<h2>
					<font color="#555555">회원 정보 수정</font>
				</h2>
				<p>${loginId}님의회원정보입니다.</p>
			</div>
		</div>
	</div>
	<!-- 선아: 회원 정보 가져오기 -->
	<div id="content">
		<div id="joinAll">
			<form id="modify_form" name="myInfoModify" method="post"
				action="myInfoModify.pulu" onsubmit="return checkValidation()">
				<div id="modifyForm">


					<!-- 선아: 회원 정보 가져오기 -->
					<div>
						<h2>기본 정보</h2>
						<hr width="490px" color="#006F3E" align="left">
					</div>
				</div>

				<table>
					<colgroup>
						<col width="130px" />
						<col width="*" />
					</colgroup>
					<tr>
						<th align="left"><h3>아이디</h3></th>
						<td><span class="insertbox"> <input type="text"
								name="ID" id="id" class="insert" value="${myInfo.ID}"
								maxlength="20" onkeydown="inputIdCheck()" readonly>
						</span></td>
					</tr>

					<tr>
						<th align="left"><div id="join_Title">
								<h3>비밀번호</h3>
							</div></th>
						<td><span class="insertbox"> <input type="password"
								name="PASSWORD" id="password" class="insert" maxlength="20"
								value="${myInfo.PASSWORD}">
						</span></td>
					</tr>
					<tr>
						<th align="left"><div id="join_Title">
								<h3>비밀번호 확인</h3>
							</div></th>
						<td><span class="insertbox"> <input type="password"
								id="password_confirm" class="insert" maxlength="20">
						</span></td>
					</tr>
					<tr>
						<th align="left"><h3>이름</h3></th>
						<td><span class="insertbox"> <input type="text"
								name="NAME" value="${myInfo.NAME}" id="name" class="insert"
								maxlength="10">
						</span></td>
					</tr>
					<tr>
						<th align="left"><h3>연락처</h3></th>
						<td><span class="insertbox"> <input type="text"
								name="PHONE" value="${myInfo.PHONE}" id="phone" class="insert"
								maxlength="11" placeholder="숫자만 입력하세요"
								onfocus="this.placeholder=''"
								onblur="this.placeholder='숫자만 입력하세요'">
						</span></td>
					</tr>
					<tr>
						<th align="left"><div id="join_Title">
								<h3>이메일</h3>
							</div></th>
						<td><span class="insertbox"> <input type="text"
								name="EMAIL" value="${myInfo.EMAIL}" id="email" class="insert"
								maxlength="40">
						</span></td>
					</tr>
					<tr>
						<th align="left"><div id="join_Title">
								<h3>우편번호</h3>
							</div></th>
						<td><span class="insertbox"> <input type="text"
								name="ZIPCODE" value="${myInfo.ZIPCODE}" id="zipcode"
								class="zipcode" maxlength="5"> <input type="button"
								class="btn " value="우편번호 찾기" onclick="kakaoPost()">
								<!-- 선민: 버튼 클릭 시 kakaoPost() 함수 실행 -->
						</span></td>
					</tr>
					<tr>
						<th align="left"><div id="join_Title">
								<h3>주소</h3>
							</div></th>
						<td><span class="insertbox"> <input type="text"
								name="ADDR1" value="${myInfo.ADDR1}" id="addr1" class="insert"
								maxlength="200">
						</span></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text"
								name="ADDR2" id="addr2" class="insert" value="${myInfo.ADDR2}"
								maxlength="200" size="40"></td>
				</table>


				<!-- 작성완료 버튼 -->
				<div style="text-align: center;" id="modify_button">
					<input type="submit" name="myInfoModify" class="btn mpbtn" value="수정 완료">
				</div>
			</form>
		</div>
	</div>
</div>

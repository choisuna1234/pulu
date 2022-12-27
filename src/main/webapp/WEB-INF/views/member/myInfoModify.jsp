<%@ page language="java" pageEncoding="UTF-8"%>
<!-- 선민: id속성값이 zipcode인 <input>에 우편번호 리턴 -->
<!-- 선민: id속성값이 addr1인 <input>에 주소 리턴 -->
<head>
<style>
.join_Title {
	text-align: left;
}

#join_Title {
	margin-bottom: 20px;
}

.insert {
      display: inline-block;
      height: 10px;
      padding: 10px 10px 10px 20px;
      vertical-align: middle;
      border: 1px solid #dddddd;
      width: 25%;
      color: #999999;
      border-radius: 5px;
      size : 100px;
}
input {
  width:200px;
  height:100px;
    font-size:20px;
}
#btn{
width:100px;
height:25px;
}


</style>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	function checkValidation()
	{
		var form = document.getElementById("modify_form");
		var regNameExp = /^[가-힣]{2,4}$/;  // 이름 유효성검사(한글) 정규식
		var regPasswordExp = /^[a-zA-Z0-9]{6,16}$/;  // 비밀번호 유효성검사(영어대/소문자, 숫자) 정규식
		var regIdExp = /^[a-z0-9]{4,16}$/;  // 아이디 유효성검사(영어소문자, 숫자) 정규식

		if(!regPasswordExp.test(form.password.value)) {
		form.password.focus();
		alert("비밀번호는 6자~16자의 영어대소문자, 숫자만 사용 가능합니다.");
		return false;
		}
		else if(form.password.value != form.password_confirm.value) {
		alert("비밀번호 확인이 비밀번호와 일치하지 않습니다.");
		form.password_confirm.focus();
		return false;
		}
		else if(form.name.value.length == 0) {
		alert("이름을 입력하세요.");
		form.name.focus();
		return false;
		}
		else if (!regNameExp.test(form.name.value)) {
		alert("이름이 올바르지 않습니다.");
		form.name.focus();
		return false;
		}
		else if(form.phone.value.length == 0) {
		alert("연락처를 입력하세요.");
		form.phone.focus();
		return false;
		}
		else if(isNaN(form.phone.value)) {
		alert("연락처는 숫자만 입력 가능합니다.");
		form.phone.focus();
		return false;
		}
		else if(!form.phone.value == 11) {
		alert("휴대전화 번호 11자리를 정확하게 입력하세요.");
		form.phone.focus();
		return false;
		}
		else if(form.email.value.length == 0) {
		alert("이메일을 입력하세요.");
		form.email.focus();
		return false;
		}
		else if(form.zipcode.value.length == 0) {
		alert("우편번호를 입력하세요.");
		form.zipcode.focus();
		return false;
		}
		else if(form.addr1.value.length == 0) {
		alert("주소를 입력하세요.");
		form.addr1.focus();
		return false;
		}
		else if(form.addr2.value.length == 0) {
		alert("주소를 입력하세요.");
		form.addr2.focus();
		return false;
		}
		else {
		alert("수정이 완료되었습니다");
		}
	}

	// 선민: 중복확인 완료(Checked) 후 아이디 창에 입력된 아이디를 지우거나 변경하면 기존 중복확인 완료여부를 무효화
	function inputIdCheck() {
		document.getElementById("idCheck").value = "Unchecked";
	}
	
</script>
</head>
<!-- 선아: 회원 정보 수정 -->
<br>
<br>
<br>
<link rel="stylesheet" type="text/css" href="./resources/css/board.css" />
<div class="boardcontainer">
	<div class="wid1280">
		<div class="titleArea">
            <h2><font color="#555555">회원 정보 수정</font> </h2>
            <p>${loginId}님의 회원정보 입니다.</p>
        </div>
</div>
</div>
<br>
<br>
<br>
<!-- 선아: 회원 정보 가져오기 -->
<div id="content">
	<div id="joinAll">
		<div id="modifyForm">
			<form id="modify_form" name="myInfoModify" method="post" action="myInfoModify.pulu" onsubmit="return checkValidation()" >
				
					<!-- 선아: 회원 정보 가져오기 -->
				<div style="padding: 10px 50px 10px 122px;">
					<h2>기본 정보</h2>
					<hr width="35%" color="#006F3E"  align="left">
				</div>
		</div>
				
				<div style="padding: 10px 50px 50px 122px;">

			<div>
				<div id="join_id">
					<div id="join_Title">
						<span class="insertbox">					
						아이디 
						<input type="text" name="ID" id="id" class="insert"  value="${myInfo.ID}" maxlength="20" onkeydown="inputIdCheck()" readonly >
						</span>
					</div>
				</div>


				<div id="join_password1">
					<div id="join_Title">
						<span class="insertbox"> 
						비밀번호 
						<input type="password"
							name="PASSWORD" id="password" class="insert" 
							maxlength="20" value="${myInfo.PASSWORD}">
						</span>
					</div>
				</div>


				<div id="join_password2">
					<div id="join_Title">
						<span class="insertbox"> 비밀번호 확인
						<input type="password"
							id="password_confirm" class="insert"  maxlength="20">
						</span>
					</div>
				</div>


				<div id="join_Title">
					<span class="insertbox"> 이름 <input type="text" name="NAME"
						value="${myInfo.NAME}" id="name" class="insert" maxlength="10">
					</span>
				</div>



				<div id="join_phone">
					<div id="join_Title">
						<span class="insertbox"> 
						연락처 <input type="text"
							name="PHONE"  value="${myInfo.PHONE}" id="phone"
							class="insert" maxlength="11" placeholder="숫자만 입력하세요"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='숫자만 입력하세요'">
						</span>
					</div>
				</div>



				<div id="join_email">
					<div id="join_Title">
						<span class="insertbox"> 이메일 <input type="text"
							name="EMAIL"  value="${myInfo.EMAIL}" id="email"
							class="insert" maxlength="40">
						</span>
					</div>
				</div>




				<div id="join_addressAll">
					<div id="join_zipcode">
						<div id="join_Title">
							<span class="insertbox"> 우편번호 <input type="text"
								name="ZIPCODE" value="${myInfo.ZIPCODE}" id="zipcode"
								class="insert" maxlength="5" size="40"> 
								<input type="button" id="btn" class="btn"
								value="우편번호 찾기" onclick="kakaoPost()"> <!-- 선민: 버튼 클릭 시 kakaoPost() 함수 실행 -->
							</span>
						</div>
					</div>
				</div>


				<div id="join_address">
							<div id="join_Title">
							<span class="insertbox"> 
							주소 <input type="text" name="ADDR1" value="${myInfo.ADDR1}" id="addr1" class="insert" maxlength="200" >
							<br />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" name="ADDR2"id="addr2" class="insert" value="${myInfo.ADDR2}" maxlength="200" >
							</span>
						</div>
					</div>
				</div>
			</div>
			<br />
					<br />
					<br />

					<!-- 작성완료 버튼 -->
					<div style="text-align: center;" id="modify_button">
						<input type="submit" name="myInfoModify" class="btn" value="수정 완료" >
					</div>
			</form>
		</div>
	</div>
</div>
					
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<!-- 선아: 비밀번호 찾기 완료 -->

<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<script>
function checkValidation()
{
	var form = document.getElementById("newPassword_form");
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
	} else {
	alert("비밀번호 변경이 완료되었습니다.");
	}
}


</script>

<title>비밀번호 찾기</title>
</head>
<body>

<div id="memberInfo">
<div id="findIdPwd_result" style="text-align: center;">
<br>
<br>
<h2>비밀번호 찾기</h2>
<br>
<hr width="40%" color="grey">
<br>
<h3>회원님의 비밀번호는 ${findPw.PASSWORD} 입니다.</h3>
<h4>회원님의 개인정보를 안전하게 보호하고 개인정보 도용으로 인한 피해를 예방하기 위해 30일 이상 비밀번호를 변경하지 않은 경우 비밀번호 변경을 권장하고 있습니다</h4>
<br><br><br>

      <form id="newPassword_form" method="post" action="newPasswordResult.pulu" onsubmit="return checkValidation()">
      <input type="hidden" name="ID" id="ID" value="${findPw.ID}" />
<h4>비밀번호 재설정 하기</h4>
<hr width="10%" color="grey">
<br>
<h4>&nbsp;새 비밀번호 &nbsp;<input type="text" name="PASSWORD" id="password" class="insert" maxlength="20" ></h4>

<h4>비밀번호 확인&nbsp; <input type="text" name="password_confirm" id="password_confirm" class="insert" maxlength="20" ></h4>
<br>
<br>
<br>
<input type="submit" class="insert_bt" value="비밀번호 변경하기">
        </form>
</div>
</div>
</body>
</html>
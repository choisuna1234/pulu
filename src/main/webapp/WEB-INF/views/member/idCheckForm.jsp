<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<style>
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");

.part1 {
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
	
}
.list-container {
	flex-direction: column;
	width: 400px;
	height: 225px;
	align-self: center;
	border: 1px solid #eaeaea;
	background-color: white;
	font-family: "Noto Sans KR", sans-serif;
}
input {
  width: 500px;
  height: 32px;
  font-size: 13px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}

#inputId {
	width: 100px;
	height: 20px;
}

#inputId2 {
	width: 90px;
	height: 27px;
	background-color: #87a86f;
	box-shadow: 0px 4px 0px #87a86f;
}

#success {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
	padding: 7px 5px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 8px;
	font-weight: 50;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	width: auto;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: 0.5s;
}
#use_bt{
-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
	padding: 7px 5px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 8px;
	font-weight: 50;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	width: 60px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: 0.5s;
}
#cancel_bt {
-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
	padding: 7px 10px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 8px;
	font-weight: 50;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	width: 60px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: 0.5s;
}

</style>

<script>
	//선민: 팝업창에서 중복확인 실행
	function idCheck() {
		var id = document.getElementById("inputId").value; 
		var regIdExp = /^[a-z0-9]{4,16}$/;  // 아이디 유효성검사(영어소문자, 숫자) 정규식
		
		if(id.length == 0) {
		alert("아이디를 입력하세요.");
		return false;
		}
		else if (!regIdExp.test(id)) {
		alert("아이디는 4자~16자의 영어소문자, 숫자만 사용 가능합니다.");
		form.id.focus();
		return false;
		} else {}
	}
	
	// 선민: 사용하기 버튼 클릭 시 join.jsp의 hidden(id=idCheck)의 value를 Checked로 변경하고,
	// 중복확인이 완료된 아이디 값을 join.jsp의 아이디 창으로 전달
	function sendCheckedID() {
		opener.document.getElementById("idCheck").value = "Checked";
		opener.document.getElementById("id").value = document.getElementById("inputId").value;
		window.close();
	}
</script>

<meta charset="UTF-8">
<title>아이디 중복확인</title>
</head>
<body>
	<div class="list-container">
		<br />
		<b><font size="4" color="gray"><center>아이디 중복확인</center></font></b><br />
		<div class="part1">
			<form id="id_check_form" method="post" action="idCheckForm.pulu"
				onsubmit="return idCheck()">
				<input type="text" name="INPUTID" id="inputId" value="${inputId }">
				<input type="submit" value="중복확인" id="success" >

			</form>
			<br />
			<!-- 선민: 중복확인 결과에 따라 다른 메시지 출력 -->
			<c:choose>
				<c:when test="${idCheckResult == '0'}">
					<!-- 아이디 사용 가능 -->
				사용 가능한 아이디입니다.
			</c:when>
				<c:otherwise>
					<!-- 아이디 사용 불가능 -->
				이미 존재하는 아이디입니다.
			</c:otherwise>
			</c:choose>
			<div id="msg"></div>
			<br />

			<c:if test="${idCheckResult == '0'}">
				<input type="button" id="use_bt" value="사용하기"
					onclick="sendCheckedID()">
			</c:if>
			<input type="button" id="cancel_bt" value="닫기"
				onclick="window.close()">
		</div>
	</div>
</body>
</html>
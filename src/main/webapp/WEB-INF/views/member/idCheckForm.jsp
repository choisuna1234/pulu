<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
	<br/><b><font size="4" color="gray">아이디 중복확인</font></b><br/>
	<div id="check">
	
		<form id="id_check_form" method="post" action="idCheckForm.pulu" onsubmit="return idCheck()">
			<input type="text" name="INPUTID" id="inputId" value="${inputId }">
			<input type="submit" value="중복확인"> 
		</form><br/>
		
		<!-- 선민: 중복확인 결과에 따라 다른 메시지 출력 -->
		<c:choose>
			<c:when test="${idCheckResult == '0'}"> <!-- 아이디 사용 가능 -->
				사용 가능한 아이디입니다.
			</c:when>
			<c:otherwise> <!-- 아이디 사용 불가능 -->
				이미 존재하는 아이디입니다.
			</c:otherwise>
		</c:choose>
		<div id="msg"></div><br/>
		
		<c:if test="${idCheckResult == '0'}">
			<input type="button" id="use_bt" value="사용하기" onclick="sendCheckedID()">
		</c:if>
		<input type="button" id="cancel_bt" value="닫기" onclick="window.close()">
	</div>
</body>
</html>
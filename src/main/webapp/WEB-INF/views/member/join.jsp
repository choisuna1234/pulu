<%@ page language="java" pageEncoding="UTF-8"%>

<!-- 선민: id속성값이 zipcode인 <input>에 우편번호 리턴 -->
<!-- 선민: id속성값이 addr1인 <input>에 주소 리턴 -->
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 js -->
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<script>
	<!-- 선민: 카카오 우편번호 api -->
	function kakaoPost() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.querySelector("#zipcode").value = data.zonecode;
				document.querySelector("#addr1").value = data.address
			}
		}).open();
	}
	
	<!-- 선민: 유효성 검사 -->
	function checkValidation()
	{
		var form = document.getElementById("join_form");
		var regNameExp = /^[가-힣]{2,4}$/;  // 이름 유효성검사(한글) 정규식
		var regPasswordExp = /^[a-zA-Z0-9]{6,16}$/;  // 비밀번호 유효성검사(영어대/소문자, 숫자) 정규식
		var regIdExp = /^[a-z0-9]{4,16}$/;  // 아이디 유효성검사(영어소문자, 숫자) 정규식

		if (!regIdExp.test(form.id.value)) {
		alert("아이디는 4자~16자의 영어소문자, 숫자만 사용 가능합니다.");
		form.id.focus();
		return false;
		}
		else if(!regPasswordExp.test(form.password.value)) {
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
		else if(form.idCheck.value != "Checked") {
		alert("아이디 중복확인을 하지 않았습니다.");
		form.id.focus();
		return false;
		} else {
		alert("검증 완료");
		}
	}
	
	<!-- 선민: 중복확인 팝업창을 띄우는 동시에 최초 중복확인 실행 -->
	function openIdCheck()
	{
		var id = document.getElementById("id").value; // 아이디 창에 기입된 값을 중복확인 팝업창에 Get으로 전달
		var url = "idCheckForm.pulu?INPUTID=" + id;
		var regIdExp = /^[a-z0-9]{4,16}$/;  // 아이디 유효성검사(영어소문자, 숫자) 정규식
		
		if(id.length == 0) {
		alert("아이디를 입력하세요.");
		return false;
		}
		else if (!regIdExp.test(id)) {
		alert("아이디는 4자~16자의 영어소문자, 숫자만 사용 가능합니다.");
		form.id.focus();
		return false;
		} else { // 중복확인 팝업창 띄우기
		window.name = "parentForm";
		window.open(url, "childForm", "width=430, height=250, status=no, toolbar=no, scrollbars=no");
	         }
	}
	
	<!-- 선민: 중복확인 완료(Checked) 후 아이디 창에 입력된 아이디를 지우거나 변경하면 기존 중복확인 완료여부를 무효화 -->
	function inputIdCheck()
	{
		document.getElementById("idCheck").value = "Unchecked";
	}
	
	// 선아: 약관 동의 유효성검사
	$(document).ready(function() {
		$("#joinRegister_bt").click(function() {
			if ($("#check1").is(":checked") == false) {
				alert("개인정보 수집 및 이용에 동의 하셔야 다음 단계로 진행 가능합니다.");
				return false;
			} else if ($("#check2").is(":checked") == false) {
				alert("푸르뎁 개인정보 수집 및 이용약관 동의 동의 하셔야 다음 단계로 진행 가능합니다.");
				return false;
			} else {
				$("#terms_form").submit();

			}

		});
	});
	
	// 선아: 약관 동의 모두 체크
	function selectAll(selectAll)  {
		  const checkboxes = document.getElementsByName('checkAll');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
	}
</script>
</head>

<br>
<br>
<br>
<center>
<h1> 회원가입 </h1>
</center>
<br>
<center>
<h3> 푸르뎁 페이지에 오신 것을 환영합니다. 원활한 이용을 위해 회원가입을 진행해주세요.</h3>
</center>

<hr width="70%" color="grey">

<br>
<br>
<br>

<div id="content">
	<div id="joinAll">
		<div id="joinForm">
			<!-- 선민: submit 시 passwordCheck() 함수 실행 -->
			<form id="join_form" method="post" action="joinForm.pulu" onsubmit="return checkValidation()">
			
			<!-- 히든타입 폼이 필요할경우 여기에 추가 -->
			
				<div style="padding: 10px 50px 10px 250px;">
					<h2>기본 정보</h2>
					<hr width="35%" color="grey" align="left">
				</div>	
				<div style="padding: 10px 50px 50px 250px;">
					<div id="join_id">
						<button type="button" onclick="checkValidation()">스크립트 테스트</button>
						<div id="join_Title"><h3>아이디</h3></div>
						<span class="insertbox">
							<input type="text" name="ID" id="id" class="insert" maxlength="20" onkeydown="inputIdCheck()"> 
							<input type="button" class="idbt" value="중복확인" onclick="openIdCheck()"> 
							<input type="hidden" id="idCheck" value="Unchecked">
						</span>
					</div>
					<div id="join_password1">
						<div id="join_Title"><h3>비밀번호</h3></div>
						<span class="insertbox">
							<input type="password" name="PASSWORD" id="password" class="insert" maxlength="20"> 
						</span>
					</div>
					<div id="join_password2">
						<div id="join_Title"><h3>비밀번호 확인</h3></div>
						<span class="insertbox">
							<input type="password" id="password_confirm" class="insert" maxlength="20">
						</span>
					</div>
					<div id="join_name">
						<div id="join_Title"><h3>이름</h3></div>
						<span class="insertbox">
							<input type="text" name="NAME" id="name" class="insert" maxlength="10">
						</span>
					</div>
					<div id="join_phone">
						<div id="join_Title"><h3>연락처</h3></div>
						<span class="insertbox">
							<input type="text" name="PHONE" id="phone" class="insert" maxlength="11" placeholder="숫자만 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='숫자만 입력하세요'">
						</span>
					</div>
					<div id="join_email">
						<div id="join_Title"><h3>이메일</h3></div>
						<span class="insertbox">
							<input type="text" name="EMAIL" id="email" class="insert" maxlength="40">
						</span>
					</div>
					<div id="join_addressAll">
						<div id="join_zipcode">
							<div id="join_Title"><h3>우편번호</h3></div>
							<span class="insertbox"> 
								<input type="text" name="ZIPCODE" id="zipcode" class="insert" maxlength="5"> <input type="button" class="zipcodebt" value="우편번호 찾기" 
								onclick="kakaoPost()"> <!-- 선민: 버튼 클릭 시 kakaoPost() 함수 실행 -->
							</span>
						</div>
						<div id="join_address">
							<div id="join_Title"><h3>주소</h3></div>
							<span class="insertbox">
								<input type="text" name="ADDR1" id="addr1" class="insert" maxlength="200"><br>
								<input type="text" name="ADDR2" id="addr2" class="insert" maxlength="200" size="40">
							</span>
						</div>
					</div>
					<br/><br/><br/>
					
					<!-- 이용약관 -->
					<div class="wrap"> <!-- 선아: 이용약관 동의 버튼 꾸미기  -->
						<h2>이용약관 동의</h2>
						<hr width="80%" color="grey" align="left"><br>

						<h3>전체 동의</h3>
						<input type='checkbox' name='checkAll' value='selectall' id='checkall' onclick='selectAll(this)'/>
						<strong> 푸르뎁 이용약관, 개인정보 수집 및 이용, 프로모션 정보수신(선택)에 모두 동의합니다.</strong><br/><br/><br/>
						
						<input type='checkbox' name='checkAll' value='check1' id='check1'/>
						이용약관 동의 (필수)<br/>
						<div style="overflow: scroll; width: 900px; height: 80px; padding: 30px;">
							<strong>제1조(목적)</strong> <br/><br/>이 약관은 (주)푸르뎁(전자상거래 사업자)이 운영하는 푸르뎁 사이버 몰(이하 “몰”이라 한다)에서
							제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을
							규정함을 목적으로 합니다. ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이
							약관을 준용합니다.」<br/><br/><strong>제2조(정의)</strong> <br/><br/>① “몰”이란 (주)푸르뎁가 재화 또는 용역(이하 “재화 등”이라
							함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의
							영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다. <br/>② “이용자”란 “몰”에 접속하여 이
							약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다. <br/>③ ‘회원’이라 함은 “몰”에 회원등록을 한
							자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다. <br/>④ ‘비회원’이라 함은 회원에 가입하지
							않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다. <br/><br/><strong>제3조</strong> (약관 등의 명시와 설명 및 개정) <br/><br/>①
							“몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를
							포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게
							알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여
							볼 수 있도록 할 수 있습니다. <br/>② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중
							청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을
							제공하여 이용자의 확인을 구하여야 합니다. <br/>③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의
							규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및
							정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이
							약관을 개정할 수 있습니다. <br/>④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의
							초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는
							경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을
							명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. <br/>⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자
							이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다.
							다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에
							“몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. <br/>⑥ 이 약관에서 정하지 아니한 사항과 이
							약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가
							정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다. <br/>
						</div>
					</div><br/>
					<input type='checkbox' name='checkAll' value='check2' id='check2'/>
					푸르뎁 개인정보 수집 및 이용약관 동의 (필수)
					<div style="overflow: scroll; width: 900px; height: 80px; padding: 30px;">
						<strong>1. 개인정보 수집목적 및 이용목적</strong> <br/><br/>
						가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 <br/> 
						콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송, 금융거래 본인 인증 및 금융 서비스, 구매 및 배송 등 서비스 이용 안내 <br/><br/> 
						나. 회원 관리 <br/> 회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 연령확인,
						만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리, 고지사항 전달 <br/><br/> 
						<strong>2. 수집하는 개인정보 항목</strong> <br/><br/>
						가. 이름, 생년월일, 성별, 로그인ID, 비밀번호, 자택 전화번호, 휴대전화번호, 이메일 , 14세미만 가입자의 경우 법정대리인의 정보 <br/><br/> 
						<strong>3. 개인정보의 보유기간 및 이용기간</strong> <br/><br/>
						원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. <br/><br/> 
						가. 회사 내부 방침에 의한 정보 보유 <br/> 
						&nbsp&nbsp&nbsp- 보존이유: 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 <br/> 
						&nbsp&nbsp&nbsp- 보존기간: 5년 <br/> <br/> 
						나. 관련 법령에 의한 정보보유 사유 <br/>
						계약 또는 청약철회 등에 관한 기록 <br/>
						&nbsp&nbsp&nbsp- 보존이유: 「전자상거래 등에서의 소비자보호에 관한 법률」<br/>
						&nbsp&nbsp&nbsp- 보존기간: 5년 <br/> 
						대금 결제 및 재화 등의 공급에 관한 기록 <br/>
						&nbsp&nbsp&nbsp- 보존이유: 「전자상거래 등에서의 소비자보호에 관한 법률」<br/>
						&nbsp&nbsp&nbsp- 보존기간: 5년 <br/> 
						소비자 불만 또는 분쟁처리에 관한 기록 <br/>
						&nbsp&nbsp&nbsp- 보존이유: 「전자상거래 등에서의 소비자보호에 관한 법률」<br/>
						&nbsp&nbsp&nbsp- 보존기간: 3년 <br/>
						로그 기록 <br/>
						&nbsp&nbsp&nbsp- 보존이유: 「통신비밀 보호법」<br/>
						&nbsp&nbsp&nbsp- 보존기간: 3개월 <br/><br/> ※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.
					</div>
				</div>

				<div style="padding: 10px 50px 50px 250px;">
					<input type='checkbox' name='checkAll' value='check_3' id='check_3'/>프로모션 정보수신 (<u>선택</u>)
					<div style="overflow: scroll; width: 900px; height: 80px; padding: 30px;">
						할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.<br/> 
						단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.<br/>
						선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.<br/>
					</div>
				</div> 
				
				<!-- 작성완료 버튼 -->
				<div style="text-align:center;" id="join_button">
					<input type="reset" name="reset" class="insert_bt" value="다시작성">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" name="submit" class="insert_bt" value="작성완료" id="joinRegister_bt">
				</div>
			</form>
		</div>
	</div>
</div>

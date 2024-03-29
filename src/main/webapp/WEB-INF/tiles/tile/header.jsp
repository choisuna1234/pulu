<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet">

<html>
<head>

</head>
<body>
	<div class="container">

		<div id="logoWrap">
			<div id = "loginMenu">
				<div id="thirdMenu">
					<!-- 탑 메인바 오른쪽 로그인 메뉴 -->
					<ul id="loginUl">
	
						<c:choose>
							<c:when test="${loginStatus == null}">
								<!-- 로그인하지 않았을 때 -->
								<li><a class="loginLink" href="loginForm.pulu">로그인</a></li>
								<li><a class="loginLink" href="joinForm.pulu">회원가입</a></li>
								<li><a class="loginLink" href="noticeList.pulu">고객센터</a></li>
							</c:when>
							<c:otherwise>
	
								<c:if test="${loginGrade == 'Admin'}">
									<!-- 로그인한 사람이 관리자일 때 -->
									<li><strong>${loginName }</strong>님</li>
									<li><a class="loginLink" href="logout.pulu">로그아웃</a></li>
									<li><a class="loginLink" href="noticeList.pulu">고객센터</a></li>
									<li><a class="loginLink" href="adminMain.pulu"><img
											src="./resources/img/icon/head_icon_01.png" class="headicon"
											width="23px"></a></li>
									<li><a class="loginLink" href="basketList.pulu"><img
											src="./resources/img/icon/head_icon_02.png" class="headicon"
											width="29px"></a></li>
								</c:if>
								<c:if test="${loginGrade != 'Admin'}">
									<!-- 로그인한 사람이 관리자가 아닐 때 -->
									<li><strong>${loginName }</strong>님</li>
									<li><a class="loginLink" href="logout.pulu">로그아웃</a></li>
									<li><a class="loginLink" href="noticeList.pulu">고객센터</a></li>
									<li><a class="loginLink" href="myPage.pulu"><img
											src="./resources/img/icon/head_icon_01.png" class="headicon"
											width="23px"></a></li>
									<li><a class="loginLink" href="basketList.pulu"><img
											src="./resources/img/icon/head_icon_02.png" class="headicon"
											width="29px"></a></li>
								</c:if>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			<div id="Logo">
				<a href="main.pulu"><img src="./resources/Pulu_LogoG.png"
					width="110" height="88"></a>
			</div>
		</div>
		<div id="topMainMenuAll">
			<div id="topMenu" style="z-index: 0;">
				<div id="totalMenu">
					<!-- 탑 메인바 '전체 카테고리' -->
					<a class="menuLink" href="allList.pulu"><i class="fa-solid fa-bars"></i> 전체 카테고리 </a>
				</div>
				<div id="totalSide">
					<!-- 탑 메인바 왼쪽 '전체 카테고리' 마우스 올릴 시 나올 창 -->
					<div id="total_Category"></div>
				</div>
				<div id="secondMenu">
					<!-- 탑 메인바 중앙 카테고리 -->
					<ul id="menu_Categori">
						<li class="topMenuLi"><a class="menuLink"
							href="List.pulu?categoryNo=1">샐러드<span class="circle"></span></a></li>
						<li class="topMenuLi"><a class="menuLink"
							href="List.pulu?categoryNo=2">샌드위치</a></li>
						<li class="topMenuLi"><a class="menuLink"
							href="List.pulu?categoryNo=3">간식/음료</a></li>
						<li class="topMenuLi"><a class="menuLink"
							href="nutritionInfo.pulu">영양정보</a></li>
						<li class="topMenuLi"><a class="menuLink"
							href="storeMap.pulu">매장</a></li>
					</ul>
				</div>
			</div>
		</div>


	</div>
</body>
</html>

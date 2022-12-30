<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.left_title {
    font-size: 25px;
    color: #333;
    margin-bottom: 30px;
}
.left_cont {
    margin-top: 12px;
}
.left_cont ul {
    width: 100%;
    margin: 0 auto;
    padding: 0px;
    border-top: 1px solid #cccccc;
}
.left_cont ul li {
    border-bottom: 1px solid #cccccc;
}
.left_cont ul li a {
    display: block;
    padding: 15px 0;
    font-size: 15px;
    color: #555;
}


</style>


	<div>
		<div>
			<p class="left_title"><strong>마이페이지</strong></p>
			<p style="font-size: 15px;">
			<strong>${loginName} 님</strong>
			<br>
			</p>
			회원등급은 ${loginGrade} 입니다.
		
		</div>
		<div class="left_cont">
			<ul><li class="selected"><a href="myInfoOrder.pulu">주문 / 결제내역</a></li>
	            <li><a href="myReview.pulu">후기목록</a></li>
	            <li><a href="myInfoModify.pulu"">정보수정</a></li>
	            <li><a href="deleteForm.pulu">회원탈퇴</a></li>
	        </ul>
		</div>
	</div>
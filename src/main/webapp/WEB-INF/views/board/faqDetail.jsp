<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<link rel="stylesheet" type="text/css"
	href="./resources/css/board.css" />

<div class="boardcontainer">
	<div class="wid1280">
		<div class="titleArea">
            <h2><font color="#555555">FAQ</font> </h2>
            <p>푸르뎁의 새로운 소식을 알려드립니다.</p>
        </div>
		<div class="base-table boardWrite">
			<table border="1" summary>
				<colgroup>
					<col width="130px"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td colspan="3">${map.FAQ_SUBJECT}
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td>${map.FAQ_ID }</td>
	
					</tr>
					<tr>
						<td colspan="2">
							<ul class="etcArea">
	                            <li class="">
	                                <strong>작성일</strong> <span class="txtNum">${map.FAQ_DATE }</span>
	                            </li>
	                            <li class="">
	                                <strong>조회수</strong> <span class="txtNum">${map.FAQ_READCOUNT }</span>
	                            </li>
	                        </ul>
	                        <div class="detail">
	                        	<div class="boardview">
	                        		${map.FAQ_CONTENT }
	                        	</div>
	                        </div>
						</td>
					</tr>
			</table>
			<div class="base-button">	
				<a href="faqList.pulu" class="btnNo" id="list">목록으로</a>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#list").on("click", function(e) { //리스트
			e.preventDefault(); //
			fn_faqList();
		});
	});

	function fn_faqList() {
		var comSubmit = new ComSubmit();
		var currentPage;
		var isSearch;
		var searchNum;

		//			if (isSearch === null) { 
		comSubmit
				.setUrl("<c:url value='/faqList.pulu?searchNum=${searchNum}&isSearch=${isSearch}&currentPage=${currentPage}'/>");
		//			} else {
		//				comSubmit.setUrl("<c:url value='/adminFaqList.pulu?currentPage=${currentPage}'/>");
		//			}
		comSubmit.submit();

		//			history.go(-1);
	}
</script>

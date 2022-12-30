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
            <h2><font color="#555555">NOTICE</font> </h2>
            <p>푸르뎁의 새로운 소식을 알려드립니다.</p>
        </div>
		<div class="base-table boardWrite">
			<table>
				<colgroup>
					<col width="130px"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td colspan="3">${map.NOTICE_SUBJECT }
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td>${map.NOTICE_ID }</td>
	
					</tr>
					<tr>
						<td colspan="2">
							<ul class="etcArea">
	                            <li class="">
	                                <strong>작성일</strong> <span class="txtNum">${map.NOTICE_DATE }</span>
	                            </li>
	                            <li class="">
	                                <strong>조회수</strong> <span class="txtNum">${map.NOTICE_READCOUNT }</span>
	                            </li>
	                        </ul>
	                        <div class="detail">
	                        	<div class="boardview">
	                        		${map.NOTICE_CONTENT }
	                        	</div>
	                        </div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="base-button">	
				<a href="noticeList.pulu" class="btnNo" id="list">목록으로</a>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //리스트
				e.preventDefault();	//
				fn_noticeList();
			});
			
		});
		
		function fn_noticeList(){
			var comSubmit = new ComSubmit();
			var currentPage;
			var isSearch;
			var searchNum;
			
/* 			if (isSearch === null) { 
			comSubmit.setUrl("<c:url value='/adminFaqList.pulu?currentPage=${currentPage}'/>");
			} else { */
			comSubmit.setUrl("<c:url value='/noticeList.pulu?searchNum=${searchNum}&isSearch=${isSearch}&currentPage=${currentPage}'/>");
/* 			}*/
			comSubmit.submit(); 
			
//			history.go(-1);
		}
		
	</script>

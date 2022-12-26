<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<h2 onclick="location.href='adminNoticeList.pulu';">Notice</h2><br>
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글번호</th>
				<td>${map.NOTICE_NUM }</td>
				<th scope="row">조회수</th>
				<td>${map.NOTICE_READCOUNT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.NOTICE_ID }</td>
				<th scope="row">작성일</th>
				<td>${map.NOTICE_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.NOTICE_SUBJECT }</td>
			</tr>
			<tr>
			    <th scope="row">내용</th>
				<td colspan="4">${map.NOTICE_CONTENT }</td>
			</tr>
		</tbody>
	</table>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //리스트
				e.preventDefault();	//
				fn_adminNoticeList();
			});
			
			$("#update").on("click", function(e){ //수정하기
				e.preventDefault();
				fn_adminNoticeUpdate();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 
	            e.preventDefault();
	            fn_adminNoticeDelete();
	        });
		});
		
		function fn_adminNoticeList(){
			var comSubmit = new ComSubmit();
			var currentPage;
			var isSearch;
			var searchNum;
			
/* 			if (isSearch === null) { 
			comSubmit.setUrl("<c:url value='/adminNoticeList.pulu?currentPage=${currentPage}'/>");
			} else { */
			comSubmit.setUrl("<c:url value='/adminNoticeList.pulu?searchNum=${searchNum}&isSearch=${isSearch}&currentPage=${currentPage}'/>");
/* 			}*/
			comSubmit.submit(); 	
//			history.go(-1);
		}
		
		
		function fn_adminNoticeUpdate(){
			var notice_num = "${map.NOTICE_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminNoticeUpdateForm.pulu'/>");
			comSubmit.addParam("NOTICE_NUM", notice_num);
			comSubmit.submit();
		}
		
		function fn_adminNoticeDelete(){
			 var notice_num = "${map.NOTICE_NUM}";
	         var comSubmit = new ComSubmit();
	         comSubmit.setUrl("<c:url value='/adminNoticeDelete.pulu'/>");
	         comSubmit.addParam("NOTICE_NUM", notice_num);
	         comSubmit.submit();
	         
	      }
	</script>

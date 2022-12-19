<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--소영: QNA -->
<html>

<head>
	<%@ include file="/WEB-INF/include/include-header.jspf"%>
	<title>QNA</title>
	<link rel="stylesheet" href="resources/css/ui.css" type="text/css" />
</head>

<body>
<h2>QNA</h2>
<div class="row" align="center">
	
	<!--------------- 페이징 테스트 (안됨) --------------->
	<div class="paging">${pagingHtml}</div>
 
	<!--------------- 글쓰기 버튼 --------------->
	<input type="button" class="btn" id="insertQna" value="글쓰기"/>
	<div id="insertQnaD" style="display:none;">	
	<c:if test="${loginId == null}">
		<p>로그인 후 문의를 작성할 수 있습니다.</p>
	</c:if>
	<c:if test="${loginId != null}">
	<!--------------- 글쓰기 창 --------------->
		
			<form id="qnaInsert" action="qnaInsert.pulu" method="post">
				<table class="dummy" align="center" style="width: 90%" border="0">
					<tr>
						<td><input type="hidden" name="ID" value="${loginId}">
							<input type="hidden" name="QNA_GOODS_NUM" value="${map.GOODS_NUM}"> 
							<input type="hidden" name="GOODS_NUM" value="${map.GOODS_NUM}">

							<table border="0" class="QNAList" style="width: 90%; align-items: center">
								<tr>
									<td width=10%>제목</td>
									<td><textarea rows="2" cols="100" name="QNA_SUBJECT"></textarea>
									</td>
								</tr>
								<tr>
									<td width=10%>내용</td>
									<td><textarea rows="5" cols="100" name="QNA_CONTENTS"></textarea>
										<input type="submit" class="btn btn-default" value="등록" />
									</td>
							</table>
						</td>
					</tr>
				</table>
			</form>
		</c:if>
	</div>
	<!--------------- 리스트 --------------->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading"></div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table border="0" class="QNAList" align="center" style="width: 90%; align-self: center;" >
				
						<colgroup>
							<col width="10%" />
							<col width="*" />
							<col width="15%" />
							<col width="20%" />
						</colgroup>
				
						<thead>
							<tr class="" style="border-color: gray; height: 35px">
								<th scope="col" bgcolor="#d4d4d4">답변상태</th>
								<th scope="col" bgcolor="#d4d4d4">제목</th>
								<th scope="col" bgcolor="#d4d4d4">작성자</th>
								<th scope="col" bgcolor="#d4d4d4">작성일</th>
							</tr>
						</thead>
						
						<c:choose>
							<c:when test="${fn:length(qnaList) > 0}">
								<c:forEach items="${qnaList}" var="row">
									<tbody>
										<tr class="item" style="height: 35px">
											<td align="center">${row.QNA_STATUS }</td>
											<td align="left">${row.QNA_SUBJECT}
												<input type="hidden" id="QNA_NUM" value="${row.QNA_NUM }"></td>
											<td align="center">${row.QNA_ID }</td>
											<td align="center">${row.QNA_DATE }</td>
										</tr>
										<tr class="hide" bgcolor="#d4d4d4" style="height: 35px">
											<td bgcolor="white" width="10%"></td>
											<td colspan="2">
												<table>
													<c:choose>
														<c:when test="${row.QNA_COMMENT == null}">
															<tbody>
																<tr>
																	<td width="5%"><img alt="q" src="resources/img/icon/qq.png" width="30" height="30"></td>
																	<td width="*%">
																		${row.QNA_CONTENTS}
																		<%-- <c:if test='${loginId == "${row.QNA_ID}"}'> --%>
																			<form action="qnaDelete.pulu" role="form" id="qnaDelete" method="post">
																				<input type="hidden" name="ID" value="${loginId}">
																				<input type="hidden" name="QNA_GOODS_NUM"value="${row.GOODS_NUM}"> 
																				<input type="hidden" name="GOODS_NUM" value="${row.GOODS_NUM}">
																				<input type="hidden" name="QNA_ID" value="${row.QNA_ID}">
																				<input type="button" class="btn btn-default" value="X" onclick="qnaDelete('${row.QNA_NUM}')">
																			</form>
																			<a href='#this' type="button" class="btn btn-default" onclick="openQnaUpdate('${row.QNA_NUM}','${row.QNA_CONTENTS}')">수정
																		<%-- </c:if> --%>
																	
																	</td>
																</tr>
																<tr>
																	<td colspan="2"><img alt="line" src="resources/img/icon/line.png" width="100%" height="10"></td>
																</tr>
																<tr>
																	<td width="5%"><img alt="a" src="resources/img/icon/a.png" width="30" height="30"></td>
																	<td width="*%">댓글 없슈</td>
																</tr>
															</tbody>
														</c:when>
														<c:otherwise>
															<tbody>
																<tr>
																	<td width="5%"><img alt="q" src="resources/img/icon/qq.png" width="30" height="30"></td>
																	<td width="*%">
																		${row.QNA_CONTENTS}
																		<%-- <c:if test="${loginId != QNA_ID}"> --%>
																			<form action="qnaDelete.pulu" role="form" id="qnaDelete" method="post">
																				<input type="hidden" name="ID" value="${loginId}">
																				<input type="hidden" name="QNA_GOODS_NUM"value="${row.GOODS_NUM}"> 
																				<input type="hidden" name="GOODS_NUM" value="${row.GOODS_NUM}">
																				<input type="hidden" name="QNA_ID" value="${row.QNA_ID}">
																				<input type="button" class="btn btn-default" value="X" onclick="qnaDelete('${row.QNA_NUM}')">
																			</form>
																			<a href='#this' type="button" class="btn btn-default" onclick="openQnaUpdate('${row.QNA_NUM}','${row.QNA_CONTENTS}')">수정
																		<%-- </c:if> --%>
																			<input type="hidden" name="QNA_NUM"value="${row.QNA_NUM}"> 
																			<input type="hidden" name="QNA_CONTENTS"value="${row.QNA_CONTENTS}"> 
																		</a>
																	</td>
																</tr>
																<tr>
																	<td colspan="2"><img alt="line" src="resources/img/icon/line.png" width="100%" height="10">
																<tr>
																	<td width="5%"><img alt="a" src="resources/img/icon/aa.png" width="30" height="30"></td>
																	<!-- 이미지 추후 변경 필수!! -->
																	<td width="*%">${row.QNA_COMMENT}</td>
																</tr>
															</tbody>
														</c:otherwise>
													</c:choose>
												</table>
											</td>
											<td colspan="1" bgcolor="white" width="10%"></td>
										</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tbody>
									<tr style="height: 35px">
										<td colspan="4"><c:choose>
												<c:when test="${isSearch != null}"> 검색 결과가 없습니다 </c:when>
												<c:otherwise> 작성된 문의가 없습니다 </c:otherwise>
											</c:choose>
										</td>
									</tr>
								</tbody>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					
					<!--------------- 페이징 --------------->
					<div class="paging">${pagingHtml}</div></div>
					
				</div>
			</div>
		</div>
	</div>

	

				<!--------------- 검색 --------------->
<%-- 			<div style="text-align: center;">
					<div id="dataTables-example_filter" class="dataTables_filter">
						<form action="">
							<input type="hidden" name="QNA_GOODS_NUM"value="${map.GOODS_NUM}"> 
							<input type="hidden" name="GOODS_NUM" value="${map.GOODS_NUM}">
							<select class="form-control" name="searchNum" id="searchNum">
								<option value="0">제목</option>
								<option value="1">작성자</option>
							</select> <input class="form-control" type="text" name="isSearch"id="isSearch" /> <span>
								<button type="submit" class="btn btn-primary">검색</button>
							</span>
						</form>
					</div>
				</div> --%>


			<br />
			<%@ include file="/WEB-INF/include/include-body.jspf"%>
			
	<script type="text/javascript">
	// QNA 수정 팝업창 띄우기
		function openQnaUpdate(QNA_NUM) {
			var QNA_NUM = QNA_NUM;
	//		var QNA_CONTENTS = QNA_CONTENTS;
			window.open("qnaUpdateForm.pulu?QNA_NUM="+QNA_NUM, 'window_qnaUpdate', 'width=800, height=400, location=no, status=no, scrollbars=yes');
		}
	</script>

	<script type="text/javascript">
		$(function() {
			var article = (".QNAList .show");
			$(".QNAList .item  td").click(function() {
				var myArticle = $(this).parents().next("tr");
				var myArticle2 = $(this).parents().parents().next("tr");
				if ($(myArticle).hasClass('hide')) {
					$(article).removeClass('show').addClass('hide');
					$(myArticle).removeClass('hide').addClass('show');
					$(myArticle2).removeClass('hide').addClass('show');

				} else {
					$(myArticle).addClass('hide').removeClass('show');
					$(myArticle2).addClass('hide').removeClass('show');
				}
			});
		});
		
		
		$(function () {
			$('#insertQna').click(function() {
				$("#insertQnaD").show();
				$("#insertQnaD").none();
			})
		});

		
		function qnaDelete(QNA_NUM){
			var comSubmit = new ComSubmit("qnaDelete");
			if (confirm("삭제 하겠습니까?") == true) {
				comSubmit.setUrl("<c:url value='/qnaDelete.pulu' />");
				comSubmit.addParam("QNA_NUM", QNA_NUM);
				comSubmit.submit();
				opener.location.reload();
			}
		}
		
	</script>


	<script type="text/javascript">
		function qnaInsert(loginId, QNA_GOODS_NUM, QNA_NUM){
			var comSubmit = new ComSubmit("qnaInsert");
			comSubmit.setUrl("<c:url value='/qnaInsert.pulu' />");
			comSubmit.addParam("QNA_GOODS_NUM",QNA_GOODS_NUM);
			comSubmit.addParam("QNA_NUM", QNA_NUM);
			comSubmit.addParam("QNA_ID", loginId);
			comSubmit.submit();
			opener.location.reload();
			$("#insertQnaD").hide();
		}
	</script>
	
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!--소영: QNA jsp 테스트 -->
<html>
<head>

<!-- <style type="text/css">
table {width: 500px;}
.hide {display: none;}
.show {display: table-row;}
.item td {cursor: pointer;}
</style> -->

<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>QNA</title>
<link rel="stylesheet" href="resources/css/ui.css" type="text/css" />

</head>

<body>

<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header" onclick="location.href='adminQnaList.pulu';" >Notice</h2>
		</div>

	<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">문의</div>
					
		<!--------------- 글쓰기 버튼 --------------->
<!-- 		<a href="#this" class="btn" id="insert">글쓰기</a> -->

	<form action="" method="post">
			<div class="col-sm-3">
				<a href="/adminQnaList.pulu">
				<br>
				<button type="button" class="btn btn-outline btn-default">전체주문</button></a> 
				
				<select class="form-control" name="select" onchange="window.open(value,'_self');">
					<option value="">--답변상태--</option>
					<option value="/adminQnaList.pulu?searchNum=3&isSearch=%EB%8C%80%EA%B8%B0">답변대기</option>
					<option value="/adminQnaList.pulu?searchNum=3&isSearch=%EC%99%84%EB%A3%8C">답변완료</option>
				</select>
				
			</div>
		</form>
		

		<!--------------- 검색 --------------->
<br>
					<div>
						<div style="border: 1px; float: left; width: 310px;">
							<div class="form-group input-group">

									<form action="">
										<select class="form-control" name="searchNum" id="searchNum">
											<option value="0">상품번호</option>
											<option value="1">제목</option>
											<option value="2">작성자</option>
											<option value="3">답변상태</option>
										</select> <input class="form-control" type="text" name="isSearch"
											id="isSearch" /> <span>
											<button type="submit" class="btn btn-primary">검색</button>
										</span>
									</form>
									
								</div>
							</div>
						</div>
						<!--------------- 리스트 --------------->

						<div class="panel-body">
							<table width="100%"
								class="table table-striped table-bordered table-hover"
								id="QNAList">

								<thead>
									<tr>
										<th style="width: 3%" >문의번호</th>
										<th style="width: 5%">상품번호</th>
										<th style="width: 5%">답변상태</th>
										<th style="width: 5%">제목</th>
										<th style="width: 5%">작성자</th>
										<th style="width: 5%">작성일</th>

									</tr>
								</thead>

								<c:choose>
									<c:when test="${fn:length(qnaList) > 0}">
										<c:forEach items="${qnaList}" var="row">
											<tbody>
												<tr class="item">
													<td align="center">${row.QNA_NUM }</td>
													<td align="center">${row.QNA_GOODS_NUM }</td>
													<%-- <td align="center">${row.QNA_STATUS }</td> --%>
													<c:choose>
														<c:when test="${row.QNA_STATUS == '답변완료'}">
															<td>답변완료</td>
														</c:when>
														<c:when test="${row.QNA_STATUS == '답변대기'}">
															<td style="color: blue;">답변대기</td>
														</c:when>
														<c:otherwise>
															<td>결제방법(3)</td>
														</c:otherwise>
													</c:choose>
													<td align="left">${row.QNA_SUBJECT}<input
														type="hidden" id="QNA_NUM" value="${row.QNA_NUM }"></td>
													<td align="center">${row.QNA_ID }</td>
													<td align="center">${row.QNA_DATE }</td>
												</tr>
												<!--------------- 제목 클릭시 나타는 창 --------------->
												<div>
													<tr class="hide" bgcolor="#d4d4d4" height="10"
														style="height: 5px; padding: 0; border: 0px;">
														<td colspan="2" bgcolor="white"></td>
														<td colspan="3">
															<table>
																<c:choose>
																	<c:when test="${row.QNA_COMMENT == null}">
																		<tbody>
																			<tr>
																				<td width="15%"><img alt="q"
																					src="resources/img/icon/qq.png" width="30"
																					height="30"></td>
																				<td width="*%"><pre>${row.QNA_CONTENTS}</pre> <input
																					type="button" class="btn btn-default" value="X"
																					onclick="adminQnaDelete(${row.QNA_NUM})"></td>
																			</tr>
																			<tr>
																				<td colspan="2"><hr
																						style="width: 100%; padding: 0"></td>
																			</tr>
																			<tr>
																				<td width="15%"><img alt="a"
																					src="resources/img/icon/a.png" width="30"
																					height="30"></td>


																				<td width="*%" height="10px">
																					<!--------------- 댓글 입력 창 --------------->
																					<form role="form" id="adminQnaComInsert"
																						method="post" action="adminQnaComInsert.pulu">
																						<input type="hidden" name="QNA_NUM" id="QNA_NUM"
																							value="${row.QNA_NUM}" />
																						<table class="comInsert"
																							style="width: 100%; height: 100%; padding: 0px; border: 0px;">
																							<tr height="5px">
																								<td style="text-align: left; padding: 0px;"
																									height="100%" width="100%"><textarea
																										class="QNA_COMMENT" rows="10"
																										style="width: 100%; height: 100%"
																										placeholder="답변을 작성하세요" id="QNA_COMMENT"
																										name="QNA_COMMENT"></textarea></td>
																							</tr>
																						</table>
																						<input type="submit" class="btn btn-default"
																							value="답변완료"
																							onclick="adminQnaComInsert(${row.QNA_COMMENT},${row.QNA_NUM})">
																					</form> <!--------------- /댓글 입력 창 --------------->
																				</td>
																			</tr>
																		</tbody>
																	</c:when>
																	<c:otherwise>
																		<tbody>
																			<tr>
																				<td width="15%"><img alt="q"
																					src="resources/img/icon/qq.png" width="30"
																					height="30"></td>
																				<td width="*%"><pre>${row.QNA_CONTENTS}</pre> <input
																					type="button" class="btn btn-default" value="X"
																					onclick="adminQnaDelete(${row.QNA_NUM})"></td>
																			</tr>
																			<tr>
																				<!-- 내용/ 답변 분리 선 -->
																				<td colspan="2"><hr
																						style="width: 100%; padding: 0"></td>
																			</tr>
																			<tr id="comment">
																				<td width="15%"><img alt="a"
																					src="resources/img/icon/aa.png" width="30"
																					height="30"></td>
																				<!-- 이미지 추후 변경 필수!! -->
																				<td width="*%">
																					<!--------------- 댓글 창 --------------->
																					<form role="form" id="adminQnaComDelete"
																						method="post" action="adminQnaComDelete.pulu">
																						<input type="hidden" name="QNA_NUM" id="QNA_NUM"
																							value="${row.QNA_NUM}" />
																						<pre>${row.QNA_COMMENT}</pre>
																						<br>
																						<br>
																						<br> <input type="submit"
																							class="btn btn-default" value="답변삭제"
																							onclick="adminQnaComDelete(${row.QNA_COMMENT},${row.QNA_NUM})">
																						<input type="button" class="btn btn-primery"
																							id="comUpdate" name="comUpdate" value="답변수정"
																							onclick="adminQnaComUpdate()" />
																					</form>
																				</td>
																				<!--------------- /댓글 창 --------------->
																			</tr>
																			<tr>
																				<!-- class="hide2" id="hide2" -->
																				<!--------------- 댓글 수정 창 --------------->
																				<td width="15%"><img alt="a"
																					src="resources/img/icon/a.png" width="30"
																					height="30"></td>
																				<td width="*%" height="10px">
																					<form role="form" id="adminQnaComInsert"
																						method="post" action="adminQnaComInsert.pulu">
																						<input type="hidden" name="QNA_NUM" id="QNA_NUM"
																							value="${row.QNA_NUM}" />
																						<table class="comInsert"
																							style="width: 100%; height: 100%; padding: 0px; border: 0px;">
																							<tr height="5px">
																								<td style="text-align: left; padding: 0px;"
																									height="100%" width="100%"><textarea
																										class="QNA_COMMENT" rows="5"
																										style="width: 100%; height: 100%"
																										placeholder="${row.QNA_COMMENT}"
																										id="QNA_COMMENT" name="QNA_COMMENT">${row.QNA_COMMENT}</textarea>
																								</td>
																							</tr>
																						</table>
																						<input type="submit" class="btn btn-default"
																							value="수정완료"
																							onclick="adminQnaComInsert(${row.QNA_COMMENT},${row.QNA_NUM})">
																					</form>
																				</td>
																				<!--------------- /댓글 수정 창 --------------->
																			</tr>
																		</tbody>
																	</c:otherwise>
																</c:choose>
																</tbody>
															</table>
														</td>
														<td colspan="1" bgcolor="white"></td>
													</tr>
											</tbody>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tbody>
											<tr>
												<td colspan="5"><c:choose>
														<c:when test="${isSearch != null}"> 검색 결과가 없습니다 </c:when>
														<c:otherwise> 작성된 후기가 없습니다 </c:otherwise>
													</c:choose></td>
											</tr>
										</tbody>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>

						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- "row" -->

	<!--------------- 검색 --------------->

	<div>
		<div style="border: 1px; float: left; width: 310px;">
			<div class="form-group input-group">

				<form action="">
					<select style="width: 80px;" class="form-control" name="searchNum"
						id="searchNum">
						<option value="0">제목</option>
						<option value="1">내용</option>
					</select> <input class="form-control" type="text" name="isSearch" style="width: 190px;" 
						id="isSearch" /> 	<span class="input-group-btn">
						<button type="submit" class="btn btn-primary">
						<i class="fa fa-search"></i>
						</button>
					</span>
				</form>
			</div>
			</div>
			</div>
			

			<!--------------- 페이징 --------------->
			<div class="paging">${pagingHtml}</div>


			<br />
			<%@ include file="/WEB-INF/include/include-body.jspf"%>

			<script type="text/javascript">
		/* 테이블 아코디언 형식 적용 (show, hide : css 참고) */
		$(function() {
			var article = (".QNAList .show");
			$(".QNAList .item  td").click(function() {
				var myArticle =$(this).parents().next("tr");  
                if($(myArticle).hasClass('hide')) {  
                    $(article).removeClass('show').addClass('hide');  
                    $(myArticle).removeClass('hide').addClass('show'); 
                }  else {  
                    $(myArticle).addClass('hide').removeClass('show'); 
                }  
            });  
		});
		
		/* QNA 관리자 삭제 */
		function adminQnaDelete(QNA_NUM){
			var comSubmit = new ComSubmit();
			if (confirm("삭제 하겠습니까?") == true) {
				comSubmit.setUrl("<c:url value='/adminQnaDelete.pulu' />");
				comSubmit.addParam("QNA_NUM", QNA_NUM);
				comSubmit.submit();
				opener.location.reload();
			}
		}
	
		
		
		/************** QNA 코멘트 **************/
			
	/* QNA 답변 수정하기 버튼 누르면 수정폼 보여지기 */
		function adminQnaComUpdate() {
			var comSubmit = new ComSubmit();
			comSubmit.addParam("QNA_COMMENT",QNA_COMMENT);
			comSubmit.addParam("QNA_NUM", QNA_NUM);
			$.ajax({
				type : 'post',
				data : {
						QNA_NUM : "QNA_NUM",
						},
//			$("#hide2").show();
		 });
		}
		
/*		$(function () {
			$('#comUpdate').click(function() {
				$("#hide2").show();
			})
		});*/
/* 		function adminQnaComUpdate(QNA_COMMENT,QNA_NUM) {
			document.getElementById("sampleDiv").style.display ='block';
		} */
		
			
		

	
		/* QNA 답변 등록 & 수정 */
		function adminQnaComInsert(QNA_COMMENT,QNA_NUM){
			var comSubmit = new ComSubmit("adminQnaComInsert");
			comSubmit.setUrl("<c:url value='/adminQnaComInsert.pulu' />");
			comSubmit.addParam("QNA_COMMENT",QNA_COMMENT);
			comSubmit.addParam("QNA_NUM", QNA_NUM);
			comSubmit.submit();
			opener.location.reload();
		}
		
		/* QNA 답변 삭제 */
		function adminQnaComDelete(QNA_NUM){
			var comSubmit = new ComSubmit("adminQnaComDelete");
				comSubmit.setUrl("<c:url value='/adminQnaComDelete.pulu' />");
				comSubmit.addParam("QNA_COMMENT", QNA_COMMENT);
				comSubmit.addParam("QNA_NUM", QNA_NUM);
				comSubmit.submit();
				opener.location.reload();
		}
	</script>
</body>

</html>

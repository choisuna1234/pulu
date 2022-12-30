<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet" type="text/css" href="./resources/css/board.css" />


<style>
.qnaInsertForm{
	text-align: center;
}

.qnaptn {
	width:80px;
    border: 1px solid;
    float:right;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 500;
    line-height: 20px;
    padding: 5px 16px;
    background-color: #006F3E !important;
    border-color: #1b1f2326;
    box-shadow: 0 1px 0 #1b1f231a, inset 0 1px 0 #ffffff08;
    color: #fff;

}

.qnatitle{
	margin: 10px 10px 10px 10px;
}



.writecontents {
    border-radius: 10px 10px 10px 10px;
    padding: 17px 10px 6px 10px;
    height: 25px;
    width: 1000px;
    border: 1px solid #dadada;
    resize: none;
}

.QNAList th {
    vertical-align: top;
    padding: 17px;
}
.QNACommentDiv {
	word-break: break-all;
}

.inboard{

}

/* QNA 게시글 아코디언 */
 table {
	font-family: PureunJeonnam;
	padding: 10px;
	}
tr {
	padding: 10px;
}
td {
	padding: 10px;
} 
.hide {display: none;}
.show {display: table-row;}
.item td {cursor: pointer;}

.hide2 {display: none;}

@font-face { /* 나눔고딕 Regular */
	font-family: PureunJeonnam;
	font-style: normal;
	font-weight: 400;
	src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.eot);
	src:
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.eot?#iefix)
		format('embedded-opentype'),
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.ttf)
		format('truetype');
}


</style>

		<!--------------- 글쓰기 버튼 --------------->
		<div class="qnatitle">
			<span style="float: left; font-size: 18px; font-weight: bold; padding: 10px;">QNA</span>
			<input type="button" class="qnaptn" id="insertQna" value="글쓰기" />
		</div>

		<!--------------- 글쓰기 창 --------------->
		<div id="insertQnaD" style="display: none;">
			<form id="qnaInsertForm" action="qnaInsert.pulu" method="post">
				<table class="dummy" style="width: 90%; border: 0">
					<tr>
						<td><input type="hidden" name="ID" value="${loginId}">
							<input type="hidden" name="QNA_GOODS_NUM" value="${map.GOODS_NUM}"> 
							<input type="hidden" name="GOODS_NUM" value="${map.GOODS_NUM}">

							<table border="0" class="QNAList" style="width: 100%; align-items: center">
								<colgroup>
									<col width="80px">
									<col width="*">
								</colgroup>
								<tr>
									<th align="center">제목</th>
									<td align="left"><textarea rows="2" cols="100"name="QNA_SUBJECT" class="writecontents sub" style="resize: none"></textarea></td>
								</tr>
								<tr>
									<th align="center">내용 </th>
									<td align="left">
										<textarea rows="5" cols="100" id="QNA_CONTENTS" name="QNA_CONTENTS" style="height: 100px; width: 110; resize: none" class="writecontents cont"></textarea></td>
								</tr>
								<tr>
									<td align="center" colspan="2">
										<input type="button" class="btn btn-default" id="qnaInsert" onclick="qnaInsertBtn(); qnaInsertBr();" value="등록" style="width: 100px; margin-top: 10px;" /></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!--------------- 리스트 --------------->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading"></div>
					<!-- /.panel-heading -->
					<div class="panel-body">

						<div class="base-table boardList">
							<table border="0" class="QNAList board_list">

								<colgroup>
									<col width="10%">
									<col width="*">
									<col width="15%">
									<col width="20%">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">답변상태</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(qnaList) > 0}">
											<c:forEach items="${qnaList}" var="row">
												<tbody>
													<tr class="item" style="height: 35px">
														<td align="center">
															<strong><${row.QNA_STATUS}></strong>
														</td>
														<td align="left" style="text-align: left; padding-left: 50px">${row.QNA_SUBJECT}
															<input type="hidden" id="QNA_NUM" value="${row.QNA_NUM }"></td>
														<td align="center">${row.QNA_ID }</td>
														<td align="center">${row.QNA_DATE }</td>
													</tr>
													<tr class="hide" bordercolor="red">
														<td bgcolor="white" width="10%"></td>
														<td colspan="2">
																<table style="width: 100%; border-top: 0; border-bottom: 0; margin: 20px; resize: none" class="inboard">
																	<c:choose>
																		<c:when test="${row.QNA_COMMENT == null}">
																			<tbody>
																				<tr>
																					<td width="15%"  style="border: 0">
																						<img alt="q" src="resources/img/icon/qq.png" width="30" height="30">
																					</td>
																					<td width="85%" style="text-align: left; padding-left: 10px; resize: none; border: 0">
																						<p style="word-break: break-all;">${row.QNA_CONTENTS}</p>
																						<form action="qnaDelete.pulu" role="form" id="qnaDelete" method="post">
																							<input type="hidden" name="ID" value="${loginId}">
																							<input type="hidden" name="QNA_GOODS_NUM" value="${row.GOODS_NUM}"> 
																							<input type="hidden" name="GOODS_NUM" value="${row.GOODS_NUM}"> 
																							<input type="hidden" name="QNA_ID" value="${row.QNA_ID}">
	
																							<c:if test="${loginId == row.QNA_ID}">
																								<input type="button" class="btn btn-default qnaptn" value="삭제" onclick="qnaDelete('${row.QNA_NUM}')" style="width: 65px">
																								<a href="#this" type="button" class="btn btn-default qnaptn" onclick="openQnaUpdate('${row.QNA_NUM}')" style="width: 65px">수정 
																									<input type="hidden" name="QNA_CONTENTS" value="${row.QNA_CONTENTS}" />
																									<input type="hidden" name="QNA_COMMENT" value="${row.QNA_COMMENT}" />
																								</a>
																							</c:if>
																							
																						</form>
																					</td>
																				</tr>
																			</tbody>
																		</c:when>
																		<c:otherwise>
																			<tbody style="border: 0">
																				<tr>
																					<td width="6%"  style="border: 0">
																						<img alt="q" src="resources/img/icon/qq.png" width="30" height="30"></td>
																					<td width="*%" style="text-align: left; padding-left: 10px; resize: none; border: 0">
																						<p style="word-break: break-all;">${row.QNA_CONTENTS}</p>
	
	
																						<form action="qnaDelete.pulu" role="form" id="qnaDelete" method="post">
																							<input type="hidden" name="ID" value="${loginId}">
																							<input type="hidden" name="QNA_GOODS_NUM" value="${row.GOODS_NUM}"> 
																							<input type="hidden" name="GOODS_NUM" value="${row.GOODS_NUM}"> 
																							<input type="hidden" name="QNA_ID" value="${row.QNA_ID}">
	
																							<c:if test="${loginId == row.QNA_ID}">
																								<input type="button" class="btn btn-default qnaptn" value="삭제" onclick="qnaDelete('${row.QNA_NUM}')">
	
																								<a href="#this" type="button" class="btn btn-default qnaptn" onclick="openQnaUpdate('${row.QNA_NUM}','${row.QNA_COMMENT}')">수정
																									<input type="hidden" name="QNA_CONTENTS" value="${row.QNA_CONTENTS}" /> 
																									<input type="hidden" name="QNA_COMMENT" value="${row.QNA_COMMENT}" />
																								</a>
																							</c:if>
																						</form>
	
																					</td>
																				</tr>
																				<tr>
																					<td width="15%"><img alt="a" src="resources/img/icon/aa.png" width="30" height="30"></td>
																					<!-- 이미지 추후 변경 필수!! -->
																					<td width="*%" style="text-align: left; padding-left: 10px; resize: none">${row.QNA_COMMENT}</td>
																				</tr>
																			</tbody>
																		</c:otherwise>
																	</c:choose>
																</table>
														</td>
														<td colspan="1" bgcolor="white" width="20%"></td>
													</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tbody>
												<tr style="height: 35px">
													<td colspan="4"><c:choose>
															<c:when test="${isSearch != null}"> 검색 결과가 없습니다 </c:when>
															<c:otherwise> 작성된 문의가 없습니다 </c:otherwise>
														</c:choose></td>
												</tr>
											</tbody>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
					<!--------------- 페이징 --------------->
				<div class="paging greenp">${pagingHtml1}</div>
				</div>
			</div>
		</div>



	<!--------------- 검색 --------------->
	<%--          <div style="text-align: center;">
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
      /************ QNA 수정 팝업창 띄우기 ************/
      function openQnaUpdate(QNA_NUM, QNA_COMMENT) {
         var QNA_NUM = QNA_NUM;
         var QNA_COMMENT = QNA_COMMENT;
         var URL = "qnaUpdateForm.pulu?QNA_NUM=" + QNA_NUM;
      		
         if(QNA_COMMENT == null || QNA_COMMENT == undefined) {
            window.open(URL,
                     'window_qnaUpdate',
                     'width=500, height=500, location=no, status=no');
         } else if(QNA_COMMENT != null || QNA_COMMENT != undefined){
            alert("답변 완료된  Q&A는 수정할 수 없습니다.");
         }
      }

      /************ QNA 리스트 아코디언 ************/
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

      /************ QNA 글쓰기 창 열기 ************/
      $(function() {
         $('#insertQna').click(function() {
            if(${loginId != null}) {
               $("#insertQnaD").show();
               } else {
                  if (confirm("로그인 후 Q&A를 남길 수 있습니다.\n 로그인 하시겠습니까?") == true) {
                  location.href="/loginForm.pulu";
            }
               }
      })
      });


      /************ QNA 삭제 확인 알림 띄우기 ************/
      function qnaDelete(QNA_NUM) {
         var comSubmit = new ComSubmit("qnaDelete");
         if (confirm("삭제 하겠습니까?") == true) {
            comSubmit.setUrl("<c:url value='/qnaDelete.pulu' />");
            comSubmit.addParam("QNA_NUM", QNA_NUM);
            comSubmit.submit();
            location.href = location.href;
         }
      }

      /************ QNA 등록 유효성 검사 + 등록 ************/
      function qnaInsertBtn() {
         var comSubmit = new ComSubmit("qnaInsertForm");

         if (qnaInsertForm.QNA_SUBJECT.value.length == 0) {
            qnaInsertForm.QNA_SUBJECT.focus();
            alert("Q&A 제목을 입력하세요.");
            return false;
         }
         if (qnaInsertForm.QNA_CONTENTS.value.length == 0) {
            alert("Q&A 내용을 입력하세요.");
            qnaInsertForm.QNA_CONTENTS.focus();
            return false;
         }
         if (qnaInsertForm.QNA_SUBJECT.value.length >= 60) {
            qnaInsertForm.QNA_SUBJECT.focus();
            alert("Q&A 제목의 글자 수는 20자로 제한합니다.");
            return false;
         }
         if (qnaInsertForm.QNA_CONTENTS.value.length >= 3000) {
            qnaInsertForm.QNA_CONTENTS.focus();
            alert("Q&A 내용의 글자 수는 1000자로 제한합니다.");
            return false;
         }
         comSubmit.setUrl("<c:url value='/qnaInsert.pulu' />");
         comSubmit.submit();
         opener.location.href = location.href;

      }

      </script>

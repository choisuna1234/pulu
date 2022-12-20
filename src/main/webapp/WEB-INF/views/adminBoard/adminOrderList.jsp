<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>

<%@ include file="/WEB-INF/include/include-header.jspf"%> 
<link rel="stylesheet" href="resources/css/ui.css" type="text/css" />
</head>
<body>

<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header" onclick="location.href='adminOrderList.pulu';">일반 상품 주문관리</h1>
		</div>

<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">주문 관리</div>
					<div class="panel-body">
   <form action="" method="post">
      <div class="col-sm-6">
         <a href="/adminOrderList.pulu">
         <button type="button" class="btn btn-primary">전체주문</button></a> 
         
         <select class="form-control" name="select" onchange="window.open(value,'_self');">
            <option value="">--주문상태--</option>
            <option value="/adminOrderList.pulu?searchNum=0&isSearch=0">주문접수</option>
            <option value="/adminOrderList.pulu?searchNum=0&isSearch=1">결제완료</option>
            <option value="/adminOrderList.pulu?searchNum=0&isSearch=2">배송준비</option>
            <option value="/adminOrderList.pulu?searchNum=0&isSearch=3">배송중</option>
            <option value="/adminOrderList.pulu?searchNum=0&isSearch=4">배송완료</option>
            <option value="/adminOrderList.pulu?searchNum=0&isSearch=5">주문취소</option>
         </select>

      </div>
   </form>
   <!-- /.row -->
   <div class="row">
      <div class="col-lg-12">
         <div class="panel panel-default">
            <div class="panel-heading"></div>
            <!-- /.panel-heading -->
            <div class="panel-body">
               <form action="" id="adminOrderList" method="post">
               <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                  <thead>
                     <tr>
                        <th>주문번호</th>
                        <th>송장번호</th>
                        <th>주문상품</th>
                        <th>회원ID</th>
                        <th>주문합계</th>
                        <th>결제방식</th>
                        <th>주문상태</th>
                        <th>주문일자</th>
                        <th>수정/삭제</th>
                     </tr>
                  </thead>
                  <tbody align="center">
                     <tr class="odd gradeX">
                        <c:choose>
                           <c:when test="${fn:length(orderList) > 0}">
                              <c:forEach items="${orderList}" var="row" varStatus="status">
                              
                                 <tr>
                                    
                                    <td><a href='#this' onclick="openOrderDetail('${row.ORDER_NUM}')">${row.ORDER_NUM}</a></td>
                                    <form id="adminOrderList">
                                       <input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${row.ORDER_NUM}">
                                    </form>
                                    <td>00000000</td>
                                    <td>${row.ORDER_GOODS_NAME} 외 <span>${row.ORDER_GOODS_AMOUNT}개</span></td>
                                    <td>${row.ORDER_MEMBER_ID}</td>
                                    <td>${row.ORDER_SUM_MONEY}원</td>
                                    <%-- <td><fmt:formatNumber pattern="#,###.##" value="${row.ORDER_SUM_MONEY}" type="number"/>원</td> --%>
                                    <c:choose>
                                       <c:when test="${row.ORDER_PAY_TYPE == 0}"><td>무통장입금</td></c:when>
                                       <c:when test="${row.ORDER_PAY_TYPE == 1}"><td>카드결제</td></c:when>
                                       <c:otherwise><td>결제방법(3)</td></c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                       <c:when test="${row.ORDER_STATUS == 0}"><td>주문접수</td></c:when>
                                       <c:when test="${row.ORDER_STATUS == 1}"><td>결제완료</td></c:when>
                                       <c:when test="${row.ORDER_STATUS == 2}"><td>배송준비</td></c:when>
                                       <c:when test="${row.ORDER_STATUS == 3}"><td>배송중</td></c:when>
                                       <c:when test="${row.ORDER_STATUS == 4}"><td>배송완료</td></c:when>
                                       <c:otherwise><td style="color: red">주문취소</td></c:otherwise>
                                    </c:choose>
                                    <td>${row.ORDER_DATE}</td>
                                    <td>
                                       
                                       <form role="form" id="adminOrderDelete"  method="post">
                                          <%-- <input type="hidden" id="ORDER_NUM${status.index }" name="ORDER_NUM" value="${row.ORDER_NUM}"> --%>
                                          <!-- <input type="button" value="삭제" class="btn btn-danger" onclick="checkOrderDelete()"> -->
                                          <input type="button" class="btn btn-default" value="주문취소" onclick="checkOrderDelete(${row.ORDER_NUM})">
                                       </form>
                                    </td>                                 
                                 </tr>
                                 
                              </c:forEach>
                           </c:when>
                           <c:otherwise>
                              <tr>
                                 <td colspan="9">조회된 결과가 없습니다.</td>
                              </tr>
                           </c:otherwise>
                        </c:choose>
                     </tr>
                  </tbody>
               </table>
               </form>
               <div>
               
               
               <!-- 페이징 -->
               <div class="paging">${pagingHtml}</div>
               
               <!-- 검색 -->
               <div style="text-align: center;">
                  <div id="dataTables-example_filter" class="dataTables_filter">
                     <form action="">
                        <select class="form-control" name="searchNum" id="searchNum">
                           <option value="1">회원ID</option>
                           <option value="2">주문번호</option>
                        </select> 
                           <input class="form-control" type="text" name="isSearch" id="isSearch" /> <span>
                           <button type="submit" class="btn btn-primary">검색</button>
                        </span>
                     </form>
                  </div>
               </div>
               </div>

            </div>
            <!-- /.panel-body -->
         </div>
         <!-- /.panel -->
      </div>
      <!-- /.col-lg-12 -->
   </div>
   <!-- /.row -->
</div> <!-- "row" --> 
<%@ include file="/WEB-INF/include/include-body.jspf"%>


<script type="text/javascript">
// 회원정보 상세보기 팝업창 띄우기 + Post로 값 넘기기
   function openOrderDetail(ORDER_NUM) {
      var orderNum = ORDER_NUM;
      window.open("adminOrderDetail.pulu?ORDER_NUM="+orderNum, 'window_adminOrderDetail', 'width=430, height=600, location=no, status=no, scrollbars=yes');
   }
</script>

<script type="text/javascript">
   function checkOrderDelete(ORDER_NUM){
      if (confirm("주문 취소 하겠습니까?") == true) {
      var comSubmit = new ComSubmit("adminOrderDelete");
      comSubmit.setUrl("<c:url value='/adminOrderDelete.pulu' />");
      comSubmit.addParam("ORDER_NUM", ORDER_NUM);
      comSubmit.submit();
      opener.parent.location.reload();
      }
   }
</script>

</body>
</html>

    
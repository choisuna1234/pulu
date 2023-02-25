<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/include/include-header.jspf" %>
<style>


.row th{
	text-align: center;
}

table.table-bordered tbody th, table.table-bordered tbody td {
	text-align: center;
    vertical-align: middle;
}

.input-group-btn:last-child>.btn, .input-group-btn:last-child>.btn-group {
    height: 34px;
}

.agoodsimg{
	width:100px;
}
.box-body {
    float: right;
}
form#Search {
    display: inline;
}
</style>




<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Goods</h1>
		</div>

		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">상품목록</div>
					
					<div class="panel-body">
					
		
					
					
						<a href="./adminGoodsInsertForm.pulu" id="insert" class="btn btn-primary">글쓰기</a>
						<form id="Search" name="Search">
						  <div class="box-body" >
				                
				            <select id="isSearch" name="isSearch" >
				                <option value="" >선택</option>
				                <option value="등록순" >등록순</option>
				                <option value="카테고리" >카테고리</option>
				                <option value="가격순"  >가격순</option>
				                <option value="삭제여부"  >삭제여부</option>
				            </select>      
				                
				            <select  id="searchNum" name="searchNum" onchange="getOption()">
				                <option value="">---------------------</option>
				            </select>
				          </div>
						</form>
						<br>
						<br>
						<table width="100%"
							class="table table-striped table-bordered table-hover"
							id="adminNoticeList">
							<colgroup>
								<col width="5%" />
								<col width="7%" />
								<col width="120px" />
								<col width="*" />
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="5%" />
								<col width="5%" />
							</colgroup>
							<thead align="center">
								<tr>
									<th scope="col">번호</th>
									<th scope="col">분류</th>
									<th scope="col">이미지</th>
									<th scope="col">상품명</th>
									<th scope="col">수량</th>
									<th scope="col">가격</th>
									<th scope="col">날짜</th>
									<th scope="col" colspan="2">관리${list}</th>
								</tr>
							</thead>
						
							<tbody>
							
									<c:choose>
										<c:when test="${fn:length(adminlist) > 0}">
											<c:forEach items="${adminlist}" var="row">
												<tr class="odd gradeX">
													<td>${row.GOODS_NUM }<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${row.GOODS_NUM}"></td>
													<td><c:if test="${row.GOODS_CATEGORY == 1}">샐러드</c:if> <c:if
															test="${row.GOODS_CATEGORY == 2}">샌드위치</c:if> <c:if
															test="${row.GOODS_CATEGORY == 3}">간식/음료</c:if></td>
													<td><img src="./resources/file/${row.IMAGE_STORED}" class="agoodsimg"></td>
													<td>${row.GOODS_NAME }</td>
													<td>${row.GOODS_AMOUNT}</td>
													<td>${row.GOODS_PRICE}</td>
													<td><fmt:formatDate value="${row.GOODS_DATE}" pattern="yyyy-MM-dd"/></td>
													<td><a href="/adminGoodsUpdateForm.pulu?GOODS_NUM=${row.GOODS_NUM}" class="btn" name="update" id="update">수정</a></td>
													<c:if test="${row.GOODS_DELETE == 'N'}">
										<td><button type="submit" class="btn btn-primary" id="deletee" onclick="fn_deleteBoard(${row.GOODS_NUM})">삭제</button></td>
										</c:if>
									    <c:if test="${row.GOODS_DELETE == 'Y'}">
                                          <td><a href="/adminGoodsUpdateD.pulu?GOODS_NUM=${row.GOODS_NUM}" class="btn" id="updateDelete"  onclick="updateCheck()">삭제취소</a></td>
                                        </c:if>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr class="odd gradeX">
												<td colspan="4">조회된 결과가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
									
							</tbody>
						
						</table>
						
						${pagingHtml}

						<div>
							<div style="border: 1px; float: left; width: 310px;">
								<div class="form-group input-group">


									<!-- <div id="dataTables-example_filter" class="dataTables_filter"> -->
									<form action="">
										<select class="form-control" name="searchNum" id="searchNum"
											style="width: 80px;">
											<option value="0">제목</option>
											<option value="1">내용</option>
										</select> <input class="form-control" type="text" name="isSearch"
											id="isSearch" style="width: 190px;" /> <span
											class="input-group-btn">
											<button type="submit" class="btn btn-primary">
												<i class="fa fa-search"></i>
											</button>
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
	</div>



<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">

 /* function gfn_isNull(str) {
	if (str == null) return true;
	if (str == "NaN") return true;
	if (new String(str).valueOf() == "undefined") return true;    
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;    
    if (chkStr.toString().length == 0 ) return true;   
    return false; 
}


function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	
	if(this.formId == "commonForm"){
		$("#commonForm")[0].reset();
		$("#commonForm").empty();
	}
	
	this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.addParam = function addParam(key, value){
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
	};
	
	this.submit = function submit(){
		var frm = $("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();	
	};
}  */
/* 
	 function removeCheck() {
		if (confirm("정말 삭제하시겠습니까??") == true){
		    document.frm.submit();
		}else{ 
		    return false;
		}
	}  */

		
		$(document).ready(function(){
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			  $("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();			
			});
		});  
		
		function fn_updateBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminGoodsUpdateForm.pulu' />");
			comSubmit.addParam("GOODS_NUM", $("#GOODS_NUM").val());
			comSubmit.submit();
		}
		
		function fn_deleteBoard(GOODS_NUM){
			 
			if (confirm("정말 삭제하시겠습니까??") == true){
				
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminGoodsDelete.pulu' />");
			comSubmit.addParam("GOODS_NUM", GOODS_NUM); 
			comSubmit.submit();
			}
		}
		

		function updateCheck() {
			 if (confirm("삭제 취소하시겠습니까??") == true){
			     document.frm.submit();
			 }else{ 
			     return false;
			 }
		}
		
		$(function(){
		    $('select[name="isSearch"] ').on('change', function()  {
		        let arrType = getAgreeType();
		        let optionType = $(this).parents('.box-body').find($('select[name="searchNum"]'));
		        optionType.empty();
		        
		        if($(this).val() == '등록순'){ 
		            for(prop in arrType['등록순']){
		                optionType.append('<option value='+prop+'>'+arrType['등록순'][prop]+'</option>');
		               
		            }
		        }else if($(this).val() == '카테고리'){                            
		            for(prop in arrType['카테고리']){
		                optionType.append('<option value='+prop+' >'+arrType['카테고리'][prop]+'</option>');
		            } 
		        }else if($(this).val() == '가격순'){                            
		            for(prop in arrType['가격순']){
		                optionType.append('<option value='+prop+' >'+arrType['가격순'][prop]+'</option>');
		            }
		        }else{                            
		            for(prop in arrType['삭제여부']){
		                optionType.append('<option value='+prop+' >'+arrType['삭제여부'][prop]+'</option>');
		            }    
		        }        
		    });
		});
		
		 function getAgreeType() {    
			    var obj = {
			        "등록순" : {
			        	'0' : '==========',
			            '5' : '최근상품',
			            '6' : '오래된상품',          
			        },
			        "카테고리" : {
			        	'0' : '==========',
			            '1' : '샐러드',
			            '2' : '샌드위치',
			            '3' : '간식/음료',			            
			        },
			        "가격순" : {
			        	'0' : '==========',
			            '7' : '높은순',
			            '8' : '낮은순',           
			        },
			        "삭제여부" : {
			        	'0' : '==========',
			            '9' : '삭제',
			            '10' : '미삭제',           
			        }
			       
			    }
			    return obj;
			}

		
		 
	  $( document ).ready( function() { 
		  
		        $( '#searchNum' ).change(function() {
		         	 
		          $( '#Search' ).submit();		      	
		        
		    
		        } );
		   } );   
		
	</script>

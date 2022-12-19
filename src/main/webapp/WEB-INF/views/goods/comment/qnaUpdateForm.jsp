<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>qna 수정</title>
	<!-- <link rel="stylesheet" href="resources/css/ui.css" type="text/css" /> -->
  
    <!-- Bootstrap Core CSS -->
    <link href="/resources/sbadmin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/sbadmin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/sbadmin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/sbadmin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>
 <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
					<h1 class="page-header">QNA 수정</h1>
				
				
				
					<form role="form" action="qnaUpdate.pulu" method="post">
						<input type="hidden" id="QNA_GOODS_NUM" name="QNA_GOODS_NUM" value="${map.QNA_GOODS_NUM}"/>
						<input type="hidden" id="QNA_NUM" name="QNA_NUM" value="${map.QNA_NUM}"/>
					
						<div class="form-group">
							<label>아이디</label> 
								<input class="form-control" type="text" value="${map.QNA_ID }" name="QNA_ID" readonly>
						</div>
						<div class="form-group">
							<label>제목</label> 
								<input class="form-control" type="text" value="${map.QNA_SUBJECT }" name="QNA_SUBJECT" readonly>
						</div>
						<div class="form-group">
							<label>내용</label> 
								<input class="form-control" type="text" value="${map.QNA_CONTENTS }" name="QNA_CONTENTS" id="QNA_CONTENTS" >
						</div>
						
						<button type="button" class="btn btn-primary" onclick="window.close();">닫기</button>
						<input type="submit" class="btn btn-primary" value="수정하기" onclick="opener.parent.location.reload(); window.close();">
					</form></br></br></br>
				   </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원정보 수정</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/sbadmin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/sbadmin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/sbadmin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/sbadmin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 js -->
	<script>
	<!-- 선민: 카카오 우편번호 api -->
	function kakaoPost() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.querySelector("#zipcode").value = data.zonecode;
				document.querySelector("#addr1").value = data.address
			}
		}).open();
	}
	
	<!-- 선민: 회원 삭제 알림 팝업 -->
	function checkMemberDelete() {
		var form = document.getElementById("memberUpdateForm");
		if (confirm("해당 회원을 삭제하시겠습니까?") == true) {
			form.action = "adminMemberDelete.pulu";
			form.target = "_self";
			form.method = "post";
			form.submit();
		} else {}
	}
	</script>
</head>

<body>
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원 정보</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            ${adminMemberUpdate.ID }님의 회원정보 입니다.
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" id="memberUpdateForm" action="adminMemberUpdate.pulu" method="post">
                                        <div class="form-group">
                                            <label>아이디</label>
                                            <input class="form-control" type="text" value="${adminMemberUpdate.ID }" name="ID" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>이름</label>
                                            <input class="form-control" type="text" value="${adminMemberUpdate.NAME }" name="NAME" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>연락처</label>
                                            <input class="form-control" type="text" value="${adminMemberUpdate.PHONE }" name="PHONE" >
                                        </div>
                                        <div class="form-group">
                                            <label>이메일</label>
                                            <input class="form-control" type="text" value="${adminMemberUpdate.EMAIL }" name="EMAIL" >
                                        </div>
                                        <div class="form-group">
                                            <label>우편번호</label><br/>
                                            <button type="button" class="btn btn-default" onclick="kakaoPost()">우편번호 찾기</button>
                                            <input class="form-control" type="text" value="${adminMemberUpdate.ZIPCODE }" name="ZIPCODE" id="zipcode" maxlength="7">
                                        </div>
                                        <div class="form-group">
                                            <label>주소</label>
                                            <input class="form-control" type="text" value="${adminMemberUpdate.ADDR1 }" name="ADDR1" id="addr1" >
                                            <input class="form-control" type="text" value="${adminMemberUpdate.ADDR2 }" name="ADDR2" >
                                        </div>
                                        <div class="form-group">
                                            <label>등급</label>
                                            <input class="form-control" type="text" value="${adminMemberUpdate.GRADE }" name="GRADE" readonly>
                                        </div>
                                        <input type="submit" value="수정 완료" class="btn btn-primary">
                                        <input type="button" value="삭제" class="btn btn-danger" onclick="checkMemberDelete()">
                                        <button type="button" class="btn btn-default" onclick="window.close()">닫기</button>
                                    </form>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/sbadmin/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/sbadmin/dist/js/sb-admin-2.js"></script>

</body>

</html>

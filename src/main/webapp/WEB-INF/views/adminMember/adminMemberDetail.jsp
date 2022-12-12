<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원정보 상세보기</title>

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
</head>

<body>
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원정보</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            ${adminMemberDetail.ID }님의 회원정보 입니다.
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" action="adminMemberUpdateForm.pulu" method="post">
                                        <div class="form-group">
                                            <label>아이디</label>
                                            <input class="form-control" type="text" value="${adminMemberDetail.ID }" name="ID" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>이름</label>
                                            <input class="form-control" type="text" value="${adminMemberDetail.NAME }" name="NAME" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>연락처</label>
                                            <input class="form-control" type="text" value="${adminMemberDetail.PHONE }" name="PHONE" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>이메일</label>
                                            <input class="form-control" type="text" value="${adminMemberDetail.EMAIL }" name="EMAIL" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>우편번호</label><br/>
                                            <input class="form-control" type="text" value="${adminMemberDetail.ZIPCODE }" name="ZIPCODE" id="zipcode" maxlength="7" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>주소</label>
                                            <input class="form-control" type="text" value="${adminMemberDetail.ADDR1 }" name="ADDR1" id="addr1" readonly>
                                            <input class="form-control" type="text" value="${adminMemberDetail.ADDR2 }" name="ADDR2" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>등급</label>
                                            <input class="form-control" type="text" value="${adminMemberDetail.GRADE }" name="GRADE" readonly>
                                        </div>
                                        <button type="button" class="btn btn-default" onclick="window.close()">확인</button>
                                        <input type="submit" class="btn btn-default" value="수정하기">
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="./resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="./resources/css/board.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="./resources/js/common.js"></script>
<style>
.mpleft {
    display: inline-block;
    max-width: 170px;
    margin-top: 45px;
    width: 13%;
    float: left;
    margin-right: 7%;
}

.mpcontent:after {
	content: "";
	display: block;
	clear: both;
}

.mpsubcont{
    width: 100%;
    max-width: 1280px;
    margin: 0 auto;
}

.mpright {
    display: inline-block;
    width: 80%;
    max-width: 1015px;
    margin-top: 46px;
}
</style>

<meta charset="UTF-8">
<title>PuluDev</title>
</head> 
<body>
<div>
<tiles:insertAttribute name="header" />
</div>


<div class="mpcontent">
	<div class="mpsubcont">
		<div class="topmenu">
		
		
		</div>
		<div class="mpleft">
			<%@ include file="/WEB-INF/views/member/myPage.jsp" %>	
		</div>
		<div class="mpright">	
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</div>

<div>
<tiles:insertAttribute name="footer" />
</div>
</body>
</html>
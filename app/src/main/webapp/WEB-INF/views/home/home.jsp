<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
function login(){
	$.ajax({
        url : 'oauth/login.do',
        method : 'GET',
        async : false
    });
}
</script>
<body>
<div id="title">Drawing Your Daily</div>
<div id="subTitle"><div id="schedule" class="yesSelect">일정</div><div id="board" class="noSelect">게시판</div></div>
<div id="content"></div>
<!-- <input type="button" value="google 연동" id="gmailLogin" onclick="login()"> -->
</body>
</html>

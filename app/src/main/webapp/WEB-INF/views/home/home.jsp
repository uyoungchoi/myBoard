<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/css/allCss.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

window.onload = function (){
	//처음 실행시 할 작업
	
	$("#boardContent").css("display", "none"); //처음에는 일정만 보여주고 액션이 있을 경우 게시판을 보여줌.
	
	$("#schedule").	attr("onclick", "toggle");
	$("#board").	attr("onclick", "toggle");  //toggle함수 호출
}

function login(){
	$.ajax({
        url : 'oauth/login.do',
        method : 'GET',
        async : false
    });
}

function toggle(){
	
	if($("#boardContent").css("display")=="none"){   //보이는 화면 변경
		$("#boardContent").css("display", "block");
		$("#scheduleContent").css("display", "none");
	}else{
		$("#boardContent").css("display", "none");
		$("#scheduleContent").css("display", "block");
	}
}
</script>
<body>
<div id="header">로그인 | 로그아웃 | 내정보</div>
<div id="title">Drawing Your Daily</div>
<div id="subTitle"><div id="schedule" class="yesSelect">일정</div><div id="board" class="noSelect">게시판</div></div>
<div id="scheduleContent"><%@ include file="../schedule/scheduleHome.jsp" %></div>
<div id="boardContent"><%@ include file="../board/boardHome.jsp" %></div>
</body>
</html>

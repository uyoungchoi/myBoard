<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%String contextPath = "/WEB-INF/views";%>
<link rel="stylesheet" type="text/css" href="/resources/css/allCss.css">
<style>
.subTitle #yesSelect{
	display: inline-block;
	font-size: 20px;
	background-color: #3F51B5;
    border-radius: 5px;
    border: none;   
}
.subTitle #noSelect{ 
	display: inline-block;
	font-size: 20px;
	background-color: #3F51B5;
    border-radius: 5px;
    border: none;   
}
.title{
	font-family: 'Nanum Gothic Coding', serif;
    text-align: center;
    font-size: 40;
    padding-top: 50px;
    font-weight: 700;
}
.content{
	width:100%;
	height:100%;
}
.header{
	text-align: right;
    font-weight: 400;
}
.body{
	background-color: #e7d7c6;
    font-family: "Roboto",Arial,serif;
}
</style>
</head>


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
<div id="header">로그인 | 로그아웃 | 내정보</div> //로그인이 되어있을 경우만 로그아웃이 나오고 회원가입 창도 만들기 필수!
<div id="title">Drawing Your Daily</div>
<div id="subTitle"><div id="schedule" class="yesSelect">일정</div><div id="board" class="noSelect">게시판</div></div>
<div id="scheduleContent"><jsp:include page="<%=contextPath+\"/schedule/scheduleHome.jsp\"%>"/></div>
<div id="boardContent"><jsp:include page="<%=contextPath+\"/board/boardHome.jsp\"%>"/></div>
</body>
</html>

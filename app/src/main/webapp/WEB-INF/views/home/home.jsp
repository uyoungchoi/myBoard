<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%String contextPath = "/WEB-INF/views";%>

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
        url : 'home/login.do',
        method : 'GET',
        async : false
    });
}
function logout(){
	//쿠키제거
}
function myInfo(){
	//내 정보 보기
	$.ajax({
        url : 'home/myInfo.do',
        method : 'GET',
        async : false
    });
}
function join(){
	//회원가입
	$.ajax({
        url : 'home/join.do',
        method : 'GET',
        async : false
    });
}
function toggle(data){
	if(data.getAttribute("name")=="board"){   //보이는 화면 변경(게시판 클릭시)
	
		$("#boardContent").css("display", "block");
		$("#scheduleContent").css("display", "none");
		
		$('[name=board]').attr("class", "yesSelect");
		$('[name=schedule]').attr("class", "noSelect");
		
	}else{
		
		$("#boardContent").css("display", "none");
		$("#scheduleContent").css("display", "block");
		
		$('[name=board]').attr("class", "noSelect");
		$('[name=schedule]').attr("class", "yesSelect");
	}
}
</script>
</head>

<body>
<div id="header">

<a href="#" onclick="login()">로그인 |</a>
<a href="#" onclick="join()">회원가입 </a>

<a href="#" onclick="logout()">로그아웃 |</a>
<a href="#" onclick="myInfo()">내정보</a></div> 
  
<div id="title">음...</div>

<div id="subTitle">
	<input type="button" class="yesSelect" value="일정" onclick="toggle(this)" name="schedule">	
	<input type="button" class="noSelect" value="게시판" onclick="toggle(this)" name="board">
</div>

<div id="scheduleContent"><jsp:include page="<%=contextPath+\"/schedule/scheduleHome.jsp\"%>"/></div>
<div id="boardContent"><jsp:include page="<%=contextPath+\"/board/boardList.jsp\"%>"/></div>
</body>
</html>

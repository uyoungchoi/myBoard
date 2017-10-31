<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<script>
$( document ).ready(function() {
	
	var calendar = new controller(); 
	calendar.init();
	
	function controller(target) {
		var that = this;   
		var m_oMonth = new Date();
		m_oMonth.setDate(1);
	
		this.init = function() {
			that.renderCalendar();
			that.initEvent();
		}
	
	    /* 달력 UI 생성 */
		this.renderCalendar = function() {
			var arrTable = [];
	
			arrTable.push('<table><colgroup>');
			for(var i=0; i<7; i++) {
				arrTable.push('<col width="100">');
			}		
			arrTable.push('</colgroup><thead><tr>');
	
			var arrWeek = "일월화수목금토".split("");
			
			//요일을 그리는 부분
			for(var i=0, len=arrWeek.length; i<len; i++) {
				var sClass = '';
				sClass += i % 7 == 0 ? ' sun' : '';
				sClass += i % 7 == 6 ? ' sat' : '';
				arrTable.push('<td class="date'+sClass+'">' + arrWeek[i] + '</td>');
			}
			arrTable.push('</tr></thead>');
			arrTable.push('<tbody>');
	
			var oStartDt = new Date(m_oMonth.getTime());
	        // 1일에서 1일의 요일을 빼면 그 주 첫번째 날이 나온다.
			oStartDt.setDate(oStartDt.getDate() - oStartDt.getDay());
	
			for(var i=0; i<100; i++) {
				if(i % 7 == 0) {
					arrTable.push('<tr>');
				}
				
				//현재달이 아닌 날짜 선택
				var sClass = 'date-cell '
	            sClass += m_oMonth.getMonth() != oStartDt.getMonth() ? 'not-this-month ' : '';
				sClass += i % 7 == 0 ? 'sun' : '';
				sClass += i % 7 == 6 ? 'sat' : '';
				
				//이번달인 날짜 선택
				arrTable.push('<td class="'+sClass+'" onclick="addSchedulePopup(this)" value="'+oStartDt.getDate()+'">' + oStartDt.getDate() + '</td>');
				oStartDt.setDate(oStartDt.getDate() + 1);
	
				if(i % 7 == 6) {
					arrTable.push('</tr>');
					if(m_oMonth.getMonth() != oStartDt.getMonth()) {
						break;
					}
				}
			}
			arrTable.push('</tbody></table>');
	
			$('#calendar').html(arrTable.join(""));
	
			that.changeMonth();
		}
	
	    /* Next, Prev 버튼 이벤트 */
		this.initEvent = function() {
			$('#btnPrev').click(that.onPrevCalendar);
			$('#btnNext').click(that.onNextCalendar);
		}
	
	    /* 이전 달력 */
		this.onPrevCalendar = function() {
			m_oMonth.setMonth(m_oMonth.getMonth() - 1);
			that.renderCalendar();
		}
	
	    /* 다음 달력 */
		this.onNextCalendar = function() {
			m_oMonth.setMonth(m_oMonth.getMonth() + 1);
			that.renderCalendar();
		}
	
	    /* 달력 이동되면 상단에 현재 년 월 다시 표시 */
		this.changeMonth = function() {
			$('#currentDate').text(that.getYearMonth(m_oMonth).substr(0,9));
		}
	
	    /* 날짜 객체를 년 월 문자 형식으로 변환 */
		this.getYearMonth = function(oDate) {
			return oDate.getFullYear() + '년 ' + (oDate.getMonth() + 1) + '월';
		}
	}
});
function addSchedulePopup(data){
	//div를 그림..
	var $href = window.event;
	$href.pageX;
	
	//현재 마우스 좌표를 가져와서
	var event = window.event;
	var xData = event.screenX;
	var yData = event.screenY;
	
	//div를 그리고
	$('#addSchedulePopup').attr("class", "yesPopup");
	$('#timePopup').text()
	
	//클릭한 날짜를 가져옴.
	data.getAttribute("value")
	
	//위치 세팅
	$('#addSchedulePopup').css("top", $href.pageY);
	$('#addSchedulePopup').css("left", $href.pageX);
	
	$('#titlePopup').focus();
	
}
function closeSchedulePopup(){
	$('#addSchedulePopup').attr("class", "noPopup");
}
function addPopup(){
	var data = {
			"title" : $('#titlePopup').val(),
			"content" : ""
	};
	$.ajax({
		data : data,
        url : 'schedule/addSchedule.do',
        method : 'GET',
        async : false
    });
}
</script>
<style>

</style>
<body>
<div class='wrap'>
	<div class='btn'>
		<button id='btnPrev'>&lt;</button>
		 <span id='currentDate'></span> 
		<button id='btnNext'>&gt;</button>
	</div>
	<div id="calendar"></div>
	
	<div id="addSchedulePopup" class="noPopup">
		<div class="ib">일정등록</div><i class="fa fa-times" onclick="closeSchedulePopup()"></i><br><br>
		<div class="ib">제목</div><input type="text" placeholder="제목없음" id="titlePopup"><br>
		<div class="ib">시간</div><div id="timePopup"></div>
		<input type="button" value="등록" class="yesSelect" onclick="addPopup()">
	</div>
</div>
</body>
</html>
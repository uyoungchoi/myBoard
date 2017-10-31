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
	
	    /* �޷� UI ���� */
		this.renderCalendar = function() {
			var arrTable = [];
	
			arrTable.push('<table><colgroup>');
			for(var i=0; i<7; i++) {
				arrTable.push('<col width="100">');
			}		
			arrTable.push('</colgroup><thead><tr>');
	
			var arrWeek = "�Ͽ�ȭ�������".split("");
			
			//������ �׸��� �κ�
			for(var i=0, len=arrWeek.length; i<len; i++) {
				var sClass = '';
				sClass += i % 7 == 0 ? ' sun' : '';
				sClass += i % 7 == 6 ? ' sat' : '';
				arrTable.push('<td class="date'+sClass+'">' + arrWeek[i] + '</td>');
			}
			arrTable.push('</tr></thead>');
			arrTable.push('<tbody>');
	
			var oStartDt = new Date(m_oMonth.getTime());
	        // 1�Ͽ��� 1���� ������ ���� �� �� ù��° ���� ���´�.
			oStartDt.setDate(oStartDt.getDate() - oStartDt.getDay());
	
			for(var i=0; i<100; i++) {
				if(i % 7 == 0) {
					arrTable.push('<tr>');
				}
				
				//������� �ƴ� ��¥ ����
				var sClass = 'date-cell '
	            sClass += m_oMonth.getMonth() != oStartDt.getMonth() ? 'not-this-month ' : '';
				sClass += i % 7 == 0 ? 'sun' : '';
				sClass += i % 7 == 6 ? 'sat' : '';
				
				//�̹����� ��¥ ����
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
	
	    /* Next, Prev ��ư �̺�Ʈ */
		this.initEvent = function() {
			$('#btnPrev').click(that.onPrevCalendar);
			$('#btnNext').click(that.onNextCalendar);
		}
	
	    /* ���� �޷� */
		this.onPrevCalendar = function() {
			m_oMonth.setMonth(m_oMonth.getMonth() - 1);
			that.renderCalendar();
		}
	
	    /* ���� �޷� */
		this.onNextCalendar = function() {
			m_oMonth.setMonth(m_oMonth.getMonth() + 1);
			that.renderCalendar();
		}
	
	    /* �޷� �̵��Ǹ� ��ܿ� ���� �� �� �ٽ� ǥ�� */
		this.changeMonth = function() {
			$('#currentDate').text(that.getYearMonth(m_oMonth).substr(0,9));
		}
	
	    /* ��¥ ��ü�� �� �� ���� �������� ��ȯ */
		this.getYearMonth = function(oDate) {
			return oDate.getFullYear() + '�� ' + (oDate.getMonth() + 1) + '��';
		}
	}
});
function addSchedulePopup(data){
	//div�� �׸�..
	var $href = window.event;
	$href.pageX;
	
	//���� ���콺 ��ǥ�� �����ͼ�
	var event = window.event;
	var xData = event.screenX;
	var yData = event.screenY;
	
	//div�� �׸���
	$('#addSchedulePopup').attr("class", "yesPopup");
	$('#timePopup').text()
	
	//Ŭ���� ��¥�� ������.
	data.getAttribute("value")
	
	//��ġ ����
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
		<div class="ib">�������</div><i class="fa fa-times" onclick="closeSchedulePopup()"></i><br><br>
		<div class="ib">����</div><input type="text" placeholder="�������" id="titlePopup"><br>
		<div class="ib">�ð�</div><div id="timePopup"></div>
		<input type="button" value="���" class="yesSelect" onclick="addPopup()">
	</div>
</div>
</body>
</html>
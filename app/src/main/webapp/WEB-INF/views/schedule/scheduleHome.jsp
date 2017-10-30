<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
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

		for(var i=0, len=arrWeek.length; i<len; i++) {
			var sClass = '';
			sClass += i % 7 == 0 ? 'sun' : '';
			sClass += i % 7 == 6 ? 'sat' : '';
			arrTable.push('<td class="'+sClass+'">' + arrWeek[i] + '</td>');
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

			var sClass = 'date-cell '
            sClass += m_oMonth.getMonth() != oStartDt.getMonth() ? 'not-this-month ' : '';
			sClass += i % 7 == 0 ? 'sun' : '';
			sClass += i % 7 == 6 ? 'sat' : '';

			arrTable.push('<td class="'+sClass+'">' + oStartDt.getDate() + '</td>');
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
</script>
<style>
.wrap {
	width: 500px;
	margin: 0 auto;
}
.btn-holder {
	text-align: center;
	margin: 10px 0 10px 0;
}
#calendar table {
	border-collapse: collapse;
	text-align: center;
}
</style>
<body>
//���� ���ø�
<div class='wrap'>
	<div class='btn-holder'>
		<button id='btnPrev'>&lt;</button>
		 <span id='currentDate'></span> 
		<button id='btnNext'>&gt;</button>
	</div>
	<div id="calendar"></div>
</div>
</body>
</html>
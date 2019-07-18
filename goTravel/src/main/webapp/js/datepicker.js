//KR language callendar
$.datepicker.regional['kr'] = {
    closeText: '닫기', // 닫기 버튼 텍스트 변경
    currentText: '오늘', // 오늘 텍스트 변경
    monthNames: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'], // 개월 텍스트 설정
    monthNamesShort: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'], // 개월 텍스트 설정
    dayNames: ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'], // 요일 텍스트 설정
    dayNamesShort: ['월','화','수','목','금','토','일'], // 요일 텍스트 축약 설정&nbsp;   dayNamesMin: ['월','화','수','목','금','토','일'], // 요일 최소 축약 텍스트 설정
};

// Seeting up default language, Korean
$.datepicker.setDefaults($.datepicker.regional['kr']);

// 기본값 셋팅
var minDate = new Date();

$.datepicker.setDefaults({
	changeYear: true,
	changeMonth: true,
	dateFormat: "yy-mm-dd",
	shoMonthAfterYear: true,
	minDate : minDate
})

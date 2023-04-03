$(document).ready(function(){

	let str = $("#str").val(); 
	let ed = $("#ed").val();

$('#datepicker').datepicker({
	
    format: 'yyyy-mm-dd',
	startDate: '-'+str+'d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
    endDate: '+'+ed+'d',
    todayHighlight: true,
    toggleActive: true
});







});
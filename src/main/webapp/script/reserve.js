
let result ;

function test(d){
	alert(d)
}

function setpts(mpts){
	if($("#pts").val() > mpts){
		alert("소유하신 포인트가 더 작습니다.");
		return;
	}else if($("#seat").val() == ''){
		alert("먼저 필요한 좌석수를 입력하세요.");
		return;
	}
	$("#currentpoint").val($("#pts").val());
	cgSeat();
};

function getCurrentprice(){
	let price = $("#currentprice").val();
	let discount = $("#dispercent").val();
	return Math.floor(price * ((100 - discount)*0.01));
}


/*날짜 확인*/
function setDate(){
	$("#tdate").val($("#datepicker").val());
}

/*좌석수 확인*/
function cgSeat(){
	$("#tseat").val($("#seat").val()+"석");
	let point = $("#currentpoint").val();
	let totalprice = $("#seat").val() * getCurrentprice() - point;
	$("#tcprice").val(totalprice);
	result = totalprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	$("#cprice").html(result);
}

/*화면 새로고침*/
function reload(){
	return location.reload();
}

function reserve(id,tid,location){
	
	let totalpcs =  $("#tcprice").val();
	let seat = $("#seat").val();
	let date = $('#datepicker').val();

	if(date == ''){
		alert("날짜를 선택하여 주세요.");
		return;
	}else if(seat == ''){
		alert("예매할 좌석수를 입력하여 주세요.");
		return;
	}

	 $('#checkreserve').modal('show');

	 $("#date").html(date);
	 $("#loc").html(location);
	 $("#qty").html(seat+"장");
	 $("#price").html(result+"원");
	 let points = $("#currentpoint").val();
		
	$.ajax({
			type : "POST",
			url : ctx1+"/ticketingPro.do",
			data : {"id":id,"price":totalpcs,"tid":tid,"seat":seat,"date":date,"points":points},
			success : function() {
			}
		});
	
	return;
}

window.onload = function() {
	$("#currentpoint").val(0);
	
}


var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})

let inputStar = [...document.querySelectorAll('#star')];

window.onload = function() {

	inputStar.forEach(function(item, index) {

		item.addEventListener("keyup", function(event) {
			   if (event.keyCode === 13) {
		var Titleinputs = document.querySelector("input[data-idx1='"+index+"']");		
        var IDinputs = document.querySelector("input[data-idx2='"+index+"']");
		 var sdinputs = document.querySelector("input[data-idx3='"+index+"']");
		 var edinputs = document.querySelector("input[data-idx4='"+index+"']");
		
		var star = event.target.value;
		let idNum = IDinputs.value;
		let Title = Titleinputs.value;
		let stDate = sdinputs.value;
		let endDate = edinputs.value;
		
		editAction(idNum,Title,star,stDate,endDate);
      	
    }
		});
	});
}

function editAction(id,title,star,sdate,edate){
	if(title.trim() === ''){
		alert("공칸이 존재합니다.");
		return;
	}
	
	$.ajax({
			type : "POST",
			url : ctx1+"/ticketmanagement.do",
			data : {"id":id,"title":title,"star":star,"sdate":sdate,"edate":edate},
			success : function() {
			alert("수정성공");
			location.reload();
			}
		});
	
	
}
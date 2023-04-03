let data = {};

function test(log){
	alert("테스트" + log);
}

function addreview(mid,id,val){
		
	$.ajax({
			type : "POST",
			url : ctx2+"/review.do",
			data : {"mid":mid,"id":id,"star":val},
			success : function() {
			location.reload();
			alert("별점 입력 완료\n리뷰작성 감사 포인트 2,000원이 적립되었습니다.");
			}
		});
}


function ischecked() {
	
	let checkedIds = [];
	
  let checkboxes =  [...document.querySelectorAll('#tid')];
  checkboxes.forEach(function(checkbox,index) {
    let idNum = checkbox.value;
    var check = document.querySelector("input[data-idx2='"+index+"']");
	

	if(check.checked){
		 checkedIds.push(idNum);
	}
	
  });

	data.addList = checkedIds;
	
	jQuery.ajaxSettings.traditional = true;
	
	
	$.ajax({
			type : "POST",
			url : ctx2+"/reserveDelete.do",
			data : {"checkedIds":checkedIds},
			success : function() {
			location.reload();
			}
		});


	
}
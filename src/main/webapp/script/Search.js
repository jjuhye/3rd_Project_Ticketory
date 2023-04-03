let ctx2 = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

function newaccounttab() {
	window.open(ctx2 + '/account.do', '로그인', 'width=500px,height=800px,scrollbars=no');
}

function checkSearch(){
	if(!$.trim($("#searchData").val())){
		alert("검색어를 입력하세요.");
		$('#searchData').focus();
		$("#searchData").css("border","2px orange solid")
	}else{
		let data = $("#searchData").val();
			$.ajax({
			type : "POST",
			url : ctx2+"/search.do",
			data : {"searchData":data},
			success : function() {
				window.location.href = "search.do";
			}
		});
	}
}

window.addEventListener("load", init);
function init(){
	$("#searchData").keyup(function() {
		$("#searchData").css("border","");
	});
	$("#customTable tbody tr").click(function () {
    var checkbox = $(this).find('td:first-child :checkbox');
    checkbox.attr('checked', !checkbox.is(':checked'));
  });
}

	

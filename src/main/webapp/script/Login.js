let ctx1 = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));	    

        function newTabClick() {
            window.open(ctx1+'/login.do', '로그인', 'width=500px,height=800px,scrollbars=no');
			}

function idcheck() {
	if(!$.trim($("#id").val())){
		alert("아이디를 입력하세요.");
		$(id).focus();
		$("#id").css("border","3px red solid")
	}else if(!$.trim($("#pw").val())){
		alert("패스워드를 입력하세요.");
		$(pw).focus();
		$("#pw").css("border","3px red solid")
	}else{
		let id=$("#id").val();
		let pw=$("#pw").val();
		$.ajax({
			type : "POST",
			url : ctx1+"/login.do",
			data : {"id":id,"pw":pw},
			success : function(data) {
				if(data == "1"){
					alert("로그인성공");
				window.close();
				opener.location.reload();		
				window.location.href = "main.do";
				}else {
					alert("아이디와 패스워드를 확인해주세요.");
					$("#id").css("border","3px orange solid")
					$("#pw").css("border","3px orange solid")
					$("#id").val("");
					$("#pw").val("");
				}	
			}
		});
	}
}

window.onload = function() {
	$("#id").keyup(function() {
		$("#id").css("border","");
	});
	$("#pw").keyup(function() {
		$("#pw").css("border","");
	});
}
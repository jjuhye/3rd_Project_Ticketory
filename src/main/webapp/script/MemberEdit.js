let ctx11 = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

function checkform(id){

	if(frontcheck(id,$("#pw").val()) == false){
		return;
	}else{
		let pw = $("#pw").val();
		$.ajax({
			type : "POST",
			url : ctx11+"/mypage.do",
			data : {"pw":pw},
			success : function(data) {
				if(data == ("1")){
					alert("탈퇴성공.");
					window.location.href = "main.do";
				}else{
					alert("패스워드를 확인해주세요.");
					$("#pw").css("border","3px orange solid")
					$("#pw").val("");
				}	
			}
		});
	}
}


function updatepw(id,pw){

	if(frontcheck(id,$("#memberpw").val()) == false){
		return;
	}else if(pw == $("#memberpw").val()){
		alert("이전 비밀번호와 같은 비밀번호 입니다.");
		return;
	}else{
		let input = $("#memberpw").val();
		$.ajax({
			type : "POST",
			url : ctx1+"/update.do",
			data : {"input":input,"pos":"1"},
			success : function(data) {
				
				if(data == ("1")){
					alert("수정성공.");
					window.location.href = "main.do";
				}else{
					alert("수정실패");
				}	
			}
		});
	}
}


function updatehp(id,hp){
	
	if(frontcheck(id,$("#memberHP").val()) == false){
		return;
	}else if(hp == $("#memberHP").val()){
		alert("이전 핸드폰 번호와 같은 번호입니다.");
		return;
	}else{
		let input = $("#memberHP").val();
		$.ajax({
			type : "POST",
			url : ctx1+"/update.do",
			data : {"input":input,"pos":"2"},
			success : function(data) {
				
				if(data == ("1")){
					alert("수정성공.");
					window.location.href = "main.do";
				}else{
					alert("수정실패");
				}	
			}
		});
	}
}

$(document).on("click", "#pwbtn", function () {
     var mypw = $("#memberpw").val();
	document.getElementById("innerpw").innerHTML=mypw;
});

$(document).on("click", "#hpbtn", function () {
     var myhp = $("#memberHP").val();
	document.getElementById("innerhp").innerHTML=myhp;
});


function cancelpw(){
	 $("#memberpw").val("");
}

function cancelhp(){
	 $("#memberHP").val("");
}

		$("#memberHP").keyup(function() {
			
			if($("#memberHP").val().length >=  10){
			let Str = $("#memberHP").val();
			Str.replace(/[^0-9]/g, '')
				Str = 
				Str
				.replace(/[^0-9]/g, '')
				.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/ , `$1-$2-$3`);
				$("#memberHP").val(Str);
			}
	});








function frontcheck(id,pw){
	 if(pw==''){
		 alert("비밀번호를 입력하세요.");
		 return false;
	 }else if(id == "admin"){
		 alert("관리자는 수정 및 삭제불가.");
		 return false;
	}else{
		return true;
	}
}



let ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

let checkDuplication = 0;


function submit(){
	
	let id = document.querySelector("#id").value;
	const checkbox = document.getElementById('terms');

    const is_checked = checkbox.checked;
	
	let pw1 = document.querySelector("#pw1").value;
	let pw2 = document.querySelector("#pw2").value;
	let name = document.querySelector("#name").value;
	let hp = document.querySelector("#hp").value;
	
	if(!checkform(id,is_checked,pw1,pw2,name,hp)){
		return;
	}else{
			$.ajax({
			type : "POST",
			url : ctx+"/account.do",
			data : {"id":id , "pw1":pw1 ,"name":name,"hp":hp},
			success : function() {
				$("#accountPage").html("<img src='img/회원가입2.png' style='width:100%'><div class='p-4 text-center'><button class='btn-basic' onclick='window.close()'>닫기</button></div>");
			}
		})	
	}
}


function checkform(id,is_checked,pw1,pw2,name,hp) {

	if (!existdate(id,"아이디") ||!existdate(pw1,"비밀번호") ||!existdate(pw2,"비밀번호확인")
		||!existdate(name,"이름") || !existdate(hp,"핸드폰번호")) {
		return false;
	}else if(pw1 != pw2){
		alert("⚠ 비밀번호 확인이 일치하지 않습니다!");
		return false;
	}else if(is_checked == false){
		alert("약관동의에 체크하여 주세요.");
		return false;
	}else if(checkDuplication == 0){
		alert("아이디 중복체크가 필요합니다.");
		return false;
	}else{
		return true;
	}
}



function dupcheck(){
	let id = document.querySelector("#id").value;
		
		if(!existdate(id,"아이디")){
			return;
		}else{
			$.ajax({
			type : "POST",
			url : ctx+"/idcheck.do",
			data : {"id":id},
			success : function(data) {
				if(data == "1"){
					checkDuplication = 0;
					alert("⚠이미 존재하는 아이디입니다!\n    다른 아이디를 입력해주세요.");
					$("#id").css("border","3px orange solid")
					$("#id").val("")
				}else{
					checkDuplication = 1;
					alert("사용 가능한 아이디입니다.");
					$("#id").css("border","3px green solid")
				}
		}});
		}
		}
		
function closetab(){
	window.close();
}	

function existdate(data,msg){
	if(data == ''){
		alert(msg+"를 입력해주세요.");
		return false;
	}
	return true;
}


window.onload = function() {
	$("#id").keyup(function() {
		checkDuplication = 0;
		$("#id").css("border","");
	});
	
		$("#hp").keyup(function() {
			
			if($("#hp").val().length >=  10){
			let Str = $("#hp").val();
			Str.replace(/[^0-9]/g, '')
				Str = 
				Str
				.replace(/[^0-9]/g, '')
				.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/ , `$1-$2-$3`);
				$("#hp").val(Str);
			}
	});
}



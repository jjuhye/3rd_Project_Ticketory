let ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

function addBoard(id){
	let title =$("#bTitle").val();
	let contents =$("#bContents").val();
	
	if(title.trim() == ''){
		alert("제목을 입력해주세요.");
		return;
	}else if(contents.trim() == ''){
		alert("내용을 입력해주세요.");
		return;
	}else{
		$.ajax({
		type : "POST",
		url : ctx+"/board.do",
		data :{"memberId":id, "title":title, "body":contents},
		success : function(){
			alert("1:1문의가 등록되었습니다.");
			location.reload();
			}
		});
	}
}

function addReply(id){
	let reply =$("#rpContents").val();
	
	if(contents.trim() == ''){
		alert("내용을 입력해주세요.");
		return;
	}else{
		$.ajax({
		type : "POST",
		url : ctx+"/board.do",
		data :{"memberId":id, "body":contents},
		success : function(){
			$("#replyContents").text('<br>┗관리자 Re : ${body}');
			alert("답글이 등록되었습니다.");
			location.reload();
			}
		});
	}
}

function fixBoard(){
	let id =$("#idval").val();
	let title =$("#eTitle").val();
	let contents =$("#eContents").val();
	
	if(title.trim() == ''){
		alert("제목을 입력해주세요.");
		return;
	}else if(contents.trim() == ''){
		alert("내용을 입력해주세요.");
		return;
	}else{
		$.ajax({
		type : "POST",
		url : ctx+"/boardedit.do",
		data :{"id":id, "title":title, "body":contents},
		success : function(){
			alert("1:1 수정이 완료되었습니다.");
			location.reload();
			}
		});
	}
}


function editboard(id,title,body){
	$('#editBoard').modal('show');
	$("#idval").val(id);
	$("#eTitle").val(title);
	$("#eContents").val(body);
}








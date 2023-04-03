function editpoint(id){
	let poval = $("#edittpoint").val();
	alert(poval);
		$.ajax({
			type : "POST",
			url : ctx2+"/editpoint.do",
			data : {"id":id,"poval":poval},
			success : function() {
				location.reload();
				
			}
		});
}



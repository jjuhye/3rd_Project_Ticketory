<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="./header.jsp" %>
<script type="text/javascript" src="script/pointedit.js" defer></script>


<div id="container" style="max-width:1200px; margin:auto">
	<div class="col-8 p-4 text-DR fs-1 fw-bold">회원관리</div>

	<table class="table table-hover text-center m-auto" style="width:95%">
		<tr style="background:#d1cfcd">
			<th>ID</th>
			<th>이름</th>
			<th>휴대폰번호</th>
			<th>포인트</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="m" items="${mlist}">
			<c:if test="${m.memberId ne 'admin'}">
				<tr>
					<td>${m.memberId}</td>
					<td>${m.memberName}</td>
					<td>${m.memberHP}</td>
					<td><input class="input-basic" type="number" id="edittpoint" 
						value="${m.memberPoints}" /></td>
					<td><button class="btn btn-basic"
					onclick="editpoint(${m.id})">수정</button></td>
					<td><button class="btn btn-cancel"
							onclick="location.href='${ctx}/admindelete.do?id=${m.id}'">삭제</button></td>

				</tr>
			</c:if>

		</c:forEach>
	</table>

</div>

<%@ include file="./footer.jsp" %>

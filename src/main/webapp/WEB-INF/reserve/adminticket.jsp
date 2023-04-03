<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>

<script type="text/javascript" src="script/Admin.js" defer></script>

<div id="container" style="max-width:1200px; margin:auto">
	<div class="row p-4">
		<div class="col-8 text-DR fs-1 fw-bold">티켓관리</div>
		<div class="col pt-2 fs-3 fw-bold" style="border:1px solid #efa635; border-radius:10px" align="center" >
		티켓 추가 &nbsp;
		<button class="btn btn-basic" onclick="location.href = '${ctx}/addticket.do?category=null'">공연 추가</button>
		</div>
	</div>

	<table class="table">
		<thead>
			<tr>
				<th scope="col">제목</th>
				<th scope="col">평점</th>
				<th scope="col">시작일</th>
				<th scope="col">마감일</th>
				<th scope="col">상태</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="t" items="${ticketAllList}" varStatus="status">
				<tr>
					<th><input class="input-basic" data-idx1="${status.index}"
						type="text" value="${t.title}" id="title" /></th>
					<td data-bs-toggle="tooltip" data-bs-placement="left"
						title="입력후 Enter"><input class="input-basic" type="text"
						value="${t.star}" style="width: 100px" id="star" /></td>
					<td><input class="input-basic" data-idx3="${status.index}"
						value="${t.dateStart}"></td>
					<td><input class="input-basic" data-idx4="${status.index}"
						value="${t.dateEnd}"></td>
					<td><c:if test="${now >= t.dateStart && now <= t.dateEnd}">
							<span class="btn-sm-blue">진행중</span>
						</c:if> <c:if test="${now < t.dateStart}">
							<span class="btn-sm-green">예정</span>
						</c:if> <c:if test="${now > t.dateEnd}">
							<span class="btn-sm-red">종료</span>
						</c:if></td>
					<td><button class="btn btn-danger btn-sm"
							onclick="location.href='${ctx}/ticketmanagement.do?num=${t.id}'">삭제</button></td>
				</tr>
				<input type="hidden" data-idx2="${status.index}" value="${t.id}">
			</c:forEach>
		</tbody>
	</table>
	
</div>

<%@ include file="./footer.jsp" %>
			
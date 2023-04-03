<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "ctx" value="${pageContext.request.contextPath}"/>
<head>
<meta charset="UTF-8">
<style type="text/css"></style>
<link rel="stylesheet" type="text/css" href="${ctx}/css/modalApp.css">
</head>
<body>

	<div class="modal fade" id="checkreserve" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fw-bold">예매가 완료되었습니다.</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					예약장소 : <span id="loc"></span><br>
					예약날짜 : <span id="date"></span><br>
					예약매수 : <span id="qty"></span><br>
					최종가격 : <span id="price"></span><br>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-cancel" onclick="location.href='${ctx}/main.do'">메인페이지</button>
					<c:forEach var="m" items="${mlist}">
						<button type="button" class="btn btn-basic" onclick="location.href='${ctx}/ticketingPro.do'">예매확인 페이지</button>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="addReview" tabindex="-1" aria-labelledby="rvModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div style="width:450px">
					<img src='img/후기2.png' style='width:100%'>
				</div>
				<div class="modal-footer">
					<button class='btn-basic' onclick='window.close()'>닫기</button>
					<button type="button" class="btn btn-cancel" onclick="location.href='${ctx}/main.do'">확인</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
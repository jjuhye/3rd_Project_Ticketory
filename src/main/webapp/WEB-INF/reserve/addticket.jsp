<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="./header.jsp" %>

<div id="container" style="max-width:1200px; margin:auto">
	<p class="text-DR pt-4 fs-2 fw-bold">티켓추가영역</p>

	<button class="btn btn-basic" onclick="location.href = '${ctx}/addticket.do?category=null'">공연추가</button>
	
</div>

<%@ include file="./footer.jsp" %>
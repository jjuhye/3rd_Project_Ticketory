<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<!-- 회원가입 이벤트 -->
<div class="fs-2 fw-bold blinking text-center pt-3" style="color:#d2850c">진행 중 이벤트</div>
<div align="center" class="pt-3">
	<c:if test="${id eq null}">
	<img class="eventBox" src="img/회원가입1.png" onclick="javascript:newaccounttab()">
	</c:if>
	<c:if test="${id ne null}">
	<img class="eventBox" src="img/회원가입1.png" onclick="location.href='mypage.do'">
	</c:if>
</div>
<!-- 리뷰 이벤트 -->
<div align="center" class="py-4">
	<img class="eventBox" src="img/후기1.png" onclick="location.href='ticketingPro.do'">
</div>

<%@ include file="./footer.jsp" %>
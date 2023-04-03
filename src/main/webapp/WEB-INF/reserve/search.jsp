<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="tday" class="java.util.Date"/>
<fmt:parseNumber value="${tday.time / (1000*60*60*24)}" integerOnly="true" var="today"></fmt:parseNumber>

<div class="container p-2" style="max-width:1200px; margin:auto"> 
	<div class="fs-3 fw-bold pt-2" style="color: #d2850c">검색결과</div>
	<div class="row row-cols-1 row-cols-md-3 g-4 m-auto">
		<c:forEach var="t" items="${TicketList}">
			<div class="card border-0" style="max-width:350px; cursor:pointer;"
			  onclick="location.href='${ctx}/ticketing.do?title=${t.id}'">
				<div class="bg-image hover-overlay ripple"
					data-mdb-ripple-color="light">
					<c:choose>
						<c:when test="${fn:startsWith(t.image, 'http')}">
							<!-- Load the image from a URL -->
							<img src="${t.image}" class="card-img-top1" alt="...">
						</c:when>
						<c:otherwise>
							<!-- Load the image from a file path -->
							<img src="img/${t.image}" class="card-img-top1" alt="...">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="card-body">
					<h5 class="card-title font-weight-bold">
						<a>${t.info}</a>
					</h5>
					<p class="card-text"></p>
					<hr class="my-4" />
					<fmt:parseDate value="${t.dateStart }" var="strD"
						pattern="yyyy-MM-dd" />
					<fmt:parseNumber value="${strD.time / (1000*60*60*24)}"
						integerOnly="true" var="strDate"></fmt:parseNumber>
					<c:if test="${today >= strDate-2 && now <= t.dateEnd}">
						<span class="btn-sm-blue">진행중</span>
					</c:if>
					<c:if test="${today < strDate-2}">
						<span class="btn-sm-green">예정</span>
					</c:if>
					<c:if test="${now > t.dateEnd}">
						<span class="btn-sm-red">종료</span>
					</c:if>
					${t.dateStart} ~ ${t.dateEnd} <br>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
	
<%@ include file="./footer.jsp" %>	


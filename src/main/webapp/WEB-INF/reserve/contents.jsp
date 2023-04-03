<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:useBean id="tday" class="java.util.Date"/>
<fmt:parseNumber value="${tday.time / (1000*60*60*24)}" integerOnly="true" var="today"></fmt:parseNumber>

<div id="container" style="max-width:1200px; margin:auto">
	<c:if test="${category eq 'show'}"> <c:set var="list" value="${ascshow}"/> </c:if>
	<c:if test="${category eq 'sports'}"> <c:set var="list" value="${ascsports}"/> </c:if>
	<c:set var="loop" value="false"/>
	<!-- 오늘의 티켓 -->
	<c:forEach var="s" items="${list}">
		<c:if test="${loop eq false}">
			<c:if test="${s.dateStart eq now}">
				<div class="row mt-4 m-auto" style="border:2px solid #f9e7cb; border-radius:10px; width:90%">
				<div class="fs-3 fw-bold pt-2 blinking" style="color:#d2850c">오늘의 티켓</div>
				<div class="row row-cols-1 row-cols-md-3 g-1 m-auto p-3">
					<!-- <div class="row m-auto p-3"> -->
						<div class="imgBox" style="width: 18rem; max-height:330px">
							<c:choose>
							<c:when test="${fn:startsWith(s.image, 'http')}">
								<!-- Load the image from a URL -->
							<div class="img-text text-danger fw-bold">이미지 보기</div>
							<img src="${s.image}" class="card-img-top3" onclick="window.open(this.src)">
							</c:when>
							<c:otherwise>
								<!-- Load the image from a file path -->
								<div class="img-text text-danger fw-bold">이미지 보기</div>
								<img src="img/${s.image}" class="card-img-top4" onclick="window.open(this.src)">
							</c:otherwise>
						</c:choose>
						</div>
					<!-- 컨텐츠 상세정보 -->
						<div class="col" style="max-height:330px; line-height:2; border-right:2px dashed #f9e7cb; cursor:pointer;"
						 onclick="location.href='${ctx}/ticketing.do?title=${s.id}'">
							<div style="font-size:1.4rem; font-weight:bold">${s.title}&nbsp;</div>
							<div class="fw-bold" style="font-size:0.8rem; color:#efa635">[${s.category} > ${s.contents}]</div>
							<div><b>기간 :</b> ${s.dateStart} ~ ${s.dateEnd}</div>
							<div><b>장소 :</b> ${s.location}</div>
							<div><b>시간 :</b> ${s.duration}</div>
							<div><b>평점 :</b>
								<span class="text-primary fw-bold" style="letter-spacing: -2pt;">
								<c:forEach var="st" begin="1" end="${s.star}">
								⭐
								</c:forEach>
								${s.star}</span></div>
							<div>금액 : ${s.price}원 <b class="text-danger">&nbsp;${s.discount}%</b></div>
						</div>
						<div class="col ps-5" style="max-height:330px; line-height:2; cursor:pointer;"
						 onclick="location.href='${ctx}/ticketing.do?title=${s.id}'">
							<br><b>[상세 소개]</b>
							<div style="overflow:auto; height:200px; line-height:1.5">${s.info}</div>
						</div>
					</div>			
				</div>
				<hr style="border-width:3px 0 0 0; border-style:dotted; border-color:#efa635">
				<c:set var="loop" value="true"/>
			</c:if>
		</c:if>
	</c:forEach>
	
	<!-- 오늘부터 전체 리스트 -->
	<div class="row row-cols-1 row-cols-md-3 g-3 m-auto">
			<c:forEach var="s" items="${list}">
	        <div class="card border-0" style="max-width:390px; cursor:pointer;" onclick="location.href='${ctx}/ticketing.do?title=${s.id}'">
	            <div class="row row-cols-md-2 g-1">
	                <div class="col-5">
						<c:choose>
							<c:when test="${fn:startsWith(s.image, 'http')}">
								<!-- Load the image from a URL -->
								<img src="${s.image}" class="card-img-top2" alt="...">
							</c:when>
							<c:otherwise>
								<!-- Load the image from a file path -->
								<img src="img/${s.image}" class="card-img-top2" alt="...">
							</c:otherwise>
						</c:choose>
					</div>
	                <div class="col-7 card-body">
	                	<div class="pb-1">
	                		<fmt:parseDate value="${s.dateStart }" var="strD" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${strD.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<c:if test="${today >= strDate-2 && now <= s.dateEnd}"><span class="btn-sm-blue">진행중</span></c:if>
							<c:if test="${today < strDate-2}"><span class="btn-sm-green">예정</span></c:if>
							<c:if test="${now > s.dateEnd}"><span class="btn-sm-red">종료</span></c:if>
						</div>
	                    <h5 class="card-title text-dark fw-bold">${s.title}</h5>
	                    <div class="text-primary fw-bold">
								<span class="text-primary fw-bold" style="letter-spacing: -2pt;">
								<c:forEach var="st" begin="1" end="${s.star}">
								⭐
								</c:forEach>
								${s.star}</span></div>
	                    <div class="text-dark">${s.location}</div>
	                    <div class="text-dark fw-bold">${s.price}원</div>
	                    <div class="text-danger fw-bold">${s.discount}%</div>
	                </div>
	            </div>
	        </div>
	        </c:forEach>
    	</div>
   	</div>

<%@ include file="./footer.jsp" %>	

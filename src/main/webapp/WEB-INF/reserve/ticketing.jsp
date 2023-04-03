<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="tday" class="java.util.Date"/>
<fmt:parseNumber value="${tday.time / (1000*60*60*24)}" integerOnly="true" var="today"></fmt:parseNumber>
<link rel="stylesheet" type="text/css" href="${ctx}/css/datepicker.css">
<script type="text/javascript" src="script/datepicker.js" defer></script>
<script type="text/javascript" src="script/reserve.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>

<%@ include file="../modal/reservecheck.jsp" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>

<div id="container" style="max-width:1200px; margin:auto">
	<div class="row p-4">
		<c:forEach var="t" items="${selection}">
		<!-- 컨텐츠 이미지 -->
		<div class="col-md-auto">
			<div class="p-2">
				<fmt:parseDate value="${t.dateStart }" var="strD" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber value="${strD.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
			    <c:if test="${today >= strDate-2 && now <= t.dateEnd}"><span class="btn-sm-blue">진행중</span></c:if>
				<c:if test="${today < strDate-2}"><span class="btn-sm-green">예정</span></c:if>
				<c:if test="${now > t.dateEnd}"><span class="btn-sm-red">종료</span></c:if>
			</div>
			<div class="imgBox" style="width: 18rem; max-height:350px">
				<c:choose>
				<c:when test="${fn:startsWith(t.image, 'http')}">
					<!-- Load the image from a URL -->
				<div class="img-text text-danger fw-bold">이미지 보기</div>
				<img alt="" src="${t.image}" class="card-img-top3" onclick="window.open(this.src)">
				</c:when>
				<c:otherwise>
					<!-- Load the image from a file path -->
					<div class="img-text text-danger fw-bold">이미지 보기</div>
					<img src="img/${t.image}" class="card-img-top4" onclick="window.open(this.src)">
				</c:otherwise>
			</c:choose>
			</div>
		</div>
		<!-- 컨텐츠 상세정보 -->
		<div class="col p-3" style="line-height:2">
			<div class="pt-3" style="font-size:1.4rem; font-weight:bold">${t.title}&nbsp;</div>
			<div class="fw-bold" style="font-size:0.8rem; color:#efa635">[${t.category} > ${t.contents}]</div>
			<div><b>기간 :</b> ${t.dateStart} ~ ${t.dateEnd}</div>
	
			<div><b>장소 :</b> ${t.location}</div>
			<div><b>시간 :</b> ${t.duration}</div>
			<div><b>평점 :</b>
				<span class="text-primary fw-bold" style="letter-spacing: -2pt;">
				<c:forEach var="st" begin="1" end="${t.star}">
				⭐
				</c:forEach>
				${t.star}</span></div>
			<div class="my-2" style="border-top:1px solid #efa635;  font-size:0.9rem">
				<b>[상세 소개]</b>
				<div style="overflow:auto; height:120px; line-height:1.5">
					${t.info}
				</div>
			</div>
		</div>
		<div class="px-3 pb-2">
			<div style="border:2px solid #f9e7cb; border-radius:10px">
				<c:if test="${id  eq null && today >= strDate-2 && now <= t.dateEnd}">
					<h5 style="color:red">로그인 후 예매 가능합니다</h5>
					<div class="p-1"><button class="btn-disable" disabled>예매불가</button></div>
				</c:if>
				
 				<c:if test="${today < strDate-2 || now > t.dateEnd}">
					<div class="p-1"><button class="btn-disable" disabled>예매불가</button></div>
				</c:if>
				
				<c:if test="${id ne null && today >= strDate-2 && now <= t.dateEnd}">
					<fmt:formatNumber var = "totalprice" type="number" value="${t.price * ((100 - t.discount)*0.01)}" maxFractionDigits="0"/>
					<c:forEach var="m" items="${mlist}">
					<div class="row row-cols-1 row-cols-md-3">
						<div class="col ps-5" style="border-right:2px dashed #f9e7cb">
							<h5 class="text-R fw-bold py-3">예매하기 >></h5>
							관람 날짜&nbsp;
							<input type="text" id="datepicker" style="width:150px" class="input-basic datepicker" placeholder="날짜 선택" onchange="setDate()"><br>
							<c:if test="${now >= t.dateStart}"><input type="hidden" id = "str" value="${now}"></c:if>
							<c:if test="${now < t.dateStart}"><input type="hidden" id = "str" value="${t.dateStart}"></c:if>
							<input type="hidden" id = "str" value="${t.dateStart}">
						
							<input type="hidden" id = "ed" value="${t.dateEnd}"><br>
							예매 수량 (잔여:<span class="text-danger fw-bold"> ${t.seatNum} </span>석) : &nbsp;
							<input class="input-basic" type="number" min="1" id="seat" style="width:70px" onchange="cgSeat()"/>석
						</div>
						<div class="col px-4" style="border-right:2px dashed #f9e7cb">
							<h5 class="text-R fw-bold py-3">할인 적용 >></h5>
							<div>티켓 금액 : <s>${t.price}원</s><b class="text-danger">&nbsp;${t.discount}%</b></div>
							<div class="pt-2">- 할인가 : <b>${totalprice}원</b></div>
							<div class="pt-2">- 포인트 : 
							<input class="input-basic" id="pts" min="0" type="number" style="width:100px">원&nbsp;
							<button class="btn-ltsm-basic" onclick="setpts(${m.memberPoints})">사용</button><br>
							<span style="padding-left:80px; font-size:0.8rem; color:blue">잔여포인트 : ${m.memberPoints}원</span> 
							</div>
						</div>
						<div class="col ps-5">
							<h4 class="text-DR fw-bold pt-3">결제 진행</h4>
							<div class="pt-2">관람 날짜 : <input type="text" style="border:none; width: 100px" id="tdate" readonly/></div>
							<div class="pt-2">예매 좌석 : <input type="text" style="border:none; width: 100px" id="tseat" readonly/></div>
							<div class="fw-bold pt-1">최종 결제 금액 : <span id="cprice" class="text-danger fs-5">${totalprice}</span>원</div>
							
							<div class="py-3">
								<button class="btn-basic" onclick="reserve(${m.id},${t.id},'${t.location}')">결제하기</button>&nbsp;
								<button class="btn-cancel" onclick="reload()">다시선택</button>
							</div>
						</div>
					</div>
					</c:forEach>
 				</c:if>
			</div>
		</div>
		
		<input type="hidden" id="dispercent" value="${t.discount}"/>
		<input type="hidden" id="currentprice" value="${t.price}"/>
		<input type="hidden" id="tcprice" value="0"/>
		<input type="hidden" id="currentpoint" value="0"/>
		
		</c:forEach>
	</div>
</div>

</body>
<%@ include file="./footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:useBean id="tday" class="java.util.Date"/>
<fmt:parseNumber value="${tday.time / (1000*60*60*24)}" integerOnly="true" var="today"></fmt:parseNumber>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript" src="script/Main.js" defer></script>
<section >
	<div class="swiper-container p-2" style="max-width:1200px; margin:auto"> 
	<div class="fs-3 fw-bold pt-2 px-4 blinking" style="color:#d2850c">추천 티켓</div>
	<hr style="border-width:3px 0 0 0; border-style:dotted; border-color:#efa635">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
			    <div class="row row-cols-1 row-cols-md-3 g-2">
    	    	<c:set var="loop" value="false"/>
				<c:set var="i" value="1"/>
				<c:forEach var="sh" items="${ascshow}">
					<c:if test="${loop eq false}">
						<c:if test="${sh.dateEnd >= now}">
				        <div class="card border-0" style="max-width:400px; cursor:pointer;" onclick="location.href='${ctx}/ticketing.do?title=${sh.id}'">
				            <div class="row row-cols-md-2 g-1">
				                <div class="col-5">
									<c:choose>
										<c:when test="${fn:startsWith(sh.image, 'http')}">
											<!-- Load the image from a URL -->
											<img src="${sh.image}" class="card-img-top2" alt="...">
										</c:when>
										<c:otherwise>
											<!-- Load the image from a file path -->
											<img src="img/${sh.image}" class="card-img-top2" alt="...">
										</c:otherwise>
									</c:choose>
								</div>
				                <div class="col-7 card-body">
				                	<div class="pb-1">
				                		<fmt:parseDate value="${sh.dateStart }" var="strD" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${strD.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
										<c:if test="${today >= strDate-2 && now <= sh.dateEnd}"><span class="btn-sm-blue">진행중</span></c:if>
										<c:if test="${today < strDate-2}"><span class="btn-sm-green">예정</span></c:if>
										<c:if test="${now > sh.dateEnd}"><span class="btn-sm-red">종료</span></c:if>
									</div>
				                    <h5 class="card-title text-dark fw-bold">${sh.title}</h5>
				                    <div class="text-primary fw-bold" style="letter-spacing: -2pt;">
										<c:forEach var="st" begin="1" end="${sh.star}">
										⭐
										</c:forEach>
				                    ${sh.star}</div>
				                    <div class="text-dark">${sh.location}</div>
				                    <div class="text-dark fw-bold">${sh.price}원</div>
				                    <div class="text-danger fw-bold">${sh.discount}%</div>
				                </div>
				            </div>
							<div class="ellipsis2 text-dark pt-3">${sh.info}</div>
				        </div>
				        <c:set var="i" value="${i+1}"/>
						<c:if test="${i eq 4}"><c:set var="loop" value="true"/></c:if>
				        </c:if>
			        </c:if>
				</c:forEach>
			    </div>
			</div>
		   
			<div class="swiper-slide">
			    <div class="row row-cols-1 row-cols-md-3 g-2" id="slideBox">
			    <c:set var="loop" value="false"/>
				<c:set var="i" value="1"/>
				<c:forEach var="sp" items="${ascsports}">
					<c:if test="${loop eq false}">
						<c:if test="${sp.dateEnd >= now}">
				        <div class="card border-0" style="max-width:400px; cursor:pointer;" onclick="location.href='${ctx}/ticketing.do?title=${sp.id}'">
				            <div class="row row-cols-md-2 g-1">
				                <div class="col-5"><img src="img/${sp.image}" class="card-img-top2" alt="..."></div>
				                <div class="col-7 card-body">
				                	<div class="pb-1">
				                		<fmt:parseDate value="${sp.dateStart }" var="strD" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${strD.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
										<c:if test="${today >= strDate-2 && now <= sp.dateEnd}"><span class="btn-sm-blue">진행중</span></c:if>
										<c:if test="${today < strDate-2}"><span class="btn-sm-green">예정</span></c:if>
										<c:if test="${now > sp.dateEnd}"><span class="btn-sm-red">종료</span></c:if>
									</div>
				                    <h5 class="card-title text-dark fw-bold">${sp.title}</h5>
    				                <div class="text-primary fw-bold" style="letter-spacing: -2pt;">
										<c:forEach var="st" begin="1" end="${sp.star}">
										⭐
										</c:forEach>
				                    ${sp.star}</div>
				                    <div class="text-dark">${sp.location}</div>
				                    <div class="text-dark fw-bold">${sp.price}원</div>
				                    <div class="text-danger fw-bold">${sp.discount}%</div>
				                </div>
				            </div>
							<div class="ellipsis2 text-dark pt-3">${sp.info}</div>
				        </div>
				        <c:set var="i" value="${i+1}"/>
						<c:if test="${i eq 4}"><c:set var="loop" value="true"/></c:if>
				        </c:if>
			        </c:if>
				</c:forEach>
			    </div>
		   </div>
	    </div>
	    <hr style="border-width:3px 0 0 0; border-style:dotted; border-color:#efa635">
    </div>
</section>
 
<section class="topRk p-4" style="max-width:1200px; margin:auto">
	<input type="radio" name="tabmenu" id="tab1" checked>
	<label for="tab1">공연 랭킹Top3</label>
	<input type="radio" name="tabmenu" id="tab2">
	<label for="tab2" >스포츠 랭킹Top3</label>
	
	<div class="conbox con1 px-5">
	    <div class="row row-cols-1 row-cols-md-3 g-5">
	    <c:set var="loop" value="false"/>
	    <c:set var="i" value="1"/>
		<c:forEach var="r" items="${rankshow}">
		<c:if test="${loop eq false}">
		<fmt:parseDate value="${r.dateEnd }" var="endD" pattern="yyyy-MM-dd"/>
		<fmt:parseNumber value="${endD.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
			<c:if test="${endDate+7 >= today}">
		        <div class="col" onclick="location.href='${ctx}/ticketing.do?title=${r.id}'" style="cursor:pointer;">
		            <div class="card h-100">
		            	<c:choose>
							<c:when test="${fn:startsWith(r.image, 'http')}">
								<!-- Load the image from a URL -->
								<img src="${r.image}" class="card-img-top" alt="...">
							</c:when>
							<c:otherwise>
								<!-- Load the image from a file path -->
								<img src="img/${r.image}" class="card-img-top" alt="...">
							</c:otherwise>
						</c:choose>
		                <div class="card-body">
		                    <h5 class="card-title">${r.title}</h5>
		                    <div class="ellipsis">${r.info}</div>
							<div class="text-primary fw-bold" style="letter-spacing: -2pt;">
								<c:forEach var="st" begin="1" end="${r.star}">
								⭐
								</c:forEach>
							${r.star}</div>
		                </div>
					</div>
				</div>
				<c:set var="i" value="${i+1}"/>
				<c:if test="${i eq 4}"><c:set var="loop" value="true"/></c:if>
			</c:if>
		</c:if>
		</c:forEach>
	    </div>
	</div>
	<div class="conbox con2 px-5" >
	    <div class="row row-cols-1 row-cols-md-3 g-5">
   	    <c:set var="loop" value="false"/>
	    <c:set var="i" value="1"/>
		<c:forEach var="r" items="${ranksports}">
		<c:if test="${loop eq false}">
		<fmt:parseDate value="${r.dateEnd }" var="endD" pattern="yyyy-MM-dd"/>
		<fmt:parseNumber value="${endD.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
			<c:if test="${endDate+7 >= today}">
		        <div class="col" onclick="location.href='${ctx}/ticketing.do?title=${r.id}'" style="cursor:pointer;">
		            <div class="card rank-card h-100">
		                <div style="height:330px"><img src="img/${r.image}" class="card-img-top1" alt="..."></div>
		                <div class="card-body">
		                    <h5 class="card-title">${r.title}</h5>
		                    <div class="ellipsis">${r.info}</div>
							<div class="text-primary fw-bold" style="letter-spacing: -2pt;">
								<c:forEach var="st" begin="1" end="${r.star}">
								⭐
								</c:forEach>
							${r.star}</div>
		                </div>
		            </div>
		        </div>
       			<c:set var="i" value="${i+1}"/>
				<c:if test="${i eq 4}"><c:set var="loop" value="true"/></c:if>
		    </c:if>
	    </c:if>
		</c:forEach>
	    </div>
	</div>
</section>
<script type = "text/javascript">

</script>
<%@ include file="./footer.jsp" %>
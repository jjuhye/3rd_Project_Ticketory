<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<div id="container" style="max-width: 1200px; margin: auto">
<%@ include file="../modal/boardModal.jsp" %>

	<section class="section faq p-4">
		<h1 class="fw-bold text-DR pb-4">티켓토리 고객센터</h1>
		<div class="col-lg-9">
			<div class="card basic">
				<div class="card-body">
					<h5 class="card-title text-R fw-bold">자주 묻는 질문 (FAQ)</h5>
					<div class="accordion accordion-flush" id="faq-group-1">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed"
									data-bs-target="#faq1" type="button" data-bs-toggle="collapse"
									aria-expanded="false">
									<div class="row">
										<div class="fw-bold p-1">1. 티켓 환불정책은 어떻게 되나요?</div>
									</div>
								</button>
							</h2>
							<div id="faq1" class="accordion-collapse collapse"
								data-bs-parent="#faq-group-1" style="">
								<div class="accordion-body">
									환불은 1차적으로 최소 시작시간 3일 전 부터 가능합니다. 그 이후에는 환불대금이 감소 될 수 있습니다
									<button onclick=""></button>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed"
									data-bs-target="#faq2" type="button" data-bs-toggle="collapse"
									aria-expanded="false">
									<div class="row">
										<div class="fw-bold p-1">2. 회원탈퇴를 하고 싶어요.</div>
									</div>
								</button>
							</h2>
							<div id="faq2" class="accordion-collapse collapse"
								data-bs-parent="#faq-group-1" style="">
								<div class="accordion-body">
									로그인후 상단메뉴에서 마이페이지에서 탈퇴를 진행하실 수 있습니다
									<button onclick=""></button>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed"
									data-bs-target="#faq3" type="button" data-bs-toggle="collapse"
									aria-expanded="false">
									<div class="row">
										<div class="fw-bold p-1">3. 부정이용(암표 부정거래)는 어떻게 처벌 되나요?</div>
									</div>
								</button>
							</h2>
							<div id="faq3" class="accordion-collapse collapse"
								data-bs-parent="#faq-group-1" style="">
								<div class="accordion-body">
									공연/전시/스포츠 문화를 해치는 범죄행위입니다. 부정거래 관리 시스템을 통한 모니터링 과정에서 비정상적인
									프로세스의 예매내역(매크로, 개인 간 거래 등) 적발 시 예매취소/회원정지/회원자격 상실 등의 적절한 조치 및
									법적 제재를 가할 수 있습니다
									<button onclick=""></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="section qna p-4">
		<div class="col-lg-9">
		<div class="card basic">
			<div class="card-body">
				<h5 class="card-title text-R fw-bold">1:1문의 게시판 (Q&A)</h5>
				<div class="accordion accordion-flush" id="faq-group-1">
					<c:forEach var="b" items="${blist}">
						<div class="accordion-item">
							<h2 class="accordion-header">
							<c:if test="${id eq b.memberId || id eq 'admin'}">
								<button class="accordion-button collapsed"
									data-bs-target="#${b.memberId}${b.id}" type="button"
									data-bs-toggle="collapse" aria-expanded="false">
									<div class="row">
										<div class="fw-bold p-1">${b.title}</div>
										<div style="font-size:0.9rem">${b.writedate} (${b.memberId}) </div>
									</div>
								</button>
							</c:if>
							</h2>
							<div id="${b.memberId}${b.id}"
								class="accordion-collapse collapse"
								data-bs-parent="#faq-group-1" style="">
								<div class="accordion-body row">
									<div class="col-9">${b.body}</div>
									<div class="col-9" id="replyContents"><br>┗관리자 Re : <span id="reply"></span></div>
									<div class="col-3" align="right">
										<button class="btn-ltsm-basic" onclick="editboard('${b.id}','${b.title}','${b.body}')">수정</button>
										<button class="btn-sm-basic" onclick="location.href='${ctx}/boardDelete.do?id=${b.id}'">삭제</button>
										<c:if test="${id eq 'admin'}">
											<button id="repl" class="btn-sm-cancel" data-bs-toggle="modal" data-bs-target="#addReply">답글</button>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="row p-3">
				<div class="col-3">
					<button id="addBd" class="btn-basic" data-bs-toggle="modal" data-bs-target="#addBoard">글쓰기</button>
				</div>
				<div class="col pe-4" align="right">
					<c:forEach var="n" begin="1" end="${paging}">
						<a class="page" href="${ctx}/board.do?pnum=${n}">${n}</a>&nbsp;
					</c:forEach>
				</div>
			</div>
			</div>
		</div>
		</div>
	</section>

</div>
<%@ include file="./footer.jsp" %>
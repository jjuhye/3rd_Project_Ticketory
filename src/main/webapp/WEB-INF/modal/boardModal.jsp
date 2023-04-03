<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="script/Board.js" defer></script>
<body>
<div class="modal fade" id="addBoard" tabindex="-1" aria-labelledby="addBdModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5 fw-bold" id="addBdModal">1:1 문의</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
		<div class="modal-body">
		
			<div id="container" style="max-width: 650px" align="center">
				<div class="col" style="border: 2px solid #f9e7cb; border-radius: 5px">
					<div class="row p-3 pb-0">
						<div class="col-2 fw-bold">제&nbsp;목</div>
						<div class="col ps-0 pe-3">
							<input class="input-basic col-12" type="text" id="bTitle" />
						</div>
					</div>
					<hr class="text-basic">
					<div class="row p-3 pt-0">
						<div class="col-2 fw-bold">내&nbsp;용</div>
						<div class="col ps-0 pe-3">
							<textarea class="input-basic col-12" id="bContents" rows="10"></textarea>
						</div>
					</div>
				</div>
			</div>

		</div>
      <div class="modal-footer">
        <button type="button" class="btn-basic" onclick="addBoard('${id}')">등록</button>
        <button type="button" class="btn-cancel" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="addReply" tabindex="-1" aria-labelledby="addRpModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5 fw-bold" id="addBdModal">1:1 문의 답글</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
		<div class="modal-body">
			<div id="container" style="max-width: 650px" align="center">
				<div class="col" style="border: 2px solid #f9e7cb; border-radius: 5px">
					<div class="row p-3 pt-0">
						<div class="col-2 fw-bold">내&nbsp;용</div>
						<div class="col ps-0 pe-3">
							<textarea class="input-basic col-12" id="rpContents" rows="10"></textarea>
						</div>
					</div>
				</div>
			</div>

		</div>
      <div class="modal-footer">
        <button type="button" class="btn-basic" onclick="addReply('${id}')">등록</button>
        <button type="button" class="btn-cancel" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="editBoard" tabindex="-1" aria-labelledby="editBoard" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5 fw-bold" id="editBdModal">1:1 문의 (수정)</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
		<div class="modal-body">
		
			<div id="container" style="max-width: 650px" align="center">
				<div class="col" style="border: 2px solid #f9e7cb; border-radius: 5px">
					<div class="row p-3 pb-0">
						<div class="col-2 fw-bold">제&nbsp;목</div>
						<div class="col ps-0 pe-3">
							<input class="input-basic col-12" type="text" id="eTitle" value=""/>
						</div>
					</div>
					<hr class="text-basic">
					<div class="row p-3 pt-0">
						<div class="col-2 fw-bold">내&nbsp;용</div>
						<div class="col ps-0 pe-3">
							<textarea class="input-basic col-12" id="eContents" rows="10"></textarea>
						</div>
					</div>
				</div>
			</div>

		</div>
      <div class="modal-footer">
      	<input type="hidden" id="idval"/>
        <button type="button" class="btn-basic" onclick="fixBoard()">수정</button>
        <button type="button" class="btn-cancel" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

















</body>
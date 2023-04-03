<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="script/MemberEdit.js" defer></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>

<div class="modal fade" id="deleteMember" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">⚠ 회원탈퇴</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<font style="color:red">회원탈퇴 시 모든 거래내역은 삭제됩니다.</font><br>
		탈퇴하시려면 아래 비밀번호를 입력해주세요.<br><br>
        비밀번호 &nbsp<input type="text" class="input-basic" id="pw"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn-cancel" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn-basic" onclick="checkform('${id}')">탈퇴하기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="updatePassword" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">🔒 비밀번호 변경</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		비밀번호를 아래와 같이 재설정 하시겠습니까?<br><br>
		새 비밀번호 : <span id="innerpw" style="color:#efa635; font-weight:bold"></span>
      </div>
      <div class="modal-footer">
      <c:forEach var="m" items="${mlist}">
        <button type="button" class="btn-cancel" data-bs-dismiss="modal" onclick="cancelpw()">취소</button>
        <button type="button" class="btn-basic" onclick="updatepw('${id}','${m.memberPw}')">변경하기</button>
      </c:forEach>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="updateHP" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">📱휴대폰번호 변경</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		휴대폰번호를 아래와 같이 변경 하시겠습니까?<br><br>
		새 휴대폰번호 : <span id="innerhp" style="color:#efa635; font-weight:bold"></span>
      </div>
      <div class="modal-footer">
      <c:forEach var="m" items="${mlist}">
        <button type="button" class="btn-cancel" data-bs-dismiss="modal" onclick="cancelhp()">취소</button>
        <button type="button" class="btn-basic" onclick="updatehp('${id}','${m.memberHP}')">변경하기</button>
      </c:forEach>
      </div>
    </div>
  </div>
</div>

</body>

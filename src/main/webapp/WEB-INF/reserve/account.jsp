<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../modal/accountModal.jsp" %>
<%@ include file="./header2.jsp" %>
<script type="text/javascript" src="script/Account.js" defer></script>
<div id="accountPage">
	<div id="container" style="max-width:400px; margin:auto" align="center">
	
		<p class="pt-4 pb-3"><font style="font-size:1.4rem; font-weight:bold;">
		<font style="color:#d2850c; font-size:1.7rem">티켓토리 </font>회원가입</font></p>
		
		
			<div class="col py-2" style="border:2px solid #f9e7cb; font-weight:bold; border-radius:5px" align="center">
				<div class="row p-3">
					<div class="col-4">아&nbsp;이&nbsp;디</div>
					<div class="col-5 pe-0"><input class="input-basic col-12" type="text" name="id" id="id"/></div>
					<div class="col-3"><div class="btn-ltsm-basic" onclick="dupcheck()" style="cursor:pointer">중복체크</div></div>
				</div>
				<div class="row p-3">
					<div class="col-4">비밀번호</div>
					<div class="col-8"><input class="input-basic col-12" type="password" name="pw1" id="pw1"/></div>
				</div>
				<div class="row px-3 pb-3">
					<div class="col-4">비밀번호 확인</div>
					<div class="col-8"><input class="input-basic col-12" type="password" name="pw2" id="pw2"/></div>
				</div>
				<div class="row p-3">
					<div class="col-4">이 &nbsp; 름</div>
					<div class="col-8"><input class="input-basic col-12" type="text" name="name" id="name"/></div>
				</div>
				<div class="row p-3">
					<div class="col-4">휴대폰 번호</div>
					<div class="col-8">
						<input class="input-basic col-12" type="text" name="hp" id="hp" placeholder="010-xxxx-xxxx"/>
					</div>
				</div>
			</div>
			<p class="pt-3"><input type="checkbox" id="terms"><label for="terms" style="cursor:pointer"> [필수] 이용약관 동의&nbsp;</label>
				<input type="button" data-bs-toggle="modal" data-bs-target="#showterms" value="전문보기" style="font-size:0.7rem">
			</p>
			<p class="py-3"><button class="btn-basic" id="join" onclick="submit()">회원가입</button> &nbsp;
				<input type="button" value="취소" class="btn-cancel" onclick="closetab()"/></p>
	</div>
	
	<div align="center">
		<div style="margin: 10px; border-bottom: 2px solid; color: #efa635"></div>
		<div class="p-3" id="footer" style="max-width:1200px; margin:auto">
			<font style="font-size: 1.2rem; font-weight: bold; color: #efa635">티켓토리</font><br>
			Ticketory ⓒ2023 PIK/LJH, All rights reserved.
		</div>
	</div>
</div>
</body>
</html>
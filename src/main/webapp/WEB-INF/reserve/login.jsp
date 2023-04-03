<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header2.jsp" %>
<script type="text/javascript" src="script/Login.js" defer></script>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>

<div id="container" style="max-width:400px; margin:auto" align="center">

	<p class="pt-4 pb-3"><font style="font-size:1.4rem; font-weight:bold;">
	<font style="color:#d2850c; font-size:1.7rem">티켓토리 </font>로그인</font></p>
	
		<div class="col py-2" style="border:2px solid #f9e7cb; font-size:1.1rem; font-weight:bold; border-radius:5px" align="center">
			<div class="row p-3">
				<div class="col-4">아&nbsp이&nbsp디</div>
				<div class="col-8"><input class="input-basic col-12" type="text" name="id" id="id"/></div>
			</div>
			<div class="row p-3">
				<div class="col-4">비밀번호</div>
				<div class="col-8"><input class="input-basic col-12" type="password" name="pw1" id="pw"/></div>
			</div>
		</div>
	<p class="p-4">
		<button type="button" class="btn-basic" onclick="idcheck()">로그인</button>
		 &nbsp
		<button type="button" class="btn-lt-basic" onclick="location.href='${ctx}/account.do'">회원가입</button>
	</p>
</div>

<div align="center">
	<div style="margin: 10px; border-bottom: 2px solid; color: #efa635"></div>
	<div class="p-3" id="footer" style="max-width:1200px; margin:auto">
		<font style="font-size: 1.2rem; font-weight: bold; color: #efa635">티켓토리</font><br>
		Ticketory ⓒ2023 PIK/LJH, All rights reserved.
	</div>
</div>
</body>
</html>
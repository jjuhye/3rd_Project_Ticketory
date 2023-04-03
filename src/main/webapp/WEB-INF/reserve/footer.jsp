<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../modal/accountModal.jsp" %>
    
<div style="margin: 10px; border-bottom: 2px solid; color: #efa635"></div>
<div id="footer" style="max-width:1200px; margin:auto">
	<div class="px-3" style="font-size: 13px"
		style="border-bottom:1x solid #dee2e6">
		<a class="text-basic" data-bs-toggle="modal" href="#showinfo">회사소개 | </a>
		<a class="text-basic" data-bs-toggle="modal" href="#showpr">개인정보 취급(처리)방침 | </a>
		<a class="text-basic" data-bs-toggle="modal" href="#showterms">이용약관 | </a>
		<a class="text-basic" href="${ctx}/board.do">Contact Us</a>
	</div>
	<div class="p-3">
		<font style="font-size: 1.2rem; font-weight: bold; color: #efa635">티켓토리</font><br>
		Ticketory ⓒ2023 PIK/LJH, All rights reserved.
	</div>
</div>

</body>
</html>
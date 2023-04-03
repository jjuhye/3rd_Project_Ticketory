<%@page import="java.util.ArrayList"%>
<%@page import="com.basic.reserve.vo.Member"%>
<%@page import="com.basic.reserve.dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "ctx" value="${pageContext.request.contextPath}"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./img/favicon.png">
<title>Ticketory</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/app.css">
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript" src="script/Search.js" defer></script>
<script type="text/javascript" src="script/Login.js" defer></script>
</head>

<body>
<header class="sticky-top" style="background:white;">
	<nav class="navbar navbar-expand-md navbar-light px-2" id="topNv" style="background-color:none; margin:auto">
	  <div class="container-fluid" style="max-width:1200px;">
	  	<img class="logo" src="${ctx}/img/logo.png" alt="Ticketory" onclick="location.href ='${ctx}/main.do'" >
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerList" aria-controls="navbarTogglerList" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse justify-content-end" id="navbarTogglerList">
			<ul class="nav topNv">
				<c:if test="${id eq null}">
				<li><a class="text-basic" href="javascript:newTabClick();">로그인</a></li>
				<li><a class="text-basic" href="javascript:newaccounttab();">회원가입</a></li>
				</c:if>
				<c:if test="${id ne null}">
				<li><a class="text-basic" href="${ctx}/logout.do">${id}님 로그아웃</a></li>
				</c:if>
				<li><a class="text-basic" href="${ctx}/ticketingPro.do">예매확인/취소</a></li>
				<li><a class="text-basic" href="${ctx}/mypage.do">마이 페이지</a></li>
				<li><a class="text-basic" href="${ctx}/board.do">고객센터</a></li>
			</ul>
	    </div>
	  </div>
	</nav>
	
	<nav class="navbar md-nav">
		<div class="container-fluid" style="max-width:1200px;">
		<ul class="nav_menu">
			<li class="nav-item"><a class="navbar-brand text-basic active"
				href="${ctx}/main.do">홈</a></li>
			<li><a class="text-basic" href="${ctx}/contents.do?ctg=show">공연</a></li>
			<li><a class="text-basic" href="${ctx}/contents.do?ctg=sports">스포츠</a></li>
			<li><a class="text-basic" href="${ctx}/event.do">이벤트</a></li>
			<c:if test="${id eq 'admin'}">
				<li class="nav-item dropdown"><a
				class="text-basic dropdown-toggle" data-bs-toggle="dropdown"
				href="#" role="button" aria-haspopup="true" aria-expanded="false">관리자메뉴</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${ctx}/ticketmanagement.do">티켓관리</a> 
					<a class="dropdown-item" href="${ctx}/adminmember.do">회원관리</a>
				</div></li>
			</c:if>
		</ul>
			<div class="d-none d-lg-block">
			<form class="d-flex">
				<input class="form-control me-sm-1" type="search"
					placeholder="Search" id="searchData">
				<button class="btn btn-secondary btn-sm btn-block" type="button"
					onclick="checkSearch()" id="search">검색</button>
			</form>
			</div>
		</div>
	</nav>
	
</header>
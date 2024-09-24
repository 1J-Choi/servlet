<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>홍당무 마켓</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<style>
header{background-color: #F79F81;}
nav{background-color: #F79F81;}
</style>
<body>
 <%
 	MysqlService ms = MysqlService.getInstance();
 	ms.connect();
 	
 	String selectQuery = "select * from `used_goods` as `a`"
 			+ "join `seller` as `b`"
 			+ "on a.sellerId = b.id";
 	ms.select(selectQuery);
 %>

	<div class="container">
		<header>
			<div class="align-items-center justify-content-center">
				<h1 class="text-white">HONG당무 마켓</h1>
			</div>
		</header>
		<nav class="d-flex align-items-center">
			<ul class="nav nav-fill w-100">
				<li class="nav-item"><a href="/lesson03/quiz03.jsp" class="nav-link text-white font-weight-bold">리스트</a></li>
				<li class="nav-item"><a href="/lesson03/quiz03_1.jsp" class="nav-link text-white font-weight-bold">물건 올리기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">마이 페이지</a></li>
			</ul>
		</nav>
		<section class="contents"></section>
		<footer></footer>
	</div>
<%
	ms.disconnect();
%>
</body>
</html>
<%@page import="java.sql.ResultSet"%>
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
.parent-media-box {gap: 20px 35px;}
.media-box {
	border: solid #F79F81;
	width: 30%;
	height: 250px; 
	border-color: #F79F81;
	}
.text-orange {color: #F79F81;}
.media-box:hover {
	background-color: #F79F81;
}
</style>
<body>
 <%
 	MysqlService ms = MysqlService.getInstance();
 	ms.connect();
 	
 	String selectQuery = "select * from `used_goods` as `a`"
 			+ "join `seller` as `b`"
 			+ "on a.sellerId = b.id";
 	ResultSet result = ms.select(selectQuery);
 %>

	<div class="container">
		<header>
			<div class="d-flex align-items-center justify-content-center">
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
		<section class="contents mt-2">
			<section class="parent-media-box d-flex flex-wrap align-items-center justify-content-between">
			<%
			while(result.next()) {
			%>
				<article class="media-box justify-content-center p-2">
				<%
					if(result.getString("pictureUrl") != null && !result.getString("pictureUrl").equals("")) {
				%>
					<img src="<%= result.getString("pictureUrl") %>" alt="썸네일 이미지" width="100%" height="150">
				<%
					} else {
				%>
					<img src="https://www.spectory.net/src/images/noImg.gif" alt="썸네일 이미지 없음" width="100%" height="150">
				<%
					}
				%>
					<div class="font-weight-bold"><%= result.getString("title") %></div>
					<div class="text-secondary"><%= result.getInt("price") %>원</div>
					<div class="text-orange font-weight-bold"><%= result.getString("nickname") %></div>
				</article>
			<%
			}
			%>
			</section>
		</section>
		<footer>
			<div class="d-flex align-items-center justify-content-center">
				<small class="text-secondary">Copyright 2024. Hong All Rights Reserved.</small>
			</div>
		</footer>
	</div>
<%
	ms.disconnect();
%>
</body>
</html>
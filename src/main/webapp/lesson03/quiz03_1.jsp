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
<style>
header{background-color: #F79F81;}
nav{background-color: #F79F81;}
</style>
<script type="text/javascript">
	function checkForm(){
		if(document.goods.sellerId.value == "" || document.goods.sellerId.value == 0){
	    	alert("판매자가 잘 못 입력되었습니다.");
	        return false;
	    }
		if(document.goods.title.value == ""){
	    	alert("제목을 입력해주세요.");
	        return false;
	    }
		if(document.goods.price.value == ""){
	    	alert("가격이 잘 못 입력되었습니다.");
	        return false;
	    }
	}
</script>
</head>
<body>
<%
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	String selectQuery = "select * from `seller`";
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
		<section class="contents">
			<h1>물건 올리기</h1>
			<form method="post" action="/lesson03/insert_quiz03" name="goods">
				<div class="d-flex justify-items-center">
					<select name="sellerId">
						<option value="0" checked>-아이디 선택-</option>
					<%
					while(result.next()) {
					%>
						<option value="<%= result.getInt("id") %>"><%= result.getString("nickname") %></option>
					<%
					}
					%>
					</select>
					<input type="text" name="title" class="form-control" placeholder="제목">
					<div class="input-group">
						<input type="number" name="price" class="form-control">
						<div class="input-group-append">
    						<span class="input-group-text">원</span>
  						</div>
					</div>
				</div>
				<textarea name="description" class="w-100"></textarea>
				<div class="input-group">
						<div class="input-group-append">
    						<span class="input-group-text">이미지 url</span>
  						</div>
						<input type="text" name="pictureUrl" class="form-control">
				</div>
				<input type="submit" class="btn btn-light w-100" value="저장" onclick="checkForm()">
			</form>
		</section>
		<footer>
			<div class="d-flex align-items-center justify-content-center">
				<small class="text-secondary">Copyright 2024. Hong All Rights Reserved.</small>
			</div>
		</footer>
	</div>
</body>
</html>
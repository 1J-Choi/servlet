<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz01</title>
</head>
<body>
	<!-- 1 -->
	<%!
		public int sumNum(int num){
			int sum = 0;
			for(int i = 1; i <= num; i++) {
				sum += i;
			}
			return sum;
		}
	%>
	
	1부터 50까지의 합은 <%= sumNum(50) %> 입니다.
	
	<br>
	<!-- 2 -->
	<%
		int[] scores = {81, 90, 100, 95, 80};
		int sum = 0;
		for(int num: scores){
			sum += num;
		}
		double avg = sum / (double) scores.length;
	%>
	
	평균 점수는 <%= avg %> 입니다.
	
	<br>
	<!-- 3 -->
	<%
		List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
		int score = 0;
		for(String xo : scoreList) {
			if(xo.equals("O")) {
				score += 100 / scoreList.size();
			}
		}
	%>
	
	채점 결과는 <%= score %>점입니다.
	
	<br>
	<!-- 4 -->
	<%
		String birthDay = "19951105";
		int birthYear = Integer.parseInt(birthDay.substring(0, 4));
		
		int year = 2024 - birthYear;
	%>
	
	<%= birthDay %>의 나이는 <%= year %>세입니다.
</body>
</html>
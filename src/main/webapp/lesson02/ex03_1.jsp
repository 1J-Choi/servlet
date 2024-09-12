<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Method 폼태그 결과</title>
</head>
<body>
	<%
		String nickName = request.getParameter("nickname");
		String hobby = request.getParameter("hobby");
		String animal = request.getParameter("animal");
		// 여러개가 올 수 있는 경우 - getParameterValues()를 통해 String 배열 형태로 받는다
		String[] foodArr = request.getParameterValues("food");
		String fruit = request.getParameter("fruit");
	%>
	
	<table border="1">
		<tr>
			<th>별명</th>
			<td><%= nickName %></td>
		</tr>
		<tr>
			<th>취미</th>
			<td><%= hobby %></td>
		</tr>
		<tr>
			<th>선호하는 동물</th>
			<td><%= animal %></td>
		</tr>
		<tr>
			<th>선호하는 음식</th>
			<td><%
				String result = "";
				if(foodArr == null ) {
					result += "없음";
				} else {
					for(String food: foodArr) {
						result += food;
						// foodArr의 마지막일 경우 ", " 붙이지 않고 생략
						if(food.equals(foodArr[foodArr.length - 1])){
							continue;
						}
						result += ", ";
					}
				}
				
				// substring 써서 한다고 치면? "abc,_abc,_"
				// result = result.substring(0, result.length() - 2);
				
				out.print(result);
			%></td>
		</tr>
		<tr>
			<th>좋아하는 과일</th>
			<td><%= fruit %></td>
		</tr>
	</table>
</body>
</html>
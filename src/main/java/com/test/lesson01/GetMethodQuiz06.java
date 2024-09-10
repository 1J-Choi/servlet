package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz06")
public class GetMethodQuiz06 extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		PrintWriter out = response.getWriter();
		
		out.print("{\"addtion\":" + (num1 + num2) + ", "
				+ "\"subtraction\":" + (num1 - num2) + ", "
				+ "\"multiplication\":" + (num1 * num2) + ", "
				+ "\"division\":" + (num1 / num2) + "}");
	}
}

package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz09")
public class PostMethodQuiz09 extends HttpServlet{

	@Override
	public void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws IOException { 
		response.setContentType("text/html");
		
		String name = "<b>" + request.getParameter("name") + "</b>";
		String text = request.getParameter("text");
		
		PrintWriter out = response.getWriter();
		
		out.print("<html><head><title>입사지원서</title></head><body>"
				+ name + "님의 지원이 완료되었습니다."
				+ "<h3>지원내용</h3>" + text
				+ "</body></html>");
	}
}

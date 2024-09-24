package com.test.lesson03;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/insert_quiz02")
public class InsertQuiz02 extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		
		String insertQuery = "insert into `book_mark`"
				+ "(`name`, `url`)"
				+ "values"
				+ "('" + name + "', '" + url + "')";
		try {
			ms.update(insertQuery);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ms.disconnect();
		
		response.sendRedirect("/lesson03/quiz02.jsp");
	}
}

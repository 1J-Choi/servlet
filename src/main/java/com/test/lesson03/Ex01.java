package com.test.lesson03;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/ex01")
public class Ex01 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
        response.setContentType("text/plain");

        MysqlService ms = MysqlService.getInstance(); // DB 연결을 위한 객체 생성(싱글턴이라 한개만 생성됨)
        ms.connect(); // 실질적인 DB 연결 ★★★★꼭 불러야함★★★★
        
        // 테이블 insert
        String insertQuery = "insert into `used_goods`"
        		+ "(`sellerId`, `title`, `description`, `price`)"
        		+ "values"
        		+ "(1, '진라면 순한맛 1박스 팝니다.', '진순이 먹을바에 진매 먹습니다.', 20000)";
        try {
        	ms.update(insertQuery);        	
        } catch (SQLException e) {
            e.printStackTrace();
		}

        //-- 쿼리 수행
        // select
        String selectQuery = "select * from used_goods";

        PrintWriter out = response.getWriter();
        try {
            ResultSet res = ms.select(selectQuery);
            while (res.next()) {  // 결과 행이 있는 동안 수행
                out.println(res.getInt("id"));
                out.println(res.getString("title"));
                out.println(res.getInt("price"));
                out.println(res.getString("description"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        //-- 쿼리 끝
        ms.disconnect(); // DB 연결 해제
    }
}

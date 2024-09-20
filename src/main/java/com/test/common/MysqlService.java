package com.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
	private static MysqlService mysqlService;
	
	private static final String URL = "jdbc:mysql://localhost:3306/test_240627"; // 접속할 DB명까지 넣는다
	private static final String ID = "root";
	private static final String PASSWORD = "1234";
	
	private Connection conn;
    private Statement statement;
    private ResultSet res;
    
    // Singleton 패턴: MysqlService라는 객체가 단 하나만 생성되도록 하는 디자인 패턴
    // (DB 연결을 여러 객체에서 하지 않도록)
    public static MysqlService getInstance() {
        if (mysqlService == null) {
            mysqlService =  new MysqlService();
        }
        return mysqlService;
    }
    
    // DB connect
    public void connect() {
    	// try/catch로 던질 때 는 servlet 외부의 문제
    	// throws로 던질 때 는 servlet의 문제
        try {
            // 1. 드라이버 메모리에 로딩
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());

            // 2. DB 연결(connection)
            conn = DriverManager.getConnection(URL, ID, PASSWORD);

            // 3. statement: DB와 연결해서 쿼리를 실행하기 위한 준비
            statement = conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // DB disconnect
    public void disconnect() {
        try {
            // 연결 끊기
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // R
    public ResultSet select(String query) throws SQLException {
    	// query가 잘못되 었을 땐 이를 보낸 Servlet 잘못! => throws 사용
        res = statement.executeQuery(query);
        return res;
    }

    // CUD 
    public void update(String query) throws SQLException {
        statement.executeUpdate(query);
    }
}

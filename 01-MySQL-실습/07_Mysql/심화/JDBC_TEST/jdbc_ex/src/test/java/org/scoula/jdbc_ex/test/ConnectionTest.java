package org.scoula.jdbc_ex.test;
//문제5: JUnit5를 이용하여 데이터베이스에 접속하는 JDBC코드를 테스트하세요. =>  IntelliJ로 작성.
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTest {
    Connection con = null;
    @Test
    @DisplayName("jdbc_ex 연결")
    public void testConnection() throws ClassNotFoundException, SQLException {
        // 1. 드라이버설정
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("1. 드라이버설정성공..");
        // 2. 데이터베이스연결
        String url = "jdbc:mysql://localhost:3306/jdbc_ex";
        String user = "scoula";
        String password = "1234";
        con = DriverManager.getConnection(url, user, password);
        System.out.println("2. db연결성공.");

        //3.데이터베이스 연결해제
        con.close();
        System.out.println("3. db연결해제.");
    }
}

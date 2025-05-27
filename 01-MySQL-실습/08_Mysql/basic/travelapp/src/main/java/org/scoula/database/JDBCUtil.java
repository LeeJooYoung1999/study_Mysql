package org.scoula.database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtil {
    static Connection con = null;
    //getConnection() 스태틱 메서드를 정의함
    //외부에서 Connection 객체를 추출하기위함
    public static Connection getConnection(){
        if(con != null){
            return con;
        }
        //Properties클래스를 이용하여 application.properties파일을 로드함.
        try{
            Properties properties = new Properties();
            properties.load(JDBCUtil.class.getResourceAsStream("/application.properties"));

            //데이터베이스 접속에 필요한 정보를 추출함
            String driver = properties.getProperty("driver");
            String url = properties.getProperty("url");
            String id = properties.getProperty("id");
            String password = properties.getProperty("password");


            Class.forName(driver);
            //jdbc_ex 데이터베이스에 접속하여 Connection 객체를 보관함
            con = DriverManager.getConnection(url, id, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
    //데이터베이스 접속을 끊는 close() 메서드를 정의함
    public static void close(){
        try{
            if(con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //ConnectionTest 클래스의 testConnection2 메서드에서 JDBCUtil 클래스의 기능을 테스트하세요.

    public void testConnection2()throws SQLException {
        try (Connection con = JDBCUtil.getConnection()){
            System.out.println("DB 연결성공");
        }
    }
}

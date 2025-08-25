// kết nối csdl
package com.nguyenvantien.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    private static final String DB_URL = "jdbc:sqlserver://localhost:1433;"
            + "databaseName=quanlydienthoai;"
            + "encrypt=true;"
            + "trustServerCertificate=true;"
            + "loginTimeout=30";
    
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "123456";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("Đang kết nối database...");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("Kết nối database thành công");
            return conn;
        } catch (ClassNotFoundException e) {
            System.err.println("Lỗi: Không tìm thấy driver SQL Server");
            throw new SQLException("SQL Server JDBC Driver not found", e);
        }
    }
}
// test kết nối với sql 
package com.nguyenvantien.TestKetNoiSQL;

import com.nguyenvantien.dao.*;
import com.nguyenvantien.dao.DBConnect;
import java.sql.Connection;
import java.sql.SQLException;

public class TestKetNoi {
    public static void main(String[] args) {
        System.out.println("Đang thử kết nối SQL Server...");
        
        try (Connection conn = DBConnect.getConnection()) {
            System.out.println("Kết nối thành công!");
            System.out.println("Database: " + conn.getMetaData().getDatabaseProductName());
            System.out.println("Version: " + conn.getMetaData().getDatabaseProductVersion());
        } catch (SQLException e) {
            System.err.println("Lỗi kết nối SQL Server:");
            e.printStackTrace();
        }
    }
}
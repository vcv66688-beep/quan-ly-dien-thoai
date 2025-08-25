package com.nguyenvantien.servlets;

import com.nguyenvantien.dao.UserDao;
import com.nguyenvantien.entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AdminUserServlett")
public class AdminUserServlett extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserDao userDao = new UserDao();
            List<User> users = userDao.getAllUsers();
            request.setAttribute("users", users);
            request.getRequestDispatcher("admin_users.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", "Lỗi khi lấy danh sách người dùng: " + e.getMessage());
            request.getRequestDispatcher("loi.jsp").forward(request, response);
        }
    }
}
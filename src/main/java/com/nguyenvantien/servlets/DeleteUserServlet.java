package com.nguyenvantien.servlets;

import com.nguyenvantien.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        try {
            UserDao userDao = new UserDao();
            boolean success = userDao.deleteUser(userId);
            if (success) {
                response.sendRedirect("AdminUserServlett");
            } else {
                request.setAttribute("error", "Không thể xóa người dùng");
                request.getRequestDispatcher("admin_users.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("error", "Lỗi khi xóa người dùng: " + e.getMessage());
            request.getRequestDispatcher("admin_users.jsp").forward(request, response);
        }
    }
}
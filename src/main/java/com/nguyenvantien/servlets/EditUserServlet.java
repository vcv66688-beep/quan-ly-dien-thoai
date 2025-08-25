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

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        try {
            UserDao userDao = new UserDao();
            User user = userDao.getUserById(Integer.parseInt(userId));
            if (user == null) {
                request.setAttribute("error", "Người dùng không tồn tại");
                request.getRequestDispatcher("loi.jsp").forward(request, response);
            } else {
                request.setAttribute("user", user);
                request.getRequestDispatcher("admin_edit_user.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("error", "Lỗi khi lấy thông tin người dùng: " + e.getMessage());
            request.getRequestDispatcher("loi.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        User user = new User();
        user.setId(userId);
        user.setUsername(username);
        user.setPassword(password);
        user.setFullname(fullname);
        user.setEmail(email);
        user.setRole(role);

        try {
            UserDao userDao = new UserDao();
            boolean success = userDao.updateUser(user);
            if (success) {
                response.sendRedirect("AdminUserServlett");
            } else {
                request.setAttribute("error", "Không thể cập nhật người dùng");
                request.setAttribute("user", user);
                request.getRequestDispatcher("admin_edit_user.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("error", "Lỗi khi cập nhật người dùng: " + e.getMessage());
            request.setAttribute("user", user);
            request.getRequestDispatcher("admin_edit_user.jsp").forward(request, response);
        }
    }
}
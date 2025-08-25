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

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        UserDao userDao = new UserDao();
        try {
            if (userDao.isUsernameExists(username)) {
                request.setAttribute("error", "Tên đăng nhập đã tồn tại");
                request.getRequestDispatcher("admin_add_user.jsp").forward(request, response);
                return;
            }

            User newUser = new User(username, password, fullname, email, role);
            boolean success = userDao.registerUser(newUser);
            if (success) {
                response.sendRedirect("AdminUserServlett");
            } else {
                request.setAttribute("error", "Không thể thêm người dùng");
                request.getRequestDispatcher("admin_add_user.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("error", "Lỗi khi thêm người dùng: " + e.getMessage());
            request.getRequestDispatcher("admin_add_user.jsp").forward(request, response);
        }
    }
}
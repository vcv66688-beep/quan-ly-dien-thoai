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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        
        UserDao userDao = new UserDao();
        
        try {
            if (userDao.isUsernameExists(username)) {
                request.setAttribute("errorMessage", "Tên đăng nhập đã tồn tại");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            
            User newUser = new User(username, password, fullname, email, "user");
            boolean isSuccess = userDao.registerUser(newUser);
            
            if (isSuccess) {
                request.setAttribute("successMessage", "Đăng ký thành công. Vui lòng đăng nhập");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Đăng ký thất bại. Vui lòng thử lại");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi hệ thống. Vui lòng thử lại sau");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
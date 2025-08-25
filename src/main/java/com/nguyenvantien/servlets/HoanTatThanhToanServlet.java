package com.nguyenvantien.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/HoanTatThanhToanServlet")
public class HoanTatThanhToanServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Xóa tempCart để tránh lưu trữ dư thừa
        session.removeAttribute("tempCart");
        // Chuyển hướng đến trang hoàn tất
        response.sendRedirect("hoantatthanhtoan.jsp");
    }
}
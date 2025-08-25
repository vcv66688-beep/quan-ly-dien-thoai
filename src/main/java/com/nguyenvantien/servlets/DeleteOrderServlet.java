package com.nguyenvantien.servlets;

import com.nguyenvantien.dao.OrderDAO;
import com.nguyenvantien.dao.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        if (orderId == null || orderId.trim().isEmpty()) {
            request.setAttribute("error", "Mã đơn hàng không hợp lệ.");
            request.getRequestDispatcher("loi.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnect.getConnection()) {
            OrderDAO orderDAO = new OrderDAO(conn);
            boolean deleted = orderDAO.deleteOrder(orderId);
            if (deleted) {
                response.sendRedirect("AdminOrderServlet");
            } else {
                request.setAttribute("error", "Không thể xóa đơn hàng #" + orderId);
                request.getRequestDispatcher("loi.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Lỗi khi xóa đơn hàng: " + e.getMessage());
            request.getRequestDispatcher("loi.jsp").forward(request, response);
        }
    }
}
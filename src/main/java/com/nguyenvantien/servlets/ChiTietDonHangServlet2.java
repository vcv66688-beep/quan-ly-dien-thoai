package com.nguyenvantien.servlets;

import com.nguyenvantien.dao.OrderDAO;
import com.nguyenvantien.dao.DBConnect;
import com.nguyenvantien.entities.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/ChiTietDonHangServlet2")
public class ChiTietDonHangServlet2 extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderId = request.getParameter("orderId");

        if (orderId == null || orderId.isEmpty()) {
            request.setAttribute("error", "Mã đơn hàng không hợp lệ");
            request.getRequestDispatcher("loi.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnect.getConnection()) {
            OrderDAO orderDAO = new OrderDAO(conn);
            Order order = orderDAO.getOrderById(orderId);

            if (order == null) {
                request.setAttribute("error", "Đơn hàng không tồn tại");
                request.getRequestDispatcher("loi.jsp").forward(request, response);
                return;
            }

            request.setAttribute("order", order);
            request.getRequestDispatcher("chitietdonhang.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Lỗi khi lấy chi tiết đơn hàng: " + e.getMessage());
            request.getRequestDispatcher("loi.jsp").forward(request, response);
        }
    }
}
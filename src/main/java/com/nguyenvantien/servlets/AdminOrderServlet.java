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
import java.util.List;

@WebServlet("/AdminOrderServlet")
public class AdminOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection conn = DBConnect.getConnection()) {
            OrderDAO orderDAO = new OrderDAO(conn);
            List<Order> orders = orderDAO.getAllOrders();
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("admin_orders.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Lỗi khi lấy danh sách đơn hàng: " + e.getMessage());
            request.getRequestDispatcher("loi.jsp").forward(request, response);
        }
    }
}
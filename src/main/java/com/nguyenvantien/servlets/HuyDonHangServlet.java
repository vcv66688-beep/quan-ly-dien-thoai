package com.nguyenvantien.servlets;

import com.nguyenvantien.dao.OrderDAO;
import com.nguyenvantien.dao.ProductDAO;
import com.nguyenvantien.dao.DBConnect;
import com.nguyenvantien.entities.Order;
import com.nguyenvantien.entities.OrderItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/HuyDonHangServlet")
public class HuyDonHangServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderId = request.getParameter("orderId");

        if (orderId == null || orderId.isEmpty()) {
            request.setAttribute("error", "Mã đơn hàng không hợp lệ");
            request.getRequestDispatcher("loi.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        try {
            conn = DBConnect.getConnection();
            conn.setAutoCommit(false);

            OrderDAO orderDAO = new OrderDAO(conn);
            ProductDAO productDAO = new ProductDAO(conn);

            Order order = orderDAO.getOrderById(orderId);
            if (order == null) {
                conn.rollback();
                request.setAttribute("error", "Đơn hàng không tồn tại");
                request.getRequestDispatcher("loi.jsp").forward(request, response);
                return;
            }

            if (!"pending".equals(order.getStatus())) {
                conn.rollback();
                request.setAttribute("error", "Đơn hàng không thể hủy vì không ở trạng thái chờ xác nhận");
                request.getRequestDispatcher("loi.jsp").forward(request, response);
                return;
            }

            // Lấy danh sách OrderItem để khôi phục tồn kho
            List<OrderItem> orderItems = orderDAO.getOrderItems(orderId);
            for (OrderItem item : orderItems) {
                String productId = item.getProductId();
                int quantity = item.getQuantity();
                // Tăng lại tồn kho
                String restoreSql = "UPDATE products SET stock = stock + ? WHERE product_id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(restoreSql)) {
                    stmt.setInt(1, quantity);
                    stmt.setString(2, productId);
                    stmt.executeUpdate();
                }
            }

            // Cập nhật trạng thái đơn hàng thành "cancelled"
            boolean success = orderDAO.updateOrderStatus(orderId, "cancelled");

            if (success) {
                conn.commit();
                response.sendRedirect("DonHangServlet");
            } else {
                conn.rollback();
                request.setAttribute("error", "Không thể hủy đơn hàng do lỗi hệ thống");
                request.getRequestDispatcher("loi.jsp").forward(request, response);
            }
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            request.setAttribute("error", "Lỗi khi hủy đơn hàng: " + e.getMessage());
            request.getRequestDispatcher("loi.jsp").forward(request, response);
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
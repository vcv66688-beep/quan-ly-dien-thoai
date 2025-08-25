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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet("/HinhThucThanhToanServlet")
public class HinhThucThanhToanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection conn = null;

        try {
            // Kết nối database
            conn = DBConnect.getConnection();
            conn.setAutoCommit(false);

            OrderDAO orderDAO = new OrderDAO(conn);
            ProductDAO productDAO = new ProductDAO(conn);

            // Lấy thông tin từ session
            String fullname = (String) session.getAttribute("fullname");
            String email = (String) session.getAttribute("email");
            String phone = (String) session.getAttribute("phone");
            String deliveryAddress = (String) session.getAttribute("deliveryAddress");
            String paymentMethod = (String) session.getAttribute("paymentMethod");
            double total = (double) session.getAttribute("orderTotal");
            List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

            if (cart == null || cart.isEmpty()) {
                throw new ServletException("Giỏ hàng trống hoặc không tồn tại");
            }

            // Kiểm tra và giảm tồn kho cho từng sản phẩm
            for (Map<String, String> item : cart) {
                String productId = item.get("id");
                int quantity = Integer.parseInt(item.get("quantity"));
                if (!productDAO.decreaseStock(productId, quantity)) {
                    conn.rollback();
                    session.setAttribute("error", "Không đủ hàng trong kho cho sản phẩm: " + item.get("name"));
                    response.sendRedirect("error.jsp");
                    return;
                }
            }

            // Lưu giỏ hàng tạm thời trước khi xóa
            session.setAttribute("tempCart", new ArrayList<>(cart));

            // Tạo mã đơn hàng
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
            String orderId = "DH" + sdf.format(new Date());

            // Tạo danh sách OrderItem
            List<OrderItem> orderItems = new ArrayList<>();
            for (Map<String, String> item : cart) {
                double price = Double.parseDouble(item.get("discountedPrice").replaceAll("[^0-9]", ""));
                int quantity = Integer.parseInt(item.get("quantity"));
                OrderItem orderItem = new OrderItem(item.get("id"), item.get("name"), item.get("image"), price, quantity);
                orderItems.add(orderItem);
            }

            // Tạo đối tượng Order
            Order order = new Order(orderId, fullname, email, phone, deliveryAddress, total, paymentMethod);

            // Lưu vào database
            boolean orderSuccess = orderDAO.addOrder(order);
            boolean itemsSuccess = orderDAO.addOrderItems(orderId, orderItems);

            if (orderSuccess && itemsSuccess) {
                conn.commit();

                // Lưu thông tin đơn hàng vào session
                session.setAttribute("orderId", orderId);
                session.setAttribute("orderTotal", total);
                session.setAttribute("customerName", fullname);
                session.setAttribute("customerPhone", phone);
                session.setAttribute("deliveryAddress", deliveryAddress);
                session.setAttribute("paymentMethod", paymentMethod);

                // Xóa giỏ hàng sau khi lưu tạm
                session.removeAttribute("cart");

                // Chuyển hướng theo phương thức thanh toán
                if ("cod".equals(paymentMethod)) {
                    response.sendRedirect("thanhtoanCOD.jsp");
                } else {
                    response.sendRedirect("thanhtoanQR.jsp");
                }
            } else {
                conn.rollback();
                throw new ServletException("Lỗi khi lưu đơn hàng vào database");
            }
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            session.setAttribute("error", e.getMessage());
            response.sendRedirect("error.jsp");
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
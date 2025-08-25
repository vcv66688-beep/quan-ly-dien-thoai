//Đối tượng cho đơn hàng
package com.nguyenvantien.dao;

import com.nguyenvantien.entities.Order;
import com.nguyenvantien.entities.OrderItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class OrderDAO {
    private final Connection connection;

    public OrderDAO(Connection connection) {
        this.connection = connection;
    }

    /**
     * Thêm đơn hàng mới vào database
     */
    public boolean addOrder(Order order) throws SQLException {
        System.out.println("[OrderDAO] Thêm đơn hàng mới: " + order.getId());
        
        String sql = "INSERT INTO orders (order_id, customer_name, customer_email, customer_phone, "
                + "delivery_address, total_amount, status, payment_method, order_date) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, order.getId());
            stmt.setString(2, order.getCustomerName());
            stmt.setString(3, order.getCustomerEmail());
            stmt.setString(4, order.getCustomerPhone());
            stmt.setString(5, order.getDeliveryAddress());
            stmt.setDouble(6, order.getTotalAmount());
            stmt.setString(7, order.getStatus());
            stmt.setString(8, order.getPaymentMethod());
            stmt.setTimestamp(9, new Timestamp(order.getOrderDate().getTime()));
            
            int result = stmt.executeUpdate();
            System.out.println("[OrderDAO] Số bản ghi orders được thêm: " + result);
            return result > 0;
        }
    }

    /**
     * Thêm các sản phẩm trong đơn hàng vào database
     */
    public boolean addOrderItems(String orderId, List<OrderItem> items) throws SQLException {
        System.out.println("[OrderDAO] Thêm " + items.size() + " sản phẩm vào đơn hàng " + orderId);
        
        String sql = "INSERT INTO order_items (order_id, product_id, product_name, "
                + "product_image, price, quantity) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            for (OrderItem item : items) {
                stmt.setString(1, orderId);
                stmt.setString(2, item.getProductId());
                stmt.setString(3, item.getProductName());
                stmt.setString(4, item.getProductImage());
                stmt.setDouble(5, item.getPrice());
                stmt.setInt(6, item.getQuantity());
                stmt.addBatch();
            }
            
            int[] results = stmt.executeBatch();
            System.out.println("[OrderDAO] Số sản phẩm được thêm: " + results.length);
            return results.length == items.size();
        }
    }

    /**
     * Lấy danh sách đơn hàng (theo số điện thoại khách hàng)
     */
    public List<Order> getOrdersByPhone(String phone) throws SQLException {
        System.out.println("[OrderDAO] Lấy đơn hàng theo SĐT: " + phone);
        
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE customer_phone = ? ORDER BY order_date DESC";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, phone);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getString("order_id"));
                    order.setCustomerName(rs.getString("customer_name"));
                    order.setCustomerEmail(rs.getString("customer_email"));
                    order.setCustomerPhone(rs.getString("customer_phone"));
                    order.setDeliveryAddress(rs.getString("delivery_address"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    order.setStatus(rs.getString("status"));
                    order.setPaymentMethod(rs.getString("payment_method"));
                    
                    // Lấy danh sách sản phẩm trong đơn hàng
                    order.setItems(getOrderItems(order.getId()));
                    
                    orders.add(order);
                }
            }
        }
        
        System.out.println("[OrderDAO] Tìm thấy " + orders.size() + " đơn hàng");
        return orders;
    }

    /**
     * Lấy chi tiết đơn hàng (theo ID)
     */
    public Order getOrderById(String orderId) throws SQLException {
        System.out.println("[OrderDAO] Lấy đơn hàng theo ID: " + orderId);
        
        String sql = "SELECT * FROM orders WHERE order_id = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, orderId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getString("order_id"));
                    order.setCustomerName(rs.getString("customer_name"));
                    order.setCustomerEmail(rs.getString("customer_email"));
                    order.setCustomerPhone(rs.getString("customer_phone"));
                    order.setDeliveryAddress(rs.getString("delivery_address"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    order.setStatus(rs.getString("status"));
                    order.setPaymentMethod(rs.getString("payment_method"));
                    order.setItems(getOrderItems(orderId));
                    
                    return order;
                }
            }
        }
        
        return null;
    }

    /**
     * Lấy danh sách sản phẩm trong đơn hàng
     */
    public List<OrderItem> getOrderItems(String orderId) throws SQLException {
        System.out.println("[OrderDAO] Lấy sản phẩm cho đơn hàng: " + orderId);
        
        List<OrderItem> items = new ArrayList<>();
        String sql = "SELECT * FROM order_items WHERE order_id = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, orderId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    OrderItem item = new OrderItem();
                    item.setId(rs.getInt("item_id"));
                    item.setProductId(rs.getString("product_id"));
                    item.setProductName(rs.getString("product_name"));
                    item.setProductImage(rs.getString("product_image"));
                    item.setPrice(rs.getDouble("price"));
                    item.setQuantity(rs.getInt("quantity"));
                    
                    items.add(item);
                }
            }
        }
        
        System.out.println("[OrderDAO] Tìm thấy " + items.size() + " sản phẩm");
        return items;
    }

    /**
     * 2.Cập nhật trạng thái đơn hàng
     */
    public boolean updateOrderStatus(String orderId, String newStatus) throws SQLException {
        System.out.println("[OrderDAO] Cập nhật trạng thái đơn hàng " + orderId + " thành: " + newStatus);
        
        String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, newStatus);
            stmt.setString(2, orderId);
            
            int result = stmt.executeUpdate();
            return result > 0;
        }
    }

    /**
     * Lấy tất cả đơn hàng (cho admin)
     */
    public List<Order> getAllOrders() throws SQLException {
        System.out.println("[OrderDAO] Lấy tất cả đơn hàng");
        
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY order_date DESC";
        
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("order_id"));
                order.setCustomerName(rs.getString("customer_name"));
                order.setCustomerEmail(rs.getString("customer_email"));
                order.setCustomerPhone(rs.getString("customer_phone"));
                order.setDeliveryAddress(rs.getString("delivery_address"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setPaymentMethod(rs.getString("payment_method"));
                
                orders.add(order);
            }
        }
        
        System.out.println("[OrderDAO] Tổng số đơn hàng: " + orders.size());
        return orders;
    }

    /**
     * Lấy đơn hàng theo trạng thái
     */
    public List<Order> getOrdersByStatus(String status) throws SQLException {
        System.out.println("[OrderDAO] Lấy đơn hàng theo trạng thái: " + status);
        
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE status = ? ORDER BY order_date DESC";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, status);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getString("order_id"));
                    order.setCustomerName(rs.getString("customer_name"));
                    order.setCustomerEmail(rs.getString("customer_email"));
                    order.setCustomerPhone(rs.getString("customer_phone"));
                    order.setDeliveryAddress(rs.getString("delivery_address"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    order.setStatus(rs.getString("status"));
                    order.setPaymentMethod(rs.getString("payment_method"));
                    
                    orders.add(order);
                }
            }
        }
        
        System.out.println("[OrderDAO] Tìm thấy " + orders.size() + " đơn hàng với trạng thái " + status);
        return orders;
    }
    // Đếm số đơn hàng mới (status = 'pending')
    public int countNewOrders() throws SQLException {
        String sql = "SELECT COUNT(*) FROM orders WHERE status = 'pending'";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    // Tính doanh thu hôm nay (của trang chủ ADMIn)
//    public double getTodayRevenue() throws SQLException {
//        String sql = "SELECT SUM(total_amount) FROM orders WHERE CAST(order_date AS DATE) = '2025-04-13'";
//        try (Connection conn = DBConnect.getConnection();
//             PreparedStatement stmt = conn.prepareStatement(sql);
//             ResultSet rs = stmt.executeQuery()) {
//            if (rs.next()) {
//                return rs.getDouble(1);
//            }
//        }
//        return 0.0;
//    }

    public Map<String, List<Map<String, Object>>> getOrderStatsByCustomer() throws SQLException {
        System.out.println("[OrderDAO] Lấy thống kê tất cả đơn hàng theo khách hàng");
        
        Map<String, List<Map<String, Object>>> result = new HashMap<>();
        List<Map<String, Object>> pendingStats = new ArrayList<>();
        List<Map<String, Object>> confirmedStats = new ArrayList<>();
        List<Map<String, Object>> shippedStats = new ArrayList<>();
        List<Map<String, Object>> deliveredStats = new ArrayList<>();
        List<Map<String, Object>> cancelledStats = new ArrayList<>();
        List<Map<String, Object>> allOrdersStats = new ArrayList<>();
        
        // Thống kê đơn hàng pending
        String pendingSql = "SELECT customer_phone, customer_name, COUNT(*) as order_count, SUM(total_amount) as total_revenue " +
                           "FROM orders " +
                           "WHERE status = 'pending' " +
                           "GROUP BY customer_phone, customer_name " +
                           "ORDER BY total_revenue DESC";
        
        try (PreparedStatement stmt = connection.prepareStatement(pendingSql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> stat = new HashMap<>();
                    stat.put("customer_phone", rs.getString("customer_phone"));
                    stat.put("customer_name", rs.getString("customer_name"));
                    stat.put("order_count", rs.getLong("order_count"));
                    stat.put("total_revenue", rs.getDouble("total_revenue"));
                    pendingStats.add(stat);
                }
            }
        }
        
        // Thống kê đơn hàng confirmed
        String confirmedSql = "SELECT customer_phone, customer_name, COUNT(*) as order_count, SUM(total_amount) as total_revenue " +
                             "FROM orders " +
                             "WHERE status = 'confirmed' " +
                             "GROUP BY customer_phone, customer_name " +
                             "ORDER BY total_revenue DESC";
        
        try (PreparedStatement stmt = connection.prepareStatement(confirmedSql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> stat = new HashMap<>();
                    stat.put("customer_phone", rs.getString("customer_phone"));
                    stat.put("customer_name", rs.getString("customer_name"));
                    stat.put("order_count", rs.getLong("order_count"));
                    stat.put("total_revenue", rs.getDouble("total_revenue"));
                    confirmedStats.add(stat);
                }
            }
        }
        
        // Thống kê đơn hàng shipped
        String shippedSql = "SELECT customer_phone, customer_name, COUNT(*) as order_count, SUM(total_amount) as total_revenue " +
                            "FROM orders " +
                            "WHERE status = 'shipped' " +
                            "GROUP BY customer_phone, customer_name " +
                            "ORDER BY total_revenue DESC";
        
        try (PreparedStatement stmt = connection.prepareStatement(shippedSql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> stat = new HashMap<>();
                    stat.put("customer_phone", rs.getString("customer_phone"));
                    stat.put("customer_name", rs.getString("customer_name"));
                    stat.put("order_count", rs.getLong("order_count"));
                    stat.put("total_revenue", rs.getDouble("total_revenue"));
                    shippedStats.add(stat);
                }
            }
        }
        
        // Thống kê đơn hàng delivered
        String deliveredSql = "SELECT customer_phone, customer_name, COUNT(*) as order_count, SUM(total_amount) as total_revenue " +
                              "FROM orders " +
                              "WHERE status = 'delivered' " +
                              "GROUP BY customer_phone, customer_name " +
                              "ORDER BY total_revenue DESC";
        
        try (PreparedStatement stmt = connection.prepareStatement(deliveredSql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> stat = new HashMap<>();
                    stat.put("customer_phone", rs.getString("customer_phone"));
                    stat.put("customer_name", rs.getString("customer_name"));
                    stat.put("order_count", rs.getLong("order_count"));
                    stat.put("total_revenue", rs.getDouble("total_revenue"));
                    deliveredStats.add(stat);
                }
            }
        }
        
        // Thống kê đơn hàng cancelled
        String cancelledSql = "SELECT customer_phone, customer_name, COUNT(*) as order_count, SUM(total_amount) as total_revenue " +
                              "FROM orders " +
                              "WHERE status = 'cancelled' " +
                              "GROUP BY customer_phone, customer_name " +
                              "ORDER BY total_revenue DESC";
        
        try (PreparedStatement stmt = connection.prepareStatement(cancelledSql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> stat = new HashMap<>();
                    stat.put("customer_phone", rs.getString("customer_phone"));
                    stat.put("customer_name", rs.getString("customer_name"));
                    stat.put("order_count", rs.getLong("order_count"));
                    stat.put("total_revenue", rs.getDouble("total_revenue"));
                    cancelledStats.add(stat);
                }
            }
        }
        
        // Thống kê tất cả đơn hàng
        String allOrdersSql = "SELECT customer_phone, customer_name, COUNT(*) as order_count, SUM(total_amount) as total_revenue " +
                              "FROM orders " +
                              "GROUP BY customer_phone, customer_name " +
                              "ORDER BY total_revenue DESC";
        
        try (PreparedStatement stmt = connection.prepareStatement(allOrdersSql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> stat = new HashMap<>();
                    stat.put("customer_phone", rs.getString("customer_phone"));
                    stat.put("customer_name", rs.getString("customer_name"));
                    stat.put("order_count", rs.getLong("order_count"));
                    stat.put("total_revenue", rs.getDouble("total_revenue"));
                    allOrdersStats.add(stat);
                }
            }
        }
        
        result.put("pending", pendingStats);
        result.put("confirmed", confirmedStats);
        result.put("shipped", shippedStats);
        result.put("delivered", deliveredStats);
        result.put("cancelled", cancelledStats);
        result.put("allOrders", allOrdersStats);
        
        System.out.println("[OrderDAO] Tìm thấy " + allOrdersStats.size() + " khách hàng (tất cả đơn hàng)");
        return result;
    }
    
    // 3.Xóa thẳng đơn hàng
    public boolean deleteOrder(String orderId) throws SQLException {
            // Xóa chi tiết đơn hàng trc 
            String deleteItemsSql = "DELETE FROM order_items WHERE order_id = ?";
            String deleteOrderSql = "DELETE FROM orders WHERE order_id = ?";
            try {
                connection.setAutoCommit(false); // Bắt đầu giao dịch
                // Xóa chi tiết đơn hàng
                try (PreparedStatement deleteItemsStmt = connection.prepareStatement(deleteItemsSql)) {
                    deleteItemsStmt.setString(1, orderId);
                    deleteItemsStmt.executeUpdate();
                }
                // Xóa đơn hàng
                try (PreparedStatement deleteOrderStmt = connection.prepareStatement(deleteOrderSql)) {
                    deleteOrderStmt.setString(1, orderId);
                    int rowsAffected = deleteOrderStmt.executeUpdate();
                    connection.commit(); // Xác nhận giao dịch
                    return rowsAffected > 0;
                }
            } catch (SQLException e) {
                connection.rollback(); // Hoàn tác nếu lỗi
                throw e;
            } finally {
                connection.setAutoCommit(true); // Khôi phục chế độ tự động commit
            }
        }
}
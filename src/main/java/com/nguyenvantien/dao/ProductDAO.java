package com.nguyenvantien.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.sql.Connection; //ad board
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDAO {
    private final Connection connection;

    public ProductDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Map<String, String>> getProductsByCategory(String category) throws SQLException {
        List<Map<String, String>> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE category = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, category);
            System.out.println("Executing query: " + sql + " with category: " + category);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> product = new HashMap<>();
                    product.put("id", rs.getString("product_id"));
                    product.put("name", rs.getString("product_name"));
                    product.put("image", rs.getString("product_image"));
                    product.put("originalPrice", formatPrice(rs.getDouble("original_price")));
                    product.put("discountedPrice", formatPrice(rs.getDouble("discounted_price")));
                    product.put("discountPercent", String.valueOf(rs.getInt("discount_percent")));
                    product.put("category", rs.getString("category"));
                    product.put("stock", String.valueOf(rs.getInt("stock")));
                    product.put("rating", String.format("%.1f", rs.getDouble("rating")));
                    products.add(product);
                }
            }
        }
        return products;
    }

    public List<Map<String, String>> getAllProducts() throws SQLException {
        List<Map<String, String>> products = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Map<String, String> product = new HashMap<>();
                product.put("id", rs.getString("product_id"));
                product.put("name", rs.getString("product_name"));
                product.put("image", rs.getString("product_image"));
                product.put("originalPrice", formatPrice(rs.getDouble("original_price")));
                product.put("discountedPrice", formatPrice(rs.getDouble("discounted_price")));
                product.put("discountPercent", String.valueOf(rs.getInt("discount_percent")));
                product.put("category", rs.getString("category"));
                product.put("stock", String.valueOf(rs.getInt("stock")));
                product.put("rating", String.format("%.1f", rs.getDouble("rating")));
                products.add(product);
            }
        }
        return products;
    }
 
    /*THÊM sp điện thoai*/
    public boolean addProduct(Map<String, String> product) throws SQLException {
        String sql = "INSERT INTO products (product_id, product_name, product_image, original_price, discounted_price, discount_percent, category, stock, rating) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, product.get("id"));
            stmt.setString(2, product.get("name"));
            stmt.setString(3, product.get("image"));
            stmt.setDouble(4, Double.parseDouble(product.get("originalPrice")));
            stmt.setDouble(5, Double.parseDouble(product.get("discountedPrice")));
            stmt.setInt(6, Integer.parseInt(product.get("discountPercent")));
            stmt.setString(7, product.get("category"));
            stmt.setInt(8, Integer.parseInt(product.get("stock")));
            stmt.setDouble(9, Double.parseDouble(product.get("rating")));

            int result = stmt.executeUpdate();
            return result > 0;
        }
    }

    public Map<String, String> getProductById(String productId) throws SQLException {
        String sql = "SELECT * FROM products WHERE product_id = ?";
        Map<String, String> product = new HashMap<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    product.put("id", rs.getString("product_id"));
                    product.put("name", rs.getString("product_name"));
                    product.put("image", rs.getString("product_image"));
                    product.put("originalPrice", formatPrice(rs.getDouble("original_price")));
                    product.put("discountedPrice", formatPrice(rs.getDouble("discounted_price")));
                    product.put("discountPercent", String.valueOf(rs.getInt("discount_percent")));
                    product.put("category", rs.getString("category"));
                    product.put("stock", String.valueOf(rs.getInt("stock")));
                    product.put("rating", String.format("%.1f", rs.getDouble("rating")));
                }
            }
        }
        return product;
    }
    
    /*SỬA sản phẩm điện thoại*/
    public boolean updateProduct(Map<String, String> product) throws SQLException {
        String sql = "UPDATE products SET product_name = ?, product_image = ?, original_price = ?, discounted_price = ?, " +
                     "discount_percent = ?, category = ?, stock = ?, rating = ? WHERE product_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, product.get("name"));
            stmt.setString(2, product.get("image"));
            stmt.setDouble(3, Double.parseDouble(product.get("originalPrice")));
            stmt.setDouble(4, Double.parseDouble(product.get("discountedPrice")));
            stmt.setInt(5, Integer.parseInt(product.get("discountPercent")));
            stmt.setString(6, product.get("category"));
            stmt.setInt(7, Integer.parseInt(product.get("stock")));
            stmt.setDouble(8, Double.parseDouble(product.get("rating")));
            stmt.setString(9, product.get("id"));

            int result = stmt.executeUpdate();
            return result > 0;
        }
    }
    
    /*XÓA sản phẩm*/
    public boolean deleteProduct(String productId) throws SQLException {
        String sql = "DELETE FROM products WHERE product_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, productId);
            int result = stmt.executeUpdate();
            return result > 0;
        }
    }

    private String formatPrice(double price) {
        return String.format("%,.0fđ", price).replace(",", ".");
    }
    
    // Tính tổng số lượng tồn kho (trang admin)
    public int getTotalStock() throws SQLException {
        String sql = "SELECT SUM(stock) FROM products";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
    
    public boolean decreaseStock(String productId, int quantity) throws SQLException {
        // Kiểm tra số lượng tồn kho hiện tại
        String checkSql = "SELECT stock FROM products WHERE product_id = ?";
        int currentStock;
        try (PreparedStatement checkStmt = connection.prepareStatement(checkSql)) {
            checkStmt.setString(1, productId);
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next()) {
                    currentStock = rs.getInt("stock");
                } else {
                    return false; // Sản phẩm không tồn tại
                }
            }
        }

        // Nếu số lượng đặt > sl tồn kho
        if (quantity > currentStock) {
            return false; // Không đủ hàng
        }

        // Cập nhật số lượng tồn kho (-1)
        String updateSql = "UPDATE products SET stock = stock - ? WHERE product_id = ?";
        try (PreparedStatement updateStmt = connection.prepareStatement(updateSql)) {
            updateStmt.setInt(1, quantity);
            updateStmt.setString(2, productId);
            int result = updateStmt.executeUpdate();
            return result > 0;
        }
    }
}
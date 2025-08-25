package com.nguyenvantien.servlets;

import com.nguyenvantien.dao.ProductDAO;
import com.nguyenvantien.dao.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

@WebServlet("/AdminProductServlet")
public class AdminProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection conn = DBConnect.getConnection()) {
            ProductDAO productDAO = new ProductDAO(conn);
            List<Map<String, String>> products = productDAO.getAllProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("admin_products.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Lỗi khi lấy danh sách sản phẩm: " + e.getMessage());
            request.getRequestDispatcher("loi.jsp").forward(request, response);
        }
    }
}
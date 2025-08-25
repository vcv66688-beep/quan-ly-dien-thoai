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
import java.util.HashMap;
import java.util.Map;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection conn = DBConnect.getConnection()) {
            ProductDAO productDAO = new ProductDAO(conn);
            
            Map<String, String> product = new HashMap<>();
            product.put("id", request.getParameter("productId"));
            product.put("name", request.getParameter("name"));
            product.put("image", request.getParameter("image"));
            product.put("originalPrice", request.getParameter("originalPrice"));
            product.put("discountedPrice", request.getParameter("discountedPrice"));
            product.put("discountPercent", request.getParameter("discountPercent"));
            product.put("category", request.getParameter("category"));
            product.put("stock", request.getParameter("stock"));
            product.put("rating", request.getParameter("rating"));

            boolean success = productDAO.updateProduct(product);
            if (success) {
                response.sendRedirect("AdminProductServlet");
            } else {
                request.setAttribute("error", "Không thể cập nhật sản phẩm");
                request.getRequestDispatcher("admin_edit_product.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Lỗi khi cập nhật sản phẩm: " + e.getMessage());
            request.getRequestDispatcher("admin_edit_product.jsp").forward(request, response);
        }
    }
}
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
import java.util.Map;

@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");
        
        // kết nối csdl để lấy tt sản phẩm
        try (Connection conn = DBConnect.getConnection()) {
            // tạo 1 đối tượng
            ProductDAO productDAO = new ProductDAO(conn);
            // lấy thông tin sp từ productId
            Map<String, String> product = productDAO.getProductById(productId);//lay tt cũ
            if (product.isEmpty()) {
                request.setAttribute("error", "Sản phẩm không tồn tại");
                request.getRequestDispatcher("loi.jsp").forward(request, response);
            } else {
                request.setAttribute("product", product);// gán
                request.getRequestDispatcher("admin_edit_product.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Lỗi khi lấy thông tin sản phẩm: " + e.getMessage());
            request.getRequestDispatcher("loi.jsp").forward(request, response);
        }
    }
}
// truy vấn đơn hàng từ DB và hiển thị
package com.nguyenvantien.servlets;

import com.nguyenvantien.dao.OrderDAO;
import com.nguyenvantien.dao.DBConnect;
import com.nguyenvantien.entities.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/DonHangServlet") // donhangcuatoi
public class DonHangServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String phone = (String) session.getAttribute("customerPhone");
        
        if (phone == null) {
            response.sendRedirect("donhangcuatoi.jsp");
            return;
        }
        
        try (Connection conn = DBConnect.getConnection()) {
            OrderDAO orderDAO = new OrderDAO(conn);
            List<Order> orders = orderDAO.getOrdersByPhone(phone);
            
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("donhangcuatoi.jsp").forward(request, response);
            
        } catch (Exception e) {
            throw new ServletException("Lỗi khi lấy danh sách đơn hàng", e);
        }
    }
}
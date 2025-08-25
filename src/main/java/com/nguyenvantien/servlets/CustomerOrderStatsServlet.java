package com.nguyenvantien.servlets;

import com.nguyenvantien.dao.OrderDAO;
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

@WebServlet("/CustomerOrderStatsServlet")
public class CustomerOrderStatsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection conn = DBConnect.getConnection()) {
            OrderDAO orderDAO = new OrderDAO(conn);
            
            // Lấy dữ liệu thống kê
            Map<String, List<Map<String, Object>>> stats = orderDAO.getOrderStatsByCustomer();
            
            // Chuyển dữ liệu sang JSP
            request.setAttribute("pendingStats", stats.get("pending"));
            request.setAttribute("confirmedStats", stats.get("confirmed"));
            request.setAttribute("shippedStats", stats.get("shipped"));
            request.setAttribute("deliveredStats", stats.get("delivered"));
            request.setAttribute("cancelledStats", stats.get("cancelled"));
            request.setAttribute("allOrdersStats", stats.get("allOrders"));
            
            request.getRequestDispatcher("admin_customer_stats.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi lấy dữ liệu thống kê: " + e.getMessage());
            request.getRequestDispatcher("loi.jsp").forward(request, response);
        }
    }
}
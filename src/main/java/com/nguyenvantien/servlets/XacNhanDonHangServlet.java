package com.nguyenvantien.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/XacNhanDonHangServlet")
public class XacNhanDonHangServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        // Xử lý khi nhấn "Quay lại" từ thanhtoanQR.jsp
        if ("restore".equals(action)) {
            // Khôi phục giỏ hàng từ tempCart
            List<Map<String, String>> tempCart = (List<Map<String, String>>) session.getAttribute("tempCart");
            if (tempCart != null && !tempCart.isEmpty()) {
                session.setAttribute("cart", tempCart);
            }
            // Xóa tempCart sau khi khôi phục (tùy chọn)
            session.removeAttribute("tempCart");
            response.sendRedirect("xacnhandonhang.jsp");
            return;
        }

        // Xử lý thông tin giao hàng từ thongtingiaohang.jsp
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String note = request.getParameter("note");
        String paymentMethod = request.getParameter("payment");

        // Validate dữ liệu đầu vào
        if (fullname == null || fullname.isEmpty() || phone == null || phone.isEmpty()) {
            session.setAttribute("error", "Thông tin khách hàng không hợp lệ");
            response.sendRedirect("error.jsp");
            return;
        }

        // Lấy giỏ hàng từ session và kiểm tra null
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            session.setAttribute("error", "Giỏ hàng trống hoặc không tồn tại");
            response.sendRedirect("error.jsp");
            return;
        }

        // Tính tổng tiền
        double total = 0;
        try {
            for (Map<String, String> item : cart) {
                double price = Double.parseDouble(item.get("discountedPrice").replaceAll("[^0-9]", ""));
                int quantity = Integer.parseInt(item.get("quantity"));
                total += price * quantity;
            }
        } catch (NumberFormatException e) {
            session.setAttribute("error", "Dữ liệu giỏ hàng không hợp lệ");
            response.sendRedirect("error.jsp");
            return;
        }

        // Lưu thông tin vào session để xác nhận
        session.setAttribute("fullname", fullname);
        session.setAttribute("email", email);
        session.setAttribute("phone", phone);
        session.setAttribute("deliveryAddress", address + ", " + district + ", " + city);
        session.setAttribute("note", note);
        session.setAttribute("paymentMethod", paymentMethod != null ? paymentMethod : "cod");
        session.setAttribute("orderTotal", total);

        // Chuyển đến trang xác nhận đơn hàng
        response.sendRedirect("xacnhandonhang.jsp");
    }
}
// xử lý với giỏ hàng thêm, tăng/giảm, xóa

package com.nguyenvantien.servlets;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        
        if (cart == null) {
            cart = new ArrayList<>();
        }
        
        String action = request.getParameter("action");
        String productId = request.getParameter("productId");
        
        if ("remove".equals(action)) {
            // Xóa sản phẩm khỏi giỏ hàng
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).get("id").equals(productId)) {
                    cart.remove(i);
                    break;
                }
            }
        } else if ("increase".equals(action) || "decrease".equals(action)) {
            // Thay đổi số lượng sản phẩm
            for (Map<String, String> item : cart) {
                if (item.get("id").equals(productId)) {
                    int quantity = Integer.parseInt(item.get("quantity"));
                    if ("increase".equals(action)) {
                        item.put("quantity", String.valueOf(quantity + 1));
                    } else if ("decrease".equals(action) && quantity > 1) {
                        item.put("quantity", String.valueOf(quantity - 1));
                    }
                    break;
                }
            }
        } else if ("add".equals(action)) {
            // Thêm sản phẩm mới vào giỏ hàng
            String productName = request.getParameter("productName");
            String image = request.getParameter("image");
            String originalPrice = request.getParameter("originalPrice");
            String discountedPrice = request.getParameter("discountedPrice");
            String discountPercent = request.getParameter("discountPercent");
            
            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            boolean found = false;
            for (Map<String, String> item : cart) {
                if (item.get("id").equals(productId)) {
                    int quantity = Integer.parseInt(item.get("quantity"));
                    item.put("quantity", String.valueOf(quantity + 1));
                    found = true;
                    break;
                }
            }
            
            if (!found) {
                Map<String, String> newItem = new HashMap<>();
                newItem.put("id", productId);
                newItem.put("name", productName);
                newItem.put("image", image);
                newItem.put("originalPrice", originalPrice);
                newItem.put("discountedPrice", discountedPrice);
                newItem.put("discountPercent", discountPercent);
                newItem.put("quantity", "1");
                cart.add(newItem);
            }
        }
        
        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }
}
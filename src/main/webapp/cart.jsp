<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Giỏ hàng</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css"> 
    <link rel="stylesheet" href="css/footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        
        /* Header giỏ hàng */
        .cart-header {
            
            margin-top: 11px;
            background-color: #fff;
            padding: 15px 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 19px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .cart-header h1 {
/*            gỏ hàng*/
            margin: 0;
            color: #3498db;
            font-size: 24px;
        }
        
        .continue-shopping {
            padding: 3px;
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .continue-shopping:hover {
            color: #2980b9;
            transform: translateX(-4px);
        }
        
        /* Bảng giỏ hàng */
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        
        .cart-table th {
            background-color: #f8f9fa;
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        .cart-table td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            vertical-align: middle;
        }
        
        .cart-table tr:last-child td {
            border-bottom: none;
        }
        
        .product-info {
            display: flex;
            align-items: center;
        }
        
        .product-image {
            width: 80px;
            height: 80px;
            object-fit: contain;
            margin-right: 15px;
            border: 1px solid #eee;
            border-radius: 4px;
        }
        
        .product-name {
            font-weight: 500;
            color: #333;
        }
        
        .quantity-control {
            display: flex;
            align-items: center;
        }
        
        .quantity-input {
            width: 50px;
            text-align: center;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin: 0 5px;
        }
        
        .quantity-btn {
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            border-radius: 4px;
        }
        
        .quantity-btn:hover {
            background-color: #e9ecef;
        }
        
        .remove-btn {
            color: #dc3545;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        
        .remove-btn:hover {
            color: #c82333;
        }
        
        .price {
            font-weight: bold;
            color: #d70018;
        }
        
        .original-price {
            text-decoration: line-through;
            color: #999;
            font-size: 14px;
            margin-right: 5px;
        }
        
        /* Tổng thanh toán */
        .cart-summary {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        
        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .summary-label {
            color: #666;
        }
        
        .summary-value {
            font-weight: bold;
        }
        
        .total-row {
            border-top: 1px solid #ddd;
            padding-top: 15px;
            margin-top: 15px;
            font-size: 18px;
        }
        
        .total-label {
            color: #333;
        }
        
        .total-value {
            color: #d70018;
            font-size: 20px;
        }
        
        /* Nút thanh toán */
        .checkout-btn {
            display: block;
            width: 98%;
            background-color: #d70018;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;         
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        
        .checkout-btn:hover {
            background-color: #c82333;
        }
        
        .empty-cart {
            text-align: center;
            padding: 50px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .empty-cart i {
            font-size: 50px;
            color: #ddd;
            margin-bottom: 20px;
        }
        
        .empty-cart p {
            color: #666;
            font-size: 18px;
            margin-bottom: 20px;
        }
        
        .back-to-shop {
            display: inline-block;
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
        }
        
        .back-to-shop:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <%@include file="header.jsp"%>
    
    <div class="container">
        <div class="cart-header">
            <a href="index.jsp#apple" class="continue-shopping"><i class="fas fa-arrow-left"></i> Tiếp tục mua sắm</a>
            <a title="xem chi tiết" href="DonHangServlet" class="continue-shopping"><i class="fas fa-list-alt"></i> XEM ĐƠN HÀNG CỦA TÔI</a>
        </div>
        
        <%
        // Lấy giỏ hàng từ session
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        NumberFormat nf = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
        
        if (cart == null || cart.isEmpty()) {
        %>
            <div class="empty-cart">
                <i class="fas fa-shopping-cart"></i>
                <p>Giỏ hàng của bạn đang trống</p>
                <a href="index.jsp#apple" class="back-to-shop">Mua sắm ngay</a>
            </div>
        <%
        } else {
            // Tính tổng tiền
            long total = 0;
            for (Map<String, String> item : cart) {
                long price = Long.parseLong(item.get("discountedPrice").replaceAll("[^0-9]", ""));
                int quantity = Integer.parseInt(item.get("quantity"));
                total += price * quantity;
            }
        %>
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Tạm tính</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Map<String, String> item : cart) { 
                        long price = Long.parseLong(item.get("discountedPrice").replaceAll("[^0-9]", ""));
                        int quantity = Integer.parseInt(item.get("quantity"));
                        long subtotal = price * quantity;
                    %>
                    <tr>
                        <td>
                            <div class="product-info">
                                <img src="<%= item.get("image") %>" alt="<%= item.get("name") %>" class="product-image">
                                <div>
                                    <div class="product-name"><%= item.get("name") %></div>
                                    <div style="color: #666; font-size: 14px;">Mã điện thoại: <%= item.get("id") %></div>
                                </div>
                            </div>
                        </td>
                        <td class="price">
                            <%= nf.format(price) %>đ
                            <% if (item.containsKey("originalPrice") && !item.get("originalPrice").isEmpty()) { %>
                                <div style="font-size: 12px; color: #666;">
                                    <del><%= item.get("originalPrice") %></del>
                                    <span style="color: #d70018;">(-<%= item.get("discountPercent") %>)</span>
                                </div>
                            <% } %>
                        </td>
                        <td>
                            <div class="quantity-control">
                                <form action="UpdateCartServlet" method="post" style="display: flex; align-items: center;">
                                    <input type="hidden" name="action" value="decrease">
                                    <input type="hidden" name="productId" value="<%= item.get("id") %>">
                                    <button type="submit" class="quantity-btn">-</button>
                                </form>
                                
                                <input type="text" value="<%= quantity %>" class="quantity-input" readonly>
                                
                                <form action="UpdateCartServlet" method="post" style="display: flex; align-items: center;">
                                    <input type="hidden" name="action" value="increase">
                                    <input type="hidden" name="productId" value="<%= item.get("id") %>">
                                    <button type="submit" class="quantity-btn">+</button>
                                </form>
                            </div>
                        </td>
                        <td class="price"><%= nf.format(subtotal) %>đ</td>
                        <td>
                            <form action="UpdateCartServlet" method="post">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="productId" value="<%= item.get("id") %>">
                                <button type="submit" class="remove-btn"><i class="fas fa-trash"></i></button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            
            <div class="cart-summary">
                <div class="summary-row">
                    <span class="summary-label">Tạm tính:</span>
                    <span class="summary-value"><%= nf.format(total) %>đ</span>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Phí vận chuyển:</span>
                    <span class="summary-value">0đ</span>
                </div>
                <div class="summary-row total-row">
                    <span class="total-label">Tổng cộng:</span>
                    <span class="total-value"><%= nf.format(total) %>đ</span>
                </div>
                
                <a href="thongtingiaohang.jsp" class="checkout-btn"><i class="fa-solid fa-credit-card"></i> TIẾN HÀNH THANH TOÁN</a>
            </div>
        <% } %>
    </div>
    
    <%@include file="footer.jsp"%>
    
    <script>
        // JavaScript 
    </script>
</body>
</html>
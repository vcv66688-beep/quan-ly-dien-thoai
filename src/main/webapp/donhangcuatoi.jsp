<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, com.nguyenvantien.entities.Order, com.nguyenvantien.entities.OrderItem" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đơn hàng của tôi</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        .orders-container { max-width: 1200px; margin: 20px auto; padding: 0 15px; }
        .page-header { text-align: center; margin-bottom: 30px; }
        .page-header h1 { font-size: 28px; font-weight: 700; color: #d70018; margin-bottom: 10px; }
        .page-header p { color: #666; font-size: 16px; }

        .order-list { display: flex; flex-direction: column; gap: 20px; }
        .order-card { background-color: #fff; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); padding: 20px; transition: transform 0.2s; }
        .order-card:hover { transform: translateY(-5px); }
        .order-header { display: flex; justify-content: space-between; align-items: center; padding-bottom: 15px; border-bottom: 1px solid #eee; }
        .order-id { font-weight: 700; color: #d70018; }
        .order-status { padding: 5px 10px; border-radius: 15px; font-size: 14px; font-weight: 500; }
        .status-pending { background-color: #fff3e0; color: #fb8c00; }
        .status-confirmed { background-color: #e8f5e9; color: #28a745; }
        .status-shipped { background-color: #e3f2fd; color: #1976d2; }
        .status-delivered { background-color: #e0f7fa; color: #00695c; }
        .status-cancelled { background-color: #ffebee; color: #d32f2f; }

        .order-details { display: flex; justify-content: space-between; padding: 15px 0; }
        .order-info { flex: 2; }
        .order-info-row { display: flex; margin-bottom: 10px; }
        .info-label { width: 120px; font-weight: 500; color: #666; }
        .info-value { flex: 1; color: #333; }
        .order-items { flex: 3; max-height: 200px; overflow-y: auto; padding-left: 30px; }
        .order-item { display: flex; align-items: center; margin-bottom: 15px; }
        .item-image { width: 50px; height: 50px; object-fit: contain; margin-right: 15px; border: 1px solid #eee; border-radius: 4px; }
        .item-info { flex: 1; }
        .item-name { font-weight: 500; color: #333; }
        .item-price { color: #d70018; }
        .item-quantity { color: #666; font-size: 14px; }

        .order-total { text-align: right; padding-top: 15px; border-top: 1px solid #eee; }
        .total-label { font-weight: 500; color: #666; }
        .total-value { font-size: 18px; font-weight: 700; color: #d70018; }

        .order-actions { margin-top: 15px; text-align: right; }
        .btn-view-details, .btn-cancel { display: inline-block; padding: 8px 15px; border-radius: 4px; text-decoration: none; font-weight: 500; transition: all 0.3s; }
        .btn-view-details { background-color: #3498db; color: white; }
        .btn-view-details:hover { background-color: #2980b9; }
        .btn-cancel { background-color: #dc3545; color: white; margin-left: 10px; }
        .btn-cancel:hover { background-color: #c82333; }

        .empty-orders { text-align: center; padding: 50px; background-color: #fff; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .empty-orders i { font-size: 50px; color: #ddd; margin-bottom: 20px; }
        .empty-orders p { font-size: 18px; color: #666; margin-bottom: 30px; }
        .btn-shop-now { background-color: #d70018; color: white; padding: 10px 20px; border-radius: 4px; text-decoration: none; font-weight: 500; }
        .btn-shop-now:hover { background-color: #c82333; }

        @media (max-width: 768px) {
            .order-details { flex-direction: column; }
            .order-items { padding-left: 0; margin-top: 15px; }
            .order-actions { text-align: center; }
            .btn-cancel { margin-left: 0; margin-top: 10px; }
        }
        
        .btn-shop-now .fa-shopping-cart { 
            font-size: 15px; 
            margin-right: 8px; 
            color: white; 
        }
        
        /*nút quay lại và h1*/
        .header-container {
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }
        
        /*quaylai*/
        .back-icon {
            position: absolute;
            left: 0;
            font-size: 32px;
            color: #d70018;
            text-decoration: none;
/*            transition: all 0.3s ease;*/
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .back-icon:hover {
            transform: translateX(-5px);
/*            transform: scale(1.2);*/
            color: #3498db;
        }

        .page-header h1 {
            font-size: 27px;
            font-weight: 700;
            color: #d70018;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .page-header h1 i {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <%@include file="header.jsp"%>

    <div class="orders-container">
        <div class="page-header">
            <div class="header-container">
                <a href="cart.jsp" class="back-icon">
                    <i class="fas fa-arrow-left" title="Quay lại giỏ hàng"></i>
                </a>
                <h1><i class="fas fa-list-alt"></i> ĐƠN HÀNG CỦA TÔI</h1>
            </div>
            <p>Hiển thị chi tiết đơn hàng khách hàng đã đăng ký</p>
        </div>

        <%
        List<Order> orders = (List<Order>) request.getAttribute("orders");
        NumberFormat nf = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

        if (orders == null || orders.isEmpty()) {
        %>
            <div class="empty-orders">
                <i class="fas fa-box-open"></i>
                <p>Danh sách đơn hàng của bạn trống</p>
                <a href="index.jsp#apple" class="btn-shop-now"><i class="fas fa-shopping-cart" ></i> MUA SẮM NGAY</a>
            </div>
        <%
        } else {
        %>
            <div class="order-list">
                <% for (Order order : orders) { %>
                <div class="order-card">
                    <div class="order-header">
                        <span class="order-id">Mã đơn hàng: <%= order.getId() %></span>
                        <span class="order-status <%= getStatusClass(order.getStatus()) %>">
                            <%= formatStatus(order.getStatus()) %>
                        </span>
                    </div>
                    <div class="order-details">
                        <div class="order-info">
                            <div class="order-info-row">
                                <span class="info-label">Khách hàng:</span>
                                <span class="info-value"><%= order.getCustomerName() %></span>
                            </div>
                            <div class="order-info-row">
                                <span class="info-label">Số điện thoại:</span>
                                <span class="info-value"><%= order.getCustomerPhone() %></span>
                            </div>
                            <div class="order-info-row">
                                <span class="info-label">Địa chỉ:</span>
                                <span class="info-value"><%= order.getDeliveryAddress() %></span>
                            </div>
                            <div class="order-info-row">
                                <span class="info-label">Ngày đặt:</span>
                                <span class="info-value"><%= sdf.format(order.getOrderDate()) %></span>
                            </div>
                        </div>
                        <div class="order-items">
                            <% for (OrderItem item : order.getItems()) { %>
                            <div class="order-item">
                                <img src="<%= item.getProductImage() %>" alt="<%= item.getProductName() %>" class="item-image">
                                <div class="item-info">
                                    <div class="item-name"><%= item.getProductName() %></div>
                                    <div class="item-price"><%= nf.format(item.getPrice()) %>đ</div>
                                    <div class="item-quantity">Số lượng: <%= item.getQuantity() %></div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <div class="order-total">
                        <span class="total-label">Tổng cộng:</span>
                        <span class="total-value"><%= nf.format(order.getTotalAmount()) %>đ</span>
                    </div>
                    <div class="order-actions">
                        <a href="<%= request.getContextPath() %>/ChiTietDonHangServlet2?orderId=<%= order.getId() %>" class="btn-view-details">
                            <i class="fas fa-eye"></i> Xem chi tiết
                        </a>
                        <% if ("pending".equals(order.getStatus())) { %>
                        <a href="<%= request.getContextPath() %>/HuyDonHangServlet?orderId=<%= order.getId() %>" class="btn-cancel" onclick="return confirm('Bạn có chắc muốn hủy đơn hàng này?');">
                            <i class="fas fa-times"></i> Hủy đơn hàng
                        </a>
                        <% } %>
                    </div>
                </div>
                <% } %>
            </div>
        <% } %>
    </div>

    <%@include file="footer.jsp"%>
</body>
<%!
    private String getStatusClass(String status) {
        switch (status.toLowerCase()) {
            case "pending": return "status-pending";
            case "confirmed": return "status-confirmed";
            case "shipped": return "status-shipped";
            case "delivered": return "status-delivered";
            case "cancelled": return "status-cancelled";
            default: return "";
        }
    }

    private String formatStatus(String status) {
        switch (status.toLowerCase()) {
            case "pending": return "Chờ xác nhận";
            case "confirmed": return "Đang xử lý";
            case "shipped": return "Đang giao";
            case "delivered": return "Đã giao";
            case "cancelled": return "Đã hủy";
            default: return status;
        }
    }
%>
</html>
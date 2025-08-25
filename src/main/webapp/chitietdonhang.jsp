<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, com.nguyenvantien.entities.Order, com.nguyenvantien.entities.OrderItem" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết đơn hàng</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .order-detail-container { max-width: 930px; margin: 20px auto; background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .order-header { text-align: center;}
        .order-header h1 { font-size: 24px; color: #d70018; }
        .order-info, .order-items, .order-total { margin-bottom: 20px; padding: 15px; background-color: #f8f9fa; border-radius: 5px; }
        .info-row { display: flex; margin-bottom: 7px; }
        .info-label { width: 200px; font-weight: 500; color: #666; }
        .info-value { flex: 1; }
        .item-row { display: flex; align-items: center; padding: 10px 0; border-bottom: 1px solid #eee; }
        .item-image { width: 60px; height: 60px; object-fit: contain; margin-right: 15px; }
        .item-details { flex: 1; }
        .item-name { font-weight: 500; }
        .item-price { color: #d70018; }
        .total-row { display: flex; justify-content: space-between; font-size: 18px; font-weight: 700; }
        .total-value { color: #d70018; }
        .btn-back { display: inline-block; margin-top: 0px; background-color: #3498db; color: white; padding: 10px 20px; border-radius: 4px; text-decoration: none; }
        .btn-back:hover { background-color: #2980b9; }
    </style>
</head>
<body>
    <%@include file="header.jsp"%>

    <div class="order-detail-container">
        <div class="order-header">
            <h1>CHI TIẾT ĐƠN HÀNG #<%= ((Order) request.getAttribute("order")).getId() %></h1>
        </div>

        <%
        Order order = (Order) request.getAttribute("order");
        NumberFormat nf = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        %>

        <div class="order-info">
            <div class="info-row"><span class="info-label">Khách hàng:</span><span class="info-value"><%= order.getCustomerName() %></span></div>
            <div class="info-row"><span class="info-label">Số điện thoại:</span><span class="info-value"><%= order.getCustomerPhone() %></span></div>
            <div class="info-row"><span class="info-label">Email:</span><span class="info-value"><%= order.getCustomerEmail() %></span></div>
            <div class="info-row"><span class="info-label">Địa chỉ giao hàng:</span><span class="info-value"><%= order.getDeliveryAddress() %></span></div>
            <div class="info-row"><span class="info-label">Ngày đặt hàng:</span><span class="info-value"><%= sdf.format(order.getOrderDate()) %></span></div>
            <div class="info-row"><span class="info-label">Trạng thái:</span><span class="info-value"><%= formatStatus(order.getStatus()) %></span></div>
            <div class="info-row"><span class="info-label">Phương thức thanh toán:</span><span class="info-value"><%= formatPaymentMethod(order.getPaymentMethod()) %></span></div>
        </div>

        <div class="order-items">
            <% for (OrderItem item : order.getItems()) { %>
            <div class="item-row">
                <img src="<%= item.getProductImage() %>" alt="<%= item.getProductName() %>" class="item-image">
                <div class="item-details">
                    <div class="item-name"><%= item.getProductName() %></div>
                    <div class="item-price"><%= nf.format(item.getPrice()) %>đ x <%= item.getQuantity() %></div>
                </div>
            </div>
            <% } %>
        </div>

        <div class="order-total">
            <div class="total-row">
                <span>Tổng tiền:</span>
                <span class="total-value"><%= nf.format(order.getTotalAmount()) %>đ</span>
            </div>
        </div>

        <a href="DonHangServlet" class="btn-back"><i class="fas fa-arrow-left"></i> Quay lại đơn hàng của tôi</a>
    </div>

    <%@include file="footer.jsp"%>
</body>
<%!
    private String formatStatus(String status) {
        switch (status.toLowerCase()) {
            case "pending": return "Chờ xác nhận";
            case "processing": return "Đang xử lý";
            case "shipped": return "Đang giao";
            case "delivered": return "Đã giao";
            case "cancelled": return "Đã hủy";
            default: return status;
        }
    }

    private String formatPaymentMethod(String method) {
        switch (method.toLowerCase()) {
            case "cod": return "Thanh toán khi nhận hàng (COD)";
            case "bank": return "Chuyển khoản ngân hàng";
            case "momo": return "Ví điện tử MoMo";
            default: return method;
        }
    }
%>
</html>
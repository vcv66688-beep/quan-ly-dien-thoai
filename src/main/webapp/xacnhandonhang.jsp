<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.NumberFormat, java.util.Locale, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Xác nhận đơn hàng</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .checkout-header { text-align: center; margin-bottom: 30px; }
        .checkout-header h1 { color: #d70018; font-size: 28px; margin-bottom: 10px; }
        .checkout-header .steps { display: flex; justify-content: center; margin-bottom: 20px; }
        .checkout-header .step { display: flex; align-items: center; margin: 0 15px; }
        .checkout-header .step-number { width: 30px; height: 30px; background-color: #d70018; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 10px; font-weight: bold; }
        .checkout-header .step.active .step-number { background-color: #d70018; }
        .checkout-header .step.inactive .step-number { background-color: #ccc; }
        .checkout-header .step-text { font-weight: 500; }
        .checkout-content { display: flex; gap: 20px; }
        .customer-info { flex: 2; background-color: white; border-radius: 8px; padding: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); margin-bottom: 20px; }
        .order-summary { flex: 1; background-color: white; border-radius: 8px; padding: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); height: fit-content; }
        .section-title { font-size: 18px; font-weight: 700; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 1px solid #eee; color: #d70018; }
        .details-grid { display: grid; grid-template-columns: 180px 1fr; gap: 10px; margin-bottom: 20px; }
        .details-grid p { margin: 8px 0; font-size: 16px; line-height: 1.5; }
        .details-grid strong { font-weight: 500; color: #333; }
        .details-grid strong.bold-label { font-weight: 700; }
        .order-items { margin-bottom: 20px; }
        .order-item { display: flex; margin-bottom: 15px; padding-bottom: 15px; border-bottom: 1px solid #eee; }
        .order-item:last-child { border-bottom: none; }
        .order-item-img { width: 60px; height: 60px; object-fit: contain; margin-right: 15px; border: 1px solid #eee; border-radius: 4px; }
        .order-item-info { flex: 1; }
        .order-item-name { font-weight: 500; margin-bottom: 5px; }
        .order-item-price { color: #d70018; font-weight: 500; }
        .order-item-qty { color: #666; font-size: 14px; }
        .summary-row { display: flex; justify-content: space-between; margin-bottom: 10px; }
        .summary-label { color: #666; }
        .summary-value { font-weight: 500; }
        .total-row { border-top: 1px solid #eee; padding-top: 15px; margin-top: 15px; font-size: 18px; font-weight: 700; }
        .total-value { color: #d70018; }
        .btn-place-order { width: 100%; background-color: #d70018; color: white; border: none; padding: 12px; font-size: 16px; font-weight: 700; border-radius: 4px; cursor: pointer; margin-top: 20px; transition: background-color 0.3s; }
        .btn-place-order:hover { background-color: #c82333; }
        .back-to-cart { display: inline-block; margin-top: 15px; color: #d70018; text-decoration: none; font-weight: 500; }
        .back-to-cart:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <%@include file="header.jsp"%>

    <div class="container">
        <div class="checkout-header">
            <h1>THANH TOÁN ĐƠN HÀNG</h1>
            <div class="steps">
                <div class="step inactive">
                    <div class="step-number">1</div>
                    <div class="step-text">Thông tin giao hàng</div>
                </div>
                <div class="step active">
                    <div class="step-number">2</div>
                    <div class="step-text">Xác nhận đơn hàng</div>
                </div>
                <div class="step inactive">
                    <div class="step-number">3</div>
                    <div class="step-text">Thanh toán</div>
                </div>
                <div class="step inactive">
                    <div class="step-number">4</div>
                    <div class="step-text">Hoàn tất thanh toán</div>
                </div>
            </div>
        </div>

        <form action="HinhThucThanhToanServlet" method="post">
            <div class="checkout-content">
                <div class="customer-info">
                    <h2 class="section-title"><i class="fa-solid fa-clipboard-check"></i> BƯỚC 2. XÁC NHẬN ĐƠN HÀNG</h2>
                    <div class="details-grid">
                        <p><strong class="bold-label">Họ và tên:</strong></p>
                        <p><%= session.getAttribute("fullname") %></p>
                        <p><strong class="bold-label">Email:</strong></p>
                        <p><%= session.getAttribute("email") %></p>
                        <p><strong class="bold-label">Số điện thoại:</strong></p>
                        <p><%= session.getAttribute("phone") %></p>
                        <p><strong>Địa chỉ giao hàng:</strong></p>
                        <p><%= session.getAttribute("deliveryAddress") %></p>
                        <p><strong>Ghi chú:</strong></p>
                        <p><%= session.getAttribute("note") != null ? session.getAttribute("note") : "Không có" %></p>
                        <p><strong>Phương thức thanh toán:</strong></p>
                        <p>
                            <%= "cod".equals(session.getAttribute("paymentMethod")) ? "Thanh toán khi nhận hàng (COD)" :
                                "bank".equals(session.getAttribute("paymentMethod")) ? "Chuyển khoản ngân hàng" : "Ví điện tử MoMo" %>
                        </p>
                    </div>
                </div>
                <div class="order-summary">
                    <h2 class="section-title"><i class="fa-solid fa-box"></i> ĐƠN HÀNG CỦA BẠN</h2>
                    <div class="order-items">
                        <%
                        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
                        NumberFormat nf = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
                        double total = (double) session.getAttribute("orderTotal");
                        if (cart != null) {
                            for (Map<String, String> item : cart) {
                                long price = Long.parseLong(item.get("discountedPrice").replaceAll("[^0-9]", ""));
                                int quantity = Integer.parseInt(item.get("quantity"));
                        %>
                        <div class="order-item">
                            <img src="<%= item.get("image") %>" alt="<%= item.get("name") %>" class="order-item-img">
                            <div class="order-item-info">
                                <div class="order-item-name"><%= item.get("name") %></div>
                                <div class="order-item-price"><%= nf.format(price) %>đ</div>
                                <div class="order-item-qty">Số lượng: <%= quantity %></div>
                            </div>
                        </div>
                        <% } } %>
                    </div>
                    <div class="summary-row">
                        <span class="summary-label">Tạm tính:</span>
                        <span class="summary-value"><%= nf.format(total) %>đ</span>
                    </div>
                    <div class="summary-row">
                        <span class="summary-label">Phí vận chuyển:</span>
                        <span class="summary-value">0đ</span>
                    </div>
                    <div class="summary-row total-row">
                        <span class="summary-label">Tổng cộng:</span>
                        <span class="total-value"><%= nf.format(total) %>đ</span>
                    </div>
                    <button type="submit" class="btn-place-order"><i class="fa-solid fa-circle-check"></i> XÁC NHẬN ĐẶT HÀNG</button>
                    <a href="thongtingiaohang.jsp" class="back-to-cart"><i class="fas fa-arrow-left"></i> Quay lại chỉnh sửa</a>
                </div>
            </div>
        </form>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
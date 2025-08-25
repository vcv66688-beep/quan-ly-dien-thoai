<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.NumberFormat, java.util.Locale" %>

<!DOCTYPE html>
<html>
<head>
    <title>Hoàn tất thanh toán</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .confirmation-box { width: 94%; margin: 10px auto; background-color: white; border-radius: 8px; padding: 30px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); text-align: center; }
        .confirmation-icon { color: #28a745; font-size: 60px; margin-bottom: 20px; }
        .confirmation-title { font-size: 24px; font-weight: 700; margin-bottom: 15px; color: #28a745; }
        .confirmation-subtitle { font-size: 18px; margin-bottom: 30px; color: #555; }
        .order-info { text-align: left; margin: 25px 0; padding: 20px; background-color: #f8f9fa; border-radius: 5px; }
        .info-row { display: flex; margin-bottom: 10px; }
        .info-label { width: 167px; font-weight: 500; color: #666; }
        .info-value { flex: 1; }
        .total-price { font-size: 20px; font-weight: 700; color: #d70018; margin: 20px 0; }
        .btn-continue, .btn-view-order { display: inline-block; color: white; padding: 12px 25px; border-radius: 4px; text-decoration: none; font-weight: 500; margin-top: 10px; transition: all 0.3s; text-align: center; min-width: 200px; box-sizing: border-box; }
        .btn-continue { background-color: #d70018; }
        .btn-continue:hover { background-color: #c82333; transform: translateY(-2px); box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .btn-view-order { background-color: #3498db; margin-right: 15px; }
        .btn-view-order:hover { background-color: #2980b9; transform: translateY(-2px); box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .payment-instruction { margin-top: 30px; padding: 15px; background-color: #fff8e1; border-left: 4px solid #ffc107; text-align: left; }
        .instruction-title { font-weight: 700; margin-bottom: 10px; }
        .order-actions { display: flex; justify-content: center; gap: 15px; margin-top: 12px; flex-wrap: wrap; }
        @media (max-width: 600px) { .order-actions { flex-direction: column; align-items: center; } .btn-view-order { margin-right: 0; margin-bottom: 15px; } .info-row { flex-direction: column; } .info-label { width: 100%; margin-bottom: 5px; } }
    </style>
</head>
<body>
    <%@include file="header.jsp"%>

    <div class="container">
        <div class="confirmation-box">
            <div class="confirmation-icon"><i class="fas fa-check-circle"></i></div>
            <h1 class="confirmation-title">ĐẶT HÀNG THÀNH CÔNG!</h1>
            <p class="confirmation-subtitle">Cảm ơn bạn đã mua sắm tại cửa hàng chúng tôi</p>

            <div class="order-info">
                <div class="info-row"><div class="info-label">Mã đơn hàng:</div><div class="info-value"><%= session.getAttribute("orderId") %></div></div>
                <div class="info-row"><div class="info-label">Khách hàng:</div><div class="info-value"><%= session.getAttribute("customerName") %></div></div>
                <div class="info-row"><div class="info-label">Số điện thoại:</div><div class="info-value"><%= session.getAttribute("customerPhone") %></div></div>
                <div class="info-row"><div class="info-label">Địa chỉ nhận hàng:</div><div class="info-value"><%= session.getAttribute("deliveryAddress") %></div></div>
                <div class="info-row"><div class="info-label">Hình thức thanh toán:</div><div class="info-value">
                    <%= "cod".equals(session.getAttribute("paymentMethod")) ? "Thanh toán khi nhận hàng (COD)" :
                        "bank".equals(session.getAttribute("paymentMethod")) ? "Chuyển khoản ngân hàng" : "Ví điện tử MoMo" %>
                </div></div>
            </div>

            <div class="total-price">Tổng tiền: <%= NumberFormat.getNumberInstance(new Locale("vi", "VN")).format(session.getAttribute("orderTotal")) %>đ</div>
            <p>Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất để xác nhận đơn hàng.</p>

            <div class="order-actions">
                <a href="DonHangServlet" class="btn-view-order"><i class="fas fa-list-alt"></i> XEM ĐƠN HÀNG CỦA TÔI</a>
                <a href="index.jsp#apple" class="btn-continue"><i class="fas fa-shopping-cart"></i> TIẾP TỤC MUA SẮM</a>
            </div>

            <div class="payment-instruction">
                <div class="instruction-title">HƯỚNG DẪN THANH TOÁN:</div>
                <p>1. Kiểm tra thông tin đơn hàng và chờ nhân viên gọi xác nhận</p>
                <p>2. Đơn hàng sẽ được giao trong vòng 2-3 ngày làm việc</p>
                <p>3. <%= "cod".equals(session.getAttribute("paymentMethod")) ? "Thanh toán khi nhận hàng (COD)" : "Kiểm tra email để xác nhận thanh toán" %></p>
                <p>4. Kiểm tra hàng hóa trước khi thanh toán</p>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF8" %>
<%@ page import="java.text.NumberFormat, java.util.Locale" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Thanh toán khi nhận hàng</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/filecss.css">
    <link rel="stylesheet" href="css/footer.css">
    <style>
        .cod-container { background-color: #ffffff; border-radius: 12px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); padding: 32px; display: flex; gap: 32px; align-items: flex-start; transition: transform 0.3s ease; }
        .cod-container:hover { transform: translateY(-4px); }
        .cod-left, .info-right { flex: 1; }
        .cod-left { text-align: center; }
        .cod-left h1 { font-size: 24px; font-weight: 600; color: #1a3c5e; margin-bottom: 16px; text-transform: uppercase; letter-spacing: 0.5px; }
        .cod-image { width: 390px; height: 222px; margin: 23px auto; border: 8px solid #f0f4f8; border-radius: 8px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05); }
        .payment-info { background-color: #f9fafb; border-radius: 8px; padding: 20px; font-size: 15px; line-height: 1.6; margin-top: 24px; }
        .payment-info p { margin: 8px 0; color: #2d4b73; }
        .payment-info strong { color: #1a3c5e; font-weight: 500; }
        .amount { font-size: 20px; font-weight: 600; color: #e53e3e; margin: 16px 0; }
        .complete-btn { display: inline-block; background-color: #28a745; color: #ffffff; padding: 14px 32px; border-radius: 8px; text-decoration: none; font-size: 16px; font-weight: 500; margin-top: 24px; transition: background-color 0.3s ease, transform 0.2s ease; }
        .complete-btn:hover { background-color: #218838; transform: translateY(-2px); }
        .complete-btn:active { transform: translateY(0); }
        .back-btn { display: inline-block; background-color: #4da8da; color: #ffffff; padding: 14px 32px; border-radius: 8px; text-decoration: none; font-size: 16px; font-weight: 500; margin-top: 24px; margin-right: 16px; transition: background-color 0.3s ease, transform 0.2s ease; border: none; }
        .back-btn:hover { background-color: #3d8bc9; transform: translateY(-2px); }
        .back-btn:active { transform: translateY(0); }
        .button-container { display: flex; align-items: center; justify-content: center; gap: 16px; }
        .note { font-size: 14px; color: #6b7280; margin-top: 16px; }
        .payment-method { display: flex; align-items: center; gap: 12px; margin-bottom: 20px; font-size: 16px; color: #2d4b73; justify-content: center; }
        .payment-method i { font-size: 24px; color: #3498db; }
        @media (max-width: 768px) {
            .cod-container { flex-direction: column; padding: 20px; align-items: center; }
            .cod-left h1 { font-size: 20px; }
            .cod-image { width: 180px; height: 180px; }
            .payment-info { font-size: 14px; padding: 16px; }
            .complete-btn, .back-btn { padding: 12px 24px; font-size: 14px; }
            .amount { font-size: 18px; }
            .button-container { flex-direction: column; gap: 12px; }
            .back-btn { margin-right: 0; }
        }
        .confirmation-header { text-align: center; margin-bottom: 30px; }
        .confirmation-header h1 { color: #d70018; font-size: 28px; margin-bottom: 10px; }
        .confirmation-header .steps { display: flex; justify-content: center; margin-bottom: 20px; }
        .confirmation-header .step { display: flex; align-items: center; margin: 0 15px; }
        .confirmation-header .step-number { width: 30px; height: 30px; background-color: #d70018; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 10px; font-weight: bold; }
        .confirmation-header .step.active .step-number { background-color: #d70018; }
        .confirmation-header .step.inactive .step-number { background-color: #ccc; }
        .confirmation-header .step-text { font-weight: 500; }
    </style>
</head>
<body>
    <%@include file="header.jsp"%>
    <div class="container">
        <div class="confirmation-header">
            <h1>THANH TOÁN ĐƠN HÀNG</h1>
            <div class="steps">
                <div class="step inactive">
                    <div class="step-number">1</div>
                    <div class="step-text"><b>Thông tin giao hàng</b></div>
                </div>
                <div class="step inactive">
                    <div class="step-number">2</div>
                    <div class="step-text"><b>Xác nhận đơn hàng</b></div>
                </div>
                <div class="step active">
                    <div class="step-number">3</div>
                    <div class="step-text"><b>Thanh toán COD</b></div>
                </div>
                <div class="step inactive">
                    <div class="step-number">4</div>
                    <div class="step-text"><b>Hoàn tất thanh toán</b></div>
                </div>
            </div>
        </div>
        <div class="cod-container">
            <%
                NumberFormat nf = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
                double total = (double) session.getAttribute("orderTotal");
            %>
            <div class="cod-left">
                <h1>Thanh toán khi nhận hàng</h1>
                <div class="payment-method">
                    <i class="fas fa-money-bill-wave"></i>
                    <span>Hình thức: Thanh toán khi nhận hàng (COD)</span>
                </div>
                <p class="amount">Số tiền: <%= nf.format(total) %>đ</p>
                <img src="images/COD.jpg" alt="COD Image" class="cod-image">
            </div>
            <div class="info-right">
                <div class="payment-info">
                    <p><strong>Mã đơn hàng:</strong> <%= session.getAttribute("orderId") %></p>
                    <p><strong>Khách hàng:</strong> <%= session.getAttribute("customerName") %></p>
                    <p><strong>Số tiền cần chuẩn bị:</strong> <%= nf.format(total) %>đ</p>
                    <p><strong>Ghi chú:</strong> Khách hàng vui lòng chuẩn bị đúng số tiền để thanh toán cho shipper khi nhận hàng.</p>
                </div>
                <p class="note">Shipper sẽ liên hệ bạn để xác nhận thời gian giao hàng. Vui lòng kiểm tra kỹ sản phẩm trước khi thanh toán.</p>
                <div class="button-container">
                    <form action="XacNhanDonHangServlet" method="post">
                        <input type="hidden" name="action" value="restore">
                        <button type="submit" class="back-btn">
                            <i class="fa-solid fa-arrow-left"></i> Quay lại xác nhận
                        </button>
                    </form>
                    <a href="#" onclick="goForward()" class="complete-btn"><i class="fa-solid fa-check"></i> Xác nhận thanh toán COD</a>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
    <script>
        function goForward() {
            if (window.history.state && window.history.length > 1) {
                window.history.forward();
            } else {
                window.location.href = "hoantatthanhtoan.jsp";
            }
        }
    </script>
</body>
</html>
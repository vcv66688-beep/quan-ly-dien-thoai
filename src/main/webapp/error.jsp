<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thông báo lỗi</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .error-container { width: 70%; margin: 70px auto; background-color: white; border-radius: 8px; padding: 45px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); text-align: center; }
        .error-icon { color: #d70018; font-size: 60px; margin-bottom: 20px; }
        .error-title { font-size: 24px; font-weight: 700; margin-bottom: 15px; color: #d70018; }
        .error-message { font-size: 16px; color: #555; margin-bottom: 30px; }
        .error-actions { display: flex; justify-content: center; gap: 15px; flex-wrap: wrap; }
        .btn-action { display: inline-block; color: white; padding: 12px 25px; border-radius: 4px; text-decoration: none; font-weight: 500; transition: all 0.3s; min-width: 150px; box-sizing: border-box; }
        .btn-back { background-color: #d70018; }
        .btn-back:hover { background-color: #c82333; transform: translateY(-2px); box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .btn-home { background-color: #3498db; }
        .btn-home:hover { background-color: #2980b9; transform: translateY(-2px); box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        @media (max-width: 600px) { .error-container { width: 90%; } .error-actions { flex-direction: column; gap: 10px; } }
    </style>
</head>
<body>
    <%@include file="header.jsp"%>

    <div class="container">
        <div class="error-container">
            <div class="error-icon"><i class="fas fa-exclamation-circle"></i></div>
            <h1 class="error-title">ĐÃ CÓ LỖI XẢY RA</h1>
            <%
                String errorMessage = (String) session.getAttribute("error");
                if (errorMessage == null) {
                    errorMessage = request.getParameter("error");
                    if (errorMessage != null) {
                        switch (errorMessage) {
                            case "session_expired":
                                errorMessage = "Phiên làm việc đã hết hạn. Vui lòng bắt đầu lại.";
                                break;
                            default:
                                errorMessage = "Có lỗi xảy ra. Vui lòng thử lại.";
                        }
                    } else {
                        errorMessage = "Có lỗi xảy ra. Vui lòng thử lại sau.";
                    }
                }
                // Xóa thông báo lỗi khỏi session sau khi hiển thị
                session.removeAttribute("error");
            %>
            <p class="error-message"><%= errorMessage %></p>
            <div class="error-actions">
                <a href="cart.jsp" class="btn-action btn-back"><i class="fa-solid fa-magnifying-glass"></i> Kiểm tra giỏ hàng</a>
                <a href="index.jsp" class="btn-action btn-home"><i class="fas fa-home"></i> Về trang chủ</a>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
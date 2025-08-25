<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lỗi</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        .error-container { max-width: 600px; margin: 50px auto; text-align: center; padding: 20px; background-color: #fff; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .error-container h1 { color: #d70018; font-size: 24px; margin-bottom: 20px; }
        .error-container p { color: #666; font-size: 16px; margin-bottom: 20px; }
        .btn-back { display: inline-block; background-color: #3498db; color: white; padding: 10px 20px; border-radius: 4px; text-decoration: none; }
        .btn-back:hover { background-color: #2980b9; }
    </style>
</head>
<body>
    <%@include file="header.jsp"%>
    <div class="error-container">
        <h1>Đã xảy ra lỗi</h1>
        <p><%= request.getAttribute("error") != null ? request.getAttribute("error") : "Không xác định" %></p>
        <a href="index.jsp" class="btn-back">Quay lại trang chủ</a>
    </div>
    <%@include file="footer.jsp"%>
</body>
</html>
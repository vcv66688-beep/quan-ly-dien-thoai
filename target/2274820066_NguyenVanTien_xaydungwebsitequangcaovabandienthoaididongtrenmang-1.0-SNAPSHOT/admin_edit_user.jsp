<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sửa tài khoản</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body { margin: 0; font-family: 'Roboto', sans-serif; background-color: #ecf0f1; display: flex; }
        .content {
            margin-left: 280px;
            padding: 5px 40px 40px 40px;
            flex: 1;
            max-width: 1200px;
            margin-right: 20px;
            transition: margin-left 0.3s ease, max-width 0.3s ease;
        }
        .content.full-width {
            margin-left: 111px;
            max-width: 1400px;
        }
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: 700;
        }
        .form-group { margin-bottom: 20px; margin-right: 22px; }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #34495e;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        .form-group input:focus, .form-group select:focus {
            border-color: #3498db;
            outline: none;
        }
        .submit-btn {
            background-color: #2ecc71;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 700;
            width: 100%;
            transition: background-color 0.3s ease;
        }
        .submit-btn:hover { background-color: #27ae60; }
        .error { color: red; text-align: center; margin-bottom: 20px; }
        .button-group {
            display: flex;
            justify-content: right;
            gap: 20px;
        }
        .submit-btn {
            width: 301px;
            padding: 12px;
        }
        .submit-btn.back-btn {
            background-color: #3498db;
        }
        .submit-btn.back-btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <c:if test="${empty sessionScope.user || sessionScope.user.role != 'admin'}">
        <c:redirect url="index.jsp"/>
    </c:if>
    <%@include file="headeradmin.jsp"%>
    <div class="content" id="content">
        <h1><i class="fa-solid fa-pen-to-square"></i> Sửa tài khoản</h1>
        <div class="form-container">
            <c:if test="${not empty error}">
                <p class="error">${error}</p>
            </c:if>
            <form action="EditUserServlet" method="post">
                <input type="hidden" name="userId" value="${user.id}">
                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" id="username" name="username" value="${user.username}" required>
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="text" id="password" name="password" value="${user.password}" required>
                </div>
                <div class="form-group">
                    <label for="fullname">Họ tên</label>
                    <input type="text" id="fullname" name="fullname" value="${user.fullname}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${user.email}" required>
                </div>
                <div class="form-group">
                    <label for="role">Vai trò</label>
                    <select id="role" name="role" required>
                        <option value="user" ${user.role == 'user' ? 'selected' : ''}>Người dùng</option>
                        <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Quản trị viên</option>
                    </select>
                </div>
                <div class="button-group">
                    <button class="submit-btn back-btn" onclick="window.location.href='AdminUserServlett'">Quay lại</button>
                    <button type="submit" class="submit-btn">Cập nhật tài khoản</button>
                </div>
            </form>
        </div>
    </div>
    <script>
        document.getElementById('adminMenu').addEventListener('transitionend', function() {
            document.getElementById('content').classList.toggle('full-width');
        });
    </script>
</body>
</html>
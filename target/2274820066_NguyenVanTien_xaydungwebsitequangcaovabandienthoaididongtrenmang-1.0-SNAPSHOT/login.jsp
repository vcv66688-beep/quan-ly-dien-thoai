<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập - Hệ thống Quản lý</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }
        
        .login-container {
            width: 100%;
            max-width: 800px;
            display: flex;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .login-image {
            flex: 1;
            background-color: #3498db;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
            color: white;
        }
        
        .login-image h1 {
            font-size: 28px;
            margin-bottom: 20px;
        }
        
        .login-image p {
            font-size: 16px;
            line-height: 1.6;
        }
        
        .login-form {
            flex: 1;
            padding: 40px;
        }
        
        .login-form h2 {
            color: #333;
            margin-bottom: 30px;
            font-size: 24px;
            text-align: center;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .form-group input:focus {
            border-color: #3498db;
            outline: none;
        }
        
        .checkbox-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .checkbox-group input {
            margin-right: 10px;
        }
        
        .login-button {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 20px;
        }
        
        .login-button:hover {
            background-color: #2980b9;
        }
        
        .login-links {
            text-align: center;
        }
        
        .login-links a {
            color: #3498db;
            text-decoration: none;
            display: block;
            margin-bottom: 10px;
        }
        
        .login-links a:hover {
            text-decoration: underline;
        }
        
        .error-message {
            color: #e74c3c;
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #fdecea;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .success-message {
            color: #2ecc71;
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #e8f8f0;
            border-radius: 4px;
            font-size: 14px;
        }
        
        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
            }
            
            .login-image {
                padding: 30px 20px;
            }
            
            .login-form {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@include file="header.jsp"%>

        <div class="main-content">
            <div class="login-container">
                <div class="login-image">
                    <div>
                        <h1>Hệ thống Quản lý</h1>
                        <p>Đăng nhập để truy cập vào hệ thống quản lý và sử dụng các tính năng dành riêng cho thành viên.</p>
                    </div>
                </div>

                <div class="login-form">
                    <h2>Đăng nhập</h2>

                    <c:if test="${not empty errorMessage}">
                        <div class="error-message">
                            <i class="fas fa-exclamation-circle"></i> ${errorMessage}
                        </div>
                    </c:if>

                    <c:if test="${not empty successMessage}">
                        <div class="success-message">
                            <i class="fas fa-check-circle"></i> ${successMessage}
                        </div>
                    </c:if>

                    <form action="LoginServlet" method="post" id="loginForm">
                        <div class="form-group">
                            <label for="username">Tên đăng nhập</label>
                            <input type="text" id="username" name="username" required placeholder="Nhập tên đăng nhập" value="${param.username}">
                        </div>

                        <div class="form-group">
                            <label for="password">Mật khẩu</label>
                            <input type="password" id="password" name="password" required placeholder="Nhập mật khẩu">
                        </div>

                        <div class="checkbox-group">
                            <input type="checkbox" id="showPassword">
                            <label for="showPassword">Hiển thị mật khẩu</label>
                        </div>

                        <button type="submit" class="login-button">Đăng nhập</button>
                    </form>

                    <div class="login-links">
                        <p style="display: inline;">Chưa có tài khoản?</p>
                        <a href="register.jsp" style="display: inline;">Đăng ký ngay</a>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp"%>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const passwordInput = document.getElementById('password');
            const showPasswordCheckbox = document.getElementById('showPassword');

            showPasswordCheckbox.addEventListener('change', function() {
                passwordInput.type = this.checked ? 'text' : 'password';
            });

            const loginForm = document.getElementById('loginForm');
            if (loginForm) {
                loginForm.addEventListener('submit', function(e) {
                    const username = document.getElementById('username').value.trim();
                    const password = document.getElementById('password').value.trim();

                    if (!username || !password) {
                        e.preventDefault();
                        alert('Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu');
                    }
                });
            }

            const usernameField = document.getElementById('username');
            if (usernameField) {
                usernameField.focus();
            }
        });
    </script>
</body>
</html>
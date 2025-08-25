<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký tài khoản</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    
    <style>
        * {
            box-sizing: border-box;
        }
        
/*        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f5f5f5;
        }
        
        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
        }*/
        
        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }
        
        .register-container {
            width: 100%;
            max-width: 800px;
            display: flex;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .register-image {
            flex: 1;
            background-color: #2ecc71;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
            color: white;
        }
        
        .register-image h1 {
            font-size: 28px;
            margin-bottom: 20px;
        }
        
        .register-image p {
            font-size: 16px;
            line-height: 1.6;
        }
        
        .register-form {
            flex: 1;
            padding: 40px;
        }
        
        .register-form h2 {
            color: #333;
            margin-bottom: 30px;
            font-size: 24px;
            text-align: center;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .register-form label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }
        
        .register-form input[type="text"],
        .register-form input[type="password"],
        .register-form input[type="email"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .register-form input:focus {
            border-color: #3498db;
            outline: none;
        }
        
        .register-button {
            width: 100%;
            padding: 12px;
            background-color: #2ecc71;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            margin-top: 10px;
        }
        
        .register-button:hover {
            background-color: #27ae60;
        }
        
        .form-links {
            margin-top: 20px;
            text-align: center;
        }
        
        .form-links a {
            color: #3498db;
            text-decoration: none;
        }
        
        .form-links a:hover {
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
        
        .form-row {
            display: flex;
            gap: 20px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        @media (max-width: 768px) {
            .register-container {
                flex-direction: column;
            }
            
            .register-image {
                padding: 30px 20px;
            }
            
            .register-form {
                padding: 30px 20px;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@include file="header.jsp"%>
        
        <div class="main-content">
            <div class="register-container">
                <div class="register-image">
                    <div>
                        <h1>Tham gia cùng chúng tôi</h1>
                        <p>Tạo tài khoản để có thể sử dụng tất cả các tính năng của hệ thống quản lý.</p>
                    </div>
                </div>
                
                <div class="register-form">
                    <h2>Đăng ký tài khoản</h2>
                    
                    <c:if test="${not empty errorMessage}">
                        <div class="error-message">
                            <i class="fas fa-exclamation-circle"></i> ${errorMessage}
                        </div>
                    </c:if>
                    
                    <form action="RegisterServlet" method="post" id="registerForm">
                        <div class="form-group">
                            <label for="username">Tên đăng nhập</label>
                            <input type="text" id="username" name="username" required 
                                   placeholder="Nhập tên đăng nhập" value="${param.username}">
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="password">Mật khẩu</label>
                                <input type="password" id="password" name="password" required 
                                       placeholder="Nhập mật khẩu (tối thiểu 6 ký tự)">
                            </div>
                            
                            <div class="form-group">
                                <label for="confirmPassword">Xác nhận mật khẩu</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" required 
                                       placeholder="Nhập lại mật khẩu">
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="fullname">Họ và tên</label>
                                <input type="text" id="fullname" name="fullname" required 
                                       placeholder="Nhập họ và tên" value="${param.fullname}">
                            </div>
                            
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" required 
                                       placeholder="Nhập email" value="${param.email}">
                            </div>
                        </div>
                        
                        <button type="submit" class="register-button">Đăng ký</button>
                    </form>
                    
                    <div class="form-links">
                        <p>Đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a></p>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="footer.jsp"%>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const registerForm = document.getElementById('registerForm');
            if (registerForm) {
                registerForm.addEventListener('submit', function(e) {
                    const password = document.getElementById('password').value;
                    const confirmPassword = document.getElementById('confirmPassword').value;
                    
                    if (password.length < 6) {
                        e.preventDefault();
                        alert('Mật khẩu phải có ít nhất 6 ký tự');
                        return false;
                    }
                    
                    if (password !== confirmPassword) {
                        e.preventDefault();
                        alert('Mật khẩu xác nhận không khớp');
                        return false;
                    }
                });
            }
        });
    </script>
</body>
</html>
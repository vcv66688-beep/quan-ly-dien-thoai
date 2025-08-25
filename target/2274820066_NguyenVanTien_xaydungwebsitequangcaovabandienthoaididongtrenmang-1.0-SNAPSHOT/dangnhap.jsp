<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
        .social-login {
            margin-top: 20px;
            text-align: center;
        }
        .social-login button {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .social-login .google {
            background-color: #4285f4;
            color: #fff;
        }
        .social-login .facebook {
            background-color: #1877f2;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            </header>

        <div class="form-container">
            <h2>Đăng nhập</h2>
            <form action="LoginServlet" method="post">
                <label for="username">Tên đăng nhập:</label><br>
                <input type="text" id="username" name="username"><br><br>
                <label for="password">Mật khẩu:</label><br>
                <input type="password" id="password" name="password">
                <input type="checkbox" id="showPassword"> Hiển thị mật khẩu<br><br>
                <input type="submit" value="Đăng nhập">
            </form>
            <p>Chưa có tài khoản? <a href="register.jsp">Đăng ký</a></p>
            <p><a href="forgot-password.jsp">Quên mật khẩu?</a></p>

            <%-- Hiển thị thông báo lỗi nếu có --%>
            <%
                String error = request.getParameter("error");
                if (error != null) {
            %>
                <p class="error-message"><%= error %></p>
            <%
                }
            %>

            <div class="social-login">
                <button class="google" onclick="signInWithGoogle()">Đăng nhập bằng Google</button>
                <button class="facebook" onclick="signInWithFacebook()">Đăng nhập bằng Facebook</button>
            </div>
        </div>

        <footer>
            <p>&copy; 2024 Cửa hàng bán tivi</p>
        </footer>
    </div>

    <script>
        const passwordInput = document.getElementById('password');
        const showPasswordCheckbox = document.getElementById('showPassword');

        showPasswordCheckbox.addEventListener('change', function() {
            passwordInput.type = this.checked ? 'text' : 'password';
        });
    </script>
    <script src="social_login.js"></script>
</body>
</html>
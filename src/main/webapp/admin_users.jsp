<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý tài khoản</title>
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
        h1 { color: #2c3e50; font-size: 28px; margin-bottom: 20px; text-align: center; }
        .add-btn {
            display: inline-block;
            background-color: #2ecc71;
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            margin-bottom: 20px;
            font-weight: 700;
            transition: background-color 0.3s ease;
        }
        .add-btn:hover { background-color: #27ae60; }
        .user-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .user-table th, .user-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        .user-table th {
            background-color: #3498db;
            color: white;
            font-weight: 700;
        }
        .user-table tr:hover { background-color: #f8f9fa; }
        .action-btn {
            color: #3498db;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 18px;
            margin-right: 4px;
            transition: color 0.3s ease;
        }
        .action-btn.delete { color: #e74c3c; }
        .action-btn:hover { color: #2980b9; }
        .action-btn.delete:hover { color: #c0392b; }
    </style>
</head>
<body>
    <c:if test="${empty sessionScope.user || sessionScope.user.role != 'admin'}">
        <c:redirect url="index.jsp"/>
    </c:if>
    <%@include file="headeradmin.jsp"%>
    <div class="content" id="content">
        <h1><i class="fas fa-users"></i> Quản lý tài khoản</h1>
        <p style="text-align: center">Hiển thị danh sách tài khoản. Admin thực hiện các chức năng: Thêm, Sửa, Xóa tài khoản </p>
        <a href="admin_add_user.jsp" class="add-btn"><i class="fa-solid fa-user-plus"></i> Thêm tài khoản</a>
        <table class="user-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên đăng nhập</th>
                    <th>Mật khẩu</th>
                    <th>Họ và tên</th>
                    <th>Email</th>
                    <th>Vai trò</th>
                    <th style="text-align: center">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.password}</td>
                        <td>${user.fullname}</td>
                        <td>${user.email}</td>
                        <td>${user.role}</td>
                        <td style="text-align: center">
                            <a title="Sửa tài khoản" href="EditUserServlet?userId=${user.id}" class="action-btn"><i class="fas fa-edit"></i></a>
                            <form action="DeleteUserServlet" method="post" style="display:inline;" onsubmit="return confirm('Bạn có chắc muốn xóa tài khoản này?');">
                                <input type="hidden" name="userId" value="${user.id}">
                                <button title="Xóa tài khoản" type="submit" class="action-btn delete"><i class="fas fa-trash"></i></button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script>
        document.getElementById('adminMenu').addEventListener('transitionend', function() {
            document.getElementById('content').classList.toggle('full-width');
        });
    </script>
</body>
</html>
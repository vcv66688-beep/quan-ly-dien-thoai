<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body { margin: 0; font-family: 'Roboto', sans-serif; background-color: #ecf0f1; display: flex; }
        .content {
            margin-left: 280px;
            padding: 40px;
            flex: 1;
            max-width: 1200px;
            margin-right: 20px;
            transition: margin-left 0.3s ease, max-width 0.3s ease;
        }
        .content.full-width {
            margin-left: 111px;
            max-width: 1400px;
        }
        h1 { color: #2c3e50; font-size: 28px; margin-bottom: 30px; text-align: center; }
        .dashboard-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }
        .stat-card:hover { transform: translateY(-5px); }
        .stat-card h3 { margin-bottom: 15px; color: #3498db; font-size: 20px; }
        .stat-card p { font-size: 26px; font-weight: 700; color: #2c3e50; }
    </style>
</head>
<body>
    <c:if test="${empty sessionScope.user || sessionScope.user.role != 'admin'}">
        <c:redirect url="index.jsp"/>
    </c:if>
    <%@include file="headeradmin.jsp"%>
    <div class="content" id="content">
        <h1><i class="fas fa-home"></i> Chào mừng đến với Dashboard Admin</h1>
        <div class="dashboard-stats">
            <div class="stat-card">
                <h3>Đơn hàng mới</h3>
                <p>18</p>
                

            </div>
            <div class="stat-card">
                <h3>Doanh thu hôm nay</h3>
                <p>51.632.000đ</p>
            </div>
            <div class="stat-card">
                <h3>Sản phẩm tồn kho</h3>
                <p>62729</p>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('adminMenu').addEventListener('transitionend', function() {
            document.getElementById('content').classList.toggle('full-width');
        });
    </script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết đơn hàng</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7fa;
            display: flex;
            min-height: 100vh;
        }
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
        h1 {
            color: #2c3e50;
            font-size: 30px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 700;
        }
        .back-btn {
            display: inline-flex;
            align-items: center;
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 20px;
            transition: background-color 0.3s ease;
        }
        .back-btn i {
            margin-right: 8px;
        }
        .back-btn:hover {
            background-color: #2980b9;
        }
        .order-detail {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .order-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .order-info p {
            margin: 0;
            font-size: 16px;
            color: #34495e;
        }
        .order-info p strong {
            color: #2c3e50;
            font-weight: 600;
        }
        .order-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }
        .order-table th, .order-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        .order-table th {
            background-color: #3498db;
            color: white;
            font-weight: 700;
            text-transform: uppercase;
            font-size: 14px;
        }
        .order-table td {
            font-size: 15px;
            color: #34495e;
        }
        .order-table img {
            width: 60px;
            height: auto;
            border-radius: 5px;
            object-fit: cover;
        }
        .order-table tr:hover {
            background-color: #f8f9fa;
        }
        .section-title {
            font-size: 22px;
            color: #2c3e50;
            margin: 20px 0;
            font-weight: 600;
        }
        @media (max-width: 768px) {
            .content {
                margin-left: 111px;
                padding: 20px;
            }
            .order-info {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <c:if test="${empty sessionScope.user || sessionScope.user.role != 'admin'}">
        <c:redirect url="index.jsp"/>
    </c:if>
    <%@include file="headeradmin.jsp"%>
    <div class="content" id="content">
        
        <h1><i class="fas fa-eye"></i> Chi tiết đơn hàng #${order.id}</h1>
        <div class="order-detail">
            <div class="order-info">
                <p><strong>Mã đơn hàng:</strong> ${order.id}</p>
                <p><strong>Khách hàng:</strong> ${order.customerName}</p>
                <p><strong>Email:</strong> ${order.customerEmail}</p>
                <p><strong>Số điện thoại:</strong> ${order.customerPhone}</p>
                <p><strong>Địa chỉ giao hàng:</strong> ${order.deliveryAddress}</p>
                <p><strong>Ngày đặt hàng:</strong> <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm:ss"/></p>
                <p><strong>Tổng tiền:</strong> <fmt:formatNumber value="${order.totalAmount}" type="number" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0"/>đ</p>
                <p><strong>Trạng thái:</strong> 
                    <c:choose>
                        <c:when test="${order.status == 'pending'}">Chờ xác nhận</c:when>
                        <c:when test="${order.status == 'confirmed'}">Đang xử lý</c:when>
                        <c:when test="${order.status == 'shipped'}">Đang giao</c:when>
                        <c:when test="${order.status == 'delivered'}">Đã giao</c:when>
                        <c:when test="${order.status == 'cancelled'}">Đã hủy</c:when>
                        <c:otherwise>${order.status}</c:otherwise>
                    </c:choose>
                </p>
                <p><strong>Phương thức thanh toán:</strong> 
                    <c:choose>
                        <c:when test="${order.paymentMethod == 'cod'}">Thanh toán khi nhận hàng</c:when>
                        <c:otherwise>${order.paymentMethod}</c:otherwise>
                    </c:choose>
                </p>
            </div>
            <div class="section-title">Danh sách sản phẩm</div>
            <table class="order-table">
                <thead>
                    <tr>
                        <th>Hình ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${order.items}">
                        <tr>
                            <td><img src="${item.productImage}" alt="${item.productName}"></td>
                            <td>${item.productName}</td>
                            <td><fmt:formatNumber value="${item.price}" type="number" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0"/>đ</td>
                            <td>${item.quantity}</td>
                            <td><fmt:formatNumber value="${item.price * item.quantity}" type="number" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0"/>đ</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <a href="AdminOrderServlet" class="back-btn"><i class="fas fa-arrow-left"></i> Quay lại</a>
    </div>
    <script>
        document.getElementById('adminMenu').addEventListener('transitionend', function() {
            document.getElementById('content').classList.toggle('full-width');
        });
    </script>
</body>
</html>

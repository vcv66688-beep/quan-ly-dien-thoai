<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý đơn hàng</title>
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
        h1 { color: #2c3e50; font-size: 28px; margin-bottom: 0px; text-align: center; }
        .order-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
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
        }
        .order-table th:first-child, .order-table td:first-child,
        .order-table th:last-child, .order-table td:last-child {
            text-align: center;
        }
        .order-table tr:hover { background-color: #f8f9fa; }
        .status-select {
            padding: 8px;
            border-radius: 15px;
            border: none;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            width: 144px;
            text-align: center;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 8px center;
            background-size: 16px;
        }
        .status-pending { background-color: #fff3e0; color: #fb8c00; }
        .status-confirmed { background-color: #e8f5e9; color: #28a745; }
        .status-shipped { background-color: #e3f2fd; color: #1976d2; }
        .status-delivered { background-color: #e0f7fa; color: #00695c; }
        .status-cancelled { background-color: #ffebee; color: #d32f2f; }
        .status-select option {
            font-size: 14px;
            font-weight: 500;
        }
        .status-select option[value="pending"] { background-color: #fff3e0; color: #fb8c00; }
        .status-select option[value="confirmed"] { background-color: #e8f5e9; color: #28a745; }
        .status-select option[value="shipped"] { background-color: #e3f2fd; color: #1976d2; }
        .status-select option[value="delivered"] { background-color: #e0f7fa; color: #00695c; }
        .status-select option[value="cancelled"] { background-color: #ffebee; color: #d32f2f; }
        .action-btn {
            color: #3498db;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 18px;
            transition: color 0.3s ease;
            display: inline-block;
            margin: 0 8px;
        }
        .action-btn:hover { color: #2980b9; }
        .delete-btn {
            color: #e74c3c;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 18px;
            transition: color 0.3s ease;
            display: inline-block;
        }
        .delete-btn:hover { color: #c0392b; }
    </style>
</head>
<body>
    <c:if test="${empty sessionScope.user || sessionScope.user.role != 'admin'}">
        <c:redirect url="index.jsp"/>
    </c:if>
    <%@include file="headeradmin.jsp"%>
    <div class="content" id="content">
        <h1><i class="fas fa-shopping-cart"></i> Quản lý đơn hàng</h1>
        <p style="text-align: center">Hiển thị danh sách đơn hàng. Admin thực hiện thay đổi trạng thái: Chờ xác nhận, Đang xử lý, Đang giao, Đã giao, Đã hủy... Xem chi tiết, Xóa đơn hàng </p>
        <table class="order-table">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã đơn hàng</th>
                    <th>Khách hàng</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th>Thời gian đặt hàng</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${order.id}</td>
                        <td>${order.customerName}</td>
                        <td>
                            <fmt:formatNumber value="${order.totalAmount}" type="number" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0"/>đ
                        </td>
                        <td>
                            <form action="UpdateOrderStatusServlet" method="post">
                                <input type="hidden" name="orderId" value="${order.id}">
                                <select name="status" class="status-select status-${order.status}" onchange="this.form.submit(); updateSelectColor(this);">
                                    <option value="pending" ${order.status == 'pending' ? 'selected' : ''}>Chờ xác nhận</option>
                                    <option value="confirmed" ${order.status == 'confirmed' ? 'selected' : ''}>Đang xử lý</option>
                                    <option value="shipped" ${order.status == 'shipped' ? 'selected' : ''}>Đang giao</option>
                                    <option value="delivered" ${order.status == 'delivered' ? 'selected' : ''}>Đã giao</option>
                                    <option value="cancelled" ${order.status == 'cancelled' ? 'selected' : ''}>Đã hủy</option>
                                </select>
                            </form>
                        </td>
                        <td>
                            <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm:ss"/>
                        </td>
                        <td>
                            <a title="Xem chi tiết" href="ChiTietDonHangAdmin?orderId=${order.id}" class="action-btn"><i class="fas fa-eye"></i></a>
                            <a title="Xóa đơn hàng" href="DeleteOrderServlet?orderId=${order.id}" class="delete-btn" onclick="return confirm('Bạn có chắc muốn xóa đơn hàng #${order.id}?');"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script>
        function updateSelectColor(select) {
            select.className = 'status-select status-' + select.value;
        }
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.status-select').forEach(select => {
                updateSelectColor(select);
            });
        });
        document.getElementById('adminMenu').addEventListener('transitionend', function() {
            document.getElementById('content').classList.toggle('full-width');
        });
    </script>
</body>
</html>
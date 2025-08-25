<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>Thống kê tất cả đơn hàng theo khách hàng</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #f5f8fa;
            display: flex;
            min-height: 100vh;
        }
        .content {
            margin-left: 280px;
            padding: 5px 40px 40px 40px;
            flex: 1;
            max-width: 1400px;
            transition: margin-left 0.3s ease;
        }
        .content.full-width {
            margin-left: 111px;
        }
        h1 {
            color: #1a3c5e;
            font-size: 28px;
            font-weight: 700;
            text-align: center;
            margin-bottom: 15px;
            letter-spacing: 0.5px;
        }
        h3 {
            color: #2d4b73;
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 10px;
            text-transform: uppercase;
        }
        .main-container {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        .stats-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            padding: 15px;
            width: 445px;
            min-width: 300px;
            transition: box-shadow 0.2s ease;
        }
        .stats-container:hover {
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
        }
        .stats-table {
            width: 100%;
            border-collapse: collapse;
        }
        .stats-table th, .stats-table td {
            padding: 8px 10px;
            text-align: center;
            font-size: 13px;
            border-bottom: 1px solid #e6ecef;
        }
        .stats-table th {
            background-color: #3498db;
            color: #ffffff;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 12px;
        }
        .stats-table td {
            color: #2d4b73;
        }
        .stats-table tr:hover {
            background-color: #f9fafb;
        }
        /* Căn giữa cột STT và điều chỉnh căn phải cho các cột số liệu */
        .stats-table th:first-child, .stats-table td:first-child {
            text-align: center;
        }
        .stats-table td:nth-child(4), .stats-table td:nth-child(5) {
            text-align: right;
        }
        .stats-table th:nth-child(4), .stats-table th:nth-child(5) {
            text-align: right;
        }
        .no-data {
            text-align: center;
            color: #7f8c8d;
            font-style: italic;
            padding: 10px;
            font-size: 13px;
        }
        .chart-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            flex: 1;
            min-width: 400px;
        }
        .chart-container canvas {
            max-height: 457px;
        }
        @media (max-width: 1000px) {
            .main-container {
                flex-direction: column;
            }
            .stats-container {
                width: 100%;
                max-width: 100%;
            }
            .chart-container {
                width: 100%;
            }
        }
        @media (max-width: 768px) {
            .content {
                padding: 15px;
                margin-left: 0;
            }
            .stats-table th, .stats-table td {
                font-size: 12px;
                padding: 6px 8px;
            }
            h1 {
                font-size: 24px;
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
        <h1><i class="fa-solid fa-chart-line"></i> Thống kê đơn hàng</h1>
        <p style="text-align: center">Thống kê đơn hàng, trạng thái đơn hàng của từng đối tượng khách hàng theo dạng bảng và biểu đồ </p>
        <!-- Container chứa bảng và biểu đồ -->
        <div class="main-container">
            <!-- Bảng thống kê (tất cả đơn hàng) -->
            <div class="stats-container">
                <h3 style="text-align: center">Bảng thống kê đơn hàng</h3>
                <table class="stats-table">
                    <thead>
                        <tr>
                            <th>STT</th> <!-- Thêm cột STT -->
                            <th>Số ĐT</th>
                            <th>Khách hàng</th>
                            <th>Đơn</th>
                            <th>Doanh thu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty allOrdersStats}">
                                <tr>
                                    <td colspan="5" class="no-data">Không có dữ liệu</td> <!-- Cập nhật colspan -->
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="stat" items="${allOrdersStats}" begin="0" end="4" varStatus="loop">
                                    <tr>
                                        <td>${loop.count}</td> <!-- Hiển thị số thứ tự -->
                                        <td>${stat.customer_phone}</td>
                                        <td>${fn:escapeXml(stat.customer_name)}</td>
                                        <td>${stat.order_count}</td>
                                        <td>
                                            <fmt:formatNumber value="${stat.total_revenue}" type="number" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0"/>đ
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                    <tfoot>
                        <tr style="font-weight: bold; background-color: #f1f5f9;">
                            <td colspan="3" style="text-align: center;">Tổng số</td> <!-- Cập nhật colspan -->
                            <td style="text-align: right;">
                                <c:set var="totalOrders" value="0"/>
                                <c:forEach var="stat" items="${allOrdersStats}">
                                    <c:set var="totalOrders" value="${totalOrders + stat.order_count}"/>
                                </c:forEach>
                                ${totalOrders}
                            </td>
                            <td style="text-align: right;">
                                <c:set var="totalRevenue" value="0"/>
                                <c:forEach var="stat" items="${allOrdersStats}">
                                    <c:set var="totalRevenue" value="${totalRevenue + stat.total_revenue}"/>
                                </c:forEach>
                                <fmt:formatNumber value="${totalRevenue}" type="number" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0"/>đ
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            
            <!-- Biểu đồ cột chồng -->
            <div class="chart-container">
                <h3 style="text-align: center">Biểu đồ cột chồng thể hiện doanh thu theo trạng thái đơn hàng</h3>
                <canvas id="customerRevenueChart"></canvas>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('adminMenu').addEventListener('transitionend', function() {
            document.getElementById('content').classList.toggle('full-width');
        });

        // Tạo danh sách khách hàng duy nhất
        const allCustomers = [...new Set([
            ...[<c:forEach var="stat" items="${allOrdersStats}">'${fn:escapeXml(stat.customer_name)}',</c:forEach>],
            ...[<c:forEach var="stat" items="${pendingStats}">'${fn:escapeXml(stat.customer_name)}',</c:forEach>],
            ...[<c:forEach var="stat" items="${confirmedStats}">'${fn:escapeXml(stat.customer_name)}',</c:forEach>],
            ...[<c:forEach var="stat" items="${shippedStats}">'${fn:escapeXml(stat.customer_name)}',</c:forEach>],
            ...[<c:forEach var="stat" items="${deliveredStats}">'${fn:escapeXml(stat.customer_name)}',</c:forEach>],
            ...[<c:forEach var="stat" items="${cancelledStats}">'${fn:escapeXml(stat.customer_name)}',</c:forEach>]
        ])];

        // Tạo dữ liệu doanh thu cho từng trạng thái
        const pendingData = allCustomers.map(customer => {
            const stat = [<c:forEach var="stat" items="${pendingStats}">{name: '${fn:escapeXml(stat.customer_name)}', revenue: ${stat.total_revenue}},</c:forEach>].find(s => s.name === customer);
            return stat ? stat.revenue : 0;
        });

        const confirmedData = allCustomers.map(customer => {
            const stat = [<c:forEach var="stat" items="${confirmedStats}">{name: '${fn:escapeXml(stat.customer_name)}', revenue: ${stat.total_revenue}},</c:forEach>].find(s => s.name === customer);
            return stat ? stat.revenue : 0;
        });

        const shippedData = allCustomers.map(customer => {
            const stat = [<c:forEach var="stat" items="${shippedStats}">{name: '${fn:escapeXml(stat.customer_name)}', revenue: ${stat.total_revenue}},</c:forEach>].find(s => s.name === customer);
            return stat ? stat.revenue : 0;
        });

        const deliveredData = allCustomers.map(customer => {
            const stat = [<c:forEach var="stat" items="${deliveredStats}">{name: '${fn:escapeXml(stat.customer_name)}', revenue: ${stat.total_revenue}},</c:forEach>].find(s => s.name === customer);
            return stat ? stat.revenue : 0;
        });

        const cancelledData = allCustomers.map(customer => {
            const stat = [<c:forEach var="stat" items="${cancelledStats}">{name: '${fn:escapeXml(stat.customer_name)}', revenue: ${stat.total_revenue}},</c:forEach>].find(s => s.name === customer);
            return stat ? stat.revenue : 0;
        });

        // Dữ liệu cho biểu đồ
        const customerRevenueData = {
            labels: allCustomers,
            datasets: [
                {
                    label: 'Chờ xác nhận',
                    data: pendingData,
                    backgroundColor: 'rgba(149, 165, 166, 0.5)',
                    borderColor: 'rgba(149, 165, 166, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Đã xác nhận',
                    data: confirmedData,
                    backgroundColor: 'rgba(46, 204, 113, 0.5)',
                    borderColor: 'rgba(46, 204, 113, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Đang giao',
                    data: shippedData,
                    backgroundColor: 'rgba(241, 196, 15, 0.5)',
                    borderColor: 'rgba(241, 196, 15, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Đã giao',
                    data: deliveredData,
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Đã hủy',
                    data: cancelledData,
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }
            ]
        };

        // Cấu hình biểu đồ
        const ctx = document.getElementById('customerRevenueChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: customerRevenueData,
            options: {
                scales: {
                    x: {
                        stacked: true,
                        ticks: {
                            font: {
                                size: 12
                            },
                            maxRotation: 45,
                            minRotation: 45
                        }
                    },
                    y: {
                        stacked: true,
                        beginAtZero: true,
                        ticks: {
                            callback: function(value) {
                                return value.toLocaleString('vi-VN') + 'đ';
                            },
                            font: {
                                size: 12
                            }
                        }
                    }
                },
                plugins: {
                    legend: {
                        labels: {
                            font: {
                                size: 13
                            }
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return context.dataset.label + ': ' + context.parsed.y.toLocaleString('vi-VN') + 'đ';
                            }
                        }
                    }
                },
                maintainAspectRatio: false
            }
        });
    </script>
</body>
</html>
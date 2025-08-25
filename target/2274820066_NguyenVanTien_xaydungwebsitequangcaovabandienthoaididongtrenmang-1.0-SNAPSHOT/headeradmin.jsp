<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Menu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        .admin-menu {
            width: 250px;
            height: 100vh;
            background-color: #1a2b3c;
            color: white;
            padding: 20px;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
            transition: width 0.3s ease;
        }
        .admin-menu.collapsed {
            width: 80px;
        }
        .admin-menu h2 {
            font-size: 24px;
            margin-bottom: 30px;
            text-align: center;
            transition: opacity 0.3s ease;
        }
        .admin-menu.collapsed h2 {
            opacity: 0;
        }
        .admin-menu ul {
            list-style: none;
            padding: 0;
            flex-grow: 1;
        }
        .admin-menu ul li {
            margin-bottom: 20px;
        }
        .admin-menu ul li a {
            color: #ecf0f1;
            text-decoration: none;
            font-size: 16px;
            display: flex;
            align-items: center;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease, padding-left 0.3s ease;
        }
        .admin-menu ul li a:hover {
            background-color: #3498db;
            padding-left: 15px;
        }
        .admin-menu ul li a i {
            margin-right: 10px;
            width: 20px;
        }
        .admin-menu.collapsed ul li a span {
            display: none;
        }
        .toggle-btn {
            position: absolute;
            top: 20px;
            right: -15px;
            width: 30px;
            height: 30px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.3s ease;
        }
        .admin-menu.collapsed .toggle-btn {
            transform: rotate(180deg);
        }
        .logout-btn {
            margin-bottom: 48px;
            background-color: #e74c3c;
            color: white;
            padding: 10px;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .logout-btn:hover {
            background-color: #c0392b;
            transform: translateY(-5px);
        }
        .admin-menu.collapsed .logout-btn span {
            display: none;
        }
        /* CSS cho nút lên đầu trang */
        .back-to-top {
            position: fixed;
            right: 15px;
            bottom: 58px;
            width: 45px;
            height: 45px;
            background-color: rgba(52, 152, 219, 0.8);
            border-radius: 50%;
            display: none;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 20px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            z-index: 999;
            border: none;
            outline: none;
        }
        .back-to-top:hover {
            background-color: rgba(41, 128, 185, 1);
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <div class="admin-menu" id="adminMenu">
        <button class="toggle-btn" onclick="toggleMenu()"><i class="fas fa-arrow-left"></i></button>
        <h2>Admin Panel</h2>
        <ul>
            <li><a href="admin_dashboard.jsp"><i class="fas fa-home"></i><span>Dashboard admin</span></a></li>
            <li><a href="AdminProductServlet"><i class="fa-solid fa-list"></i><span>Quản lý sp điện thoại</span></a></li>
            <li><a href="AdminUserServlett"><i class="fas fa-users"></i> <span>Quản lý tài khoản</span></a></li>
            <li><a href="AdminOrderServlet"><i class="fas fa-shopping-cart"></i><span>Quản lý đơn hàng</span></a></li>
            <li><a href="CustomerOrderStatsServlet"><i class="fa-solid fa-chart-line"></i><span>Thống kê đơn hàng</span></a></li>            
        </ul>
        <a href="LogoutServlet" class="logout-btn"><i class="fas fa-sign-out-alt"></i> <span> .Đăng xuất</span></a>
    </div>
    <!-- Nút Quay lên đầu trang -->
    <button class="back-to-top" onclick="scrollToTop()" title="Quay lên đầu trang">
        <i class="fas fa-arrow-up"></i>
    </button>
    <script>
        function toggleMenu() {
            const menu = document.getElementById('adminMenu');
            menu.classList.toggle('collapsed');
        }
        // Hàm xử lý cuộn lên đầu trang
        function scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        }
        // Hiển thị/ẩn nút dựa trên vị trí cuộn
        window.addEventListener('scroll', function() {
            const backToTopButton = document.querySelector('.back-to-top');
            if (window.scrollY > 300) {
                backToTopButton.style.display = 'flex';
            } else {
                backToTopButton.style.display = 'none';
            }
        });
    </script>
</body>
</html>
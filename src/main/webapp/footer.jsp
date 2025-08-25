<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer</title>
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>/*footer*/
        footer {
            width: 100%;
            background-color: #3498db;
            color: white;
            padding: 20px 0;
            font-family: 'Roboto', sans-serif;
        }

        .footer-container {
            display: flex;
            justify-content: space-around;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .footer-section {
            flex: 1;
            margin: 0 15px; /* Khoảng cách các cột */
            text-align: left; /* Căn trái chữ cho các cột */
        }

        /* Thêm class riêng cho cột "Kết nối với chúng tôi" */
        .footer-section.connect {
            margin-left: 30px; 
        }

        .footer-section h3 {
            margin-bottom: 15px; 
            font-size: 18px;
            color: white;
        }

        .footer-section p, .footer-section ul, .footer-section .product-list {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .footer-section ul li, .footer-section .product-list a {
            margin-bottom: 10px;
        }

        .footer-section ul li a, .footer-section .product-list a {
            color: white;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-section ul li a:hover, .footer-section .product-list a:hover {
            color: #a2d6f9; /* Đổi màu khi hover */
        }

        .product-list {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .product-list a {
            transition: color 0.3s ease;
            color: black; /* Màu chữ */
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .product-list a:hover {
            color: #a2d6f9; /* Màu chữ xanh khi hover */
        }

        .social-icons {
            display: flex;
            gap: 14px;
        }

        .social-icons a {
            transition: color 0.3s ease;
            color: #f8f9fa;
            font-size: 40px;
            transition: color 0.3s ease;
        }

        .social-icons a:hover {
            color: #a2d6f9;
        }
</style>
</head>

<body>
    
<footer>
    <div class="footer-container">
        <!-- Phần Liên Hệ -->
        <div class="footer-section">
            <h3>THÔNG TIN LIÊN HỆ</h3>
            <p><i class="fas fa-map-marker-alt"></i> Địa chỉ: 68 Nguyễn Chí Thanh, Láng Thượng, Đống Đa, Hà Nội</p>
            <p><i class="fas fa-phone"></i> <strong>Điện thoại liên hệ:</strong> 0123 456 789 <br> - 0987 654 321</p>
            <p><i class="fas fa-envelope"></i> <strong>Email liên hệ:</strong> nguyenvantien5a2@gmail.com</p>
            <p><i class="fas fa-clock"></i> <strong>Thời gian làm việc:</strong> 8:00 - 21:00 </p>
        </div>

        <!-- Phần Thông Tin & Chính Sách -->
        <div class="footer-section">
            <h3>DANH MỤC CỬA HÀNG</h3>
            <ul>
                <li><a href="gioithieumenu.jsp"> Giới thiệu cửa hàng</a></li>
                <li><a href="danhmucdienthoai.jsp"> Danh mục điện thoại</a></li>
                <li><a href="giaohangnhanh.jsp"> Dịch vụ giao hàng nhanh 24h</a></li>
                <li><a href="bayngaydoitra.jsp"> Chính sách 7 ngày đổi trả</a></li>
                <li><a href="tincongnghe.jsp"> Tin công nghệ điện thoại</a></li>
            </ul>
        </div>

        <!-- Phần Top Sản Phẩm -->
        <div class="footer-section">
            <h3>TOP SẢN PHẨM NỔI BẬT</h3>
            <div class="product-list">
                <a href="s25utral.jsp"> Samsung Galaxy S25 Ultra</a>
                <a href="index.jsp#apple"> iPhone 16 Pro Max 128Gb</a>
                <a href="index.jsp#samsung"> Samsung Galaxy A55 5G 128GB</a>
                <a href="index.jsp#xiao"> Xiaomi Poco C75 6GB/128GB </a>
            </div>
        </div>

        <!-- Phần Kết Nối Với Chúng Tôi -->
        <div class="footer-section">
            <h3>KẾT NỐI VỚI CHÚNG TÔI</h3>
            <div class="social-icons">
                <a href="index.jsp"><i class="fa-solid fa-house" title="Trang chủ"></i></a>
                <a href="https://www.youtube.com/watch?v=WXZRJO9w8nU"><i class="fa-solid fa-circle-play" title="Youtube"></i></a> 
                <a href="#"><i class="fab fa-twitter" title="Telegram"></i></a>
                <a href="https://zalo.me/0972044460"><i class="fa-solid fa-square-phone-flip" title="Zalo"></i></a>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
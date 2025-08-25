<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Samsung - Đổi mới sáng tạo vì tương lai</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/thuonghieunoibat.css">
</head>
<body>
    <%@include file="header.jsp"%>
    
    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <div class="hero-logo">
                <img src="images/ss4.jpg" alt="Samsung Logo">
            </div>
            <h1>Đổi mới sáng tạo vì tương lai</h1>
            <p class="subtitle">Dẫn đầu thế giới về công nghệ điện tử tiêu dùng và thiết bị di động</p>
            <a href="#products" class="btn">Khám phá sản phẩm</a>
        </div>
    </section>
    
    <!-- Brand Info Section -->
    <section class="brand-info" id="about">
        <div class="container">
            <div class="brand-info-container">
                <div class="brand-image">
                    <img src="images/thuonghieunoibat/ctyss.jpg" alt="Samsung Digital City">
                </div>
                <div class="brand-content">
                    <h3>Samsung Electronics</h3>
                    <p>Từ một công ty buôn bán nhỏ ở Daegu năm 1938, Samsung đã trở thành tập đoàn công nghệ hàng đầu thế giới. Với triết lý "Đổi mới không ngừng", Samsung liên tục định hình lại tương lai công nghệ toàn cầu.</p>
                    
                    <h3 style="margin-top: 2.5rem;">Thông tin cốt lõi</h3>
                    <ul class="info-list">
                        <li class="info-item">
                            <strong>Trụ sở chính</strong>
                            <span>Samsung Digital City, Suwon</span>
                        </li>
                        <li class="info-item">
                            <strong>Thành lập</strong>
                            <span>1/3/1938</span>
                        </li>
                        <li class="info-item">
                            <strong>Chủ tịch</strong>
                            <span>Lee Jae-yong</span>
                        </li>
                        <li class="info-item">
                            <strong>Doanh thu (2022)</strong>
                            <span>245 tỷ USD</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Featured Products -->
    <section class="featured-products" id="products">
        <div class="container">
            <div class="section-heading">
                <h2>Sản phẩm nổi bật</h2>
                <p>Khám phá những đột phá công nghệ từ Samsung</p>
            </div>
            
            <div class="product-grid">
                <div class="product-card">
                    <div class="product-badge">Mới nhất</div>
                    <div class="product-media">
                        <img src="images/ssn.jpg" alt="Galaxy S25 Ultra">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">Galaxy S25 Ultra</h3>
                        <p class="product-description">Camera 200MP, chip Snapdragon 8 Gen 2, bút S Pen tích hợp</p>
                        <div class="product-price">Từ 26.990.000đ</div>
                        <a href="https://bensonandcompany.com/product/samsung-s23-ultra-512gb/" class="btn">Tìm hiểu thêm</a>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-media">
                        <img src="images/thuonghieunoibat/Galaxy Z Fold 5.png" alt="Galaxy Z Fold 5">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">Galaxy Z Fold 5</h3>
                        <p class="product-description">Smartphone màn hình gập cao cấp với bản lề không khe hở</p>
                        <div class="product-price">Từ 41.990.000đ</div>
                        <a href="https://www.xcite.com/samsung-galaxy-z-fold-5-phone-7-6-inch-12gb-ram-512gb-5g-icy-blue/p" class="btn">Tìm hiểu thêm</a>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-badge">Bán chạy</div>
                    <div class="product-media">
                        <img src="images/thuonghieunoibat/galaxywatch6.jpg" alt="Galaxy Watch 6">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">Galaxy Watch 6</h3>
                        <p class="product-description">Đồng hồ thông minh với Wear OS và khả năng theo dõi sức khỏe</p>
                        <div class="product-price">Từ 7.990.000đ</div>
                        <a href="https://propakistani.pk/2023/08/26/samsung-galaxy-watch-6-classic-gets-a-classy-space-themed-model/" class="btn">Tìm hiểu thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Philosophy Section -->
    <section class="philosophy-section">
        <div class="container">
            <div class="philosophy-container">
                <div class="philosophy-text">
                    <h3>Triết lý Samsung</h3>
                    <p>Samsung cam kết mang đến trải nghiệm công nghệ vượt trội cho người dùng toàn cầu. "Inspire the World, Create the Future" là tầm nhìn định hướng mọi hoạt động của tập đoàn.</p>
                    <p>Tập trung vào đổi mới sáng tạo, Samsung đầu tư mạnh mẽ vào R&D với hơn 20 tỷ USD mỗi năm. Mỗi sản phẩm là sự kết hợp giữa thiết kế tinh tế và công nghệ đột phá.</p>
                    <p>Samsung không ngừng mở rộng biên giới công nghệ từ bán dẫn, màn hình đến trí tuệ nhân tạo và Internet vạn vật.</p>
                </div>
                <div class="philosophy-image">
                    <img src="images/bìa s25.jpg" alt="Samsung Innovation">
                </div>
            </div>
        </div>
    </section>
    
    <%@include file="footer.jsp"%>
</body>
</html>
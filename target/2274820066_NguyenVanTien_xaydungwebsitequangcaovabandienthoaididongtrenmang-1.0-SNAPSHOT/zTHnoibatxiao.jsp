<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Xiaomi - Chất lượng cao, giá cả phải chăng</title>
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
                <img src="images/xm4.jpg" alt="Xiaomi Logo">
            </div>
            <h1>Chất lượng cao, giá cả phải chăng</h1>
            <p class="subtitle">Công nghệ đỉnh cao dành cho tất cả mọi người</p>
            <a href="#products" class="btn">Khám phá sản phẩm</a>
        </div>
    </section>
    
    <!-- Brand Info Section -->
    <section class="brand-info" id="about">
        <div class="container">
            <div class="brand-info-container">
                <div class="brand-image">
                    <img src="images/thuonghieunoibat/ctyxiao.JPG" alt="Xiaomi Park">
                </div>
                <div class="brand-content">
                    <h3>Xiaomi Corporation</h3>
                    <p>Từ startup thành lập năm 2010, Xiaomi đã trở thành thương hiệu smartphone top 3 thế giới chỉ sau 1 thập kỷ. Với triết lý "Công nghệ chất lượng không cần đắt", Xiaomi đã cách mạng hóa thị trường điện tử tiêu dùng.</p>
                    
                    <h3 style="margin-top: 2.5rem;">Thông tin cốt lõi</h3>
                    <ul class="info-list">
                        <li class="info-item">
                            <strong>Trụ sở chính</strong>
                            <span>Bắc Kinh, Trung Quốc</span>
                        </li>
                        <li class="info-item">
                            <strong>Thành lập</strong>
                            <span>6/4/2010</span>
                        </li>
                        <li class="info-item">
                            <strong>Nhà sáng lập</strong>
                            <span>Lei Jun</span>
                        </li>
                        <li class="info-item">
                            <strong>Doanh thu (2022)</strong>
                            <span>43 tỷ USD</span>
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
                <p>Công nghệ cao cấp với mức giá không thể tin nổi</p>
            </div>
            
            <div class="product-grid">
                <div class="product-card">
                    <div class="product-badge">Mới nhất</div>
                    <div class="product-media">
                        <img src="images/14.jpg" alt="Xiaomi 14T">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">Xiaomi 14T</h3>
                        <p class="product-description"> Snapdragon 8 Gen 2</p>
                        <div class="product-price">Từ 21.990.000đ</div>
                        <a href="https://xiaomitime.com/xiaomi-14t-series-pricing-leaks-ahead-of-launch-13180/" class="btn">Tìm hiểu thêm</a>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-media">
                        <img src="images/thuonghieunoibat/redmi-note-12-pro.jpg" alt="Redmi Note 12 Pro">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">Redmi Note 12 Pro</h3>
                        <p class="product-description">Smartphone tốt nhất phân khúc tầm trung</p>
                        <div class="product-price">Từ 7.490.000đ</div>
                        <a href="https://bludiode.com/en/xiaomi/xiaomi-redmi-note-12-pro-plus-12256gb-black-21373/" class="btn">Tìm hiểu thêm</a>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-badge">Bán chạy</div>
                    <div class="product-media">
                        <img src="images/thuonghieunoibat/xiaoband7.png" alt="Xiaomi Band 7">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">Xiaomi Band 7</h3>
                        <p class="product-description">Vòng đeo tay thông minh giá rẻ</p>
                        <div class="product-price">Từ 990.000đ</div>
                        <a href="https://www.mi.com/uk/product/xiaomi-smart-band-7-pro/" class="btn">Tìm hiểu thêm</a>
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
                    <h3>Triết lý Xiaomi</h3>
                    <p>"Chỉ 5% lợi nhuận trên mỗi sản phẩm" là cam kết của Xiaomi nhằm mang công nghệ cao cấp đến với đại chúng. Mô hình kinh doanh độc đáo tập trung vào dịch vụ và hệ sinh thái.</p>
                    <p>Xiaomi đầu tư mạnh vào R&D nhưng cắt giảm tối đa chi phí trung gian. Mỗi sản phẩm là sự cân bằng hoàn hảo giữa hiệu năng, thiết kế và giá cả.</p>
                    <p>Từ smartphone đến thiết bị IoT, Xiaomi xây dựng hệ sinh thái thông minh với hơn 200 sản phẩm kết nối.</p>
                </div>
                <div class="philosophy-image">
                    <img src="images/xm4.jpg" alt="Xiaomi Ecosystem">
                </div>
            </div>
        </div>
    </section>
    
    <%@include file="footer.jsp"%>
</body>
</html>
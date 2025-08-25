<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Apple - Đổi mới sáng tạo vì trải nghiệm người dùng</title>
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
            <div class="hero-logo" >
                <img src="images/táo4.jpg" alt="Apple Logo">
            </div>
            <h1>Đổi mới sáng tạo vì trải nghiệm người dùng</h1>
            <p class="subtitle">Apple không ngừng cách mạng hóa công nghệ với những sản phẩm đột phá và hệ sinh thái hoàn chỉnh</p>
            <a href="#products" class="btn">Khám phá sản phẩm</a>
        </div>
    </section>
    
    <!-- Brand Info Section -->
    <section class="brand-info" id="about">
        <div class="container">
            <div class="brand-info-container">
                <div class="brand-image">
                    <img src="images/thuonghieunoibat/ctyapple.png" alt="Apple Park">
                </div>
                <div class="brand-content">
                    <h3>Apple Inc.</h3>
                    <p>Từ một garage nhỏ ở California đến tập đoàn công nghệ trị giá nghìn tỷ đô la, Apple đã viết nên câu chuyện thành công vĩ đại nhất trong lịch sử kinh doanh. Với triết lý "Think Different", Apple liên tục định hình lại tương lai của công nghệ.</p>
                    
                    <h3 style="margin-top: 2.5rem;">Thông tin cốt lõi</h3>
                    <ul class="info-list">
                        <li class="info-item">
                            <strong>Trụ sở chính</strong>
                            <span>Apple Park, Cupertino</span>
                        </li>
                        <li class="info-item">
                            <strong>Thành lập</strong>
                            <span>1/4/1976</span>
                        </li>
                        <li class="info-item">
                            <strong>Nhà sáng lập</strong>
                            <span>Steve Jobs, Wozniak, Wayne</span>
                        </li>
                        <li class="info-item">
                            <strong>Giá trị thị trường</strong>
                            <span>2.8 nghìn tỷ USD</span>
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
                <p>Khám phá những sản phẩm đã làm nên thương hiệu Apple</p>
            </div>
            
            <div class="product-grid">
                <div class="product-card">
                    <div class="product-badge">Mới nhất</div>
                    <div class="product-media">
                        <img src="images/a1.png" alt="iPhone 15 Pro">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">iPhone 15 Pro</h3>
                        <p class="product-description">Thiết kế titan cao cấp, chip A17 Pro mạnh mẽ, camera 48MP chuyên nghiệp</p>
                        <div class="product-price">Từ 28.999.000đ</div>
                        <a href="https://gizmobo.com/product/apple-iphone-15-pro/" class="btn">Tìm hiểu thêm</a>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-media">
                        <img src="images/thuonghieunoibat/MacBook-pro-m2.png" alt="MacBook Pro">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">MacBook Pro M2</h3>
                        <p class="product-description">Hiệu năng đỉnh cao với chip Apple Silicon, màn hình Liquid Retina XDR</p>
                        <div class="product-price">Từ 42.999.000đ</div>
                        <a href="https://ipadizate.com/mac/los-nuevos-macbook-pro-de-14-y-16-pulgadas-comenzaran-a-producirse-este-mismo-ano-tal-vez-con-chips-de-5-nm" class="btn">Tìm hiểu thêm</a>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-badge">Bán chạy</div>
                    <div class="product-media">
                        <img src="images/thuonghieunoibat/ipad11pro.png" alt="iPad Pro">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">iPad 11 Pro</h3>
                        <p class="product-description">Máy tính bảng mạnh nhất thế giới với màn hình Mini-LED</p>
                        <div class="product-price">Từ 21.999.000đ</div>
                        <a href="https://www.techradar.com/reviews/ipad-pro-11-2021-review" class="btn">Tìm hiểu thêm</a>
                    </div>
                </div>
            </div>
            
            <div class="product-grid" style="margin-top: 30px;">
                <div class="product-card">
                    <div class="product-media">
                        <img src="images/thuonghieunoibat/Apple Watch Ultra 2.png" alt="Apple Watch Ultra 2">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">Apple Watch Ultra 2</h3>
                        <p class="product-description">Đồng hồ thông minh cao cấp cho thể thao và phiêu lưu</p>
                        <div class="product-price">Từ 17.999.000đ</div>
                        <a href="https://gearuptofit.com/review/apple-watch-ultra-2/" class="btn">Tìm hiểu thêm</a>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-media">
                        <img src="images/thuonghieunoibat/AirPods_Pro_2nd-Gen-1.png" alt="AirPods Pro 2">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">AirPods Pro 2</h3>
                        <p class="product-description">Tai nghe không dây với công nghệ Active Noise Cancellation</p>
                        <div class="product-price">Từ 6.999.000đ</div>
                        <a href="https://jinnyyrosalinda.pages.dev/uujiynt-airpods-pro-2-2024-review-mgqbdck/" class="btn">Tìm hiểu thêm</a>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-badge">Mới cập nhật</div>
                    <div class="product-media">
                        <img src="images/thuonghieunoibat/imac24.png" alt="iMac 24-inch">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">iMac 24-inch</h3>
                        <p class="product-description">Máy tính all-in-one mỏng nhẹ với 7 màu sắc cá tính</p>
                        <div class="product-price">Từ 27.999.000đ</div>
                        <a href="https://www.ebay.com/p/78135973" class="btn">Tìm hiểu thêm</a>
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
                    <h3>Triết lý Apple</h3>
                    <p>Apple luôn đặt trải nghiệm người dùng lên hàng đầu. Mỗi sản phẩm là sự kết hợp hoàn hảo giữa thiết kế tối giản, công nghệ đột phá và sự chính xác đến từng chi tiết.</p>
                    <p>"Đơn giản là đỉnh cao của sự tinh tế" - triết lý này thấm nhuần trong từng sản phẩm Apple, từ phần cứng đến phần mềm, tạo nên hệ sinh thái khép kín mang đến trải nghiệm độc đáo không đối thủ nào có thể sao chép.</p>
                    <p>Apple không chỉ bán sản phẩm, mà bán cả trải nghiệm, phong cách sống và sự sáng tạo không giới hạn.</p>
                </div>
                <div class="philosophy-image">
                    <img src="images/táo4.jpg" alt="Apple Design Philosophy">
                </div>
            </div>
        </div>
    </section>
    
    <!-- Milestones Section -->
    <section class="milestones-section">
        <div class="container">
            <div class="section-heading">
                <h2>Cột mốc đáng nhớ</h2>
                <p>Hành trình đổi mới không ngừng nghỉ của Apple</p>
            </div>
            
            <div class="milestones-grid">
                <div class="milestone-card">
                    <div class="milestone-icon">
                        <img src="images/thuonghieunoibat/Apple Watch Ultra 2.png" alt="Founded">
                    </div>
                    <div class="milestone-number">1976</div>
                    <div class="milestone-title">Thành lập Apple</div>
                </div>
                
                <div class="milestone-card">
                    <div class="milestone-icon">
                        <img src="images/thuonghieunoibat/MacBook-pro-m2.png" alt="Macintosh">
                    </div>
                    <div class="milestone-number">1984</div>
                    <div class="milestone-title">Ra mắt Macintosh</div>
                </div>
                
                <div class="milestone-card">
                    <div class="milestone-icon">
                        <img src="images/thuonghieunoibat/AirPods_Pro_2nd-Gen-1.png" alt="iPod">
                    </div>
                    <div class="milestone-number">2001</div>
                    <div class="milestone-title">iPod thay đổi ngành âm nhạc</div>
                </div>
                
                <div class="milestone-card">
                    <div class="milestone-icon">
                        <img src="images/logo1tao.png" alt="iPhone">
                    </div>
                    <div class="milestone-number">2007</div>
                    <div class="milestone-title">iPhone cách mạng smartphone</div>
                </div>
            </div>
        </div>
    </section>
    
    <%@include file="footer.jsp"%>
</body>
</html>
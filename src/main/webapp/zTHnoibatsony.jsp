<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Sony - Make.Believe</title>
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
                <img src="images/sony4.png" alt="Sony Logo">
            </div>
            <h1>Make.Believe</h1>
            <p class="subtitle">Biến trí tưởng tượng thành hiện thực với công nghệ đỉnh cao</p>
            <a href="#products" class="btn">Khám phá sản phẩm</a>
        </div>
    </section>
    
    <!-- Brand Info Section -->
    <section class="brand-info" id="about">
        <div class="container">
            <div class="brand-info-container">
                <div class="brand-image">
                    <img src="images/thuonghieunoibat/ctysony.jpg" alt="Sony Headquarters">
                </div>
                <div class="brand-content">
                    <h3>Sony Corporation</h3>
                    <p>Thành lập năm 1946 tại Tokyo, Sony đã trở thành biểu tượng của sự sáng tạo và chất lượng Nhật Bản. Từ chiếc radio bán dẫn đầu tiên đến công nghệ camera mirrorless, Sony luôn tiên phong trong đổi mới.</p>
                    
                    <h3 style="margin-top: 2.5rem;">Thông tin cốt lõi</h3>
                    <ul class="info-list">
                        <li class="info-item">
                            <strong>Trụ sở chính</strong>
                            <span>Minato, Tokyo, Nhật Bản</span>
                        </li>
                        <li class="info-item">
                            <strong>Thành lập</strong>
                            <span>7/5/1946</span>
                        </li>
                        <li class="info-item">
                            <strong>Chủ tịch</strong>
                            <span>Kenichiro Yoshida</span>
                        </li>
                        <li class="info-item">
                            <strong>Lĩnh vực</strong>
                            <span>Điện tử, Game, Giải trí</span>
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
                <h2>Sản phẩm biểu tượng</h2>
                <p>Những đột phá công nghệ làm thay đổi ngành công nghiệp</p>
            </div>
            
            <div class="product-grid">
                <div class="product-card">
                    <div class="product-badge">Mới nhất</div>
                    <div class="product-media">
                        <img src="images/thuonghieunoibat/sony_a7r_v.jpg" alt="Sony α7R V">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">Sony α7R V</h3>
                        <p class="product-description">Mirrorless 61MP, AI Focus, 8-stop</p>
                        <div class="product-price">Từ 89.990.000đ</div>
                        <a href="https://www.juzaphoto.com/recensione.php?t=sony_a7r_v" class="btn">Tìm hiểu thêm</a>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-media">
                        <img src="images/thuonghieunoibat/Sony XA1 ultra.jpg" alt="Sony XA1">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">Sony Xperia XA1 Ultra</h3>
                        <p class="product-description">Cảm biến hình ảnh Exmor R 1/2,6 inch</p>
                        <div class="product-price">Từ 12.990.000đ</div>
                        <a href="https://phongvu.vn/cong-nghe/danh-gia-dien-thoai-sony-xperia-xa1-ultra-g3226vn-n/" class="btn">Tìm hiểu thêm</a>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-badge">Bán chạy</div>
                    <div class="product-media">
                        <img src="images/thuonghieunoibat/sonyWH.png" alt="WH-1000XM5">
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">WH-1000XM5</h3>
                        <p class="product-description">Tai nghe chống ồn tốt nhất thế giới</p>
                        <div class="product-price">Từ 8.990.000đ</div>
                        <a href="https://pricehistoryapp.com/product/sony-wh-1000xm5-bluetooth-headphone-with-mic-auto-noise-cancellation-optimizer-over-ear-blue#google_vignette" class="btn">Tìm hiểu thêm</a>
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
                    <h3>Tinh thần Sony</h3>
                    <p>"Sáng tạo không biên giới" là triết lý xuyên suốt lịch sử Sony. Từ Walkman đến PlayStation, Sony luôn dẫn đầu trong việc tạo ra những sản phẩm định hình lại ngành công nghiệp.</p>
                    <p>Sony tập trung vào chất lượng hoàn hảo từ cảm biến camera đến âm thanh cao cấp. Mỗi sản phẩm là sự kết hợp giữa kỹ thuật tinh xảo và thiết kế tối giản.</p>
                    <p>Với hệ sinh thái đa dạng từ điện tử, giải trí đến game, Sony mang đến trải nghiệm độc đáo không thể tìm thấy ở bất kỳ đâu.</p>
                </div>
                <div class="philosophy-image">
                    <img src="images/sony4.png" alt="Sony Innovation">
                </div>
            </div>
        </div>
    </section>
    
    <%@include file="footer.jsp"%>
</body>
</html>
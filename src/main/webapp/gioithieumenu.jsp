<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Giới thiệu NVT Smartphone</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .store-logo {
            text-align: center;
            margin-bottom: 18px;
            background-color: white;
            border-bottom: 1px solid #eee;
        }
        
        .store-logo img {
            max-width: 165px;
            height: auto;
            transition: transform 0.3s ease;
        }
        
        .store-logo img:hover {
            transform: scale(1.05);
        }

        :root {
            --primary-color: #1a237e;
            --secondary-color: #283593;
            --accent-color: #3949ab;
            --light-color: #e8eaf6;
        }

        .hero-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 29px 20px;
            text-align: center;
            margin-bottom: 20px;
            border-radius: 0 0 20px 20px;
        }
        
        .hero-section h1 {
            font-size: 2.4rem;
            margin-bottom: 17px;
        }
        #gioi-thieu, #dinh-vi, #lien-he {
            padding: 18px 28px 24px 28px; /*trên phải dưới trái*/
            margin-bottom: 21px;
        }
        
        /* Content Section */
        .content-section {
            margin-bottom: 20px;
            padding: 22px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .content-section h2 {
            color: var(--primary-color);
            margin-bottom: 15px;
            padding-bottom: 8px;
            border-bottom: 2px solid var(--accent-color);
        }
        
        /* Gallery -  */
        .image-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 15px;
            margin-top: 15px;
        }
        
        .gallery-item {
            position: relative;
            overflow: hidden;
            border-radius: 5px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .gallery-item img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            display: block;
            transition: transform 0.5s ease;
        }
        
        .gallery-item:hover {
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }
        
        .gallery-item:hover img {
            transform: scale(1.08);
        }
        
        .gallery-item::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to top, rgba(0,0,0,0.4), transparent 50%);
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .gallery-item:hover::after {
            opacity: 1;
        }
        
        /* Điểm mạnh */
        .strengths {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        
        .strength-item {
            text-align: center;
            padding: 20px;
            background: var(--light-color);
            border-radius: 5px;
        }
        
        .strength-item i {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 10px;
        }
        
        /* Bản đồ */
        .map-container {
            height: 350px;
            margin-top: 15px;
            border-radius: 5px;
            overflow: hidden;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .hero-section {
                padding: 60px 15px;
            }
            
            .hero-section h1 {
                font-size: 1.8rem;
            }
            
            .strengths {
                grid-template-columns: 1fr;
            }
            
            .store-logo img {
                max-width: 180px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@include file="header.jsp"%>
        <section class="hero-section">
            <h1><i class="fas fa-info-circle"></i> GIỚI THIỆU CỬA HÀNG</h1>
            <p>10 năm kinh nghiệm cung cấp các sản phẩm điện thoại chất lượng cao</p>
        </section>
        
        <!-- Nội dung chính -->
        <main>
            <section id="gioi-thieu" class="content-section">
                <h2>Về chúng tôi</h2>
                <!-- Phần logo cửa hàng  -->
                <div class="store-logo">
                    <img src="images/ngvantienlogo.png" alt="Logo Cửa hàng Tivi cao cấp" title="Cửa hàng">
                    <small><i style="display: block; text-align: center;">Logo cửa hàng</i></small>
                </div>
                <p>NVT Smartphone thành lập từ năm 2015, cửa hàng điện thoại của chúng tôi đã trở thành địa chỉ tin cậy của hàng nghìn khách hàng trên khắp cả nước. Chúng tôi chuyên cung cấp các sản phẩm điện thoại từ các thương hiệu hàng đầu thế giới như Apple, Samsung, Sony, Xiaomi với chất lượng đảm bảo và giá cả cạnh tranh.</p>
                
                <div class="strengths">
                    <div class="strength-item">
                        <i class="fas fa-award"></i>
                        <h3>Chất lượng hàng đầu</h3>
                        <p>Sản phẩm chính hãng, bảo hành dài hạn</p>
                    </div>
                    <div class="strength-item">
                        <i class="fas fa-tag"></i>
                        <h3>Giá cả cạnh tranh</h3>
                        <p>Giá tốt nhất thị trường với nhiều ưu đãi</p>
                    </div>
                    <div class="strength-item">
                        <i class="fas fa-headset"></i>
                        <h3>Hỗ trợ 24/7</h3>
                        <p>Đội ngũ tư vấn nhiệt tình, chuyên nghiệp</p>
                    </div>
                </div>
            </section>

            <section id="dinh-vi" class="content-section">
                <h2>Định vị thương hiệu</h2>
                <p>Chúng tôi tự hào là một trong những đơn vị phân phối tivi uy tín nhất tại Việt Nam, luôn đi đầu trong việc cập nhật những công nghệ mới nhất về hình ảnh và âm thanh. Với phương châm "Khách hàng là trung tâm", chúng tôi cam kết mang đến trải nghiệm mua sắm tốt nhất cho mọi khách hàng.</p>
                
                <div class="image-gallery">
                    <div class="gallery-item">
                        <img src="images/tincongnghe1.png" alt="Showroom 1">
                    </div>
                    <div class="gallery-item">
                        <img src="images/tincongnghe2.png" alt="Showroom 2">
                    </div>
                    <div class="gallery-item">
                        <img src="images/tincongnghe3.png" alt="Đội ngũ nhân viên">
                    </div>
                    <div class="gallery-item">
                        <img src="images/tuvandienthoai.jpg" alt="Đội ngũ nhân viên">
                    </div>
                </div>
            </section>

            <section id="lien-he" class="content-section">
                <h2>Thông tin liên hệ</h2>
                <div class="contact-info">
                    <p><i class="fas fa-map-marker-alt"></i> <strong>Địa chỉ:</strong> 68 Nguyễn Chí Thanh, Đống Đa, Hà Nội</p>
                    <p><i class="fas fa-phone"></i> <strong>Điện thoại:</strong> 0123 456 789 - 0987 654 321</p>
                    <p><i class="fas fa-envelope"></i> <strong>Email:</strong> nguyenvantien5a2@gmail.com</p>
                    <p><i class="fas fa-clock"></i> <strong>Giờ làm việc:</strong> 8:00 - 21:00 hàng ngày</p>
                </div>
                
                <div class="map-container">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.096484299299!2d105.8145573154026!3d21.028766893153234!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab63c5a1d3a5%3A0x2c3e8b6a8e5e6e1!2zNjggTmd1eeG7hW4gQ2jDrSBUaGFuaCwgxJDhu5NuZyDEkGEsIMSQ4bqvayBM4bqvaywgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1620000000000!5m2!1svi!2s" 
                            width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </section>
        </main>

        <%@include file="footer.jsp"%>
    </div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iPhone 16 | Công nghệ đỉnh cao 2024</title>
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <!-- Integrated CSS -->
    <style>
        :root {
            --apple-blue: #0071e3;
            --apple-dark: #1d1d1f;
            --highlight: #ff2d55;
        }

        /* General Styles */
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background-color: #f9f9f9;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Hero Section */
        .product-hero {
            background: linear-gradient(135deg, var(--apple-dark), var(--apple-blue));
            color: white;
            padding: 45px 20px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 800px;
            margin: 0 auto;
        }

        .product-hero h1 {
            font-size: 2.5rem;
            margin-bottom: 15px;
            font-weight: 700;
        }

        .product-hero .tagline {
            font-size: 1.5rem;
            margin-bottom: 30px;
            opacity: 0.9;
        }

        .hero-highlight {
            color: var(--highlight);
            font-weight: 600;
        }

        /* Product Showcase */
        .product-showcase {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 60px 20px;
            background: white;
            margin-top: -50px;
            border-radius: 20px 20px 0 0;
            box-shadow: 0 -10px 30px rgba(0,0,0,0.1);
            position: relative;
            z-index: 3;
        }

        .product-image-container {
            width: 45%;
            text-align: center;
            position: relative;
        }

        .product-image-main {
            width: 100%;
            max-width: 400px;
            transform: perspective(1000px) rotateY(-15deg);
            transition: transform 0.5s ease;
        }

        .product-image-container:hover .product-image-main {
            transform: perspective(1000px) rotateY(0deg);
        }

        .product-info {
            width: 50%;
            padding: 0 20px;
        }

        .price-box {
            background: linear-gradient(135deg, #f5f5f5, #e0e0e0);
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 30px;
        }

        .price {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--apple-blue);
            margin-bottom: 10px;
        }

        .old-price {
            text-decoration: line-through;
            color: #999;
            font-size: 1.5rem;
        }

        .discount-badge {
            background-color: #e53935;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 0.9rem;
            font-weight: 600;
            margin-left: 10px;
        }
        
        form {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }
        
        .cta-button {
            justify-content: center;
            background: var(--apple-blue);
            color: white;
            border: none;
            padding: 15px 40px;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            box-shadow: 0 5px 15px rgba(0, 113, 227, 0.3);
            width: 80%;
        }

        .cta-button:hover {
            background: var(--apple-dark);
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 113, 227, 0.4);
        }

        .cta-button i {
            margin-right: 10px;
        }

        /* Features Section */
        .features-section {
            padding: 60px 20px;
            background: white;
        }

        .section-title {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 50px;
            color: var(--apple-dark);
            position: relative;
        }

        .section-title:after {
            content: "";
            display: block;
            width: 80px;
            height: 4px;
            background: var(--highlight);
            margin: 15px auto 0;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
        }

        .feature-card {
            text-align: center;
            padding: 30px 20px;
            border-radius: 12px;
            transition: transform 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-10px);
        }

        .feature-icon {
            font-size: 2.5rem;
            color: var(--apple-blue);
            margin-bottom: 20px;
        }

        .feature-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 15px;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .product-showcase {
                flex-direction: column;
            }
            
            .product-image-container, 
            .product-info {
                width: 100%;
            }
            
            .product-image-main {
                max-width: 300px;
                margin-bottom: 30px;
            }
            
            .features-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 576px) {
            .product-hero h1 {
                font-size: 2.2rem;
            }
            
            .product-hero .tagline {
                font-size: 1.2rem;
            }
            
            .features-grid {
                grid-template-columns: 1fr;
            }
            
            .price {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <%@include file="header.jsp"%>

        <!-- Hero Section -->
        <section class="product-hero">
            <div class="hero-content">
                <h1>iPHONE 16 PRO MAX</h1>
                <p class="tagline">Đỉnh cao công nghệ với <span class="hero-highlight">Apple Intelligence</span></p>
            </div>
        </section>

        <!-- Product Showcase -->
        <section class="product-showcase">
            <div class="product-image-container">
                <img src="images/a1.png" alt="iPhone 16" class="product-image-main">
            </div>
            
            <div class="product-info">
                <div class="price-box">
                    <div class="old-price">22.990.000₫</div>
                    <div class="price">20.990.000₫ <span class="discount-badge">Tiết kiệm 8%</span></div>
                    <p>Giá đã bao gồm VAT</p>
                </div>
                
                <h2>Thông số nổi bật</h2>
                <ul>
                    <li>Chip A18, hỗ trợ Apple Intelligence</li>
                    <li>Màn hình Super Retina XDR 6.1" 60Hz</li>
                    <li>Camera Fusion 48MP, hỗ trợ Spatial Video</li>
                    <li>Camera Ultra Wide 12MP với macro</li>
                    <li>Pin 3561mAh, sạc nhanh 45W</li>
                    <li>Khung nhôm, kính Ceramic Shield</li>
                </ul>
                
                <form action="UpdateCartServlet" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="iphone_16_promax">
                    <input type="hidden" name="productName" value="iPhone 16 Pro Max">
                    <input type="hidden" name="image" value="images/a1.png">
                    <input type="hidden" name="originalPrice" value="22.990.000đ">
                    <input type="hidden" name="discountedPrice" value="20.990.000đ">
                    <input type="hidden" name="discountPercent" value="8%">
                    <button type="submit" class="cta-button">
                        <i class="fas fa-shopping-cart"></i> ĐẶT MUA NGAY
                    </button>
                </form>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features-section">
            <h2 class="section-title">TÍNH NĂNG ĐỘT PHÁ</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-camera"></i>
                    </div>
                    <h3 class="feature-title">CAMERA FUSION 48MP</h3>
                    <p>Chụp ảnh sắc nét với hỗ trợ Spatial Video, Photographic Styles tùy chỉnh thời gian thực</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-bolt"></i>
                    </div>
                    <h3 class="feature-title">CHIP A18 MẠNH MẼ</h3>
                    <p>Hiệu năng vượt trội, hỗ trợ Apple Intelligence, Neural Engine nhanh gấp đôi</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h3 class="feature-title">THIẾT KẾ BỀN BỈ</h3>
                    <p>Khung nhôm, kính Ceramic Shield, chống nước IP68</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-battery-full"></i>
                    </div>
                    <h3 class="feature-title">PIN LÂU DÀI</h3>
                    <p>Pin 3561mAh, hỗ trợ sạc nhanh 45W và MagSafe 25W</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-mobile-alt"></i>
                    </div>
                    <h3 class="feature-title">MÀN HÌNH SẮC NÉT</h3>
                    <p>Super Retina XDR 6.1", độ sáng tối đa 2000 nits</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-wifi"></i>
                    </div>
                    <h3 class="feature-title">KẾT NỐI VỆ TINH</h3>
                    <p>Hỗ trợ gửi tin nhắn, SOS khẩn cấp qua vệ tinh khi không có Wi-Fi</p>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <%@include file="footer.jsp"%>
    </div>
</body>
</html>